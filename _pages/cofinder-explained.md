---
title: CoFinder data infrastructure
permalink: /cofinder/
toc: true
sidebar:
  nav: "docs"
---

CoFinder is a system designed to automate the process of identifying relevant job ads for different Knowit organisations and matching them with the most suitable consultants. The fundamental idea is to gather job advertisements from various external sources, such as Verama, Fieldglass, and HubSpot, and integrate this information with our consultants' professional profiles and experiences retrieved from Cinode. By connecting opportunities with internal talent, CoFinder aims to streamline business development, allowing the company to quickly identify which relevant job ads have been posted and which specific consultants are well-suited for them.

At the heart of CoFinder is a data pipeline orchestrated using Dagster. The
first main step involves ingesting, cleansing, and consolidating all job
advertisements into a unified data store. These jobs are then subjected to an
evaluation process where they are ranked for relevance to the company.
Simultaneously, consultant data from Cinode representing individual skills and
experiences is processed and run through an embedding model. The final step
involves matching the relevant job ads against the consultant profiles,
generating a rank for each consultant/job pairing. The resulting matches and
detailed data are loaded into a database and made available for review and
action via the CoFinder Portal. See *Figure 1* for a schematic of the data flow
in the main pipeline.

This page focuses on the data pipeline and matching flow. The monorepo also
contains frontend and backend functionality such as onboarding, portal views,
search, and MCP integration, but those parts are not described in detail here.

![img](../assets/diagrams/Cofinder_data_flow.svg)
*Figure 1: A schematic of the data flow in the CoFinder system. Only the most central assets have been named in the diagram.*

Below, each stage is explained in more detail.

## Job ad data ingestion

The job ad ingestion process begins by fetching advertisements from various
external sources, including Verama, Fieldglass, HubSpot, calloffs, and several
scraped sources. This data is extracted using DLT assets for some sources and
Python assets for others, and then cleansed and transformed using dbt. The data
is further enriched, for example by adding geographic locations to each ad,
before all input is consolidated into a unified intermediate table,
*int_union_job_ads*. This unified table then flows into the next step: match
evaluation by the Large Language Model (LLM).

## Job ad matching 

The LLM evaluation process takes the consolidated job ads and determines their
relevance to each onboarded Knowit organisation separately using the prompts
stored in *stg_company*. This function is handled by an asset that queries an
LLM, with the company prompt as system instructions and the job ad as the user
input. The LLM assigns a rank from 0 to 10 and provides a motivation for that
rank, adding these details as columns to the resulting *int_evaluated_job_ads*
table. The LLM call stacks are tracked using **Phoenix**.

## Consultant data ingestion

The consultant skills and experiences are imported from their Cinode profile and saved in *int_people_experience*. The pipeline only draws from the data in the profile section, not from targeted CVs. 

## Embeddings

The tables *int_union_job_ads* and *int_people_experience* are converted into
embedding space and saved to **LanceDB**. In the current implementation, job ad
embeddings are created from the ad description, while consultant embeddings are
created from prioritized experience entries in *int_people_experience*.

The embedding model is configured in the pipeline code and may change over
time, so this page avoids hardcoding a model name.

## RAG + consultant matching

For relevant ads in the job ad evaluation step, each consultant for the company
in question is run through RAG plus consultant matching. In the current
implementation, the pipeline first filters to ads in cities configured for the
company. It then continues with ads that either received a rank above 1, or
come from selected sources that are always included in this step.

In the retrieval step, the most similar experience embeddings are retrieved for
the job ad embedding, filtered to the Cinode team IDs belonging to the company.
The current retrieval limit is 200 experience rows per ad before consultant
aggregation and LLM evaluation.

In consultant matching, an LLM call is made with the job ad, consultant skills,
and the prompt found in
*pipelines/processing/prompts/knowit_consultant_matcher_msg.txt*.
Each evaluated consultant receives a rank from 1 to 10 indicating their
suitability for the assignment, together with a motivation for that rank.

## Output

The output from the consultant matching step is saved in
*obt_consultant_matches*. This table is then used as a source for notifications
to channels like Slack and Teams, and for syncing relevant match data to the
**Postgres** database used by the CoFinder portal.
