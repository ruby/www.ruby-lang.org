---
layout: news_post
title: "Ruby 2.2.0 Released"
author: "naruse"
translator:
date: 2014-12-25 09:00:00 +0000
lang: vi
---

We are pleased to announce the release of Ruby 2.2.0.

Ruby 2.2 includes many new features and improvements for the increasingly
diverse and expanding demands for Ruby.

For example, Ruby's Garbage Collector is now able to collect Symbol type objects.
This reduces memory usage of Symbols; because GC was previously unable
to collect them before 2.2.
Since Rails 5.0 will require Symbol GC, it will support only Ruby 2.2 or later.
(See [Rails 4.2 release post](http://weblog.rubyonrails.org/2014/12/19/Rails-4-2-final/) for details.)

Also, a reduced pause time thanks to the new Incremental Garbage Collector will
be helpful for running Rails applications. Recent developments mentioned on the
[Rails blog](http://weblog.rubyonrails.org/)
suggest that Rails 5.0 will take advantage of Incremental GC as well as
Symbol GC.

Another feature related to memory management is an additional option
for `configure.in` to use jemalloc
[Feature #9113](https://bugs.ruby-lang.org/issues/9113).
This feature is still experimental and currently disabled by default until we
gather performance data and more use cases. When we are convinced of the
benefits, this feature will be enabled by default.

Experimental support for using vfork(2) with system() and spawn() have also
been added. You can read more detail on
[tanaka-san's blog in Japanese](http://www.a-k-r.org/d/2014-09.html#a2014_09_06).
This could potentially bring huge speed-up when a large process executes
external commands many times.
However vfork(2) is still not well understood and a potentially harmful
system call. We would like to experiment to find out how much benefit can be
gained by gathering performance data and use cases.

Try and enjoy programming with Ruby 2.2.0, and report us your findings!

## Notable Changes since 2.1

* [Incremental GC](https://bugs.ruby-lang.org/issues/10137)
  ([presentation at RubyConf 2014: "Incremental GC for Ruby interpreter"](http://www.atdot.net/~ko1/activities/2014_rubyconf_pub.pdf))
* [Symbol GC](https://bugs.ruby-lang.org/issues/9634)
  ([presentation at RubyKaigi 2014](http://www.slideshare.net/authorNari/symbol-gc))
* configure --with-jemalloc
  [Feature #9113](https://bugs.ruby-lang.org/issues/9113)
* core libraries:
  * Support Unicode 7.0 [#9092](https://bugs.ruby-lang.org/issues/9092)
  * New methods:
    * Enumerable#slice_after [#9071](https://bugs.ruby-lang.org/issues/9071),
      Enumerable#slice_when [#9826](https://bugs.ruby-lang.org/issues/9826)
    * Float#next_float, Float#prev_float
      [#9834](https://bugs.ruby-lang.org/issues/9834)
    * File.birthtime, File#birthtime
      [#9647](https://bugs.ruby-lang.org/issues/9647)
    * String#unicode_normalize [#10084](https://bugs.ruby-lang.org/issues/10084)
* bundled libraries:
  * Update Psych 2.0.8
  * Update Rake 10.4.2
  * Update RDoc 4.2.0
  * Update RubyGems 2.4.5
  * Update test-unit 3.0.8 (removed from repository but bundled in tarball)
  * Update minitest 5.4.3 (removed from repository but bundled in tarball)
  * Deprecate mathn
* C API
  * Remove deprecated APIs

See [NEWS in Ruby repository](https://github.com/ruby/ruby/blob/v2_2_0/NEWS)
for details.

With those changes, 1557 files changed, 125039 insertions(+), 74376 deletions(-)
from v2.1.0!

## Download

* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0.tar.bz2>
  * SIZE:   13304042 bytes
  * MD5:    d03cd4690fec1fff81d096d1c1255fde
  * SHA256: 1c031137999f832f86be366a71155113675b72420830ce432b777a0ff4942955
  * SHA512: 04edc53e8cd1732c3ca61ebeb1d6133614beb10f77f9abb80d8d36352fe8aa205112068e460bf600b2c7e81e0ddcc3b311e7e027c320366f1bd992b3e378a6ad
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0.tar.gz>
  * SIZE:   16494584 bytes
  * MD5:    cd03b28fd0b555970f5c4fd481700852
  * SHA256: 7671e394abfb5d262fbcd3b27a71bf78737c7e9347fa21c39e58b0bb9c4840fc
  * SHA512: 1ba0c68e1c8d2b60bbd1e218cf36463edbe34cf9418d7593702b631e68d02297465f752e71395f6cfa4104f4cd70a1eb44381ffb74bc7801758b830931fdcfc6
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0.tar.xz>
  * SIZE:   10304244 bytes
  * MD5:    54b43c6c6c9dd4c4b08ceb03ad0ded7a
  * SHA256: 848714e280fc5fb44dbac3b060b206e56c1947006324ee68a174d68b483ef8ca
  * SHA512: cd7e52faa464df8aca7ccfa23a5f06248e1ad82bc8c9f1829aa1b51ff37b15973b8caaa68e914d837325b8d59427fda4f3cad82c50925e1c84e688324a2a155d
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0.zip>
  * SIZE:   18441027 bytes
  * MD5:    f8e1d0cee4f2d9535a9529ed23ae3700
  * SHA256: e06c1e2b1248cf881749833084b2bec93f7612676009190ff9bc89b8fd07c29f
  * SHA512: 364dd927b496520d95a1b06c68e1a265015f4cab08bdf3efaa323d385e7bf075eae47f2e1db78a629db0f3c0c1ed24e086603ba21e2da02ac06dd3c8b716766e
