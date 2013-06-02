---
layout: page
title: "Download Ruby"
lang: en
---

Here you can get the latest Ruby distributions in your favorite flavor.
The current stable version is {{ site.downloads.stable.version }}.
Please be sure to read [Ruby’s License]({{ site.license.url }}).

### Three Ways of Installing Ruby

You can get a copy of Ruby in a variety of ways, and different people
prefer each of the three methods for different reasons. Each will have a
section below, but here’s an overview:

* **Compiling from Source** is the standard way that software has been
  delivered for many, many years. This will be most familiar to the
  largest number of software developers.
* There are a few **third-party tools** to install Ruby. These are often
  simpler for total newbies or the most advanced of users.
* Finally, a few **package management systems** support Ruby. This will
  be most familiar to people who use one operating system for
  everything, and like to stick to those individual standards.

Finally, if you want to run multiple versions of Ruby on the same
machine, check the **third party tools** section and use RVM. It’s by
far the best way to accomplish that, unless you know exactly what you’re
doing.

### Compiling Ruby — Source code

Installing from the source code is a great solution for when you are
comfortable enough with your platform and perhaps need specific settings
for your environment. It’s also a good solution in the event that there
are no other premade packages for your platform.

If you have an issue compiling Ruby, consider using one of the third
party tools in the next section. They may help you.

* [Ruby {{ site.downloads.stable.version }}][1]
  (md5:&nbsp;{{ site.downloads.stable.md5.gz }}) Stable
* [Ruby {{ site.downloads.previous.version }}][2]
  (md5:&nbsp;{{ site.downloads.previous.md5.gz }}) Previous
* [Stable Snapshot][3] This is a tarball of the latest snapshot of the
  Stable branch (ruby\_2\_0\_0).
* [Nightly Snapshot][4] This is a tarball of whatever is in SVN, made
  nightly. This may contain bugs or other issues, use at your own risk!

For information about the Ruby Subversion and Git repositories, see our
[Ruby Core](/en/community/ruby-core/) page.

### Third Party Tools

Many Rubyists use third-party tools to help them install Ruby. They
confer various advantages, but are not officially supported. Their
respective communities are very helpful, however.

#### RVM

The most popular tool to install Ruby is **RVM** (“Ruby Version Manager”).
Not only does it make installing Ruby incredibly easy, it also
allows you to install and manage multiple copies of Ruby on your system,
as well as multiple alternate implementations of Ruby.

RVM is only available for Mac OS X, Linux, or any UNIX-like operating
system. Windows users should check out [pik][5] for a similar project,
or consider using RubyInstaller, described in the next section.

As of this writing, you should be able to install RVM with:

{% highlight sh %}
$ \curl -L https://get.rvm.io | bash -s stable --ruby
{% endhighlight %}

For the latest instructions on installing RVM, check out [the RVM
installation page][7]. The above command will install both RVM and the
latest version of Ruby. RVM can also install most of the Ruby
implementations listed below. To see all supported versions, type `rvm
list known`.

#### RubyInstaller

If you’re on Windows, there’s a great project to help you install Ruby:
[RubyInstaller][8]. It gives you everything you need to set up a full
Ruby development environment on Windows.

To use RubyInstaller, download it from the [RubyInstaller download
page][9]. Then just use the installer, and you’re done!

If you are installing Ruby in order to use Rails, you should use
[RailsInstaller][10] which uses RubyInstaller but gives you extra tools
that help with Rails development.

### Package Management Systems

If you can’t compile your own Ruby, and you don’t want to use a third
party tool, you can use your system’s package manager to install Ruby.

Certain members of the Ruby community feel very strongly that you should
never use a package manager to install Ruby, and that you should use RVM
instead. While the full list of pros and cons are outside of the scope
of this page, the most basic reason is that most package managers have
older versions of Ruby in their repositories. If you’d like to use the
newest Ruby, make sure you use the correct package name, or use RVM
instead.

#### Ruby on Linux

Debian GNU/Linux or Ubuntu use the apt package manager system.
You can use it like this:

{% highlight sh %}
$ sudo apt-get install ruby1.9.1
{% endhighlight %}

Yes, this will install Ruby 1.9.2 or newer. It has a ‘library
compatibility version’ of 1.9.1, hence the name.

If you install the ‘ruby’ package, you might get the older Ruby 1.8,
depending on the distro.

Arch Linux uses a package manager named pacman. To get Ruby, just do
this:

{% highlight sh %}
$ sudo pacman -S ruby
{% endhighlight %}

On other systems you can search the package repository for your
Linux distro’s manager, or RVM might be the right choice for you.

