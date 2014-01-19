---
layout: page
title: "Installing Ruby"
lang: en
---

You can use some tools to install Ruby.
This page describes about using major package management systems
and third-party tools for managing and installing Ruby.
{: .summary}


## Choose installation method for your system

The following list is available installation methods.
Choose your comfortable way.

- OS X

  - [rbenv](#rbenv)
  - [RVM](#rvm)
  - [homebrew](#homebrew)
  - [Building from source](#building-from-source)

- Linux/UNIX

  - [rbenv](#rbenv)
  - [RVM](#rvm)
  - [Package management systems](#package-management-systems)
  - [Building from source](#building-from-source)

- Windows

  - [RubyInstaller](#rubyinstaller)
  - [pik][pik]


## Third Party Tools
{: #third-party-tools}

Many Rubyists use third-party tools to install Ruby.
They confer various advantages, but are not officially supported. Their
respective communities are very helpful, however.


### rbenv
{: #rbenv}

rbenv allows you to manage multiple Installation of Ruby.

It doesn't support installing Ruby, but there's a popular plugin named
ruby-build to install Ruby.

Both tools are available for OS X, Linux, or other UNIX-like operating systems.

For the latest instructions on installing rbenv, check out [rbenv page][rbenv].

There is similar tool named RVM, described in the next section.
Check it out too, and choose your comfortable one.


### RVM ("Ruby Version Manager")
{: #rvm}

RVM allows you to install and manage multiple installation of Ruby on your
system.  It is only available for Mac OS X, Linux, or other UNIX-like
operating system.

For the latest instructions on installing RVM, check out [rvm.io][rvm].


### RubyInstaller
{: #rubyinstaller}

If you're on Windows, there's a great project to help you install Ruby:
[RubyInstaller][rubyinstaller].
It gives you everything you need to set up a full Ruby development
environment on Windows.

To use RubyInstaller, download it from the [RubyInstaller page][rubyinstaller].
Then just use the installer, and you're done!


### RailsInstaller and Ruby Stack

If you are installing Ruby in order to use Rails, you can use the following
installers:

* [RailsInstaller][railsinstaller] which uses RubyInstaller but gives you
  extra tools that help with Rails development.
* [Bitnami Ruby Stack][rubystack] wich provides a complete development
  environment for Ruby on Rails. It supports Windows, OS X, Linux, virtual
  machines and cloud images.


## Package Management Systems
{: #package-management-systems}

If you can't compile your own Ruby, and you don't want to use a third
party tool, you can use your system's package manager to install Ruby.

Certain members in the Ruby community feel very strongly that you should
never use a package manager to install Ruby, and that you should use tools
instead. While the full list of pros and cons are outside of the scope
of this page, the most basic reason is that most package managers have
older versions of Ruby in their official repositories. If you'd like to
use the newest Ruby, make sure you use the correct package name,
or use the tools described above instead.

In this page the following package managers are described:

- [apt (Debian or Ubuntu)](#apt)
- [yum (CentOS, Fedora, or RHEL)](#yum)
- [portage (Gentoo)](#gentoo)
- [pacman (Arch Linux)](#pacman)
- [Solaris, OpenIndiana](#solaris)


### apt (Debian or Ubuntu)
{: #apt}

Debian GNU/Linux or Ubuntu use the apt package manager.
You can use it like this:

{% highlight sh %}
$ sudo apt-get install ruby
{% endhighlight %}

As of writing, the `ruby` package provides older Ruby 1.9.3
on Debian and Ubuntu.


### yum (CentOS, Fedora, or RHEL)
{: #yum}

CentOS, Fedora, and RHEL use the yum package manager.
You can use it like this:

{% highlight sh %}
$ sudo yum install ruby
{% endhighlight %}

The installed version is typically the latest version of Ruby available
at the release time of the specific distro version.


### portage (Gentoo)
{: #portage}

Gentoo uses the portage package manager.

{% highlight sh %}
$ sudo emerge dev-lang/ruby
{% endhighlight %}

In default, this will try to install all available versions (1.8, 1.9, and 2.0).
To install the specific version, set `RUBY_TARGETS` in your `make.conf`.
See [Gentoo Ruby Project page][gentoo-ruby] for details.


### pacman (Arch Linux)
{: #pacman}

Arch Linux uses a package manager named pacman. To get Ruby, just do
this:

{% highlight sh %}
$ sudo pacman -S ruby
{% endhighlight %}


### Homebrew (Mac OS X)
{: #homebrew}

Ruby 2.0.0 is included in Mac OS X Mavericks.
And OS X Mountain Lion, Lion, and Leopard ships with 1.8.7.

2.0 and 1.8 is older version, so there are a number of options
for installing the latest version of Ruby.

Most OS X users in the Ruby community use the third party tools to install
Ruby. But there are some package managers supporting Ruby.

Many people on Mac OS X use [homebrew][homebrew] as a package manager.
It's really easy to get Ruby:

{% highlight sh %}
$ brew install ruby
{% endhighlight %}

Also, since OS X is based on Unix, downloading and installing from the
source is just as easy and effective as the other solutions.
To help you with installation of new Ruby versions on OS X, it's
probably a good idea to use the third party tools.


### Ruby On Solaris and OpenIndiana
{: #solaris}

Ruby 1.8.7 is available for Solaris 8 through Solaris 10 on
[Sunfreeware][sunfreeware] and Ruby 1.8.7 is available at
[Blastwave][blastwave].
Ruby 1.9.2p0 is also available at [Sunfreeware][sunfreeware],
but this is outdated.
Using the third party tools can get you the latest version of Ruby.

To install Ruby on [OpenIndiana][openindiana], please use the
[Image Packaging System, or IPS][opensolaris-pkg] client.
This will install the latest Ruby binaries and RubyGems directly
from the OpenSolaris network repository for Ruby 1.9. It’s easy:

{% highlight sh %}
$ pkg install runtime/ruby-18
{% endhighlight %}

Like before, the third party tools is a good way to obtain the
latest version of Ruby.


### Other Distributions
{: #other}

On other systems you can search the package repository for your
Linux distro's manager, or the third party tools might be the
right choice for you.


## Building from source
{: #building-from-source}

Of course, you can install Ruby from source.
Download and unpack a tarball, then just do this:

{% highlight sh %}
$ ./configure
$ make
$ sudo make install
{% endhighlight %}

In default, this will install Ruby into `/usr/local`. To change, pass
`--prefix=DIR` option to `./configure` script.

Although using the third party tools or package managers is better idea,
because installed Ruby won't be managed by any tools.


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
[macosforge-ruby]: http://trac.macosforge.org/projects/ruby/wiki
[gentoo-ruby]: http://www.gentoo.org/proj/en/prog_lang/ruby/
[homebrew]: http://brew.sh/
