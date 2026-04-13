---
layout: single
title: Home
nav_order: 10
---

## Datadrivet Infrastructure Documentation

This site is the entry point for working in the Datadrivet and CoFinder
ecosystem: onboarding, repository conventions, system access, and architecture.

## Start Here

If you are new to the project, use these pages in order:

1. [Getting Started](/getting-started/) to install the local toolchain and
   verify that `devenv` works.
2. [Access](/access/) to understand which systems you need access to and who
   can grant it.
3. [Existing Repositories](/existing-repositories/) to decide where your work
   belongs.
4. [CoFinder](/cofinder/) to understand the main data flow and architecture.

## Overview

Our infrastructure is built on the foundation of Nix + Devenv + Direnv to
provide:

- **Reproducible environments** - Eliminate "works on my machine" issues
- **Isolated dependencies** - Each project has its own environment
- **Automatic setup** - Environment activates when you enter a project directory
- **Cross-platform support** - Works on Linux, macOS, and Windows (WSL)

## Main Sections

- [Getting Started](/getting-started/) - Local setup and first-run verification
- [Access](/access/) - System access, owners, and where credentials live
- [Existing Repositories](/existing-repositories/) - Where to add new work
- [Setting up a Repository](/new-repository/) - Criteria for creating a new repo
- [CoFinder](/cofinder/) - Pipeline and system overview
- [Ways of Working](/wow/) - Collaboration and review conventions
- [Slack Wisdom](/slack-wisdom/) - Short operational notes captured from Slack

## Slack Wisdom

Use [Slack Wisdom](/slack-wisdom/) for short operational fixes and recurring
troubleshooting notes that came out of project discussions.

To add a new entry:

1. Create a file under `_posts/` named `YYYY-MM-DD-short-title.md`.
2. Reuse the same front matter fields as the existing posts.
3. Add any images under `assets/images/` with descriptive filenames.

The page is generated automatically from posts in the `slack-wisdom` category.
