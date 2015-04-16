---
layout: page
title: "Installing Ruby"
lang: en
---

You can use several tools to install Ruby.
This page describes how to use major package management systems
and third-party tools for managing and installing Ruby
and how to build Ruby from source.
{: .summary}


## Choose Your Installation Method

There are several ways to install Ruby:

* When you are on a UNIX-like operating system, using your system's
  **package manager** is the easiest way of getting started.
  However, the packaged Ruby version usually is not the newest one.
* **Installers** can be used to install a specific or multiple
  Ruby versions. There is also an installer for Windows.
* **Managers** help you to switch between multiple Ruby installations
  on your system.
* And finally, you can also **build Ruby from source**.

The following overview lists available installation methods
for different needs and platforms.

* [Package Management Systems](#package-management-systems)
  * [Debian, Ubuntu](#apt)
  * [CentOS, Fedora, RHEL](#yum)
  * [Gentoo](#portage)
  * [Arch Linux](#pacman)
  * [OS X](#homebrew)
  * [Solaris, OpenIndiana](#solaris)
  * [Other Distributions](#other-systems)
* [Installers](#installers)
  * [ruby-build](#ruby-build)
  * [ruby-install](#ruby-install)
  * [RubyInstaller](#rubyinstaller) (Windows)
  * [RailsInstaller and Ruby Stack](#railsinstaller)
* [Managers](#managers)
  * [chruby](#chruby)
  * [rbenv](#rbenv)
  * [RVM](#rvm)
  * [uru](#uru)
* [Building from source](#building-from-source)


## Package Management Systems
{: #package-management-systems}

If you cannot compile your own Ruby, and you do not want to use a
third-party tool, you can use your system's package manager to install Ruby.

Certain members in the Ruby community feel very strongly that you should
never use a package manager to install Ruby and that you should use tools
instead. While the full list of pros and cons is outside of the scope
of this page, the most basic reason is that most package managers have
older versions of Ruby in their official repositories. If you would like to
use the newest Ruby, make sure you use the correct package name,
or use the tools described further below instead.


### apt (Debian or Ubuntu)
{: #apt}

Debian GNU/Linux and Ubuntu use the apt package manager.
You can use it like this:

{% highlight sh %}
$ sudo apt-get install ruby-full
{% endhighlight %}

As of writing, the `ruby-full` package provides Ruby 1.9.3, which is an old
stable release, on Debian and Ubuntu.


### yum (CentOS, Fedora, or RHEL)
{: #yum}

CentOS, Fedora, and RHEL use the yum package manager.
You can use it like this:

{% highlight sh %}
$ sudo yum install ruby
{% endhighlight %}

The installed version is typically the latest version of Ruby available
at the release time of the specific distribution version.


### portage (Gentoo)
{: #portage}

Gentoo uses the portage package manager.

{% highlight sh %}
$ sudo emerge dev-lang/ruby
{% endhighlight %}

By default, this will try to install versions 1.9 and 2.0,
but more versions are available.
To install a specific version, set `RUBY_TARGETS` in your `make.conf`.
See the [Gentoo Ruby Project website][gentoo-ruby] for details.


### pacman (Arch Linux)
{: #pacman}

Arch Linux uses a package manager named pacman.
To get Ruby, just do this:

{% highlight sh %}
$ sudo pacman -S ruby
{% endhighlight %}

This should install the latest stable Ruby version.


### Homebrew (OS X)
{: #homebrew}

On OS X Yosemite and Mavericks, Ruby 2.0 is included.
OS X Mountain Lion, Lion, and Snow Leopard ship with Ruby 1.8.7.

Many people on OS X use [Homebrew][homebrew] as a package manager.
It is really easy to get a newer version of Ruby using Homebrew:

{% highlight sh %}
$ brew install ruby
{% endhighlight %}

This should install the latest Ruby version.


### Ruby on Solaris and OpenIndiana
{: #solaris}

Ruby 1.8.7 is available for Solaris 8 through Solaris 10 on
[Sunfreeware][sunfreeware] and Ruby 1.8.7 is available at
[Blastwave][blastwave].
Ruby 1.9.2p0 is also available at [Sunfreeware][sunfreeware],
but this is outdated.

To install Ruby on [OpenIndiana][openindiana], please use the
[Image Packaging System (IPS)][opensolaris-pkg] client.
This will install the latest Ruby binaries and RubyGems directly
from the OpenSolaris network repository for Ruby 1.9. It’s easy:

{% highlight sh %}
$ pkg install runtime/ruby-18
{% endhighlight %}

However, the third-party tools might be a good way to obtain the
latest version of Ruby.


### Other Distributions
{: #other-systems}

On other systems, you can search the package repository of your
Linux distribution's manager for Ruby, or the third-party tools might be the
right choice for you.


## Installers
{: #installers}

If the version of Ruby provided by your system or package manager is out of
date, a newer one can be installed using a third-party installer.
Some of them also allow you to install multiple versions on the same system;
associated managers can help to switch between the different Rubies.
If you are planning to use [RVM](#rvm) as a version manager you do not need
a separate installer, it comes with its own.


### ruby-build
{: #ruby-build}

[ruby-build][ruby-build] is a plugin for [rbenv](#rbenv) that
allows you to compile and install different versions of Ruby
into arbitrary directories.
ruby-build can also be used as a standalone program without rbenv.
It is available for OS X, Linux, and other UNIX-like operating systems.


### ruby-install
{: #ruby-install}

[ruby-install][ruby-install] allows you to compile and install different
versions of Ruby into arbitrary directories.
There is also a sibling, [chruby](#chruby), which handles switching between
Ruby versions.
It is available for OS X, Linux, and other UNIX-like operating systems.


### RubyInstaller
{: #rubyinstaller}

If you are on Windows, there is a great project to help you install Ruby:
[RubyInstaller][rubyinstaller]. It gives you everything you need to set up
a full Ruby development environment on Windows.

Just download it, run it, and you are done!


### RailsInstaller and Ruby Stack
{: #railsinstaller}

If you are installing Ruby in order to use Ruby on Rails,
you can use the following installers:

* [RailsInstaller][railsinstaller],
  which uses RubyInstaller but gives you
  extra tools that help with Rails development.
  It supports OS X and Windows.
* [Bitnami Ruby Stack][rubystack],
  which provides a complete development environment for Rails.
  It supports OS X, Linux, Windows, virtual machines, and cloud images.


## Managers
{: #managers}

Many Rubyists use Ruby managers to manage multiple Rubies.
They confer various advantages but are not officially supported.
Their respective communities are very helpful, however.


### chruby
{: #chruby}

[chruby][chruby] allows you to switch between multiple Rubies.
chruby can manage Rubies installed by [ruby-install](#ruby-install)
or even built from source.


### rbenv
{: #rbenv}

[rbenv][rbenv] allows you to manage multiple installations of Ruby.
It does not support installing Ruby, but there is a popular plugin
named [ruby-build](#ruby-build) to install Ruby.
Both tools are available for OS X, Linux, or other UNIX-like operating systems.


### RVM ("Ruby Version Manager")
{: #rvm}

[RVM][rvm] allows you to install and manage multiple installations of Ruby
on your system. It can also manage different gemsets.
It is available for OS X, Linux, or other UNIX-like operating systems.


## uru
{: #uru}

[Uru][uru] is a lightweight, multi-platform command line tool that helps you
to use multiple Rubies on OS X, Linux, or Windows systems.


## Building from Source
{: #building-from-source}

Of course, you can install Ruby from source.
[Download](/en/downloads/) and unpack a tarball, then just do this:

{% highlight sh %}
$ ./configure
$ make
$ sudo make install
{% endhighlight %}

By default, this will install Ruby into `/usr/local`.
To change, pass the `--prefix=DIR` option to the `./configure` script.

Using the third-party tools or package managers might be a better idea,
though, because the installed Ruby won't be managed by any tools.


[rvm]: http://rvm.io/
[rbenv]: https://github.com/sstephenson/rbenv#readme
[ruby-build]: https://github.com/sstephenson/ruby-build#readme
[ruby-install]: https://github.com/postmodern/ruby-install#readme
[chruby]: https://github.com/postmodern/chruby#readme
[uru]: https://bitbucket.org/jonforums/uru
[rubyinstaller]: http://rubyinstaller.org/
[railsinstaller]: http://railsinstaller.org/
[rubystack]: http://bitnami.com/stack/ruby/installer
[sunfreeware]: http://www.sunfreeware.com
[blastwave]: http://www.blastwave.org
[openindiana]: http://openindiana.org/
[opensolaris-pkg]: http://opensolaris.org/os/project/pkg/
[gentoo-ruby]: http://www.gentoo.org/proj/en/prog_lang/ruby/
[homebrew]: http://brew.sh/