#### Ruby on Mac OS X

Ruby 1.8.7 is fully supported in Mac OS X Lion as well as many popular
Ruby gems (packages). For details, see the [Ruby wiki at Mac OS
Forge][11].

Mac OS X Tiger is packaged with version 1.8.2 of Ruby, and Leopard ships
with 1.8.6, but, for those who haven’t upgraded to Leopard, there are a
number of options for installing the latest version of Ruby.

Many people on Mac OS X use [Homebrew][12] as a package manager. It’s
really easy to get Ruby:

{% highlight sh %}
$ brew install ruby
{% endhighlight %}

Also, since OS X is based on Unix, downloading and installing from the
source is just as easy and effective as the other solutions. To help you
with installation of new Ruby versions on OS X, it’s probably a good
idea to use RVM. Type `rvm notes` for system-specific information.

For a detailed look at installing Ruby (and Rails), Dan Benjamin’s
excellent articles [for Tiger][13], [for Leopard][14], and [for Snow
Leopard][15] will get you up and running very quickly. On Lion, [this
article][16] can help you.

#### Ruby On Solaris and OpenIndiana

Ruby 1.8.7 is available for Solaris 8 through Solaris 10 on
[Sunfreeware][17] and Ruby 1.8.7 is available at [Blastwave][18].
Ruby 1.9.2p0 is also available at [Sunfreeware][17], but this is outdated.
Using RVM can get you the latest version of Ruby.

To install Ruby on [OpenIndiana][19], please use the [Image Packaging
System, or IPS][20] client. This will install the latest Ruby binaries
and RubyGems directly from the OpenSolaris network repository for
Ruby 1.9. It’s easy:

{% highlight sh %}
$ pkg install runtime/ruby-18
{% endhighlight %}

Like before, RVM is a good way to obtain the latest version of Ruby.

### Other Implementations of Ruby

Ruby, as a language, has a few different implementations. This guide has
been discussing the reference implementation, **MRI** (“Matz's Ruby
Interpreter”) or **CRuby**, but there are also others.
They are often useful in certain situations, provide extra
integration to other languages or environments, or have special features
that MRI doesn’t.

Here’s a list:

* [JRuby][21] is Ruby atop the JVM (Java Virtual Machine), utilizing the
  JVM’s optimizing JIT compilers, garbage collectors, concurrent
  threads, tool ecosystem, and vast collection of libraries.
* [Rubinius][22] is ‘Ruby written in Ruby’. Built on top of LLVM,
  Rubinius sports a nifty virtual machine that other languages are being
  built on top of, too.
* [MacRuby][23] is a Ruby that’s tightly integrated with Apple’s Cocoa
  libraries for Mac OS X, allowing you to write desktop applications
  with ease.
* [Cardinal][24] is a “Ruby compiler for [Parrot][25] Virtual Machine”
  (Perl 6).
* [IronRuby][26] is an implementation “tightly integrated with the .NET
  Framework”.
* [MagLev][27] is “a fast, stable, Ruby implementation with integrated
  object persistence and distributed shared cache”.

Some of those implementations, including MRI, follow the guidelines of
[RubySpec][28], a “complete executable specification for the Ruby
programming language”.



[1]: {{ site.downloads.stable.url.gz }}
[2]: {{ site.downloads.previous.url.gz }}
[3]: {{ site.downloads.stable_snapshot.url.gz }}
[4]: {{ site.downloads.nightly_snapshot.url.gz }}
[5]: https://github.com/vertiginous/pik
[7]: https://rvm.io/rvm/install/
[8]: http://rubyinstaller.org/
[9]: http://rubyinstaller.org/downloads/
[10]: http://railsinstaller.org/
[11]: http://trac.macosforge.org/projects/ruby/wiki
[12]: http://mxcl.github.com/homebrew/
[13]: http://hivelogic.com/articles/ruby-rails-mongrel-mysql-osx
[14]: http://hivelogic.com/articles/ruby-rails-leopard
[15]: http://hivelogic.com/articles/compiling-ruby-rubygems-and-rails-on-snow-leopard/
[16]: http://intridea.com/2011/7/26/setting-up-ruby-dev-on-lion?blog=company
[17]: http://www.sunfreeware.com
[18]: http://www.blastwave.org
[19]: http://openindiana.org/
[20]: http://opensolaris.org/os/project/pkg/
[21]: http://jruby.org
[22]: http://rubini.us
[23]: http://www.macruby.org
[24]: https://github.com/parrot/cardinal
[25]: http://parrot.org
[26]: http://www.ironruby.net
[27]: http://ruby.gemstone.com
[28]: http://rubyspec.org
