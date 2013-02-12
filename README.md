# www.ruby-lang.org on Jekyll

This is an attempt to port the poorly maintained
[www.ruby-lang.org](http://www.ruby-lang.org/) website to
[Jekyll](http://www.jekyllrb.com/). You can view the live site at
[ruby-lang.github.com](http://ruby-lang.github.com/)

## Get It

    $ git clone https://github.com/postmodern/www.ruby-lang.org.git
    $ cd www.ruby-lang.org/
    $ jekyll
    $ open http://localhost:4000/

## Todo

1. Compare [ruby-lang.github.com](http://ruby-lang.github.com/) to
   [www.ruby-lang.org](http://www.ruby-lang.org/). Submit Issues for any
   formatting mistakes.
2. Generate the yearly/monthly News Post index pages.
3. Write some JavaScript to randomly request code examples, from the
   `examples/` directory, for the front-page.
4. Auto-generate the Top Projects page using a `rake` task that pulls
   statistics from [www.rubygems.org](http://www.rubygems.org/).
