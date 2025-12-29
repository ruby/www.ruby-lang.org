www.ruby-lang.org
=================

[![Join the chat at https://gitter.im/ruby/www.ruby-lang.org](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/ruby/www.ruby-lang.org?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

[![Build Status](https://github.com/ruby/www.ruby-lang.org/workflows/ci/badge.svg)](https://github.com/ruby/www.ruby-lang.org/actions?query=branch%3Amaster)

This is the [Jekyll](http://www.jekyllrb.com/) source code for the official [Ruby programming language website](https://www.ruby-lang.org/).

## 🚀 Quick Start

**First time contributing?** Welcome! This guide will help you get the website running locally in just a few steps.

### Prerequisites

- **Ruby** (latest stable version recommended) - [Install Ruby](https://www.ruby-lang.org/en/documentation/installation/)
- **Node.js** (for Tailwind CSS) - [Install Node.js](https://nodejs.org/)
- **Git** - [Install Git](https://git-scm.com/downloads)

### Get It Running

1. **Install Bundler** (if you haven't already):
   ```sh
   gem install bundler
   ```

2. **Clone and setup the project**:
   ```sh
   git clone https://github.com/ruby/www.ruby-lang.org.git
   cd www.ruby-lang.org/
   bundle config set --local without production
   bundle install
   npm install
   ```

3. **Start the development server**:
   ```sh
   bundle exec rake serve
   ```

4. **View the website**: Open [http://localhost:4000/](http://localhost:4000/) in your browser

   ⏱️ **Note:** The initial build takes several minutes. Make some tea! 🍵

## 🤝 How to Contribute

### Quick Fixes
- **Found a typo?** Just edit the Markdown file and submit a pull request!
- **Broken link?** Open an issue and we'll fix it quickly
- **Translation error?** Check our [translation guidelines](https://github.com/ruby/www.ruby-lang.org/wiki)

### Making Changes

1. **Find the content**: Website pages are in Markdown format in language-specific folders (e.g., `en/`, `ja/`, `es/`)
2. **Create a branch**: `git checkout -b fix-typo-in-getting-started`
3. **Make your changes**: Edit the Markdown files
4. **Test as you go**: Run `bundle exec rake serve` to preview your changes
5. **Run the test suite**: Before submitting, ensure all tests pass (see Testing section below)
6. **Submit**: Open a pull request with a clear description

**New to open source?** Check out [First Contributions](https://github.com/firstcontributions/first-contributions) for a beginner-friendly guide.

## 🛠️ Development

### Local Development
```sh
# Quick development server (faster rebuilds)
bundle exec jekyll serve --watch --future --incremental

# development server (faster rebuilds, but may miss CSS changes)
bundle exec jekyll serve --watch --future

# Full build (for testing)
bundle exec rake build
```

⚠️ **About `--incremental` flag**: While it speeds up rebuilds, it can sometimes miss changes due to caching. If your changes aren't appearing:
1. Try restarting the server
2. If that doesn't work, clean the cache:
   ```sh
   rm -rf _site .jekyll-cache
   bundle exec jekyll serve --watch --future
   ```

### 🎨 Working with Tailwind CSS

This site uses [Tailwind CSS](https://tailwindcss.com/) via [jekyll-postcss-v2](https://github.com/mhanberg/jekyll-postcss-v2).

**CSS is automatically processed during Jekyll builds**, so you don't need to run separate commands in most cases.

#### CSS File Structure
- `stylesheets/main.css` - Main CSS file (imports all others + Tailwind)
- `stylesheets/variables.css` - CSS custom properties
- `stylesheets/components/*.css` - Component-specific styles

#### When CSS Changes Don't Apply

If you modify `stylesheets/components/*.css` or `variables.css` and changes aren't reflected:

1. **Without `--incremental`**: Changes should be detected automatically
2. **With `--incremental`**: Restart Jekyll first
   ```sh
   # Stop the server (Ctrl+C) and restart
   bundle exec jekyll serve --watch --future --incremental
   ```
3. **Still not working?** Clean build cache and restart (this always works):
   ```sh
   rm -rf _site .jekyll-cache
   bundle exec jekyll serve --watch --future
   ```

💡 **Tip**: For CSS-heavy development, consider using `--watch --future` without `--incremental` for more reliable change detection.

#### How It Works

CSS processing happens automatically via PostCSS:
- `postcss-import` - Combines all CSS files into one
- `tailwindcss` - Processes Tailwind utilities based on HTML/Markdown content
- `autoprefixer` - Adds vendor prefixes for browser compatibility

Configuration files:
- `tailwind.config.js` - Tailwind configuration
- `postcss.config.js` - PostCSS plugins

### Testing Your Changes

**Important**: Always run the full test suite before submitting a pull request:

```sh
bundle exec rake lint          # Check markdown formatting
bundle exec rake check:markup  # Validate HTML output
bundle exec rake check:links   # Check for broken links (requires local server)
```

You can run these tests while developing to catch issues early.

## 🌐 Translations

This project supports multiple languages! Each language has its own folder:
- `en/` - English (base language)
- `ja/` - Japanese
- `es/` - Spanish
- `fr/` - French
- And many more...

**Want to help translate?** See our [translation guide](https://github.com/ruby/www.ruby-lang.org/wiki) for detailed instructions.

## 📝 Content Guidelines

- **Keep it simple**: Write for a global audience of developers with varying English proficiency
- **Be clear**: Use straightforward language that's easy to understand
- **Stay current**: Update version numbers and examples regularly
- **Test your changes**: Always preview locally before submitting

## 🔧 Heroku Preview (Advanced)

If you can't build locally or want to test under production conditions:

1. **Setup Heroku**: Sign up at [heroku.com](http://www.heroku.com) and install [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli)

2. **Create preview app**:
   ```sh
   heroku login
   heroku create --buildpack https://github.com/ruby/heroku-buildpack-www-ruby-lang.git
   ```

3. **Deploy your branch**:
   ```sh
   git push heroku your-branch-name:master
   heroku open
   ```

## 💬 Getting Help

- **Questions?** Join our [Gitter chat](https://gitter.im/ruby/www.ruby-lang.org)
- **Found a bug?** [Open an issue](https://github.com/ruby/www.ruby-lang.org/issues)
- **Need more info?** Check the [project wiki](https://github.com/ruby/www.ruby-lang.org/wiki)


## Testing

Besides generating and previewing the site
you can perform additional tests with these tasks:
 
``` sh
bundle exec rake lint          # run linter on markdown files
bundle exec rake check:markup  # check markup for all generated pages
bundle exec rake check:links   # check for 404's (needs a running local server)
```

## 📚 More Information

For detailed contribution guidelines, coding standards, and project structure, see our [wiki](https://github.com/ruby/www.ruby-lang.org/wiki).

---

**Thank you for helping make Ruby's website better for everyone!** 🎉
