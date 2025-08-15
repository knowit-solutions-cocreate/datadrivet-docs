---
layout: page
title: Existing Repositories
nav_order: 30
---

## Existing Repositories

Overview of current Datadrivet repositories and their purposes.

## Main Infrastructure Repository

### [datadrivet-infra-opendatastack](https://github.com/knowit-solutions-cocreate/datadrivet-infra-opendatastack)

#### Primary data infrastructure and pipeline repository

- **Purpose**: Main data processing pipelines, ETL jobs, and analytics
  infrastructure
- **Technology**: Python, dbt, Dagster, Apache Airflow
- **Use Cases**:
  - Data ingestion from various sources (Airtable, Teamtailor, etc.)
  - Data transformations and modeling
  - Analytics and reporting pipelines
  - ML model training and inference

**When to add here**: Most data-related projects, utilities, and experiments
should start here.

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
- ✅ ML experiments and models
- ✅ Utility scripts and tools
- ✅ Data quality checks and monitoring
- ✅ API endpoints and services

### Examples by Project Type

| Project Type             | Recommended Location             | Rationale                          |
| ------------------------ | -------------------------------- | ---------------------------------- |
| New data connector       | `datadrivet-infra-opendatastack` | Shares ETL infrastructure          |
| Analytics dashboard      | `datadrivet-infra-opendatastack` | Uses existing data models          |
| ML model training        | `datadrivet-infra-opendatastack` | Leverages data pipelines           |
| Data quality monitoring  | `datadrivet-infra-opendatastack` | Integrates with existing workflows |
| External API integration | `datadrivet-infra-opendatastack` | Shares secrets and configuration   |

### Consider New Repository Only If

- **Different technology stack** (e.g., Java/Spring Boot application)
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

### 3. Understand the Structure

Each repository typically has:

- **Root**: Configuration files (`devenv.yaml`, `.sops.yaml`, `.envrc`)
- **src/**: Source code organized by functionality
- **scripts/**: Utility scripts and tools
- **secrets/**: Encrypted configuration and credentials
- **docs/**: Repository-specific documentation

### 4. Find Your Area

Look for existing directories that match your work:

- **Data connectors**: Usually in `src/connectors/` or `src/sources/`
- **Transformations**: In `dbt/` or `src/transforms/`
- **APIs**: In `src/api/` or `src/services/`
- **Analytics**: In `src/analytics/` or `notebooks/`

## Contributing Guidelines

1. **Follow existing patterns** - Look at similar code in the repository
2. **Update documentation** - Add or update relevant docs
3. **Add tests** - Include appropriate test coverage
4. **Use pre-commit hooks** - Code will be automatically formatted and linted
5. **Update menu scripts** - Add your commands to the `menu` for discoverability

## Repository Maintenance

Each repository has designated maintainers:

- **Primary contact**: Alexander Reinthal, Jimmy Flatting
- **Access management**: Repository owners manage SOPS keys and permissions
- **Code review**: All changes require pull request review

## Need Help?

- **General questions**: Ask in team Slack channels
- **Technical issues**: Create issues in the relevant repository
- **Access problems**: Contact repository maintainers
- **New repository requests**: Discuss with team leads first

Remember: **When in doubt, start with the main infrastructure repository**. You
can always refactor later if a genuine need for separation emerges.
