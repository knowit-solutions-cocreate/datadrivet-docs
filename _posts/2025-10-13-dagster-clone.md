---
layout: single
title: "Admin issue in cloning dagster"
date: 2025-10-13 00:00:00 +0200
categories: slack-wisdom
author: Edvard Lindelöf & Minh Tran
---
Minh:
> Jag fick detta felet när jag kör ett dagster materialize ett asset

~~~
The above exception was caused by the following exception:
dlt.pipeline.exceptions.PipelineStepFailed: Pipeline execution failed at `step=load` when processing package with `load_id=1760105365.4028292` with exception:

<class 'dlt.destinations.exceptions.DatabaseTransientException'>
100132 (P0000): JavaScript execution error: Uncaught Execution of multiple statements failed on statement "ALTER TABLE "RAW_TEAMTAILOR"."..." (at line 1, position 0).
SQL access control error:
Insufficient privileges to operate on table 'CANDIDATES'. in SYSTEM$MULTISTMT at '    throw `Execution of multiple statements failed on statement {0} (at line {1}, position {2}).`.replace('{1}', LINES[i])' position 4
stackstrace: 
SYSTEM$MULTISTMT line: 10
~~~

> 
> Detta gäller att min development role har inte ownership permission att skriva och skapa något i detta databas.
> 
> Det finns bara SELECT i DEVELOPMENT role.

![Screenshot of Snowflake webUI](/assets/images/snowflake-privileges.png)

Edvard:
> Nu har vi löst saken för Minh. Problemet är att behörighetsredigeringsraderna i klonskriptet failar tyst om man ej är admin. Tillsvidare så gäller det att man får klona från DATADRIVEN_ACCEPTANCE, som redan har rätt behörighetsstyrning:
> 
~~~
set this_db = 'DATADRIVEN_<ditt namn>';
CREATE DATABASE identifier($this_db) CLONE DATADRIVEN_ACCEPTANCE;
~~~
> 
> om statet i acceptance är utdaterat m a p vad man meckar med, be en admin att köra prod -> acc synk skriptet
> 
> Och adminskriptet (som du alltså INTE skall köra om du ej är admin) ser i sin tur ut såhär:
>
~~~
set this_db = 'DATADRIVEN_ACCEPTANCE';
set this_role = 'DEVELOPMENT';
CREATE DATABASE identifier($this_db) CLONE DATADRIVEN;
GRANT OWNERSHIP ON DATABASE identifier($this_db) TO ROLE identifier($this_role) REVOKE CURRENT GRANTS;
GRANT OWNERSHIP ON ALL SCHEMAS IN DATABASE identifier($this_db) TO ROLE identifier($this_role) REVOKE CURRENT GRANTS;
GRANT OWNERSHIP ON ALL TABLES IN DATABASE identifier($this_db) TO ROLE identifier($this_role) REVOKE CURRENT GRANTS;
GRANT OWNERSHIP ON ALL VIEWS IN DATABASE identifier($this_db) TO ROLE identifier($this_role) REVOKE CURRENT GRANTS;
~~~
