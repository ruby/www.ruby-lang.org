---
layout: page
title: "Download Ruby"
lang: en
---

Here you can get the latest Ruby distributions in your favorite flavor.
The current stable version is {{ site.downloads.stable.version }}.
Please be sure to read [Ruby’s License]({{ site.license.url }}).
{: .summary}

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

* [Ruby {{ site.downloads.stable.version }}][stable-gz]
  (md5:&nbsp;{{ site.downloads.stable.md5.gz }}) Stable
* [Ruby {{ site.downloads.previous.version }}][previous-gz]
  (md5:&nbsp;{{ site.downloads.previous.md5.gz }}) Previous
* [Ruby {{ site.downloads.previous19.version }}][previous-but-one-gz]
  (md5:&nbsp;{{ site.downloads.previous19.md5.gz }}) Previous 1.9
* [Stable Snapshot][stable-snapshot-gz] This is a tarball of the latest snapshot of the
  Stable branch (ruby\_2\_1).
* [Nightly Snapshot][nightly-gz] This is a tarball of whatever is in SVN, made
  nightly. This may contain bugs or other issues, use at your own risk!

For information about the Ruby Subversion and Git repositories, see our
[Ruby Core](/en/community/ruby-core/) page.

### Mirror sites

The Ruby source is available from a worldwide set of mirror sites.
Please try to use a mirror that is near you.

#### Mirror sites via HTTP

* [CDN][mirror-http-cdn] (fastly.com)
* [Japan 1][mirror-https-jp] (Master) - HTTPS
* Japan 2 (RingServer)
  * [shibaura-it.ac.jp][mirror-http-jp-ring-shibaura-it]
  * [tohoku.ac.jp][mirror-http-jp-ring-tohoku]
  * [u-toyama.ac.jp][mirror-http-jp-ring-u-toyama]
  * [yamanashi.ac.jp][mirror-http-jp-ring-yamanashi]
  * [airnet.ne.jp][mirror-http-jp-ring-airnet]
  * [maffin.ad.jp][mirror-http-jp-ring-maffin]
* [Britain][mirror-http-uk] (The Mirror Service)
* [Germany][mirror-http-de] (AmbiWeb GmbH)
* [Belgium][mirror-http-be] (Easynet)
* [Denmark][mirror-http-dk] (sunsite.dk)
* [Holland][mirror-http-nl] (XS4ALL) - only release packages
* [USA 1][mirror-http-us1] (ibiblio.org)
* [USA 2][mirror-http-us2] (lcs.mit.edu)
* [USA 3][mirror-http-us3] (binarycode.org)
* [USA 4][mirror-http-us4] (online-mirror.org)
* [USA 5][mirror-http-us5] (trexle.com)
* [Austria][mirror-http-at] (tuwien.ac.at)
* [Taiwan 1][mirror-http-tw1] (cdpa.nsysu.edu.tw)
* [Taiwan 2][mirror-http-tw2] (ftp.cs.pu.edu.tw)
* [China][mirror-http-cn] (ruby.taobao.org)

#### Mirror sites via FTP

* [Japan 1][mirror-ftp-jp1] (Master: ruby-lang.org)
* Japan 2 (RingServer)
  * [shibaura-it.ac.jp][mirror-ftp-jp-ring-shibaura-it]
  * [tohoku.ac.jp][mirror-ftp-jp-ring-tohoku]
  * [u-toyama.ac.jp][mirror-ftp-jp-ring-u-toyama]
  * [yamanashi.ac.jp][mirror-ftp-jp-ring-yamanashi]
  * [airnet.ne.jp][mirror-ftp-jp-ring-airnet]
  * [maffin.ad.jp][mirror-ftp-jp-ring-maffin]
