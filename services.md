---
layout: page
title: Services
nav_order: 5
---

# Services

Overview of available infrastructure services and tools in the Datadrivet ecosystem.

## Development Environment Services

### Nix + Devenv + Direnv
- **Purpose**: Reproducible development environments
- **Usage**: Automatically activated when entering project directories
- **Benefits**: Consistent tooling, isolated dependencies, cross-platform support

### SOPS (Secrets OPerationS)
- **Purpose**: Encrypted secret management
- **Usage**: Store API keys, database credentials, and other secrets securely in Git
- **Access**: Controlled via age keys, managed per-developer

## Data Infrastructure Services

### Apache Airflow (via Dagster)
- **Purpose**: Data pipeline orchestration
- **Usage**: Schedule and monitor data workflows
- **Access**: Through `dagster-dev` command in development environment

### dbt (Data Build Tool)
- **Purpose**: SQL-based data transformations
- **Usage**: Transform raw data into analytics-ready datasets
- **Commands**: `dbt-run`, `dbt-test`, `dbt-compile`

### Snowflake
- **Purpose**: Cloud data warehouse
- **Usage**: Store and query large datasets
- **Access**: Credentials managed through SOPS

### MinIO
- **Purpose**: S3-compatible object storage
- **Usage**: Development and testing object storage
- **Access**: Local development instances via devenv

## Monitoring and Observability

### Phoenix
- **Purpose**: ML model monitoring and observability
- **Usage**: Track model performance and data drift
- **Access**: API key managed through SOPS

### Slack Integration
- **Purpose**: Notifications and alerting
- **Usage**: Pipeline status, error alerts, and team notifications
- **Access**: Bot tokens managed through SOPS

## External Integrations

### Airtable
- **Purpose**: Structured data storage and workflows
- **Usage**: Job ads, team data, and workflow management
- **Access**: API tokens managed through SOPS

### Teamtailor
- **Purpose**: Recruitment data integration
- **Usage**: Job postings and candidate data
- **Access**: API key managed through SOPS

### Plausible Analytics
- **Purpose**: Privacy-friendly web analytics
- **Usage**: Website and application usage tracking
- **Access**: API key managed through SOPS

## AI and ML Services

### OpenAI
- **Purpose**: Large language models and AI services
- **Usage**: Text generation, analysis, and processing
- **Access**: API key managed through SOPS

### LiteLLM
- **Purpose**: Unified interface for multiple LLM providers
- **Usage**: Abstract away different AI service APIs
- **Access**: API key managed through SOPS

### Ollama
- **Purpose**: Local LLM inference
- **Usage**: Run language models locally for development
- **Access**: API key managed through SOPS

## Development Tools

### Pre-commit Hooks
- **Purpose**: Code quality enforcement
- **Usage**: Automatically format and lint code before commits
- **Setup**: Installed automatically with `setup-hooks`

### GitHub Actions
- **Purpose**: CI/CD pipelines
- **Usage**: Automated testing, deployment, and releases
- **Configuration**: Defined in `.github/workflows/`

## Getting Access

Most services require proper setup of your development environment:

1. Complete the [Getting Started](getting-started.html) setup
2. Generate your age key with `setup-age-key`
3. Get added to project secrets by team administrator
4. Run `direnv allow` to load service credentials

## Service Status and Health

- **Development Environment**: Check with `menu` command
- **External Services**: Status typically displayed in Slack channels
- **Data Pipelines**: Monitor through Dagster UI (`dagster-dev`)

## Adding New Services

When adding a new external service:

1. Add credentials to appropriate secrets file
2. Update `.sops.yaml` with team member access
3. Document the service in this page
4. Update relevant devenv scripts for easy access

Need help with a specific service? Contact the Datadrivet team.