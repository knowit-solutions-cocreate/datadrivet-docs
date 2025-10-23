---
layout: page
title: Different systems and how to get access
---

A list of different systems related to CoFinder data processing pipelines is listed below together with how to get access.

| System    | Link | What it does  | Who can help you with access | Other comments? |
| -------- | ------- | -------- | ------- | ------- |
| SOPS secrets | [inside the repository](https://github.com/knowit-solutions-cocreate/datadrivet-infra-opendatastack/tree/main/secrets) | Most access things you need are here | All developers in the project | Follow the [onboarding guide](02-getting-started.md) to add your key |
| Snowflake web UI  | [https://app.snowflake.com](https://app.snowflake.com) | An easy way to look at the main database for the project | ???? | Your username will be of format cocreate<yourname>. You may need admin rights to create your copy of the database. |
| Snowflake API access | [https://app.snowflake.com](https://app.snowflake.com) | Access main database for the project via code | Jon-Erik, ??? | The key pair setup is a bit convoluted, make sure you follow [these instructions](https://docs.snowflake.com/en/user-guide/key-pair-auth) carefully |
| MinIO | [https://minio-console.platform.datadrivet.ai/](https://minio-console.platform.datadrivet.ai/)  | S3 compatible storage hosted by us | e.g. Jimmy | You should get access through Keycloak when you get added to Terraform as a developer |
|  Phoenix webui | [https://phoenix.platform.datadrivet.ai/](https://phoenix.platform.datadrivet.ai/) | This is where we track LLM call traces | ???? |  API access info in SOPS secrets | 
|  Dagster dashboard | [https://dagster.platform.datadrivet.ai/](https://dagster.platform.datadrivet.ai/) | Webui to look at how the production Dagster is doing | see Azure KeyVault | Username and password are in Azure datadrivet-cluster-prod > Secrets | 
| Azure KeyVault | [https://portal.azure.com](https://portal.azure.com) | A secure location to store some access information | Tom, Lunken | Ask to be added to team "Invativa" and to get role "Key Vault Secrets User" for datadrivet-cluster-prod |
| LiteLLM API definition | [https://litellm.platform.datadrivet.ai](https://litellm.platform.datadrivet.ai) | API definition to LiteLLM |  | No login | 
| LiteLLM logs | [https://litellm.platform.datadrivet.ai/ui/](https://litellm.platform.datadrivet.ai/ui/?login=success) | API definition to LiteLLM | Andreas |  |
| Openrouter | [https://openrouter.ai](https://openrouter.ai) | Site to check which all LLMs we have access to |  | No login, just browse the openly available parts | 
