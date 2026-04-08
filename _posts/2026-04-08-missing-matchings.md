---
layout: single
title: "Missing embeddings cause new employees not appear in Cofinder"
date: 2026-04-08 09:40:00 +0100
categories: slack-wisdom
author: Kristian
---

Anton:
> Tjena! Just nu matchas endast Jonas av någon anledning.

Kristian:
> Efter Jonas och Peter börjat på FLX Göteborg slutade även Pehr att matchas på nya jobb och Peter fick inga heller. Lösningen var att köra backfill på embeddings i dagster, det ska triggas om de gjort uppdateringar på 
> sin profil i Cinode, men om jobbet misslyckas av någon anledning så görs inte automatiskt nya försök att skapa embeddings, utan backfill måste göras manuellt på respektive datum. Problemet är relaterat till en issue i
> github som Tomas beskriver nedan:

Tomas:
> https://github.com/knowit-solutions-cocreate/datadrivet-cofinder-portal/issues/487
> A user experienced a bug where they added new team ids via the cofinder portal, but they didn't get any matches on these new consultants. That is because emb_people_experience is not automatically backfilled, and 
> consequently the new people's experiences are never considered during matching.
> 
> Solution might be to trigger onboarding_backfill_job_1 and onboarding_backfill_job_2 via dagsters graphql as is done after onboarding.