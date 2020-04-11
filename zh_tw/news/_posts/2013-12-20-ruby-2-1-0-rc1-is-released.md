---
layout: news_post
title: "Ruby 2.1.0-rc1 發佈了"
author: "nurse"
translator: "Juanito Fatas"
date: 2013-12-20 16:53:05 +0000
lang: zh_tw
---

很高興告訴大家 Ruby 2.1.0-rc1 發佈了。
請在 2013 年 12 月 25 日最終發行版釋出前，試試 Ruby 2.1 的新特色！

## 與 preview 2 相比的重要更動

* 移除了擴充庫 curses [#8584](https://bugs.ruby-lang.org/issues/8584)。

其它更動請參考 [NEWS](https://github.com/ruby/ruby/blob/v2_1_0_rc1/NEWS)。

## 下載

* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-rc1.tar.bz2](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-rc1.tar.bz2)
  * SIZE:   11394226 bytes
  * MD5:    cae095b90349b5b0f7026060cc3dd2c5
  * SHA256: af828bc0fe6aee5ffad0f8f10b48ee25964f54d5118570937ac7cf1c1df0edd3
* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-rc1.tar.gz](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-rc1.tar.gz)
  * SIZE:   14450990 bytes
  * MD5:    a16561f64d78a902fab08693a300df98
  * SHA256: 1b467f13be6d3b3648a4de76b34b748781fe4f504a19c08ffa348c75dd62635e
* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-rc1.zip](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-rc1.zip)
  * SIZE:   16107702 bytes
  * MD5:    b6cdc0e63185b4aeb268bdf6ebd4de9f
  * SHA256: 4d6a256b73b79f5b64182e1f55db3e61042bbe0166a45917e69c1b4e47247276

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

更多更動細節詳見： [NEWS in Ruby repository（施工中）](https://github.com/ruby/ruby/blob/v2_1_0_rc1/NEWS)。

ko1 在 toruby 談到了 Ruby 2.1 的新功能： [All about Ruby 2.1](http://www.atdot.net/~ko1/activities/toruby05-ko1.pdf)。

Konstantin Haase ([@konstantinhaase](https://twitter.com/konstantinhaase)) 寫了篇不錯的總結 [What's new in Ruby 2.1?](http://rkh.im/ruby-2.1)。

## 發佈記

已知問題：

<https://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=102>

請參考其它相關資訊與發佈時程：

<https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering210>
