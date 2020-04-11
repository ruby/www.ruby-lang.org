---
layout: news_post
title: "Ruby 2.1.0-rc1 リリース"
author: "nurse"
translator: "sorah"
date: 2013-12-20 16:53:05 +0000
lang: ja
---

Ruby 2.1.0-rc1 をリリースしました。
2013/12/25 に予定されている最終リリース前に新機能をどうぞお試しください。

## preview2 からの注目すべき変更点

* 拡張ライブラリ curses が削除されました。 [#8584](https://bugs.ruby-lang.org/issues/8584)

その他の変更は [NEWS](https://github.com/ruby/ruby/blob/v2_1_0_rc1/NEWS) をご覧ください。

## ダウンロード

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

## 2.0 からの変更点

Ruby 2.0.0 からの注目すべき変更点は以下の通りです:

* VM (メソッドキャッシュ)
* RGenGC (ささださんの [RubyKaigi での発表](http://rubykaigi.org/2013/talk/S73) や [RubyConf 2013 での発表](http://www.atdot.net/~ko1/activities/rubyconf2013-ko1_pub.pdf) を参照してください)
* refinements [#8481](https://bugs.ruby-lang.org/issues/8481) [#8571](https://bugs.ruby-lang.org/issues/8571)
* 文法の変更
  * 有理数リテラルと複素数リテラル [#8430](https://bugs.ruby-lang.org/issues/8430)
  * def の返り値 [#3753](https://bugs.ruby-lang.org/issues/3753)
* Bignum
  * GMP の使用 [#8796](https://bugs.ruby-lang.org/issues/8796)
* String#scrub [#8414](https://bugs.ruby-lang.org/issues/8414)
* Socket.getifaddrs [#8368](https://bugs.ruby-lang.org/issues/8368)
* RDoc 4.1.0 と RubyGems 2.2.0
* "literal".freeze の最適化 [#9042](https://bugs.ruby-lang.org/issues/9042)
* Exception#cause の追加 [#8257](https://bugs.ruby-lang.org/issues/8257)
* ライブラリの更新: BigDecimal, JSON, NKF, Rake, RubyGems, RDoc
* 拡張ライブラリ curses が削除されました。 [#8584](https://bugs.ruby-lang.org/issues/8584)

詳細な変更点は [Ruby リポジトリの NEWS (作業中)](https://github.com/ruby/ruby/blob/v2_1_0_rc1/NEWS) を参照してください。

ささださんが toruby で Ruby 2.1 の新機能について話しました: [All about Ruby 2.1](http://www.atdot.net/~ko1/activities/toruby05-ko1.pdf)

Konstantin Haase (@konstantinhaase) さんがブログに良いまとめを書いています: [What's new in Ruby 2.1?](http://rkh.im/ruby-2.1) (英語)

## リリースコメント

既知の問題点:

<https://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=102>

リリーススケジュールやその他の情報については以下も参照してください:

<https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering210>
