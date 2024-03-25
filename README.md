www.ruby-lang.org
=================

[![Join the chat at https://gitter.im/ruby/www.ruby-lang.org](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/ruby/www.ruby-lang.org?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

[![Build Status](https://github.com/ruby/www.ruby-lang.org/workflows/ci/badge.svg)](https://github.com/ruby/www.ruby-lang.org/actions?query=branch%3Amaster)

This is the [Jekyll](http://www.jekyllrb.com/) source of
the [www.ruby-lang.org](https://www.ruby-lang.org/) website.

## How to Contribute?

You can contribute by reporting errors or suggesting improvements.
Just open an issue or pull request.

This is a big project with many translations involved.
Please help us stay on top of things by following our
[guidelines for contributors](https://github.com/ruby/www.ruby-lang.org/wiki).

## Get It!

Bundler will take care of the dependencies, so unless you
already have done so, you might need to install bundler with:

``` sh
gem install bundler
```

Then clone the repository and install the dependencies:

``` sh
git clone https://github.com/ruby/www.ruby-lang.org.git
cd www.ruby-lang.org/
bundle config set --local without production
bundle install
```

## Make Changes

Making changes is easy:
just locate the Markdown source of the page you want to improve,
then make your changes or add content.

If you plan to submit a pull request or want to preview your changes
on Heroku, you need to

* create a topic branch,
* commit your changes to this branch.

See the [project's wiki][wiki] for some guidelines on how
your commits and PRs should look like.

## Preview Your Changes

### Preview Locally

Generate the website with

``` sh
bundle exec rake build
```

Then start a local web server with

``` sh
bundle exec rake serve
```

Open [http://localhost:4000/](http://localhost:4000/)
in your browser to access the preview.

**Note:** The build of the site will take several minutes.

Alternatively, you can use Jekyll directly.

```
bundle exec jekyll serve --watch --future --incremental
```

If your draft uses future date, you may want to use `--future` option.

### Preview on Heroku

In case a build is not possible on your local machine
or you want to test your changes under production conditions
you can also create a preview on Heroku.

  * Sign up for [Heroku](http://www.heroku.com) if you do not have
    an account yet.

  * Install the [Heroku Toolbelt](https://toolbelt.heroku.com).

  * Unless you already have, `cd` into your local working copy of this repo.

  * Create a preview app on Heroku using the custom buildpack:

    ``` sh
    heroku login
    heroku create --buildpack https://github.com/ruby/heroku-buildpack-www-ruby-lang.git
    ```

  * Push your feature branch:

    ``` sh
    git push heroku feature_branch:master
    ```

    To create a preview of the master branch:

    ``` sh
    git push heroku master
    ```

Open the preview in your browser with `heroku open` or
retrieve the preview URL using `heroku info` and open it in your browser.


## Testing

Besides generating and previewing the site
you can perform additional tests with these tasks:

``` sh
bundle exec rake lint          # run linter on markdown files
bundle exec rake check:markup  # check markup for all generated pages
bundle exec rake check:links   # check for 404's (needs a running local server)
```

## More Information

For more information see the [wiki][wiki].

[wiki]: https://github.com/ruby/www.ruby-lang.org/wiki