* [Japan 3][mirror-ftp-jp3] (IIJ)
* [South Korea][mirror-ftp-kr] (Korea FreeBSD Users Group)
* [Britain][mirror-ftp-uk] (The Mirror Service)
* [Germany][mirror-ftp-de] (FU Berlin)
* [Belgium][mirror-ftp-be] (Easynet)
* [Russia][mirror-ftp-ru] (ChgNet)
* [Greece][mirror-ftp-gr] (ntua.gr)
* [Denmark][mirror-ftp-dk] (sunsite.dk)
* [USA 1][mirror-ftp-us1] (ibiblio.org)
* [USA 2][mirror-ftp-us2] (lcs.mit.edu)
* [Austria][mirror-ftp-at] (tuwien.ac.at)
* [Taiwan 1][mirro-ftp-tw1] (cdpa.nsysu.edu.tw)
* [Taiwan 2][mirror-ftp-tw2] (ftp.cs.pu.edu.tw)
* [Canada][mirror-ftp-ca] (mirror.cs.mun.ca)

#### Mirror sites via rsync

* rsync://rsync.mirrorservice.org/ftp.ruby-lang.org/pub/ruby/ (Britain)
* rsync://sunsite.dk/ftp/mirrors/ruby/ (Denmark)
* rsync://gd.tuwien.ac.at/languages/ruby/ (Austria)
* rsync://mirror.cs.mun.ca/ruby/ (Canada)
* rsync://ftp.cs.pu.edu.tw/Ruby/ (Taiwan)

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
system. Windows users should check out [pik][pik] for a similar project,
or consider using RubyInstaller, described in the next section.

As of this writing, you should be able to install RVM with:

{% highlight sh %}
$ \curl -L https://get.rvm.io | bash -s stable --ruby
{% endhighlight %}

For the latest instructions on installing RVM, check out [the RVM
installation page][rvm]. The above command will install both RVM and the
latest version of Ruby. RVM can also install most of the Ruby
implementations listed below. To see all supported versions, type `rvm
list known`.

#### RubyInstaller

If you’re on Windows, there’s a great project to help you install Ruby:
[RubyInstaller][rubyinstaller]. It gives you everything you need to set up a full
Ruby development environment on Windows.

To use RubyInstaller, download it from the [RubyInstaller download
page][rubyinstall-downloads]. Then just use the installer, and you’re done!

If you are installing Ruby in order to use Rails, you should use
[RailsInstaller][railsinstaller] which uses RubyInstaller but gives you extra tools
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

##### Debian or Ubuntu

Debian GNU/Linux or Ubuntu use the apt package manager system.
You can use it like this:

{% highlight sh %}
$ sudo apt-get install ruby1.9.1
{% endhighlight %}

Yes, this will install Ruby 1.9.2 or newer. It has a ‘library
compatibility version’ of 1.9.1, hence the name.

If you install the ‘ruby’ package, you might get the older Ruby 1.8,
depending on the distro.

##### Arch Linux

Arch Linux uses a package manager named pacman. To get Ruby, just do
this:

{% highlight sh %}
$ sudo pacman -S ruby
{% endhighlight %}

##### Fedora

Fedora use YUM package manager system. You can use it like this:

{% highlight sh %}
$ su -c "yum install ruby"
{% endhighlight %}

The installed version is typically the latest version of Ruby available
when specific version of Fedora was released (e.g. Ruby 2.0.0 is
available in Fedora 20 while Fedora 21 will most likely provide
Ruby 2.1.0).

##### Other Distributions

On other systems you can search the package repository for your
Linux distro’s manager, or RVM might be the right choice for you.

#### Ruby on Mac OS X

Ruby 1.8.7 is fully supported in Mac OS X Lion as well as many popular
Ruby gems (packages). For details, see the [Ruby wiki at Mac OS
Forge][macosforge-ruby].

Mac OS X Tiger is packaged with version 1.8.2 of Ruby, and Leopard ships
with 1.8.6, but, for those who haven’t upgraded to Leopard, there are a
number of options for installing the latest version of Ruby.

Many people on Mac OS X use [Homebrew][brew] as a package manager. It’s
really easy to get Ruby:

{% highlight sh %}
$ brew install ruby
{% endhighlight %}

Also, since OS X is based on Unix, downloading and installing from the
source is just as easy and effective as the other solutions. To help you
with installation of new Ruby versions on OS X, it’s probably a good
idea to use RVM. Type `rvm notes` for system-specific information.

