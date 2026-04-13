---
title: Different systems and how to get access
permalink: /access/
toc: true
sidebar:
  nav: "docs"
---

A list of systems related to CoFinder data processing and how to get access to
them.

Use this page as the directory for ownership and access paths. If a system is
missing, add it here rather than leaving the knowledge only in Slack.

## General

| System    | Link | What it does  | Who can help you with access | Other comments? |
| -------- | ------- | -------- | ------- | ------- |
| SOPS secrets | [linked](https://github.com/knowit-solutions-cocreate/datadrivet-infra-opendatastack/tree/main/secrets) | Most project secrets are stored in encrypted files in Git | All developers in the project | Follow the [Getting Started](/getting-started/) guide to add your key |
| Azure KeyVault | [linked](https://portal.azure.com) | A secure location to store some access information | Tom, Lunken, Jimmy, Ruben, Fredrik M | Ask to be added to team "Invativa" and to get role "Key Vault Secrets User" for datadrivet-cluster-prod |
| Keycloak |  | Identity provider for several internal platform services | Jimmy, Fredrik, Andreas, Jon-Erik, Ruben, Tomas | Linked to Vault, MinIO, and Onyxia |
| Hashicorp Vault | [linked](https://vault.platform.datadrivet.ai/ui) | Stores secrets used by internal platform services | see Keycloak | Access typically follows your platform role |

## Data 

| System    | Link | What it does  | Who can help you with access | Other comments? |
| -------- | ------- | -------- | ------- | ------- |
| Snowflake web UI  | [linked](https://app.snowflake.com) | An easy way to look at the main database for the project | Jon-Erik, Fredrik, Andreas, Jimmy, Edvard | Your username will be of format cocreate\<yourname\>. You may need admin rights to create your copy of the database. |
| Snowflake API access | [linked](https://app.snowflake.com) | Access main database for the project via code | Jon-Erik, Fredrik, Andreas, Jimmy, Edvard | The key pair setup is a bit convoluted, make sure you follow [these instructions](https://docs.snowflake.com/en/user-guide/key-pair-auth) carefully |
| Dagster dashboard | [linked](https://dagster.platform.datadrivet.ai/) | Web UI to inspect production pipeline runs and asset state | see Azure KeyVault | Username and password are in Azure `datadrivet-cluster-prod` secrets |
| MinIO | [linked](https://minio-console.platform.datadrivet.ai/) | S3-compatible object storage hosted by the platform team | see Keycloak | You should get access through Keycloak when you get added to Terraform as a developer |
| Onyxia | [linked](https://onyxia.platform.datadrivet.ai/) | Self-service portal for data services, code spaces, and other OSS tools | see Keycloak | Status changes over time; if unavailable, ask in Slack before assuming it is gone |
| LanceDB | Repository-local or service-local depending on workload | Vector store used for embedding-based retrieval | Ask the owning developer for the relevant service | Access is usually indirect through the pipeline or application rather than a shared UI |

## LLM-related

| System    | Link | What it does  | Who can help you with access | Other comments? |
| -------- | ------- | -------- | ------- | ------- |
| Phoenix web UI | [linked](https://phoenix.platform.datadrivet.ai/) | Tracks LLM call traces and debugging metadata | see Azure KeyVault | API access info is in SOPS secrets |
| LiteLLM API definition | [linked](https://litellm.platform.datadrivet.ai) | API definition for the LiteLLM gateway |  | No login |
| LiteLLM API keys | [linked](https://litellm.platform.datadrivet.ai) | API keys to access LiteLLM proxy either as an individual or as a project | Andreas, Jimmy, Jon-Erik | Jimmy can help with adding money | 
| LiteLLM logs | [linked](https://litellm.platform.datadrivet.ai/ui/?login=success) | LiteLLM usage logs, costs, and API key management | Andreas, Jimmy, Jon-Erik | You likely do not need access unless you are tracking usage or costs |
| OpenRouter | [linked](https://openrouter.ai) | Site to inspect which models are available |  | No need to log in just to browse models |
| Modal | [linked](https://modal.com/) | Site where CV-generator endpoint is hosted | Andreas | The modal workspace is limited to 3 people. Discuss with Andreas or Tomas if you think you need access. |
