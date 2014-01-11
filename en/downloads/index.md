---
layout: page
title: "Download Ruby"
lang: en
---

Here you can get the latest Ruby distributions in your favorite flavor.
The current stable version is {{ site.downloads.stable.version }}.
Please be sure to read [Ruby’s License]({{ site.license.url }}).
{: .summary}

### Ways of installing Ruby

We have some tools on each major platform to install Ruby:

- On Linux/UNIX machines, you can use package management system in your system or third-party tools (rbenv and RVM).
- On OS X machines, you can use third-party tools (rbenv and RVM).
- On Windows machines, you can use RubyInstaller or pik.

See [Installation](/en/installation) page for detail of package management systems and third-party tools.

Of course, you can install Ruby from source on the major platforms.

### Compiling Ruby — Source code

Installing from the source code is a great solution for when you are
comfortable enough with your platform and perhaps need specific settings
for your environment. It’s also a good solution in the event that there
are no other premade packages for your platform.

If you have an issue compiling Ruby, consider using one of the third
party tools in [Installation](/en/installation) page. They may help you.

* **Current stable:** [Ruby {{ site.downloads.stable.version }}][stable-gz]<br>
  md5: {{ site.downloads.stable.md5.gz }}

* **Previous stable:** [Ruby {{ site.downloads.previous.version }}][previous-gz]<br>
  md5: {{ site.downloads.previous.md5.gz }}

* **Old stable:** [Ruby {{ site.downloads.previous19.version }}][old-gz]<br>
  md5: {{ site.downloads.previous19.md5.gz }}

* **Snapshots:**

  * [Stable Snapshot][stable-snapshot-gz]:
    This is a tarball of the latest snapshot of the current stable branch.
  * [Nightly Snapshot][nightly-gz]:
    This is a tarball of whatever is in SVN, made nightly.
    This may contain bugs or other issues, use at your own risk!

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
[RubySpec][rubyspec], a “complete executable specification for the Ruby
programming language”.

[stable-gz]: {{ site.downloads.stable.url.gz }}
[previous-gz]: {{ site.downloads.previous.url.gz }}
[old-gz]: {{ site.downloads.previous19.url.gz }}
[stable-snapshot-gz]: {{ site.downloads.stable_snapshot.url.gz }}
[nightly-gz]: {{ site.downloads.nightly_snapshot.url.gz }}
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
[mirror-ftp-jp1]: ftp://ftp.ruby-lang.org/pub/ruby/
[mirror-ftp-jp-ring-shibaura-it]: ftp://ring.shibaura-it.ac.jp/pub/lang/ruby/
[mirror-ftp-jp-ring-tohoku]: ftp://ring.tains.tohoku.ac.jp/pub/lang/ruby/
[mirror-ftp-jp-ring-u-toyama]: ftp://ring.u-toyama.ac.jp/pub/lang/ruby/
[mirror-ftp-jp-ring-yamanashi]: ftp://ring.yamanashi.ac.jp/pub/lang/ruby/
[mirror-ftp-jp-ring-airnet]: ftp://ring.airnet.ne.jp/pub/lang/ruby/
[mirror-ftp-jp-ring-maffin]: ftp://ring.maffin.ad.jp/pub/lang/ruby/
[mirror-ftp-jp3]: ftp://ftp.iij.ad.jp/pub/lang/ruby/
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
