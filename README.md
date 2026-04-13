# Datadrivet docs

This repository powers https://docs.datadrivet.dev.

It is a Jekyll site hosted with GitHub Pages. Content is written in Markdown and
mostly lives in:

- `_pages/` for permanent documentation pages
- `_posts/` for dated Slack Wisdom entries
- `_data/navigation.yml` for top navigation and sidebars
- `assets/` for images and diagrams

## Local development

If you already use the Datadrivet Nix/devenv setup:

```bash
devenv shell
bundle exec jekyll serve
```

Then open `http://127.0.0.1:4000`.

If Bundler dependencies are missing, run:

```bash
bundle install
```

## Editing guidelines

- Prefer updating existing pages over adding new top-level pages.
- Keep onboarding docs task-oriented and explicit about prerequisites.
- Do not leave `TODO`, placeholder headings, or draft values in published pages.
- Add images under `assets/images/` and use descriptive filenames.
- For Slack snippets, add a dated file under `_posts/` using the format
  `YYYY-MM-DD-short-title.md`.

## Publishing

Changes merged to `main` are published through GitHub Pages.
