---
title: Existing Repositories
permalink: /existing-repositories/
toc: true
sidebar:
  nav: "repos"
---

Overview of current Datadrivet repositories and their purposes.

### Main CoFinder Monorepo

#### [cofinder](https://github.com/knowit-solutions-cocreate/cofinder)

##### Primary active repository for CoFinder

- **Purpose**: Main monorepo for CoFinder frontend, backend, MCP integration,
  and data pipelines
- **Technology**: Nuxt/Vue, FastAPI, dbt, Dagster, Postgres, Snowflake,
  DuckDB, LanceDB, and related integrations
- **Use Cases**:
  - CoFinder portal development
  - Backend APIs and MCP server
  - Data ingestion, transformations, and matching pipelines
  - Operational tooling and local development setup

**When to add here**: Most CoFinder-related work should now start here.

[The CoFinder data infrastructure and data pipeline is more thoroughly explained on this page](/cofinder/)

### Historical CoFinder Repositories

#### [datadrivet-infra-opendatastack](https://github.com/knowit-solutions-cocreate/datadrivet-infra-opendatastack)

Former standalone repository for the CoFinder pipelines and related data
infrastructure.

#### [datadrivet-cofinder-portal](https://github.com/knowit-solutions-cocreate/datadrivet-cofinder-portal)

Former standalone repository for the CoFinder portal.

These repos were later merged into the `cofinder` monorepo. Their history has
been preserved, but active development has moved to `cofinder`.

## Azure Terraform Resources

#### [k8s-dataplatform](https://github.com/knowit-solutions-cocreate/k8s-dataplatform)

All Azure related resources are deployed through here.

### Fluxcd (Kubernetes Continuous Delivery)

#### [fluxcd-dataplatform](https://github.com/knowit-solutions-cocreate/fluxcd-dataplatform)

### Template Repository

#### [datadrivet-template](https://github.com/knowit-solutions-cocreate/datadrivet-template)

##### Template for creating new Datadrivet repositories

- **Purpose**: Standardized starting point for new projects
- **Includes**:
  - Pre-configured devenv setup
  - SOPS secrets management
  - Common development scripts
  - GitHub Actions workflows
  - Pre-commit hooks

**When to use**: Only when you have a
[valid reason](/new-repository/#-good-reasons-for-new-repository)
for a new repository.

## Support Repositories

### [nixos-wsl](https://github.com/knowit-solutions-cocreate/nixos-wsl)

#### NixOS-based WSL distribution for Windows development

- **Purpose**: Provides Windows developers with a pre-configured Linux
  environment
- **Includes**: Nix, Devenv, Direnv, and common development tools
- **Use Cases**: Windows developers who need the full Nix development stack

### [datadrivet-docs](https://github.com/knowit-solutions-cocreate/datadrivet-docs)

#### This documentation site

- **Purpose**: Central documentation for Datadrivet infrastructure
- **Technology**: Jekyll, GitHub Pages
- **Content**: Setup guides, best practices, service documentation

## Repository Selection Guide

### Start with Existing Repositories

**For most new CoFinder work, add to `cofinder`:**

- ✅ Frontend and portal changes
- ✅ Backend APIs and MCP work
- ✅ New data sources or integrations
- ✅ Matching and pipeline changes
- ✅ Analytics scripts and reports

**Use `k8s-dataplatform` and `fluxcd-dataplatform` only when the change is about infrastructure or deployment.**

### Consider New Repository Only If

- **Different technology stack** (i.e not python)
- **Different deployment target** (e.g., mobile app, embedded system)
- **External collaboration** (will be shared with external partners)
- **Regulatory isolation** (compliance requires separate codebase)

## Getting Started with Existing Repositories

### 1. Clone and Setup

```bash
# Example: Main CoFinder repository
git clone git@github.com:knowit-solutions-cocreate/cofinder.git
cd cofinder
```

### 2. Explore Available Commands

```bash
menu
```

See each respective repository's `README.md` for more information on how to start
contributing.

## Contributing Guidelines

0. **Use Vibes with Care** - Write your code first and then let your vibe-tool
   of choice iterate on it. We are interested in how you think. At the time of
   writing(August 2025), Agents/LLMs tend to overlook existing coding patterns
   and this causes a lot of technical debt.
1. **Match existing conventions** - Before adding a new pattern, check how the
   surrounding repository already structures code, tests, configuration, and
   scripts.

## Repository Maintenance

Each repository has designated maintainers:

- **Primary contact**: Jimmy Flatting
- **Access management**: Repository owners manage SOPS keys and permissions
- **Code review**: All changes require pull request review

## Need Help?

- **General questions**: Ask in #cofinder or #cofinder-dev
- **New repository requests**: Discuss in the above channels
