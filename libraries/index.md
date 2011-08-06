---
layout: page
title: Libraries
---

A myriad of fascinating and useful libraries are out there for Ruby,
many released as [a convenient *gem* file][1]. Other libraries are
released as archived (.zip or .tar.gz) directories of source code. Let’s
take a look at finding libraries and installing them for your own use.

###  <a id="finding-libraries" />Finding Libraries

[**RubyForge**][2] is a popular home for Ruby libraries. One good spot
to browse is its [software map][3], which lists libraries by topic. (If
you end up creating your own libraries, you can [register][4] your
project at Rubyforge to get free Subversion access, web space, and
mailing lists.)

The [**Ruby Application Archive**][5] (or RAA)
is a directory of all manner of Ruby software, categorized by function.
Right now, the [Database][6] category has the most entries, leading by 1
over [Net.][7] [HTML][8] and [XML][9] are also popular categories.
There are even 4 [Physics][10] entries.

###  <a id="using-rubygems" />Using RubyGems

As stated on the [RubyGems website][1], “RubyGems is the premier ruby
packaging system. It provides a standard format for distributing Ruby
programs and libraries, and an easy to use tool for managing the
installation of gem packages.” In some ways, it is a distribution
packaging system similar to, say, apt-get, targeted at ruby software.
The official gems repository is [RubyGems.org][11].

Ruby 1.9 and the Windows installer includes RubyGems, so you may not
need to install it separately. Please refer to [Installing
RubyGems](#installing-rubygems) below, if next gem commands do not work
for you.

#### Searching for Gems

The **search** command can be used to look for gems of a certain name.
To search for the word “html” in the name of a gem:

    {% highlight bash %}
    $ gem search html --remote
    *** REMOTE GEMS ***
    html-sample (1.0, 1.1)
    {% endhighlight %}

A sample Ruby gem, just to illustrate how RubyGems works.

(*The `--remote` flag indicates that we’ll be searching the official
Gemcutter gems.*)

#### Installing a Gem

Once you know which gem you’d like to **install**\:

    {% highlight bash %}
    $ gem install html-sample

You can even install just a certain version of the library using the
`--version` flag.

    {% highlight bash %}
    $ gem install html-sample --version 1.0
    {% endhighlight %}

#### Listing All Gems

For a complete **list** of all gems at Gemcutter:

    {% highlight bash %}
    $ gem list --remote
    {% endhighlight %}

To list only gems you’ve installed, leave off the flag.

    {% highlight bash %}
    $ gem list
    {% endhighlight %}

For more on using RubyGems, see [**the official manual**][12], which
includes examples for using gems in your Ruby scripts.

###  <a id="installing-rubygems" />Installing RubyGems

To install RubyGems, download the latest version of RubyGems from its
[downloads page][13]. Extract the archive and run `setup.rb`. On some
operating systems you may need to do this as root.

For example, on Linux:

    {% highlight bash %}
    $ tar xzvf rubygems-1.7.2.tgz
    $ cd rubygems-1.7.2
    $ su -# ruby setup.rb
    {% endhighlight %}

If you need some further direction on how to install Ruby, check out the
[**installation chapter**][14] in the RubyGems manual.

[1]: http://docs.rubygems.org 
[2]: http://rubyforge.org/ 
[3]: http://rubyforge.org/softwaremap/trove_list.php 
[4]: http://rubyforge.org/register/ 
[5]: http://raa.ruby-lang.org/ 
[6]: http://raa.ruby-lang.org/cat.rhtml?category_major=Library;category_minor=Database 
[7]: http://raa.ruby-lang.org/cat.rhtml?category_major=Library;category_minor=Net 
[8]: http://raa.ruby-lang.org/cat.rhtml?category_major=Library;category_minor=HTML 
[9]: http://raa.ruby-lang.org/cat.rhtml?category_major=Library;category_minor=XML 
[10]: http://raa.ruby-lang.org/cat.rhtml?category_major=Library;category_minor=Physics 
[11]: http://rubygems.org/ 
[12]: http://rubygems.org/read/chapter/1 
[13]: http://rubyforge.org/frs/?group_id=126 
[14]: http://rubygems.org/read/chapter/3 
