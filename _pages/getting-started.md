---
title: Getting Started
permalink: /getting-started/
toc: true
sidebar:
  nav: "docs"
---

## Prerequisites

- GitHub account with access to
  [knowit-solutions-cocreate](https://github.com/orgs/knowit-solutions-cocreate/)
  organization
- Access to the Datadrivet team
- Terminal access and curl installed

## Overview

CoFinder is currently transitioning from a `nix` + `devenv` + `direnv`
development setup to a dev container workflow. Both methods are still
available.

For new developers, prefer the dev container path unless someone on the team
asks you to use the Nix-based setup for a specific reason.

The older Nix-based setup exists to minimize manual scripts, setups and
"it works on my machine" problems. This trinity of tools does a few things:

- Nix is a package manager. You won't have to touch it if you don't want to.
- Devenv is a wrapper on a subset of functionality of nix. It provides isolated
  development environments and simplifies working with nix.
- Direnv is a convenience package which hooks into your terminal to
  automatically source `.envrc` and `.env` files.

Together, they create a robust foundation that facilitates collaboration and
minimizes manual setups/configurations. This documentation will instruct you to
either:

1. use the dev container workflow, or
2. use the legacy `nix` + `devenv` + `direnv` workflow

and then configure access to secrets stored in the `cofinder` monorepo.

## Recommended Path

For most new developers, use the dev container workflow:

1. Clone `cofinder`
2. Open the repo in VS Code with `code .`
3. Let the dev container build
4. Sign in with Azure and choose `datadrivet-dev` if prompted
5. Decrypt the required secret files after your age key has been approved

Use the Nix-based workflow below if you prefer it or if the team asks you to.

## Alternative Path: Nix + Devenv + Direnv

Below are setups for Windows with WSL (recommended), macOS and Linux.

### Windows with WSL

Use [NixOS-WSL](https://github.com/knowit-solutions-cocreate/NixOS-WSL/releases/). This
WSL distribution contains the necessary dependencies to work with the holy
trinity nix+devenv+direnv.

1. Get WSL by running `wsl --install` in PowerShell
2. Find the latest nixos.wsl file [here](https://github.com/knowit-solutions-cocreate/NixOS-WSL/releases/),
   download it and run it (in Windows)
3. Find "NixOS App" in Windows Start Menu to open a NixOS terminal
4. Run `sudo nixos-rebuild switch` to sync your NixOS packages
5. Activate direnv in your bash shell by running `echo 'eval "$(direnv hook bash)"' >> ~/.bashrc`

**Success indicator:** Pressing Windows key, typing "nix" then Enter gives you a NixOS terminal.

### macOS

⚠️ **Important Note for Microsoft Defender for Mac Users**: Microsoft Defender
for Mac, which is bundled with new Knowit laptops, has severe performance issues
with Nix and development environments due to real-time scanning of the many
files involved. This makes the development environment cripplingly slow.

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

Then set up your shell to use direnv, in the case of bash:

```bash
echo 'eval "$(direnv hook bash)"' >> ~/.bashrc
```

This sets up direnv to automatically activate the development environment when
you enter that folder.

Allow devenv's caching system:

```bash
sudo tee -a /etc/nix/nix.conf <<EOF
extra-substituters = https://devenv.cachix.org
extra-trusted-public-keys = devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw=
EOF
```

**Success indicator:** Commands complete without errors.

### Linux

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

Then set up your shell to use direnv, in the case of bash:

```bash
echo 'eval "$(direnv hook bash)"' >> ~/.bashrc
```

This sets up direnv to automatically activate the development environment when
you enter that folder.

**Success indicator:** Commands complete without errors.

## 2. Set up access to git
Close your current terminal and open a new one.

Create a private key ("password") for letting your machine access GitHub repos
over SSH:
```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
```

Add the content of the generated `~/.ssh/id_ed25519.pub` file under SSH keys in your
[github settings](https://github.com/settings/keys).
(The id_ed25519.pub content is a non-sensitive key that github uses to verify that your computer knows the secret "password" in id_ed25519.)


Then, clone [cofinder](https://github.com/knowit-solutions-cocreate/cofinder):
```bash
git clone git@github.com:knowit-solutions-cocreate/cofinder.git
```

**Success indicator:** Running `ls` shows that you have the `cofinder`
directory locally.


## 3. Verification

```bash
cd cofinder
```

At this point you should be able to enter the repo and initialize the local
development environment. Depending on your setup, you may be prompted to allow
`direnv`:

```bash
direnv allow
```

If you use the dev-container flow, open the repo in VS Code:

```bash
code .
```

The current dev-container setup will prompt you to sign in with Azure and
choose `datadrivet-dev`.

**Success indicator:** You can enter the repository and initialize the
development environment. It is normal if secret-related errors appear at this
stage, because you do not have access to encrypted secrets yet.

If installation fails, contact Alexander Reinthal or Jimmy Flatting.

## 4. Set Up Secrets Management

To decrypt secrets stored in git, you need an age key pair and for someone to
grant your key access to the repository secrets.

### 4.1 Generate an Age Key

Run this command from inside the repository:

```bash
setup-age-key
```

Output will look like this:

```bash
kog@test-ubuntu:~/cofinder$ setup-age-key
Setting up age key for sops...
Generating new age key...
Public key: age1vhctyw5e38fr8s6dmaygltsl0rtd6zd34tp88za4purrrcn7vqdq3hf0lw
Age key generated successfully!
Please save your public key and add it to .sops.yaml:
# public key: age1vhctyw5e38fr8s6dmaygltsl0rtd6zd34tp88za4purrrcn7vqdq3hf0lw
```

**Important:**

- Save the public key displayed in the terminal
- The private key is stored in `~/.config/sops/age/keys.txt` (or at `~/Library/Application Support/sops/age/keys.txt` if you're on a mac) and should be kept
  secret
- You'll need to enter the public key in `.sops.yaml` located in the repository
  root

**Success indicator:** Public key is generated and displayed.

### 4.2 Add Your Key to the Project

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

3. Any team member who has already been granted access will:
   - Review your PR
   - Run `sops updatekeys secrets/x.env` for the relevant encrypted env files on
     your branch and push the changes
   - Approve and merge your PR

**Success indicator:** PR is created and merged successfully.

### 4.3 Start Development

Once your PR is merged:

```bash
sops -d secrets/backend.env > backend/.env
sops -d secrets/frontend.env > frontend/.env
sops -d secrets/pipelines.env > pipelines/.env
```

Then reload the shell environment if needed:

```bash
direnv allow
```

You should now be able to inspect the helper commands:

```bash
menu
```

From there you can either use the dev container or run services locally. Common
starting points are:

```bash
docker compose -f docker-compose.yaml up
```

or:

```bash
cd frontend && npm run dev
cd backend && uv run fastapi dev cofinder_api/main.py --host 0.0.0.0 --port 8000 --reload
cd pipelines && dagster dev
```

**Success indicator:** SOPS decrypts successfully, the project-specific `.env`
files exist, and you can run commands such as `menu`.

## 5. Next Steps

Consult the repository-specific documentation for the part of the monorepo you
want to work in next.
