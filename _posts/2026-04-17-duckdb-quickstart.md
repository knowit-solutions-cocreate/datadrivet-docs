---
layout: single
title: "Kom igång med DuckDB"
date: 2026-04-17 09:00:00 +0200
categories: slack-wisdom
author: Kristian
---
> Om ni vill börja använda den nya DuckDB-databasen lokalt är detta en enkel start:
>
> Installera DuckDB CLI:
> - `brew install duckdb`
> - eller kör via Python med `uv add duckdb` / `pip install duckdb`
>
> Öppna databasen:
> - `duckdb cofinder/pipelines/dagster_home/storage/quackdb.duckdb`
>
> Bra första kommandon i DuckDB:
> - `.tables`
> - `DESCRIBE;` för att lista relationer i databasen
> - `DESCRIBE tabellnamn;`
> - `SELECT * FROM tabellnamn LIMIT 10;`
>
> Avsluta med kommandot:
> - `.exit`
