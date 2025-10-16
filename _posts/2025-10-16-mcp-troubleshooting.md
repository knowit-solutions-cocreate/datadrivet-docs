---
layout: post
title: "openwebui and cofinder-mcp troubleshooting"
date: 2025-10-16 09:00:00 +0200
categories: slack-wisdom
author: Tomas Pousette
---
> Angående openwebui och cofinder-mcp:
>
> När vi först fick det att funka så slutade fungera efter ca. ett dygn. Svagt minne av att det var problem med något "session id" i antingen mcp eller mcpo loggen i kubernetes. Dokumenterade dock inte detta. Fick igång det igen genom att starta om mcpo podden (och kanske mcp podden också, starta om mcp podden först isf)
> 
> Om det strular, prova att gå in i k9s och
> - Starta om mcpo-podden (ctrl + k på den)
> Funkar det inte så kan hjälpsam debugging vara:
>  - Kolla mcp poddens log vid omstart av mcpo-podden (då den försöker köra pat-auth). Borde komma loggning om att det försöker köra PAT-auth och om det lyckas eller ej
>  - Kolla cofinder-api poddens log också, och kolla vad som händer i /authenticate_token requestet
> 
> Dök upp ett problem idag som var att /authenticate_token tog för lång tid (ca. 11 sek), och att requestet från pat_middleware.py i mcp'n då timeade ut. Ökade timeout från 10 till 20 sek, och då kunde openwebui connecta till mcp'n igen. Borde det verkligen ta så lång tid att authenticatea en pat?