www.ruby-lang.org
=================

This is the [Jekyll](http://www.jekyllrb.com/) source of
the [www.ruby-lang.org](http://www.ruby-lang.org/) website.

## How to Contribute?

You can contribute by reporting errors or suggesting improvements.
Just open an issue or pull request.
Further details about contributing are
[available in the wiki](https://github.com/ruby/www.ruby-lang.org/wiki).

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
