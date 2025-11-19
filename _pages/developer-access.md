---
title: Different systems and how to get access
permalink: /access/
toc: true
sidebar:
  nav: "docs"
---

A list of different systems related to CoFinder data processing pipelines is listed below together with how to get access.

TODO: add information for 
- LanceDB
- anything else that might be missing

## General

| System    | Link | What it does  | Who can help you with access | Other comments? |
| -------- | ------- | -------- | ------- | ------- |
| SOPS secrets | [linked](https://github.com/knowit-solutions-cocreate/datadrivet-infra-opendatastack/tree/main/secrets) | Most access things you need are here | All developers in the project | Follow the [onboarding guide](02-getting-started.md) to add your key |
| Azure KeyVault | [linked](https://portal.azure.com) | A secure location to store some access information | Tom, Lunken, Jimmy, Ruben, Fredrik M | Ask to be added to team "Invativa" and to get role "Key Vault Secrets User" for datadrivet-cluster-prod |
| Keycloak |  | Access system that gives you access to several services | Jimmy, Fredrik, Andreas, Jon-Erik, Ruben, Tomas | Liked to Vault, Minio, and Onyxia |
|Hashicorp Vault | [linked](https://vault.platform.datadrivet.ai/ui) |  | see Keycloak |

## Data 

| System    | Link | What it does  | Who can help you with access | Other comments? |
| -------- | ------- | -------- | ------- | ------- |
| Snowflake web UI  | [linked](https://app.snowflake.com) | An easy way to look at the main database for the project | Jon-Erik, Fredrik, Andreas, Jimmy, Edvard | Your username will be of format cocreate\<yourname\>. You may need admin rights to create your copy of the database. |
| Snowflake API access | [linked](https://app.snowflake.com) | Access main database for the project via code | Jon-Erik, Fredrik, Andreas, Jimmy, Edvard | The key pair setup is a bit convoluted, make sure you follow [these instructions](https://docs.snowflake.com/en/user-guide/key-pair-auth) carefully |
|  Dagster dashboard | [linked](https://dagster.platform.datadrivet.ai/) | Webui to look at how the production Dagster is doing | see Azure KeyVault | Username and password are in Azure datadrivet-cluster-prod > Secrets | 
| MinIO | [linked](https://minio-console.platform.datadrivet.ai/) | S3 compatible storage hosted by us | see Keycloak | You should get access through Keycloak when you get added to Terraform as a developer |
| Onyxia | [linked](https://onyxia.platform.datadrivet.ai/) | Self service portal for data services, code spaces and other open source stuff | see Keycloak | Down right now (10/2025) but Jimmy's on it! |

## LLM-related

| System    | Link | What it does  | Who can help you with access | Other comments? |
| -------- | ------- | -------- | ------- | ------- |
|  Phoenix webui | [linked](https://phoenix.platform.datadrivet.ai/) | This is where we track LLM call traces | see Azure KeyVault |  API access info in SOPS secrets | 
| LiteLLM API definition | [linked](https://litellm.platform.datadrivet.ai) | API definition to LiteLLM |  | No login | 
| LiteLLM API keys | [linked](https://litellm.platform.datadrivet.ai) | API keys to access LiteLLM proxy either as an individual or as a project | Andreas, Jimmy, Jon-Erik | Jimmy can help with adding money | 
| LiteLLM logs | [linked](https://litellm.platform.datadrivet.ai/ui/?login=success) | LiteLLM usage logs and costs + ability create API keys | Andreas, Jimmy, Jon-Erik | You likely don't need access unless you're tracking costs of something |
| Openrouter | [linked](https://openrouter.ai) | Site to check which all LLMs we have access to |  | No need to log in, just browse models |
| Modal | [linked](https://modal.com/) | Site where CV-generator endpoint is hosted | Andreas | The modal workspace is limited to 3 people. Discuss with Andreas or Tomas if you think you need access. |
