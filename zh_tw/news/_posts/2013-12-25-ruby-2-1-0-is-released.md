---
layout: news_post
title: "發佈 Ruby 2.1.0"
author: "nurse"
translator: "Juanito Fatas"
date: 2013-12-25 16:00:00 +0000
lang: zh_tw
---

很高興告訴大家 Ruby 2.1.0 發佈了。

Ruby 2.1 速度方面改良許多並且向下兼容。馬上試試吧！

## 下載

* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0.tar.bz2](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0.tar.bz2)
  * SIZE:   12007442 bytes
  * MD5:    1546eeb763ac7754365664be763a1e8f
  * SHA256: 1d3f4ad5f619ec15229206b6667586dcec7cc986672c8fbb8558161ecf07e277
* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0.tar.gz](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0.tar.gz)
  * SIZE:   15076389 bytes
  * MD5:    9e6386d53f5200a3e7069107405b93f7
  * SHA256: 3538ec1f6af96ed9deb04e0965274528162726cc9ba3625dcf23648df872d09d
* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0.zip](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0.zip)
  * SIZE:   16603067 bytes
  * MD5:    2fc3a80b56da81b906a9bb6fc7ca8399
  * SHA256: d40d7bfb39ca2e462dea61dcbbcf33426b60e6e553335c3afb39b4d827a6891c

## 與 2.0 相比的更動

值得一提的更動有：

* VM （方法快取）
* RGenGC （參見 ko1's [RubyKaigi 簡報](http://rubykaigi.org/2013/talk/S73) 與 [RubyConf 2013 簡報](http://www.atdot.net/~ko1/activities/rubyconf2013-ko1_pub.pdf)）
* Refinements [#8481](https://bugs.ruby-lang.org/issues/8481) [#8571](https://bugs.ruby-lang.org/issues/8571)
* 更動語法
  * 實數與虛數的常量寫法 [#8430](https://bugs.ruby-lang.org/issues/8430)
  * def 的返回值 [#3753](https://bugs.ruby-lang.org/issues/3753)
* Bignum
  * 採用 GMP [#8796](https://bugs.ruby-lang.org/issues/8796)
* String#scrub [#8414](https://bugs.ruby-lang.org/issues/8414)
* Socket.getifaddrs [#8368](https://bugs.ruby-lang.org/issues/8368)
* RDoc 4.1.0 與 RubyGems 2.2.0
* 優化了 "literal".freeze [#9042](https://bugs.ruby-lang.org/issues/9042)
* 新增 Exception#cause [#8257](https://bugs.ruby-lang.org/issues/8257)
* 更新函式庫：BigDecimal、JSON、NKF、Rake、RubyGems 以及 RDoc 等
* 移除了擴充庫 curses [#8584](https://bugs.ruby-lang.org/issues/8584)

更多更動細節詳見：[NEWS in Ruby repository](https://github.com/ruby/ruby/blob/v2_1_0/NEWS).
