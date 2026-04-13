---
title: Services
permalink: /services/
toc: true
sidebar:
  nav: "repos"
---

This page gives a quick overview of the main platform services used by
Datadrivet and CoFinder. For access details, see [Access](/access/).

## Core services

| Service | Main purpose | Notes |
| ------- | ------- | ------- |
| Dagster | Orchestrates data pipelines and backfills | Primary operational UI for pipeline runs |
| Snowflake | Analytical warehouse | Main store for transformed and evaluated data |
| PostgreSQL | Application database | Used by the portal for serving user-facing data |
| MinIO | Object storage | S3-compatible storage for platform workloads |
| Vault / Key Vault | Secret and credential management | Access depends on role and system |
| LiteLLM | Model gateway | Central point for API-based LLM usage |
| Phoenix | LLM tracing and debugging | Useful when investigating prompt or latency issues |

## How to use this page

- Use [Access](/access/) when you need permissions or credentials.
- Use [CoFinder](/cofinder/) when you need system context.
- Use [Slack Wisdom](/slack-wisdom/) for known operational issues and fixes.
