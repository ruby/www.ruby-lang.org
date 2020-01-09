---
layout: news_post
title: "Ruby 2.1.0-preview1 發佈了"
author: "nurse"
translator: "Juanito Fatas"
date: 2013-09-23 07:00:00 +0000
lang: zh_tw
---

很榮幸告訴大家我們發佈了 Ruby 2.1.0-preview1。
請在最終發佈版出來之前，試試看 Ruby 2.1 新的特色！

## 下載

推薦透過 Fastly
[https://cache.ruby-lang.org/pub/ruby/2.1/](https://cache.ruby-lang.org/pub/ruby/2.1/)
下載。

* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview1.tar.bz2](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview1.tar.bz2)

      SIZE:   11475553 bytes
      MD5:    d32d1ea23988399afadbd21c5a7a37fc
      SHA256: 860b90d28b214393fd9d77ac2ad65b384d8249cd59b658c668cf0c7bad1db341

* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview1.tar.gz](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview1.tar.gz)

      SIZE:   14449544 bytes
      MD5:    9df4f546f6b961895ba58a8afdf857da
      SHA256: 747472fb33bcc529f1000e5320605a7e166a095d3805520b989e73b33c05b046

* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview1.zip](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview1.zip)

      SIZE:   16124069 bytes
      MD5:    f9bc3f9a10174a022381ce2c60a59e64
      SHA256: 28855621f7d364277e7f258d5cc380e005896ef8ebc36e5cbf78d2bf763c291b

## 變化

值得一提的變化有：

* VM (method cache)
* RGenGC (參見 ko1's [RubyKaigi 簡報](http://rubykaigi.org/2013/talk/S73) 及 [EuRuKo 簡報](http://www.atdot.net/~ko1/activities/Euruko2013-ko1.pdf))
* refinements
* syntax
* Decimal Literal
* Frozen String Literal
* def's return value
* Bignum
* 128bit
* GMP
* String#scrub
* Socket.getifaddrs
* new RubyGems

關於 Ruby 2.1 更多的細節：[NEWS in Ruby repository (WIP)](https://github.com/ruby/ruby/blob/trunk/NEWS)

ko1 的 toruby 簡報：[Summary of Ruby 2.1](http://www.atdot.net/~ko1/activities/toruby05-ko1.pdf)

Konstantin Haase (@konstantinhaase) 寫了篇文章總結了 2.1 的變化：[What's new in Ruby 2.1?](http://rkh.im/ruby-2.1).

## 發佈記

已知問題：

[https://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=102](https://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=102)

請參考下列時程與其他資訊：

[https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering210](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering210)
