---
layout: page
title: "Installing Ruby"
lang: en
---

With package managers or third-party tools, you have plenty of options
to install and manage Ruby.
{: .summary}

You may already have Ruby installed on your computer. You can check
inside a [terminal emulator][terminal] by typing:

{% highlight sh %}
ruby -v
{% endhighlight %}

This should output some information on the installed Ruby version.

## Choose Your Installation Method

There are several ways to install Ruby:

* On a UNIX-like operating system, using your system's
  **package manager** is easiest.
  However, the packaged Ruby version may not be the newest one.
* **Installers** can be used to install a specific or multiple
  Ruby versions. There is also an installer for Windows.
* **Managers** help you to switch between multiple Ruby versions
  on your system.
* Finally, you can also **build Ruby from source**.

On Windows 10, you can also use the [Windows Subsystem for Linux][wsl]
to install one of the supported Linux distributions and use any of the
installation methods available on that system.

Here are available installation methods:

* [Package Management Systems](#package-management-systems)
  * [Debian, Ubuntu](#apt)
  * [CentOS, Fedora, RHEL](#yum)
  * [Snap](#snap)
  * [Gentoo](#portage)
  * [Arch Linux](#pacman)
  * [macOS](#homebrew)
  * [FreeBSD](#freebsd)
  * [OpenIndiana](#openindiana)
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

Some members of the Ruby community feel that you should avoid package
managers to install Ruby and that you should use dedicated tools instead.

It is possible that major package managers will install older Ruby
versions instead of the latest release. To use the latest Ruby release,
check that the package name matches its version number. Or use a
dedicated [installer][installers].


### apt (Debian or Ubuntu)
{: #apt}

Debian GNU/Linux and Ubuntu use the apt package manager. You can use it
like this:

{% highlight sh %}
$ sudo apt-get install ruby-full
{% endhighlight %}


### yum (CentOS, Fedora, or RHEL)
{: #yum}

CentOS, Fedora, and RHEL use the yum package manager.
You can use it like this:

{% highlight sh %}
$ sudo yum install ruby
{% endhighlight %}

The installed version is typically the latest version of Ruby available
at the release time of the specific distribution version.


### snap (Ubuntu or other Linux distributions)
{: #snap}

Snap is a package manager developed by Canonical.
It is available out-of-the-box on Ubuntu, but snap also works
on many other Linux distributions.
You can use it like this:

{% highlight sh %}
$ sudo snap install ruby --classic
{% endhighlight %}

We have several channels per Ruby minor series.
For instance, the following commands switch to Ruby 2.3:

{% highlight sh %}
$ sudo snap switch ruby --channel=2.3/stable
$ sudo snap refresh
{% endhighlight %}


### portage (Gentoo)
{: #portage}

Gentoo uses the portage package manager.

{% highlight sh %}
$ sudo emerge dev-lang/ruby
{% endhighlight %}

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


### Homebrew (macOS)
{: #homebrew}

Ruby versions 2.0 and above are included by default in macOS releases
since at least El Capitan (10.11).

[Homebrew][homebrew] is a commonly used package manager on macOS.
Installing Ruby using Homebrew is easy:

{% highlight sh %}
$ brew install ruby
{% endhighlight %}

This should install the latest Ruby version.


### FreeBSD
{: #freebsd}

FreeBSD offers both pre-packaged and source-based methods to install Ruby.
Prebuilt packages can be installed via the pkg tool:

{% highlight sh %}
$ pkg install ruby
{% endhighlight %}

A source-based method can be used to install Ruby using the
[Ports Collection][freebsd-ports-collection]. This is useful if you want
to customize the build configuration options.

More information about Ruby and its surrounding ecosystem on FreeBSD
can be found on the [FreeBSD Ruby Project website][freebsd-ruby].


### Ruby on OpenIndiana
{: #openindiana}

To install Ruby on [OpenIndiana][openindiana], please use the
Image Packaging System (IPS) client.
This will install the Ruby binaries and RubyGems directly
from the OpenIndiana repositories. It’s easy:

{% highlight sh %}
$ pkg install runtime/ruby
{% endhighlight %}

However, the third-party tools might be a good way to obtain the
latest version of Ruby.


### Other Distributions
{: #other-systems}

On other systems, you can search the package repository of your Linux
distribution's manager for Ruby. Alternatively, you can use a
[third-party installer][installers].


## Installers
{: #installers}

If the version of Ruby provided by your system or package manager is out
of date, a newer one can be installed using a third-party installer.

Some installers allow you to install multiple versions on the same
system; associated managers can help to switch between the different
Rubies.

If you are planning to use [RVM](#rvm) as a version manager you don't
need a separate installer, it comes with its own.


### ruby-build
{: #ruby-build}

[ruby-build][ruby-build] is a plugin for [rbenv](#rbenv) that allows you
to compile and install different versions of Ruby. ruby-build can also
be used as a standalone program without rbenv. It is available for macOS,
Linux, and other UNIX-like operating systems.


### ruby-install
{: #ruby-install}

[ruby-install][ruby-install] allows you to compile and install different
versions of Ruby into arbitrary directories. [chruby](#chruby) is a
complimentary tool used to switch between Ruby versions. It is available
for macOS, Linux, and other UNIX-like operating systems.


### RubyInstaller
{: #rubyinstaller}

On Windows, [RubyInstaller][rubyinstaller] gives you everything you need
to set up a full Ruby development environment.

Just download it, run it, and you are done!


### RailsInstaller and Ruby Stack
{: #railsinstaller}

If you are installing Ruby in order to use Ruby on Rails,
you can use the following installers:

* [RailsInstaller][railsinstaller] uses [RubyInstaller][rubyinstaller]
  but gives you extra tools that help with Rails development. It
  supports macOS and Windows.
* [Bitnami Ruby Stack][rubystack] provides a complete development
  environment for Rails. It supports macOS, Linux, Windows, virtual
  machines, and cloud images.


## Managers
{: #managers}

Many Rubyists use Ruby managers to manage multiple Rubies. They allow
easy or even automatic switching between Ruby versions depending on the
project and other advantages but are not officially supported. You can
however find support within their respective communities.


### chruby
{: #chruby}

[chruby][chruby] allows you to switch between multiple Rubies. It can
manage Rubies installed by [ruby-install](#ruby-install) or even built
from source.


### rbenv
{: #rbenv}

[rbenv][rbenv] allows you to manage multiple installations of Ruby.
While it can't install Ruby by default, its [ruby-build](#ruby-build)
plugin can. Both tools are available for macOS, Linux, or other
UNIX-like operating systems.


### RVM ("Ruby Version Manager")
{: #rvm}

[RVM][rvm] allows you to install and manage multiple installations of
Ruby on your system. It can also manage different gemsets. It is
available for macOS, Linux, or other UNIX-like operating systems.


### uru
{: #uru}

[Uru][uru] is a lightweight, multi-platform command line tool that helps you
to use multiple Rubies on macOS, Linux, or Windows systems.


## Building from Source
{: #building-from-source}

Of course, you can install Ruby from source.
[Download][download] and unpack a tarball, then just do this:

{% highlight sh %}
$ ./configure
$ make
$ sudo make install
{% endhighlight %}

By default, this will install Ruby into `/usr/local`.
To change, pass the `--prefix=DIR` option to the `./configure` script.

You can find more information about building from source in the
[Ruby README file][readme].

Using the third-party tools or package managers might be a better idea,
though, because the installed Ruby won't be managed by any tools.


[rvm]: http://rvm.io/
[rbenv]: https://github.com/rbenv/rbenv#readme
[ruby-build]: https://github.com/rbenv/ruby-build#readme
[ruby-install]: https://github.com/postmodern/ruby-install#readme
[chruby]: https://github.com/postmodern/chruby#readme
[uru]: https://bitbucket.org/jonforums/uru
[rubyinstaller]: https://rubyinstaller.org/
[railsinstaller]: http://railsinstaller.org/
[rubystack]: http://bitnami.com/stack/ruby/installer
[openindiana]: http://openindiana.org/
[gentoo-ruby]: http://www.gentoo.org/proj/en/prog_lang/ruby/
[freebsd-ruby]: https://wiki.freebsd.org/Ruby
[freebsd-ports-collection]: https://www.freebsd.org/doc/en_US.ISO8859-1/books/handbook/ports-using.html
[homebrew]: http://brew.sh/
[terminal]: https://en.wikipedia.org/wiki/List_of_terminal_emulators
[download]: /en/downloads/
[installers]: /en/documentation/installation/#installers
[readme]: https://github.com/ruby/ruby#how-to-compile-and-install
[wsl]: https://docs.microsoft.com/en-us/windows/wsl/about
