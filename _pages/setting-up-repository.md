---
title: Setting up a Repository
permalink: /new-repository/
toc: true
sidebar:
  nav: "repos"
---

## Step 1: Do You Really Need a New Repository?

### Default approach: Use existing repositories (monorepo)

Before creating a new repository, consider adding your project to one of our
existing repositories. This approach offers several benefits:

- **Shared infrastructure** - Leverage existing CI/CD, secrets, and tooling
- **Reduced maintenance** - No need to duplicate devenv configurations
- **Better collaboration** - All related projects in one place
- **Simplified dependency management** - Shared libraries and utilities

### When to Use Existing Repositories

- **Data pipelines** → Add to `datadrivet-infra-opendatastack`
- **Web applications** → Add to existing web projects repository
- **Utilities and scripts** → Add to `datadrivet-infra-opendatastack`
- **Experiments and prototypes** → Add to appropriate existing repository

## Step 2: Valid Reasons for a New Repository

Create a new repository ONLY if you have a compelling reason:

### ✅ Good Reasons for New Repository

1. **Different technology stack** - Requires fundamentally different toolchain
   (e.g., Go project when existing repos are Python)
2. **Different deployment model** - Needs separate CI/CD pipeline or deployment
   target
3. **Different access control** - Requires different team permissions or
   security boundaries
4. **External collaboration** - Will be shared with external parties or
   open-sourced
5. **Different lifecycle** - Has significantly different release cadence or
   maintenance schedule
6. **Regulatory/compliance** - Must be isolated due to compliance requirements

### ❌ Poor Reasons for New Repository

- "It feels cleaner" - Organization preference without technical merit
- "Different programming language" - Many monorepos successfully handle multiple
  languages
- "It's a new feature" - Features should typically be part of existing
  applications
- "Different team" - Teams can share repositories with proper folder
  organization using github CODEOWNERS

## Step 3: Creating a New Repository (If Justified)

If you have a valid reason from Step 2, create your repository using our
template:

### Use the Template Repository

1. Navigate to
   [datadrivet-template](https://github.com/knowit-solutions-cocreate/datadrivet-template)
2. Click **"Use this template"** → **"Create a new repository"**
3. Configure your new repository:
   - **Owner**: `knowit-solutions-cocreate`
   - **Repository name**: Follow naming convention `datadrivet-[purpose]`
   - **Description**: Clear description of the repository's purpose
   - **Visibility**: Private (unless specifically needs to be public)
4. Click **"Create repository from template"**

### Initial Setup

After creating from template:

```bash
git clone git@github.com:knowit-solutions-cocreate/your-new-repo.git
cd your-new-repo
direnv allow
```

The template includes:

- Pre-configured `devenv.yaml`
- SOPS secrets management setup
- Common development scripts
- GitHub Actions workflows
- Pre-commit hooks

### Add Team Members

1. Each team member follows the [Getting Started](/getting-started/) guide
2. Each member generates their age key using `setup-age-key`
3. Add their public keys to `.sops.yaml`
4. Create PR with the new keys
5. Admin runs `updatekeys` to grant access to secrets
6. Merge the PR

## Step 4: Documentation Requirements

Document your decision in the repository README:

```markdown
## Why This Repository Exists

**Justification for separate repository:** [Explain which criteria from "Valid
Reasons" above applies]

**Considered alternatives:**

- Adding to datadrivet-infra-opendatastack: [why not suitable]
- Adding to [other-repo]: [why not suitable]
```

## Need Help Deciding?

If you're unsure whether your project needs a new repository:

1. Review existing repositories in
   [Existing Repositories](/existing-repositories/)
2. Discuss with the Datadrivet team:
   - Jimmy Flatting

**Remember**: When in doubt, start with the existing `datadrivet-infra-opendatastack`. You can always
refactor later if a genuine need emerges.
