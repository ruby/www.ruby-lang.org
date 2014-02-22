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

The following overview lists available installation methods
for each of the major platforms.
Choose the way that is the most comfortable for you.

* OS X

  * [rbenv](#rbenv)
  * [RVM](#rvm)
  * [Homebrew](#homebrew)
  * [Building from source](#building-from-source)

* Linux/UNIX

  * [rbenv](#rbenv)
  * [RVM](#rvm)
  * [Package management systems](#package-management-systems)
  * [Building from source](#building-from-source)

* Windows

  * [RubyInstaller](#rubyinstaller)
  * [pik][pik]


## Third Party Tools

Many Rubyists use third-party tools to install Ruby.
They confer various advantages but are not officially supported.
Their respective communities are very helpful, however.


### rbenv
{: #rbenv}

[rbenv][rbenv] allows you to manage multiple installations of Ruby.
It does not support installing Ruby, but there is a popular plugin
named ruby-build to install Ruby.
Both tools are available for OS X, Linux, or other UNIX-like operating systems.


### RVM ("Ruby Version Manager")
{: #rvm}

[RVM][rvm] allows you to install and manage multiple installations of Ruby
on your system. It can also manage different gemsets.
It is available for OS X, Linux, or other UNIX-like operating systems.


### RubyInstaller
{: #rubyinstaller}

If you are on Windows, there is a great project to help you install Ruby:
[RubyInstaller][rubyinstaller]. It gives you everything you need to set up
a full Ruby development environment on Windows.

Just download it, run it, and you are done!


### RailsInstaller and Ruby Stack

If you are installing Ruby in order to use Ruby on Rails,
you can use the following installers:

* [RailsInstaller][railsinstaller]
  which uses RubyInstaller but gives you
  extra tools that help with Rails development.
  It supports OS X and Windows.
* [Bitnami Ruby Stack][rubystack]
  which provides a complete development environment for Rails.
  It supports OS X, Linux, Windows, virtual machines and cloud images.


## Package Management Systems
{: #package-management-systems}

If you cannot compile your own Ruby, and you do not want to use a third
party tool, you can use your system's package manager to install Ruby.

Certain members in the Ruby community feel very strongly that you should
never use a package manager to install Ruby and that you should use tools
instead. While the full list of pros and cons are outside of the scope
of this page, the most basic reason is that most package managers have
older versions of Ruby in their official repositories. If you would like to
use the newest Ruby, make sure you use the correct package name,
or use the tools described above instead.

The following package managers are described below:

* [apt (Debian or Ubuntu)](#apt)
* [yum (CentOS, Fedora, or RHEL)](#yum)
* [portage (Gentoo)](#gentoo)
* [pacman (Arch Linux)](#pacman)
* [Homebrew (OS X)](#homebrew)
* [Solaris, OpenIndiana](#solaris)


### apt (Debian or Ubuntu)
{: #apt}

Debian GNU/Linux and Ubuntu use the apt package manager.
You can use it like this:

{% highlight sh %}
$ sudo apt-get install ruby
{% endhighlight %}

As of writing, the `ruby` package provides Ruby 1.9.3, which is an old stable
release, on Debian and Ubuntu.


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

By default, this will try to install all available versions (1.8, 1.9, and 2.0).
To install a specific version, set `RUBY_TARGETS` in your `make.conf`.
See the [Gentoo Ruby Project website][gentoo-ruby] for details.


### pacman (Arch Linux)
{: #pacman}

Arch Linux uses a package manager named pacman.
To get Ruby, just do this:

{% highlight sh %}
$ sudo pacman -S ruby
{% endhighlight %}


### Homebrew (OS X)
{: #homebrew}

On OS X Mavericks, Ruby 2.0 is included.
OS X Mountain Lion, Lion, and Snow Leopard ship with Ruby 1.8.7.

There are a number of options for installing newer versions of Ruby.
Most OS X users in the Ruby community use the third party tools to install
Ruby, but there are some package managers supporting Ruby.

Many people on OS X use [Homebrew][homebrew] as a package manager.
It is really easy to get Ruby:

{% highlight sh %}
$ brew install ruby
{% endhighlight %}

Also, since OS X is based on Unix, downloading and installing from the
source is just as easy and effective as the other solutions.
To help you with the installation of new Ruby versions on OS X,
it is probably a good idea to use the third party tools.


### Ruby on Solaris and OpenIndiana
{: #solaris}

Ruby 1.8.7 is available for Solaris 8 through Solaris 10 on
[Sunfreeware][sunfreeware] and Ruby 1.8.7 is available at
[Blastwave][blastwave].
Ruby 1.9.2p0 is also available at [Sunfreeware][sunfreeware],
but this is outdated.
Using the third party tools can get you the latest version of Ruby.

To install Ruby on [OpenIndiana][openindiana], please use the
[Image Packaging System (IPS)][opensolaris-pkg] client.
This will install the latest Ruby binaries and RubyGems directly
from the OpenSolaris network repository for Ruby 1.9. It’s easy:

{% highlight sh %}
$ pkg install runtime/ruby-18
{% endhighlight %}

Like before, the third party tools are a good way to obtain the
latest version of Ruby.


### Other Distributions

On the other systems, you can search the package repository of your
Linux distribution's manager for Ruby, or the third party tools might be the
right choice for you.


## Building from Source
{: #building-from-source}

Of course, you can install Ruby from source.
[Download](/en/downloads/) and unpack a tarball, then just do this:

{% highlight sh %}
$ ./configure
$ make
$ sudo make install
{% endhighlight %}

By default, this will install Ruby into `/usr/local`. To change, pass
the `--prefix=DIR` option to the `./configure` script.

Using the third party tools or package managers might be a better idea,
though, because the installed Ruby won't be managed by any tools.


[rvm]: http://rvm.io/
[rbenv]: https://github.com/sstephenson/rbenv
[rubyinstaller]: http://rubyinstaller.org/
[railsinstaller]: http://railsinstaller.org/
[rubystack]: http://bitnami.com/stack/ruby/installer
[pik]: https://github.com/vertiginous/pik
[sunfreeware]: http://www.sunfreeware.com
[blastwave]: http://www.blastwave.org
[openindiana]: http://openindiana.org/
[opensolaris-pkg]: http://opensolaris.org/os/project/pkg/
[gentoo-ruby]: http://www.gentoo.org/proj/en/prog_lang/ruby/
[homebrew]: http://brew.sh/
