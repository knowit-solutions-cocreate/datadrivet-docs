---
layout: page
title: Home
nav_order: 10
---

## Datadrivet Infrastructure Documentation

Welcome to the Datadrivet infrastructure documentation. This site provides
comprehensive guides for setting up and working with our development
environment.

## Quick Navigation

- [Getting Started](02-getting-started.html) - Set up your development
  environment
- [About](06-about.html) - Learn about our infrastructure approach
- [Setting up a Repository](05-setting-up-repository.html) - Create new projects
- [Existing Repositories](03-existing-repositories.html) - Browse current
  projects

## Overview

Our infrastructure is built on the foundation of Nix + Devenv + Direnv to
provide:

- **Reproducible environments** - Eliminate "works on my machine" issues
- **Isolated dependencies** - Each project has its own environment
- **Automatic setup** - Environment activates when you enter a project directory
- **Cross-platform support** - Works on Linux, macOS, and Windows (WSL)

Get started by following our [Getting Started](02-getting-started.html) guide.

## Adding to Slack Wisdom

In the tab [Slack wisdom](07-slack-wisdom.html), we have short snippets from Slack that can prove to be useful in the long term. In order to add a new snippet, create a new file under _posts, using naming convention YYYY-MM-DD-brief-post-name.md . Make sure that your post has the front matter defined like the other posts in the folder. If there are any images you want to use in the post, place these under assets/images with a descriptive name. 

You don't need to do anything else, the feed of posts in [Slack wisdom](07-slack-wisdom.html) is automatically generated from post

You don't need to PR adding a single post, just merge directly to main. YOLO.
