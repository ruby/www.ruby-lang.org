---
layout: news_post
title: "Ruby 2.1.0-preview2 發佈了"
author: "nurse"
translator: "Juanito Fatas"
date: 2013-11-22 22:00:00 +0000
lang: zh_tw
---

很榮幸告訴大家我們發佈了 Ruby 2.1.0-preview2。
請在最終發佈版出來之前，試試看 Ruby 2.1 新的特色！

## 與 preview1 相比的重要變化

* 修復了 [浮點數解析存在溢出風險 (CVE-2013-4164)](https://www.ruby-lang.org/zh_tw/news/2013/11/22/heap-overflow-in-floating-point-parsing-cve-2013-4164/)
* 優化了 `"literal".freeze` [#9042](https://bugs.ruby-lang.org/issues/9042)。
* 移除字串常量的 f 字尾 [#9042](https://bugs.ruby-lang.org/issues/9042)。
* 修正了 RGenGC 記憶體的耗損問題 ([r43532](https://git.ruby-lang.org/ruby.git) 與 [r43755](https://git.ruby-lang.org/ruby.git))。
* 新增 `Exception#cause` [#8257](https://bugs.ruby-lang.org/issues/8257)
* 更新了許多函式庫，如 json、nkf、rake、RubyGems、以及 RDoc。

## 下載

* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview2.tar.bz2](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview2.tar.bz2)

      SIZE:   11432454 bytes
      MD5:    9d566a9b2d2e7e35ad6125e2a14ce672
      SHA256: 780fddf0e3c8a219057d578e83367ecfac5e945054b9f132b3b93ded4802d1ce

* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview2.tar.gz](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview2.tar.gz)

      SIZE:   14416029 bytes
      MD5:    ba2b95d174e156b417a4d580a452eaf5
      SHA256: a9b1dbc16090ddff8f6c6adbc1fd0473bcae8c69143cecabe65d55f95f6dbbfb

* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview2.zip](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview2.zip)

      SIZE:   16110720 bytes
      MD5:    2ad1aa3d89ae32607cf14fc73b192de1
      SHA256: cc2f7f8e05daed716489e5480e6365a711a13ed7747dbc59e989a41fe2805076

## 與 2.0 相比的變動

值得一提的變動有：

* VM (方法快取)
* RGenGC (參見 ko1's [RubyKaigi 簡報](http://rubykaigi.org/2013/talk/S73) 與 [RubyConf 2013 簡報](http://www.atdot.net/~ko1/activities/rubyconf2013-ko1_pub.pdf))
* 改進 [#8481](https://bugs.ruby-lang.org/issues/8481) [#8571](https://bugs.ruby-lang.org/issues/8571)
* 語法變化
  * 實數與虛數的常量寫法 [#8430](https://bugs.ruby-lang.org/issues/8430)
  * def 的返回值 [#3753](https://bugs.ruby-lang.org/issues/3753)
* Bignum
  * 整數使用 128 位元 [#8509](https://bugs.ruby-lang.org/issues/8509)
  * 採用 GMP [#8796](https://bugs.ruby-lang.org/issues/8796)
* `String#scrub` [#8414](https://bugs.ruby-lang.org/issues/8414)
* `Socket.getifaddrs` [#8368](https://bugs.ruby-lang.org/issues/8368)
* RDoc 4.1.0.preview.2 與 RubyGems 2.2.0.preview.2

了解更多細節 [NEWS in Ruby repository (WIP)](https://github.com/ruby/ruby/blob/v2_1_0_preview2/NEWS).

ko1 在 toruby 談到了 Ruby 2.1 的新特性： [All about Ruby 2.1](http://www.atdot.net/~ko1/activities/toruby05-ko1.pdf)

Konstantin Haase ([@konstantinhaase](https://twitter.com/konstantinhaase)) 寫了篇不錯的總結 [What's new in Ruby 2.1?](http://rkh.im/ruby-2.1).

## 發佈記

已知問題：

[https://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=102](https://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=102)

請參考其他相關資訊與發佈時程：

[https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering210](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering210)
