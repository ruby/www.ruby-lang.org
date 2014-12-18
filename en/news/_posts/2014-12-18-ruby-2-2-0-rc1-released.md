---
layout: news_post
title: "Ruby 2.2.0-rc1 Released"
author: "naruse"
translator:
date: 2014-12-18 09:00:00 +0000
lang: en
---

We are pleased to announce the release of Ruby 2.2.0-rc1.
From this RC1, we don't change nothing but bug fixes.
The final release of Ruby 2.2.0 is scheduled on 2014-12-25.

Ruby 2.2 has many new features and improvements are included for the increasingly
diverse and expanding demands for Ruby.

For example, Symbol GC makes Symbols garbage collectable.
This reduces memory usage of Symbols; because GC couldn't collect Symbols before
Ruby 2.2. Since Rails 5.0 will require Symbol GC, it will support only Ruby 2.2
or later. (See [Rails' blog post](http://weblog.rubyonrails.org/2014/8/20/Rails-4-2-beta1/) for details.)

Also, new Incremental GC decreases pause time of garbage collection, which is also helpful for running Rails applications.

Another feature related to memory management is adding an option for configure.in to use jemalloc
[Feature #9113](https://bugs.ruby-lang.org/issues/9113).
This is an experimental feature, and is disabled by default.
We need to gather use cases and performance data.
When we get convinced of the benefits, the feature will be enabled by default.

One more topic is [using vfork(2) in system() and spawn() (Japanese)](http://www.a-k-r.org/d/2014-09.html#a2014_09_06).
It is expected that it brings a huge speed-up when a large process executes external commands many times.
But vfork(2) is a risky system call.
We want to know how much benefit it brings through gathering use cases and performance data.

Try and enjoy programming with Ruby 2.2.0-preview2, and report us your knowledge!

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
  * Update Psych 2.0.6
  * Update Rake 10.4.0
  * Update RDoc 4.2.0.alpha (21b241a)
  * Update RubyGems 2.4.4+ (2f6e42e)
  * rubygems 2.4.4+ (2f6e42e)
  * Update test-unit 3.0.7 (removed from repository but bundled
in tarball)
  * Update minitest 5.4.3 (removed from repository but bundled in tarball)
  * Deprecate mathn
* C API
  * Remove deprecated APIs

See [NEWS in ruby repository (WIP)](https://github.com/ruby/ruby/blob/v2_2_0_rc1/NEWS) for details.

With those changes, 1239 files changed, 98343 insertions(+), 61858 deletions(-).

## Download

* <http://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-rc1.tar.bz2>
  * SIZE:   12475612 bytes
  * MD5:    7144732d30dd4547c0a59862b3345d54
  * SHA256: e6a1f8d45ea749bdc92eb1269b77ec475bc600b66039ff90d77db8f50820a896
  * SHA512: 181201168360bee37dceeef3481a69e8a333a5d329680031fd9d371d30ac64460bbdf4db07546133024f541774e51301f1630cfd988c5e5bf2464834f3abe6bf
* <http://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-rc1.tar.gz>
  * SIZE:   15531233 bytes
  * MD5:    51f218fabc3ceb7bf3fe5f4f87ddebd3
  * SHA256: a59c8db71b967015ad7c259ba8ef638c7943ec78580412bb86e97791a9322b6b
  * SHA512: 4a35e78c4c0747f9c79e506e98acc117efb0be72fc103d6f9c13d5eb5efa5c6d6748f491526fc7ebb24397f25238f06d552f841e9e898be30aa7cd6c2df38494
* <http://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-rc1.tar.xz>
  * SIZE:   9675108 bytes
  * MD5:    3f482b88eda45c1bc6bab1921763ce52
  * SHA256: dcfad9bb6e0b513b03f08f86b195da6a6a7045559b558d3493decac0e0abb86c
  * SHA512: 3ec8955d8a269a1e5f28c3e0e6023bd613f244c83914a4a8c96d2761b11914c21ce67cfadb2bcebc480d9c0b9c7b54da6dfa67cdf4b4350db2a85d379265ffed
* <http://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-rc1.zip>
  * SIZE:   17219660 bytes
  * MD5:    49f5aae44c00f4d57be47576c29a53bd
  * SHA256: 1bd3e83d44b4e5879b4ecdc496d19905bc03637a8c88027c2dc98a369f1ebb83
  * SHA512: bf0e39e5add532ca338095ad6eaaafbe4f84cc9df1e8d4bad986c44e17614623430c2670d9751865e8d645cb483007d5473be82536b985ccab40a7dde72c4161

## Release Comment

* [2.2.0 Known issues](http://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=115)

See also the release schedule and other information:

[ReleaseEngineering22](http://bugs.ruby-lang.org/projects/ruby-trunk/wiki/ReleaseEngineering22)
