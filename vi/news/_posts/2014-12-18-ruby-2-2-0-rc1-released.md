---
layout: news_post
title: "Ruby 2.2.0-rc1 Released"
author: "naruse"
translator:
date: 2014-12-18 09:00:00 +0000
lang: vi
---

We are pleased to announce the release of Ruby 2.2.0-rc1.
After RC1, all changes will be limited to bug fix only.
The final release of Ruby 2.2.0 is scheduled on December 25, 2014.

Ruby 2.2 includes many new features and improvements for the increasingly
diverse and expanding demands for Ruby.

For example, Ruby's Garbage Collector is now able to collect Symbol type objects.
This reduces memory usage of Symbols; because GC was previously unable to collect them before 2.2.
Since Rails 5.0 will require Symbol GC, it will support only Ruby 2.2 or later.
(See [Rails 4.2 release post](http://weblog.rubyonrails.org/2014/12/19/Rails-4-2-final/) for details.)

Also, a reduced pause time thanks to the new Incremental Garbage Collector will be helpful for running Rails applications. Recent developments mentioned on the [Rails blog](http://weblog.rubyonrails.org/) suggest that Rails 5.0 will take advantage of Incremental GC as well as Symbol GC.

Another feature related to memory management is an additional option for `configure.in` to use jemalloc
[Feature #9113](https://bugs.ruby-lang.org/issues/9113).
This feature is still experimental and currently disabled by default until we gather performance data and more use cases. When we are convinced of the benefits, this feature will be enabled by default.

Experimental support for using vfork(2) with system() and spawn() have also been added. You can read more detail on [tanaka-san's blog in japanese](http://www.a-k-r.org/d/2014-09.html#a2014_09_06).
This could potentially bring huge speed-up when a large process executes external commands many times.
However vfork(2) is still not well understood and a potentially harmful system call. We would like to experiment to find out how much benefit can be gained by gathering performance data and use cases.

Try and enjoy programming with Ruby 2.2.0-rc1, and report us your findings!

## Notable Changes since 2.1

* [Incremental GC](https://bugs.ruby-lang.org/issues/10137) ([YARV Maniacs No.12](http://magazine.rubyist.net/?0048-YARVManiacs))
* [Symbol GC](https://bugs.ruby-lang.org/issues/9634) ([presentation at RubyKaigi 2014](http://www.slideshare.net/authorNari/symbol-gc))
* configure --with-jemalloc [Feature #9113](https://bugs.ruby-lang.org/issues/9113)
* core libraries:
  * Support Unicode 7.0 [#9092](https://bugs.ruby-lang.org/issues/9092)
  * New methods:
    * Enumerable#slice_after [#9071](https://bugs.ruby-lang.org/issues/9071), Enumerable#slice_when [#9826](https://bugs.ruby-lang.org/issues/9826)
    * Float#next_float, Float#prev_float [#9834](https://bugs.ruby-lang.org/issues/9834)
    * File.birthtime, File#birthtime [#9647](https://bugs.ruby-lang.org/issues/9647)
    * String#unicode_normalize [#10084](https://bugs.ruby-lang.org/issues/10084)
* bundled libraries:
  * Update Psych 2.0.8
  * Update Rake 10.4.0
  * Update RDoc 4.2.0.alpha (21b241a)
  * Update RubyGems 2.4.5
  * Update test-unit 3.0.8 (removed from repository but bundled
in tarball)
  * Update minitest 5.4.3 (removed from repository but bundled in tarball)
  * Deprecate mathn
* C API
  * Remove deprecated APIs

See [NEWS in Ruby repository (WIP)](https://github.com/ruby/ruby/blob/v2_2_0_rc1/NEWS) for details.

With those changes, 1548 files changed, 123658 insertions(+), 74306 deletions(-) from v2.1.0!

## Download

* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-rc1.tar.bz2>
  * SIZE:   12475612 bytes
  * MD5:    7144732d30dd4547c0a59862b3345d54
  * SHA256: e6a1f8d45ea749bdc92eb1269b77ec475bc600b66039ff90d77db8f50820a896
  * SHA512: 181201168360bee37dceeef3481a69e8a333a5d329680031fd9d371d30ac64460bbdf4db07546133024f541774e51301f1630cfd988c5e5bf2464834f3abe6bf
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-rc1.tar.gz>
  * SIZE:   15531233 bytes
  * MD5:    51f218fabc3ceb7bf3fe5f4f87ddebd3
  * SHA256: a59c8db71b967015ad7c259ba8ef638c7943ec78580412bb86e97791a9322b6b
  * SHA512: 4a35e78c4c0747f9c79e506e98acc117efb0be72fc103d6f9c13d5eb5efa5c6d6748f491526fc7ebb24397f25238f06d552f841e9e898be30aa7cd6c2df38494
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-rc1.tar.xz>
  * SIZE:   9675108 bytes
  * MD5:    3f482b88eda45c1bc6bab1921763ce52
  * SHA256: dcfad9bb6e0b513b03f08f86b195da6a6a7045559b558d3493decac0e0abb86c
  * SHA512: 3ec8955d8a269a1e5f28c3e0e6023bd613f244c83914a4a8c96d2761b11914c21ce67cfadb2bcebc480d9c0b9c7b54da6dfa67cdf4b4350db2a85d379265ffed
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-rc1.zip>
  * SIZE:   17219660 bytes
  * MD5:    49f5aae44c00f4d57be47576c29a53bd
  * SHA256: 1bd3e83d44b4e5879b4ecdc496d19905bc03637a8c88027c2dc98a369f1ebb83
  * SHA512: bf0e39e5add532ca338095ad6eaaafbe4f84cc9df1e8d4bad986c44e17614623430c2670d9751865e8d645cb483007d5473be82536b985ccab40a7dde72c4161

## Release Comment

* [2.2.0 Known issues](https://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=115)

See also the release schedule and other information:

[ReleaseEngineering22](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering22)
