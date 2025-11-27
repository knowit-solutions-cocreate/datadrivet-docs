---
title: "Image versioning in CD"
date: 2025-11-25 14:48:00 +0200
categories: slack-wisdom
author: Tomas Pousette
---
Tomas Pousette:
> Does someone understand how the image version numbers work in the CD in opendatastack? It seems to build images with the same version number as the previous image sometimes
>
> See these two runs for example:
>
> First: https://github.com/knowit-solutions-cocreate/datadrivet-infra-opendatastack/actions/runs/19664554028/job/56318270850
>
> Second: https://github.com/knowit-solutions-cocreate/datadrivet-infra-opendatastack/actions/runs/19670675098/job/56338521922

Kristian: 
> commitizen ska göra det automatiskt genom en github action som uppdaterar versionen i pyproject.toml
>
> det finns några tags i commit meddelandet som inte bumpar versionen så det får man se upp med
>
> till exempel är en PATCH bump som ändrar bara tredje siffran i versionen (0.0.X):
> - `fix`: - Bug fixes
> - `perf`: - Performance improvements
> - `refactor`: - Code refactoring
> - `build`: - Build system changes
> - `ci`: - CI/CD changes
> - `docs`: - Documentation only changes
> - `style`: - Code style changes
> - `test`: - Adding/updating tests
> - `chore`: - Other changes that don't modify src
>
> sen ett till krav är att åtminstone en fil måste finnas i /dbt eller /processing mappen eller vara datadriven.Dockerfile
>
> så om man ändrat någon annan typ av fil så fångas det inte upp av versionsändringen
