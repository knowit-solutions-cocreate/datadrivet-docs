---
layout: page
title: Existing Repositories
nav_order: 30
---

- toc
{:toc}

## Existing Repositories

Overview of current Datadrivet repositories and their purposes.

## Main Dagster Data Infrastructure Repository

### [datadrivet-infra-opendatastack](https://github.com/knowit-solutions-cocreate/datadrivet-infra-opendatastack)

#### Primary data infrastructure and pipeline repository

- **Purpose**: All data processing pipelines, LLM job ad matching, ETL jobs, and
  analytics infrastructure
- **Technology**: Python, dbt, Dagster, Snowflake, Airtable and upstream message
  intergrations,
- **Use Cases**:
  - Data ingestion from various sources (Airtable, Teamtailor, etc.)
  - Data transformations and modeling
  - Analytics and reporting pipelines
  - LLM Job ad Matching (Cofinder pipeline)

**When to add here**: Most data-related projects, utilities, and experiments
should start here.

[The CoFinder data infrastructure and data pipeline is more thoroughly explained on this page](03-01-cofinder-explained.md)

## Azure Terraform Resources

### [k8s-dataplatform](https://github.com/knowit-solutions-cocreate/k8s-dataplatform)

All Azure related resources are deployed through here.

## Cofinder Portal

### [datadrivet-cofinder-portal](https://github.com/knowit-solutions-cocreate/datadrivet-cofinder-portal)

## Fluxcd (Kubernetes Continous Delivery)

### [fluxcd-dataplatform](https://github.com/knowit-solutions-cocreate/fluxcd-dataplatform)

## Template Repository

### [datadrivet-template](https://github.com/knowit-solutions-cocreate/datadrivet-template)

#### Template for creating new Datadrivet repositories

- **Purpose**: Standardized starting point for new projects
- **Includes**:
  - Pre-configured devenv setup
  - SOPS secrets management
  - Common development scripts
  - GitHub Actions workflows
  - Pre-commit hooks

**When to use**: Only when you have a
[valid reason](05-setting-up-repository.html#step-2-valid-reasons-for-a-new-repository)
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

**For most new work, add to `datadrivet-infra-opendatastack`:**

- ✅ New data sources or integrations
- ✅ Analytics scripts and reports

**For CRUD things & MCP server, add to `datadrivet-cofinder-portal`**

### Consider New Repository Only If

- **Different technology stack** (i.e not python)
- **Different deployment target** (e.g., mobile app, embedded system)
- **External collaboration** (will be shared with external partners)
- **Regulatory isolation** (compliance requires separate codebase)

## Getting Started with Existing Repositories

### 1. Clone and Setup

```bash
# Example: Main infrastructure repository
git clone git@github.com:knowit-solutions-cocreate/datadrivet-infra-opendatastack.git
cd datadrivet-infra-opendatastack
direnv allow
```

### 2. Explore Available Commands

```bash
menu
```

See each respective repository's `REAMDE.md` for mor information on how to start
contributing.

## Contributing Guidelines

0. **Use Vibes with Care** - Write your code first and then let your vibe-tool
   of choice iterate on it. We are interested in how you think. At the time of
   writing(August 2025), Agents/LLMs tend to overlook existing coding patterns
   and this causes a lot of technical debt.
1. **See rule 0** -

## Repository Maintenance

Each repository has designated maintainers:

- **Primary contact**: Jimmy Flatting
- **Access management**: Repository owners manage SOPS keys and permissions
- **Code review**: All changes require pull request review

## Need Help?

- **General questions**: Ask in #cofinder or #cofinder-dev
- **New repository requests**: Discuss in the above channels
