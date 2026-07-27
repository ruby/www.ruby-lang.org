# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is the Jekyll-based source for the official Ruby programming language website (www.ruby-lang.org), featuring multi-language support for 16+ languages and a Tailwind CSS-based design system.

## Build & Development Commands

### Jekyll Site Operations

```bash
# Build the site and its search index (takes several minutes)
bundle exec rake build

# Serve locally at http://localhost:4000/ (rebuilds, so no search index)
bundle exec rake serve

# Serve an already-built site, search included, without live reload
bundle exec rake serve-built

# Alternative: Jekyll direct serve with incremental builds
bundle exec jekyll serve --watch --future --incremental
```

### CSS (Tailwind)

```bash
# Build CSS (production)
npm run build-css

# Watch CSS for development
npm run watch-css
```

### Testing & Quality Assurance

```bash
# Run all tests (includes linter, lint, build)
bundle exec rake test

# Run individual test suites
bundle exec rake test-news-plugin     # News archive plugin tests
bundle exec rake test-linter          # Linter library tests
bundle exec rake test-search-index    # Search index library tests

# Linting
bundle exec rake lint                 # Markdown linter

# Post-build validation (requires built site)
bundle exec rake check:markup         # Validate HTML markup
bundle exec rake check:links          # Check for broken links (needs local server running)
```

### Creating News Posts

```bash
# Create news post template for specific language
bundle exec rake new_post:en    # English
bundle exec rake new_post:ja    # Japanese
bundle exec rake new_post:fr    # French
# ... etc for: bg, de, es, id, it, ko, pl, pt, ru, tr, vi, zh_cn, zh_tw
```

## Architecture & Structure

### Multi-Language System

- **16 supported languages**: bg, de, en, es, fr, id, it, ja, ko, pl, pt, ru, tr, vi, zh_cn, zh_tw
- Language-specific content organized in top-level directories (e.g., `/en/`, `/ja/`)
- Locale data stored in `_data/locales/*.yml`
- Language switching handled by `_includes/language_selector.html`

### Jekyll Configuration

- **Markdown**: Kramdown with Rouge syntax highlighting
- **Timezone**: UTC (critical for news posts)
- **Permalinks**: Pretty URLs
- **Build output**: `_site/` directory

### Key Directories

- `_layouts/`: Page templates (default, homepage, news_post, news_archive_month, etc.)
- `_includes/`: Reusable components (header, footer, navigation, toc, sidebar)
- `_plugins/`: Custom Jekyll plugins (news archive generator, posted_by, translation_status)
- `_data/`: YAML data files (releases.yml, downloads.yml, branches.yml, locales/)
- `lib/`: Ruby utilities (linter, markup checker, draft release)
- `test/`: Test files for plugins and linter
- `stylesheets/`: CSS source and compiled output
- `_javascripts_src/`: TypeScript source files
- `javascripts/`: Compiled JavaScript output

### Design System (Tailwind CSS)

The site uses a custom Tailwind configuration with:

- **Semantic color tokens** via CSS variables (defined in `tailesheets/semantic-colors.css`)
  - Accessible via `bg-semantic-*`, `text-semantic-*`, `border-semantic-*` classes
  - Automatically handles light/dark mode via `prefers-color-scheme`
- **Brand colors**: Ruby (red) and Gold palettes
- **Typography plugin** for prose styling
- **Custom breakpoints**: Container max-widths configured for content layouts
- **Dark mode**: Enabled via OS preference (`darkMode: 'media'`)

Input: `stylesheets/tailwind.css` → Output: `stylesheets/compiled.css`

### News System

The news system is powered by a custom Jekyll plugin (`_plugins/news.rb`):

- **Archive generation**: Automatically creates yearly/monthly archive pages
- **Post structure**: Posts stored in `{lang}/news/_posts/YYYY-MM-DD-title.md`
- **Archive pages**: Index, yearly archives, monthly archives
- **RSS feeds**: Generated per language via `news_feed.rss` layout

### Search (Pagefind)

Search is client-side and needs no backend. `rake build` runs `npm run
build-search` over `_site` once Jekyll is done, so the index only exists after a
full build.

- **Indexed region**: `_includes/search_body.html` emits `data-pagefind-body` on
  the `<article>` of `page.html` and `news_post.html`. Everything outside it, and
  anything marked `data-pagefind-ignore` inside it, stays out of results.
- **Per-language indexes**: Pagefind splits the index by the `lang` attribute on
  `<html>` and the browser loads the one matching the page, so a translation only
  ever finds its own pages. The same attribute picks the interface language, so
  no UI strings live in `_data/locales`.
- **Unsupported languages**: `search.unsupported` in `_config.yml` lists the
  languages Pagefind cannot index well (currently `bg`). Their pages get no
  `data-pagefind-body`, and `lib/search_index.rb` rewrites `pagefind-entry.json`
  so they resolve to `search.fallback`. Without that rewrite Pagefind would fall
  back to whichever index has the most pages, which is not a language we choose.
- **UI**: `_includes/search.html` (button, modal, config) and
  `_includes/search_assets.html` (bundle, loaded before `compiled.css` so the
  site's `--pf-*` overrides win).

### Linter (`lib/linter.rb`)

Enforces strict content quality rules:

- YAML front matter validation (lang, author, translator, date)
- File naming conventions (date must match filename)
- UTC timezone enforcement for news posts
- Line ending consistency (LF only, no CRLF)
- Trailing whitespace checks
- Release post SHA hash validation (SHA1/SHA256/SHA512)
- Release data validation against `_data/releases.yml`

### Layout Hierarchy

```
default.html (base)
├── homepage.html
├── page.html
├── news.html
├── news_post.html
├── news_archive_year.html
├── news_archive_month.html
└── news_feed.rss
```

### Front Matter Requirements

**Standard pages:**
```yaml
---
layout: page
title: "Page Title"
lang: en
---
```

**News posts:**
```yaml
---
layout: news_post
title: "Post Title"
author: "Author Name"
translator: "Translator Name"  # Required for non-original language
date: YYYY-MM-DD HH:MM:SS +0000  # Must be UTC
lang: en
---
```

## TypeScript/JavaScript

- Source files in `_javascripts_src/` (TypeScript)
- Compiled to `javascripts/` (JavaScript)
- Files: `examples.ts`, `page.ts`
- No build command specified - likely manual compilation or external process

## Dependencies

**Ruby (Gemfile):**
- `jekyll` - Static site generator
- `rouge` - Syntax highlighting
- `rake` - Task automation
- `html-proofer` - Markup validation
- `validate-website` - Link checking
- `minitest` - Testing framework
- `csv`, `base64` - Ruby 3.4+ compatibility

**Node (package.json):**
- `tailwindcss` - CSS framework
- `@tailwindcss/typography` - Prose styling plugin
- `pagefind` - Static search index and UI

## Important Conventions

1. **All news posts must use UTC timezone** (`+0000`) in the date field
2. **File naming**: News posts must be `YYYY-MM-DD-title.md` matching the date in front matter
3. **Language codes**: Must match directory structure (e.g., `lang: en` for files in `/en/`)
4. **Translator field**: Required for translated news posts, not for original posts
5. **Line endings**: LF only, no CRLF
6. **Release posts**: Must include valid SHA checksums if referencing downloads

## CI/CD

GitHub Actions workflow (`.github/workflows/ci.yml`):
- Runs on: Ruby 3.2, Ubuntu latest
- Executes: `bundle exec rake test` (includes linter, lint, build)
- Triggers: Push and pull requests
