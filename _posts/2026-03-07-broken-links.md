---
layout: single
title: "Broken links from Slack or Airtable gives 404 error"
date: 2026-03-07 10:00:00 +0100
categories: slack-wisdom
author: Kristian
---

Anna V:
> Verkar fortfarande vara något tokigt @Kristian
> ![Cofinder architecture](/assets/images/404.png)

Kristian:
> Broken Opportunity Links From Slack/Airtable (404)
>   Symptoms:
>
>   - Some /opportunities/<uuid> links return 404 in the portal.
>   - Not all links fail, only some.
>
>   What happened:
>
>   - Link data existed in Snowflake (core.obt_evaluated_job_ads /
>     core.obt_consultant_matches).
>   - The same opportunities were missing in backend Postgres (evaluatedjobads), which is
>     what /jobpostings/{id} uses.
>   - Daily sync automation (cofinder-cronjob) runs /fetch_latest, but on March 6, 2026 
>     the API pod was in CrashLoopBackOff, and the cron job hung (0/1 completion).
>   - Result: Snowflake was up to date, Postgres was stale, so links 404’d.
>
>   How we fixed it:
>
>   1. Ran manual full sync on backend:
>
>   curl -i "https://cofinder-api.platform.datadrivet.ai/fetch_tables" \
>     -H "Authorization: Bearer <TOKEN>" 
>
>   2. Sync inserted missing rows and links started working again.
>>
>   How to diagnose quickly next time:
>
>   1. Pick a failing UUID.
>   2. Verify it exists in Snowflake.
>   3. Verify it exists in Postgres.
>   4. Check cron job status:
>
>   kubectl -n cofinder-api get cronjob
>   kubectl -n cofinder-api get job --sort-by=.metadata.creationTimestamp | tail -n 5
>
>   If latest job is 0/1, sync likely failed/hung.
>
>   Hardening recommendation:
>
>   - Update cron curl command to fail fast and time out:
>
>   curl -fsS --max-time 60 --retry 3 --retry-delay 5 \
>     "http://cofinder-api-service.cofinder-api.svc.cluster.local:8000/fetch_latest"
>
>   - Include required auth header (X-API-Key) if enforced.
>   - Alert if cron job does not complete successfully.
