---
layout: news_post
title: "Ruby 1.9.2 is released"
author: "Yugui"
lang: en
---

Ruby 1.9.2 is released. This is the latest stable version of 1.9 series.

### About Ruby 1.9.2

The new 1.9.2 is almost compatible with 1.9.1, except these changes:

* Many new methods
* New socket API (improved IPv6 support)
* New encodings
* New Random class which supports several random numbers generators
* Time is reimplemented. The bug with year 2038 is fixed.
* regex improvements
* $: doesn\'t include the current directory.
* dl is reimplemented on top of libffi.
* new psych library wrapping libyaml which can replace syck.

See [NEWS][1] and [ChangeLog][2] for more detailed information.

Ruby 1.9.2 passes more than 99% of [RubySpec][3].

### Supported platforms

Ruby 1.9 supports four levels.

Supported
: We\'ve checked that Ruby 1.9.2 works well on most of them.

  * Debian GNU/Linux 5.0 на IA32.

Efforts made for
: We\'ve checked that Ruby 1.9.2 works well on most of them.

  * mswin32, x64-mswin64, mingw32
  * MacOS X 10.5 (Intel) and 10.6
  * FreeBSD 6 and later (amd64, IA32)
  * Solaris 10
  * Symbian OS

Efforts made for
: We\'ve checked that Ruby 1.9.2 works well on most of them with small
  modifications. Patches are accepted.

  * Other Linux distributions
  * Other versions of MacOS X.
  * cygwin
  * AIX 5
  * Other POSIX-compatible systems
  * BeOS (Haiku)

### FAQ

Standard library is installed in /usr/local/lib/ruby/1.9.1
: This version is a \"library compatible version.\" Ruby 1.9.2 is almost
  1.9.1 compatible, so the library is installed in the 1.9.1 directory.

It causes a LoadError
: `$:` doesn\'t include the current directory. Some script may need
  modifications to work properly.

### Downloads

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p0.tar.bz2&gt;][4]
  SIZE
  : 8495472 bytes

  MD5
  : d8a02cadf57d2571cd4250e248ea7e4b

  SHA256
  : e9710990ed8c2e794123aba509010471915fb13c27dae0118831d2001a9c8d3b

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p0.tar.gz&gt;][5]
  SIZE
  : 10787899 bytes

  MD5
  : 755aba44607c580fddc25e7c89260460

  SHA256
  : 8c0c4e261a921b5c406bf9e76ac23bf3c915651534e9d1b9e8c5d0bee4a7285c

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p0.zip&gt;][6]
  SIZE
  : 12159728 bytes

  MD5
  : e57a393ccd62ddece4c63bd549d8cf7f

  SHA256
  : e61521af06da71fde9f0c7c08baaf7415614d00c86ec5a7ab08b60a4f3185b2a



[1]: https://github.com/ruby/ruby/blob//v1_9_2_0/NEWS
[2]: https://github.com/ruby/ruby/blob//v1_9_2_0/ChangeLog
[3]: https://github.com/ruby/spec
[4]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p0.tar.bz2
[5]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p0.tar.gz
[6]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p0.zip
