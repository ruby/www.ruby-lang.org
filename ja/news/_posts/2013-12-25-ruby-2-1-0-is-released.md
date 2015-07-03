---
layout: news_post
title: "Ruby 2.1.0 リリース"
author: "nurse"
translator: "takahashim"
date: 2013-12-25 16:00:00 +0000
lang: ja
---

Ruby 2.1.0 をリリースしました。

Ruby 2.1 では深刻な非互換もなく、速度の向上を含めた多くの改善が行われています。

どうぞご利用ください。

## ダウンロード

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

## 2.0 からの変更点

主な変更点は以下の通りです。

* VM (メソッドキャッシュ)
* RGenGC (ささださんの[RubyKaigiのプレゼン資料](http://rubykaigi.org/2013/talk/S73) と [RubyConf 2013のプレゼン資料](http://www.atdot.net/~ko1/activities/rubyconf2013-ko1_pub.pdf)をご覧ください)
* refinements [#8481](https://bugs.ruby-lang.org/issues/8481) [#8571](https://bugs.ruby-lang.org/issues/8571)
* 文法の変更
  * Rational/Complex リテラル [#8430](https://bugs.ruby-lang.org/issues/8430)
  * defの戻り値 [#3753](https://bugs.ruby-lang.org/issues/3753)
* Bignum
  * GMP の利用 [#8796](https://bugs.ruby-lang.org/issues/8796)
* String#scrub [#8414](https://bugs.ruby-lang.org/issues/8414)
* Socket.getifaddrs [#8368](https://bugs.ruby-lang.org/issues/8368)
* RDoc 4.1.0 と RubyGems 2.2.0
* "literal".freeze の最適化 [#9042](https://bugs.ruby-lang.org/issues/9042)
* Exception#cause の追加 [#8257](https://bugs.ruby-lang.org/issues/8257)
* BigDecimal, JSON, NKF, Rake, RubyGems, RDoc などのライブラリの更新
* curses の削除 [#8584](https://bugs.ruby-lang.org/issues/8584)

詳しい変更点については [RubyリポジトリのNEWSファイル](https://github.com/ruby/ruby/blob/v2_1_0/NEWS)を参照ください。
