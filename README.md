www.ruby-lang.org reloaded
==========================

This is the official port of the
[www.ruby-lang.org](http://www.ruby-lang.org/) website to
[Jekyll](http://www.jekyllrb.com/). You can view the live preview
at [ruby-lang.github.io](http://ruby-lang.github.io/).

Right now, [we](https://github.com/ruby/www.ruby-lang.org/wiki/Team) are in the middle of the transition from the
current RadiantCMS-based website to this Jekyll-based site.

## How to Contribute?

You can contribute by comparing
[ruby-lang.github.io](http://ruby-lang.github.io/)
to [www.ruby-lang.org](http://www.ruby-lang.org/)
and reporting any inconsistencies between the two sites.

Changes of the content (corrections, improvements, …) and the design
will have to wait until after the migration!

Further details about contributing are [available in the wiki](https://github.com/ruby/www.ruby-lang.org/wiki).

## Get It!

In order to preview your changes to the website, you need to have
[Jekyll and Pygments installed](https://github.com/mojombo/jekyll/wiki/install)
on your local system.

Clone the repository, create the site and start a local server:

``` bash
git clone https://github.com/ruby/www.ruby-lang.org.git
cd www.ruby-lang.org/
bundle install
rake preview # you may need to use bundle exec
```

Then, open [http://localhost:4000/](http://localhost:4000/) in your browser.

Note that creating the website may take several minutes.

To create the website *without starting a local server*, use:

```
rake generate
```
