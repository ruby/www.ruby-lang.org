# www.ruby-lang.org on Jekyll

This is the official port of the
[www.ruby-lang.org](http://www.ruby-lang.org/) website to
[Jekyll](http://www.jekyllrb.com/). You can view the live site at
[ruby-lang.github.com](http://ruby-lang.github.com/).

Right now we are in the middle of the transition from the
current Radiant CMS based site to this Jekyll based site.

## How to Contribute

You can contribute by comparing
[ruby-lang.github.com](http://ruby-lang.github.com/)
to [www.ruby-lang.org](http://www.ruby-lang.org/)
and reporting any inconsistencies between the two sites.

Changes of the content (corrections, improvements, ...)
will have to wait until after the migration.

## Get It

In order to preview your changes to the site you need to have
[Jekyll and Pygments installed](https://github.com/mojombo/jekyll/wiki/install)
on your system.

Clone the repository, create the site and start a local server:

    $ git clone https://github.com/ruby/www.ruby-lang.org.git
    $ cd www.ruby-lang.org/
    $ rake preview

Then open `http://localhost:4000/` in your browser.

Note that creating the site may take several minutes.

To create the site without starting a local server use

    $ rake generate

## Todo

1. Compare [ruby-lang.github.com](http://ruby-lang.github.com/) to
   [www.ruby-lang.org](http://www.ruby-lang.org/). Submit Issues for any
   formatting mistakes.
2. Auto-generate the Top Projects page using a `rake` task that pulls
   statistics from [www.rubygems.org](http://www.rubygems.org/).