For a detailed look at installing Ruby (and Rails), Dan Benjamin’s
excellent articles [for Tiger][hivelogic-tiger], [for Leopard][hivelogic-leopard], and [for Snow
Leopard][hivelogic-snowleopard] will get you up and running very quickly. On Lion, [this
article][intridea-lion] can help you.

#### Ruby On Solaris and OpenIndiana

Ruby 1.8.7 is available for Solaris 8 through Solaris 10 on
[Sunfreeware][sunfreeware] and Ruby 1.8.7 is available at [Blastwave][blastwave].
Ruby 1.9.2p0 is also available at [Sunfreeware][sunfreeware], but this is outdated.
Using RVM can get you the latest version of Ruby.

To install Ruby on [OpenIndiana][openindiana], please use the [Image Packaging
System, or IPS][opensolaris-pkg] client. This will install the latest Ruby binaries
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

* [JRuby][jruby] is Ruby atop the JVM (Java Virtual Machine), utilizing the
  JVM’s optimizing JIT compilers, garbage collectors, concurrent
  threads, tool ecosystem, and vast collection of libraries.
* [Rubinius][rubinius] is ‘Ruby written in Ruby’. Built on top of LLVM,
  Rubinius sports a nifty virtual machine that other languages are being
  built on top of, too.
* [MacRuby][macruby] is a Ruby that’s tightly integrated with Apple’s Cocoa
  libraries for Mac OS X, allowing you to write desktop applications
  with ease.
* [mruby][mruby] is a lightweight implementation of the Ruby language
  that can be linked and embedded within an application.
  Its development is lead by Ruby’s creator Yukihiro “Matz” Matsumoto.
* [IronRuby][ironruby] is an implementation “tightly integrated with the .NET
  Framework”.
* [MagLev][maglev] is “a fast, stable, Ruby implementation with integrated
  object persistence and distributed shared cache”.
* [Cardinal][cardinal] is a “Ruby compiler for [Parrot][parrot] Virtual Machine”
  (Perl 6).

Some of those implementations, including MRI, follow the guidelines of
[RubySpec][28], a “complete executable specification for the Ruby
programming language”.

