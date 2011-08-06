# www.ruby-lang.org on Jekyll

This is an attempt to port the poorly maintained
[www.ruby-lang.org](http://www.ruby-lang.org/) website to
[Jekyll](http://www.jekyllrb.com/).

## Translations

Currently the [master](http://github.com/postmodern/www.ruby-lang.org/tree/master)
branch contains the layouts, includes and statis assets to be used by all
translations. Individual translations are branched off of master, for
example the [en](http://github.com/postmodern/www.ruby-lang.org/tree/en)
branch.

## Get It

    $ git clone https://github.com/postmodern/www.ruby-lang.org.git
    $ cd www.ruby-lang.org/
    # Pick your native language (example: en)
    $ git fetch origin en
    $ git checkout en

## Run It

    $ jekyll
    $ open http://localhost:4000/

## Todo

1. Generate site using `jekyll` and compare to
   [www.ruby-lang.org](http://www.ruby-lang.org/). Submit Issues for any
   formatting mistakes.
2. Generate the yearly/monthly News Post index pages.
3. Write some JavaScript to randomly request code examples, from the
   `examples/` directory, for the front-page.
4. Auto-generate the Top Projects page using a `rake` task that pulls
   statistics from [www.rubygems.org](http://www.rubygems.org/).
