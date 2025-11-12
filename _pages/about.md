---
title: About
permalink: /about/
toc: true
---

## About Datadrivet Infrastructure

## Our Philosophy

The Datadrivet infrastructure is designed around the principle of **reproducible
development environments**. We believe that every developer should be able to
clone a repository and have a fully functional development environment within
minutes, without manual setup or configuration.

## Technology Stack

### Visual Overview

![img](https://i.imgur.com/kLJ8NFT.png)

### Core Tools

- **Nix** - A powerful package manager that ensures reproducible builds and
  deployments
- **Devenv** - A developer-friendly wrapper around Nix that simplifies
  environment management
- **Direnv** - Automatically loads environment variables and activates
  development environments

### Why This Stack?

1. **Reproducibility** - Every developer gets exactly the same environment
2. **Isolation** - Each project has its own dependencies without conflicts
3. **Cross-platform** - Works consistently across Linux, macOS, and Windows
   (WSL)
4. **Version pinning** - Lock specific versions of tools and dependencies
5. **Instant activation** - Environment loads automatically when entering a
   project directory

## Security Model

Our infrastructure uses **SOPS (Secrets OPerationS)** for secure secret
management:

- Secrets are encrypted at rest in Git repositories
- Each developer has their own age key for decryption
- Fine-grained access control per project
- No secrets in plaintext ever committed to version control

## Getting Help

If you encounter issues:

1. Check the [Getting Started](/getting-started/) guide
2. Review [existing repositories](/existing-repositories/) for examples
3. Contact the Datadrivet team:
   - Alexander Reinthal
   - Jimmy Flatting
