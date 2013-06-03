www.ruby-lang.org
=================

This is the [Jekyll](http://www.jekyllrb.com/) source of
the [www.ruby-lang.org](http://www.ruby-lang.org/) website.

## How to Contribute?

You can contribute by reporting errors or suggesting improvements.
Just open an issue or pull request.

This is a big project with many translations involved.
Please help us stay on top of things by following our
[guidelines for contributors](https://github.com/ruby/www.ruby-lang.org/wiki).

## Get It!

In order to generate the site locally, you need to have
[Pygments installed](http://jekyllrb.com/docs/extras/) on your system.

Bundler will take care of the rest of the dependencies, so unless you
already have done so, you might need to install bundler with:

``` sh
gem install bundler
```

Then clone the repository and install the dependencies:

``` sh
git clone https://github.com/ruby/www.ruby-lang.org.git
cd www.ruby-lang.org/
bundle install
```

To generate the site and start a local web server, you can use

``` sh
bundle exec rake preview
```

Then open [http://localhost:4000/](http://localhost:4000/)
in your local browser to access the preview.

**Note:** The build of the site will take several minutes.
If you created the site previously and the `_site` directory
already exists, the web server will start instantly but large parts
of the site will not be updated until the build has completely finished.
Also, the build may fail silently when using the preview mode.

To always get feedback on the success of the build you might want
to create the website *without starting a local server* instead:

``` sh
bundle exec rake generate
```

When you now start a preview with the site already generated
it will be available instantly.

## Preview on Heroku

* Signup [Heroku](http://www.heroku.com) if you don't have an account yet.
* Install [Heroku Toolbelt](https://toolbelt.heroku.com).
* Clone repository.

```
git clone https://github.com/ruby/www.ruby-lang.org.git
cd www.ruby-lang.org
```

* Add Contents into **/_posts dir, and commit.
* Create preview app on Heroku using custom buildpack.

```
heroku login
heroku create --buildpack http://github.com/ayumin/heroku-buildpack-ruby-jekyll.git
```

* Push your site

```
git push heroku master
heroku open
```

## More Information

For more information see the [wiki](https://github.com/ruby/www.ruby-lang.org/wiki).