[stable-gz]: {{ site.downloads.stable.url.gz }}
[previous-gz]: {{ site.downloads.previous.url.gz }}
[previous-but-one-gz]: {{ site.downloads.previous19.url.gz }}
[stable-snapshot-gz]: {{ site.downloads.stable_snapshot.url.gz }}
[nightly-gz]: {{ site.downloads.nightly_snapshot.url.gz }}
[pik]: https://github.com/vertiginous/pik
[rvm]: https://rvm.io/rvm/install/
[rubyinstaller]: http://rubyinstaller.org/
[rubyinstaller-downloads]: http://rubyinstaller.org/downloads/
[railsinstaller]: http://railsinstaller.org/
[macosforge-ruby]: http://trac.macosforge.org/projects/ruby/wiki
[brew]: http://brew.sh/
[hivelogic-tiger]: http://hivelogic.com/articles/ruby-rails-mongrel-mysql-osx
[hivelogic-leopard]: http://hivelogic.com/articles/ruby-rails-leopard
[hivelogic-snowleopard]: http://hivelogic.com/articles/compiling-ruby-rubygems-and-rails-on-snow-leopard/
[intridea-lion]: http://intridea.com/2011/7/26/setting-up-ruby-dev-on-lion?blog=company
[sunfreeware]: http://www.sunfreeware.com
[blastwave]: http://www.blastwave.org
[openindiana]: http://openindiana.org/
[opensolaris-pkg]: http://opensolaris.org/os/project/pkg/
[jruby]: http://jruby.org
[rubinius]: http://rubini.us
[macruby]: http://www.macruby.org
[mruby]: https://github.com/mruby/mruby
[ironruby]: http://www.ironruby.net
[maglev]: http://ruby.gemstone.com
[cardinal]: https://github.com/parrot/cardinal
[parrot]: http://parrot.org
[rubyspec]: http://rubyspec.org
[mirror-http-cdn]: http://cache.ruby-lang.org/pub/ruby/
[mirror-http-jp-ring-shibaura-it]: http://ring.shibaura-it.ac.jp/archives/lang/ruby/
[mirror-http-jp-ring-tohoku]: http://ring.tains.tohoku.ac.jp/archives/lang/ruby/
[mirror-http-jp-ring-u-toyama]: http://ring.u-toyama.ac.jp/archives/lang/ruby/
[mirror-http-jp-ring-yamanashi]: http://ring.yamanashi.ac.jp/archives/lang/ruby/
[mirror-http-jp-ring-airnet]: http://ring.airnet.ne.jp/archives/lang/ruby/
[mirror-http-jp-ring-maffin]: http://ring.maffin.ad.jp/archives/lang/ruby/
[mirror-https-jp]: https://ftp.ruby-lang.org/pub/ruby/
[mirror-http-uk]: http://www.mirrorservice.org/sites/ftp.ruby-lang.org/pub/ruby/
[mirror-http-de]: http://dl.ambiweb.de/mirrors/ftp.ruby-lang.org/
[mirror-http-be]: http://ruby.mirror.easynet.be/
[mirror-http-dk]: http://mirrors.sunsite.dk/ruby/
[mirror-http-nl]: http://www.xs4all.nl/~hipster/lib/mirror/ruby/
[mirror-http-us1]: http://www.ibiblio.org/pub/languages/ruby/
[mirror-http-us2]: http://xyz.lcs.mit.edu/ruby/
[mirror-http-us3]: http://www.binarycode.org/ruby/
[mirror-http-us4]: http://www.online-mirror.org/ruby/
[mirror-http-us5]: http://ruby.trexle.com/
[mirror-http-at]: http://gd.tuwien.ac.at/languages/ruby/
[mirror-http-tw1]: http://pluto.cdpa.nsysu.edu.tw/ruby/
[mirror-http-tw2]: http://ftp.cs.pu.edu.tw/Unix/lang/Ruby/
[mirror-http-cn]: http://ruby.taobao.org/mirrors/ruby/
[mirror-ftp-jp1]: ftp://ftp.iij.ad.jp/pub/lang/ruby/
[mirror-ftp-jp-ring-shibaura-it]: ftp://ring.shibaura-it.ac.jp/pub/lang/ruby/
[mirror-ftp-jp-ring-tohoku]: ftp://ring.tains.tohoku.ac.jp/pub/lang/ruby/
[mirror-ftp-jp-ring-u-toyama]: ftp://ring.u-toyama.ac.jp/pub/lang/ruby/
[mirror-ftp-jp-ring-yamanashi]: ftp://ring.yamanashi.ac.jp/pub/lang/ruby/
[mirror-ftp-jp-ring-airnet]: ftp://ring.airnet.ne.jp/pub/lang/ruby/
[mirror-ftp-jp-ring-maffin]: ftp://ring.maffin.ad.jp/pub/lang/ruby/
[mirror-ftp-jp3]: ftp://ftp.ruby-lang.org/pub/ruby/
[mirror-ftp-kr]: ftp://ftp.kr.freebsd.org/pub/ruby/
[mirror-ftp-de]: ftp://ftp.fu-berlin.de/unix/languages/ruby/
[mirror-ftp-uk]: ftp://ftp.mirrorservice.org/sites/ftp.ruby-lang.org/pub/ruby/
[mirror-ftp-be]: ftp://ftp.easynet.be/ruby/ruby/
[mirror-ftp-ru]: ftp://ftp.chg.ru/pub/lang/ruby/
[mirror-ftp-gr]: ftp://ftp.ntua.gr/pub/lang/ruby/
[mirror-ftp-dk]: ftp://sunsite.dk/mirrors/ruby/
[mirror-ftp-us1]: ftp://www.ibiblio.org/pub/languages/ruby/
[mirror-ftp-us2]: ftp://xyz.lcs.mit.edu/pub/ruby/
[mirror-ftp-at]: ftp://gd.tuwien.ac.at/languages/ruby/
[mirror-ftp-tw1]: ftp://ruby.cdpa.nsysu.edu.tw/ruby/
[mirror-ftp-tw2]: ftp://ftp.cs.pu.edu.tw/Unix/lang/Ruby/
[mirror-ftp-ca]: ftp://mirror.cs.mun.ca/pub/mirror/ruby/
