---
layout: page
title: Download Ruby
---

Here you can get the latest Ruby distributions in your favorite flavor.
The current stable version is 1.9.2. Please be sure to read
[Ruby&#8217;s License](/about/license.txt).

### Ruby Source Code

Installing from the source code is a great solution for when you are comfortable enough with your platform and perhaps need specific settings for your environment. It&#8217;s also a good solution in the event that there are no other premade packages for your platform.

{% for download in site.downloads.source %}
* [{{ download.name }}]({{ download.url }}) {% if download.md5 != null %}(md5: {{ download.md5 }}){% endif %} {% if download.comment != null %} {{ download.comment }}{% endif %}
{% endfor %}

For information about the Ruby Subversion and Git repositories, see our
[Ruby Core](/community/ruby-core/) page.

### Ruby on Windows

The Windows platform has several options to install Ruby.
The first option is to use the [RubyInstaller](http://rubyinstaller.org/),
an installer that contains compiled binaries. The second option is usage of
packaged executables and binaries. If you&#8217;re unsure about how to
install Ruby, the first option might be the best for you.

{% for download in site.downloads.windows %}
* [{{ download.name }}]({{ download.url }}) {% if download.md5 != null %}(md5: {{ download.md5 }}){% endif %} {% if download.comment != null %}{{ download.comment }}{% endif %}
{% endfor %}

Please note that using the above indicated binaries will require manual
download and installation of additional components detailed on
[this page](http://www.garbagecollect.jp/ruby/mswin32/en/documents/install.html).
Please ensure you have followed and performed these steps prior reporting a bug.

The [RubyInstaller](http://rubyinstaller.org/) does not require these additional tasks.

Please also investigate the use of [pik](http://github.com/vertiginous/pik)
which eases the process of installing and maintaining concurrent versions of
both ruby and gems on Windows.

### Ruby On Linux

Depending on the distribution you are using, there are several ways to
install Ruby. The first option is simply to download the source code above
and compile by hand. However, on some platforms, there are package management
solutions that make installing Ruby extremely easy. There is also `rvm`, the
[Ruby Version Manager](http://rvm.beginrescueend.com), which eases the process
of installing and maintaining concurrent versions of both ruby and gems.
This software may become the default installation choice for newcomers as it
is quite straightforward to use. If however you would like to stick to your
distribution package system, read on.

For example, on Debian or Ubuntu `apt-get` provides an easy and elegant solution:

    % sudo apt-get install ruby1.9.1-full

The above command installs the current stable version of Ruby 1.9.1.
If you prefer to install a Ruby 1.8 version, you can use:

    % sudo apt-get install ruby-full

For irb and rdoc, you will need to enable the universe repository.

### Ruby On OS X

Ruby 1.8.6 is fully supported in Mac OS X Leopard including Ruby on Rails,
Mongrel, Capistrano, and many other popular Ruby gems (packages).
For details, see the [Ruby wiki at MacOS Forge](http://trac.macosforge.org/projects/ruby/wiki).

Mac OS X Tiger is packaged with version 1.8.2 of Ruby, but, for those who
haven&#8217;t upgraded to Leopard, there are a number of options for
installing the latest version of Ruby. [Locomotive](http://locomotive.raaum.org/)
is a nice choice if you are looking for something to get you up and running
quickly for Rails development.  Using [MacPorts](http://www.macports.org/) or
[Fink](http://fink.sourceforge.net/) might be a little nicer for the more
technically savvy.

On MacPorts, you can install Ruby with&#8230;

    % sudo port install ruby

Fink has a graphical interface (using Fink Commander) for installing Ruby.

Also, since OS X is based on Unix, downloading and installing from the source
is just as easy and effective as the other solutions.

For a detailed look at installing Ruby (and Rails), Dan Benjamin&#8217;s
excellent articles [for Tiger](http://hivelogic.com/articles/ruby-rails-mongrel-mysql-osx),
[for Leopard](http://hivelogic.com/articles/ruby-rails-leopard), and
[for Snow Leopard](http://hivelogic.com/articles/compiling-ruby-rubygems-and-rails-on-snow-leopard/)
will get you up and running very quickly.

### Ruby On Solaris and OpenSolaris

Ruby 1.8.7 are available for Solaris 8 through Solaris 10 on [Sunfreeware](http://www.sunfreeware.com)
and Ruby 1.8.7 is available at [Blastwave](http://www.blastwave.org).
Ruby 1.9.2p0 is also available at [Sunfreeware](http://www.sunfreeware.com) now.
An optimized Ruby on Rails stack for Solaris 10 is available as
[Coolstack](http://cooltools.sunsource.net/coolstack) from Sun&#8217;s
Cooltools project.

To install Ruby on [OpenSolaris](http://www.opensolaris.org), please use the
[Image Packaging System, or IPS](http://opensolaris.org/os/project/pkg/) client.
This will install the latest Ruby binaries and Rubygems directly from the
OpenSolaris network repository. It&#8217;s easy:

    % pfexec pkg install SUNWruby18

This will install Ruby, Rubygems, common extensions and their supporting libraries.
This package also contains DTrace support and performance optimizations.
The locations of various artifacts are described in the
[Ruby OpenSolaris ARC Case](http://jp.opensolaris.org/os/community/arc/caselog/2007/600/).

The other OpenSolaris distribution, called the [Solaris Express Community Edition or SXCE](http://opensolaris.org/os/downloads)
comes with Ruby preinstalled. The version, location etc., are the same as
with the vanilla OpenSolaris distribution, and are documented in the above
mentioned ARC case.

To install SVR4 packages manually, please visit the
[RubyOpenSolaris project @ Rubyforge](http://rubyforge.org/projects/rubyopensolaris).
