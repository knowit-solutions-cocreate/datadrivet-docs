---
layout: page
title: Getting Started
nav_order: 20
---

## Getting Started

## Prerequisites

- GitHub account with access to
  [knowit-solutions-cocreate](https://github.com/orgs/knowit-solutions-cocreate/)
  organization
- Access to the Datadrivet team
- Terminal access and curl installed

## Overview

To minimize manual scripts, setups and "it works on my machine" problems, all
repositories use a setup of Nix+Devenv+Direnv. This trinity of tools does a few
things:

- Nix is a package manager. You won't have to touch it if you don't want to.
- Devenv is a wrapper on a subset of functionality of nix. It provides isolated
  development environments and simplifies working with nix.
- Direnv is a convenience package which hooks into your terminal to
  automatically source `.envrc` and `.env` files.

Together, they create a robust foundation that facilitates collaboration and
minimizes manual setups/configurations. This documentation will instruct you to
setup nix+devenv+direnv, then configure access to secrets stored in these
repositories.

## 1. Setting up the Trinity

Below are setups for Linux, macOS and Windows.

### Identify Your Shell

To determine your current shell:

```bash
ps
```

### 1.1 Installing dependencies (Linux)

- Install nix

```bash
sh <(curl -L https://nixos.org/nix/install) --daemon
```

- Install devenv

```bash
nix-env --install --attr devenv -f https://github.com/NixOS/nixpkgs/tarball/nixpkgs-unstable/
```

- Install direnv

```bash
nix-env --install --attr direnv -f https://github.com/NixOS/nixpkgs/tarball/nixpkgs-unstable
```

Add these lines to `/etc/nix/nix.conf`:

```bash
sudo tee -a /etc/nix/nix.conf <<EOF
extra-substituters = https://devenv.cachix.org
extra-trusted-public-keys = devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw=
EOF
```

Then depending on the shell you are using:

For bash:

```bash
echo 'eval "$(direnv hook bash)"' >> ~/.bashrc
```

For zsh:

```bash
echo 'eval "$(direnv hook zsh)"' >> ~/.zshrc
```

For fish:

```bash
echo 'eval "$(direnv hook fish)"' >> ~/.fishrc
```

This sets up direnv to automatically activate the development environment when
you enter that folder.

**Success indicator:** Commands complete without errors.

### 1.2 Installing dependencies (macOS)

⚠️ **Important Note for Microsoft Defender for Mac Users**: Microsoft Defender
for Mac, which is bundled with new Knowit laptops, has severe performance issues
with Nix and development environments due to real-time scanning of the many
files involved. This makes the development environment crippingly slow.

**Recommended solutions:**

1. **Whitelist the Nix store**: Add `/nix/store` and your project directory to
   Microsoft Defender's exclusions
2. **Use a Remote machine**: Consider using a remote machine in Kubernetes
   instead
3. **Disable real-time protection**: Temporarily disable real-time protection
   during development if possible

**To add exclusions in Microsoft Defender for Mac:**

1. Open Microsoft Defender for Mac
2. Go to Preferences → Threat Protection
3. Under "Exclusions", add `/nix/store` and your project directory

- Install nix

```bash
curl -L \
https://github.com/NixOS/experimental-nix-installer/releases/download/0.27.0/nix-installer.sh | \
  sh -s -- install
```

- Install devenv

```bash
nix-env --install --attr devenv -f https://github.com/NixOS/nixpkgs/tarball/nixpkgs-unstable/
```

- Install direnv

```bash
nix-env --install --attr direnv -f https://github.com/NixOS/nixpkgs/tarball/nixpkgs-unstable
```

Then depending on the shell you are using:

For zsh:

```bash
echo 'eval "$(direnv hook zsh)"' >> ~/.zshrc
```

For bash:

```bash
echo 'eval "$(direnv hook bash)"' >> ~/.bashrc
```

For fish:

```bash
echo 'eval "$(direnv hook fish)"' >> ~/.fishrc
```

Allow devenv's caching system:

```bash
sudo tee -a /etc/nix/nix.conf <<EOF
extra-substituters = https://devenv.cachix.org
extra-trusted-public-keys = devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw=
EOF
```

**Success indicator:** Commands complete without errors.

### 1.3 Installing dependencies (Windows)

Use [NixOS-WSL](https://github.com/knowit-solutions-cocreate/nixos-wsl). This
WSL distribution contains the necessary dependencies to work with the holy
trinity nix+devenv+direnv. Navigate to it for further instructions. You can also
choose to run your own WSL distribution and proceed from the previous section
[Installing dependencies (Linux)].

**Success indicator:** WSL environment is running and accessible.

## 2. Verification

Close your current terminal and open a new one. Then, clone the repo
[datadrivet-infra-opendatastack](https://github.com/knowit-solutions-cocreate/datadrivet-infra-opendatastack/)
and cd into it:

```bash
direnv allow
```

You should see output similar to this:

```bash
datadrivet-infra-opendatastack on  feat/finalize-huge-refactor [!] is 📦 v3.45.5 via 🐍
❯ direnv allow
direnv: loading ~/repos/knowit/datadrivet-infra-opendatastack/.envrc
direnv: using devenv
• Using Cachix caches: devenv
✓ Building shell in 34.4ms
Running tasks     devenv:enterShell

Succeeded         devenv:python:uv                         31ms
Succeeded         devenv:enterShell                        2ms
*** CUT FOR BREVITY ***
  age1dj4tzl06h5lyftgvpkdf62483zsuj88swj5rny0wlrk02v54j9dscj4ekh: FAILED
    - | failed to load age identities: failed to open file: open
      | /home/user/.config/sops/age/keys.txt: no such file or
      | directory

Recovery failed because no master key was able to decrypt the file. In
order for SOPS to recover the file, at least one key has to be successful,
but none were.
direnv: using git_branch
```

**Success indicator:** Environment loads and shows the SOPS error (expected -
you don't have access to secrets yet). At this point you should be able to run
devenv shell commands like `menu`. Verify that you can before proceeding to the
next step.

If installation fails, contact Alexander Reinthal or Jimmy Flatting.

## 3. Set Up Secrets Management

To decrypt secrets stored in git, you need a key pair and for someone to grant
your key access to the secrets.

### 3.1 Generate an Age Key

Run this command:

```bash
setup-age-key
```

Output will look like this:

```bash
kog@test-ubuntu:~/datadrivet-infra-opendatastack$ setup-age-key
Setting up age key for sops...
Generating new age key...
Public key: age1vhctyw5e38fr8s6dmaygltsl0rtd6zd34tp88za4purrrcn7vqdq3hf0lw
Age key generated successfully!
Please save your public key and add it to .sops.yaml:
# public key: age1vhctyw5e38fr8s6dmaygltsl0rtd6zd34tp88za4purrrcn7vqdq3hf0lw
```

**Extra step for Mac users only:**

Mac expects the key file to be in a different location than where it gets generated. Move your key to the location Mac wants it to be at with 

```bash
# do this only if you're on a mac! 
mkdir -p ~/Library/Application\ Support/sops/age 
mv ~/.config/sops/age/keys.txt ~/Library/Application\ Support/sops/age/keys.txt
```


**Important:**

- Save the public key displayed in the terminal
- The private key is stored in `~/.config/sops/age/keys.txt` (or at `~/Library/Application Support/sops/age/keys.txt` if you're on a mac) and should be kept
  secret
- You'll need to enter the public key in `.sops.yaml` located in the repository
  root

**Success indicator:** Public key is generated and displayed.

### 3.2 Add Your Key to the Project

1. Add your public key to `.sops.yaml`:

   ```yaml
   keys:
     - &your_github_username age1your_public_key_here
   creation_rules:
     - path_regex: secrets/[^/]+\.(yaml|json|env|ini)$
       key_groups:
         - age:
             - *your_github_username
   ```

2. Create a Pull Request with your changes:

```bash
git checkout -b add-user123-to-secrets
git add .sops.yaml
git commit -m "chore: add user123 to sops secrets"
git push origin HEAD
```

1. Any team member who has already been granted access will:
   - Review your PR
   - Run `updatekeys` command to add your key to the encrypted secrets on your
     branch and push the changes
   - Approve and merge your PR

**Success indicator:** PR is created and merged successfully.

### 3.3 Start Development

Once your PR is merged:

```bash
direnv allow
```

Output should show successful loading:

```bash
direnv: loading ~/repos/knowit/datadrivet-infra-opendatastack/.envrc
direnv: using devenv
• Using Cachix caches: devenv
✓ Building shell in 33.9ms
Running tasks     devenv:enterShell

Succeeded         devenv:python:uv                         38ms
Succeeded         devenv:enterShell                        3ms
2 Succeeded                         42.62ms
uv 0.8.2
Python 3.12.11
Welcome ⊂(◉‿◉)þ!
Pre-commit hooks already installed ✓

 ____  ____  _____ _  _      ____  _____ ____
/   _\/  _ \/    // \/ \  /|/  _ \/  __//  __\
|  /  | / \||  __\| || |\ ||| | \||  \  |  \/|
|  \__| \_/|| |   | || | \||| |_/||  /_ |    /
\____/\____/\_/   \_/\_/  \|\____/\____\\_/\_\

type `menu` print this menu.

Dagster/dbt
-----------
type `dagster-dev` to start dagster development server.
type `dbt-deps` to install dbt dependencies.
type `dbt-compile` to compile dbt project & build manifest.
type `dbt-run` to run dbt models.
type `dbt-test` to run dbt tests.

Misc
----
type `setup-hooks` Reinstall githooks.
type `updatekeys` add new users to allowed list of sops.
type `setup-age-key` generate age key for sops encryption. (backs up existing key to .bkp)
type `setup-personal-env` Sets up personal environment file with snowflake
passwords and DAGSTER_HOME. (backs up existing .env to .bkp)
direnv: using sops
direnv: using git_branch
direnv: export +AIRTABLE_ADS_ENDPOINT +AIRTABLE_AD_VIEW +AIRTABLE_PAT +AR +AS
+AWS_ACCESS_KEY_ID +AWS_BUCKET +AWS_DEFAULT_REGION +AWS_ENDPOINT +AWS_SECRET_ACCESS_KEY
+CC +CMAKE_INCLUDE_PATH +CMAKE_LIBRARY_PATH +COFINDER_BACKEND_API_ENDPOINT
+COFINDER_BACKEND_API_KEY +CONFIG_SHELL +CONNECTIVITY_TEAMS_WEBHOOK_URL
+CONNECTIVITY__NOCODB__AUTH_TOKEN +CONNECTIVITY__NOCODB__JOB_ADS_ENDPOINT
+CONNECTIVITY__NOCODB__VIEW_URL +CURRENT_BRANCH +CXX +DAGSTER_HOME
+DESTINATION__SNOWFLAKE__CREDENTIALS__DATABASE
+DESTINATION__SNOWFLAKE__CREDENTIALS__HOST
+DESTINATION__SNOWFLAKE__CREDENTIALS__PASSWORD
+DESTINATION__SNOWFLAKE__CREDENTIALS__ROLE
+DESTINATION__SNOWFLAKE__CREDENTIALS__USERNAME
+DESTINATION__SNOWFLAKE__CREDENTIALS__WAREHOUSE
+DESTINATION___SLACK__COFINDER_ALERTER__CHANNEL_NAME
+DESTINATION___SLACK__FAILED_ALERTER__CHANNEL_NAME +DETERMINISTIC_BUILD
+DEVENV_DIRENVRC_ROLLING_UPGRADE +DEVENV_DIRENVRC_VERSION +DEVENV_DOTFILE
+DEVENV_PROFILE +DEVENV_ROOT +DEVENV_RUNTIME +DEVENV_STATE +DEVENV_TASKS
+DEV_TEAMS_WEBHOOK_URL +DIGITAL_MANAGEMENT_TEAMS_WEBHOOK_URL
+EMAIL_SERVICE_CONNECTION_STRING +INSIGHTS_TEAMS_WEBHOOK_URL +IN_NIX_SHELL +LD
+LITELLM_API_KEY +MINIO_DEV_PASSWORD +MINIO_DEV_USER +NIXPKGS_CMAKE_PREFIX_PATH
+NIX_BINTOOLS +NIX_BINTOOLS_WRAPPER_TARGET_HOST_aarch64_unknown_linux_gnu +NIX_CC
+NIX_CC_WRAPPER_TARGET_HOST_aarch64_unknown_linux_gnu +NIX_CFLAGS_COMPILE
+NIX_ENFORCE_NO_NATIVE +NIX_HARDENING_ENABLE +NIX_LDFLAGS
+NIX_PKG_CONFIG_WRAPPER_TARGET_HOST_aarch64_unknown_linux_gnu +NIX_STORE +NM
+OBJCOPY +OBJDUMP +OLLAMA_API_KEY +OPENAI_API_KEY +OPENAI_BASE_URL
+OPENROUTER_API_KEY +PHOENIX_API_KEY +PHOENIX_ENDPOINT +PKG_CONFIG +PKG_CONFIG_PATH
+PYTHONHASHSEED +PYTHONNOUSERSITE +PYTHONPATH +RANLIB +READELF +SHLINK_API_KEY
+SHLINK_ENDPOINT +SIZE +SLACK_TOKEN +SOLUTIONS_UPPSALA_LINKOPING_OREBRO_WEBHOOK_URL
+SOURCES__PLAUSIBLE__API_KEY +SOURCES__SLACK__CHANNEL_ID +SOURCES__SLACK__CLIENT_TOKEN
+SOURCES__TEAMTAILOR__API_KEY +SOURCE_DATE_EPOCH +STRINGS +STRIP +TARGET
+UV_PROJECT_ENVIRONMENT +UV_PYTHON_DOWNLOADS +UV_PYTHON_PREFERENCE +VIRTUAL_ENV
+_PYTHON_HOST_PLATFORM +_PYTHON_SYSCONFIGDATA_NAME +cmakeFlags +configureFlags
+hardeningDisable +mesonFlags +name +system ~PATH ~XDG_DATA_DIRS
```

Environment variables like `AIRTABLE_ADS_ENDPOINT` are now loaded into your
shell.

**Success indicator:** Environment variables are exported and accessible.

## 4. Browse Repository Options

```bash
menu
```

Consult the repository specific documentation for next steps.
