---
layout: news_post
title: "Ruby 2.1.0-preview2 リリース"
author: "nurse"
translator: "znz"
date: 2013-11-22 22:00:00 +0000
lang: ja
---

Ruby 2.1.0-preview2 をリリースしました。
最終リリースの前に Ruby 2.1 の新機能をお試しください。

## preview1 からの注目すべき変更点

* [浮動小数点数パースにおけるヒープオーバーフロー (CVE-2013-4164)](https://www.ruby-lang.org/ja/news/2013/11/22/heap-overflow-in-floating-point-parsing-cve-2013-4164/) の修正
* "literal".freeze が最適化されるようになりました [#9042](https://bugs.ruby-lang.org/issues/9042)
* 文字列リテラルの f 接尾辞はなくなりました [#9042](https://bugs.ruby-lang.org/issues/9042) (訳注: リリースされたバージョンでは 2.1.0-preview1 にだけありました)
* RGenGC の メモリ使用量増大問題の修正 ([r43532](https://git.ruby-lang.org/ruby.git) と [r43755](https://git.ruby-lang.org/ruby.git))
* Exception#cause 追加 [#8257](https://bugs.ruby-lang.org/issues/8257)
* 以下のライブラリの更新: json, nkf, rake, RubyGems, RDoc

## ダウンロード

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

## 2.0 からの変更点

注目すべき変更点は以下の通りです:

* VM (メソッドキャッシュ)
* RGenGC (ささださんの [RubyKaigi での発表](http://rubykaigi.org/2013/talk/S73) や [RubyConf 2013 での発表](http://www.atdot.net/~ko1/activities/rubyconf2013-ko1_pub.pdf) を参照してください)
* refinements [#8481](https://bugs.ruby-lang.org/issues/8481) [#8571](https://bugs.ruby-lang.org/issues/8571)
* 文法の変更
  * 有理数リテラルと複素数リテラル [#8430](https://bugs.ruby-lang.org/issues/8430)
  * def の返り値 [#3753](https://bugs.ruby-lang.org/issues/3753)
* Bignum
  * 128ビット整数の使用 [#8509](https://bugs.ruby-lang.org/issues/8509)
  * GMP の使用 [#8796](https://bugs.ruby-lang.org/issues/8796)
* String#scrub [#8414](https://bugs.ruby-lang.org/issues/8414)
* Socket.getifaddrs [#8368](https://bugs.ruby-lang.org/issues/8368)
* RDoc 4.1.0.preview.2 と RubyGems 2.2.0.preview.2

詳細な変更点は [Ruby リポジトリの NEWS (作業中)](https://github.com/ruby/ruby/blob/v2_1_0_preview2/NEWS) を参照してください。

ささださんが toruby で Ruby 2.1 の新機能について話しました: [All about Ruby 2.1](http://www.atdot.net/~ko1/activities/toruby05-ko1.pdf)

Konstantin Haase (@konstantinhaase) さんがブログに良いまとめを書いています: [What's new in Ruby 2.1?](http://rkh.im/ruby-2.1) (英語)

## リリースコメント

既知の問題点:

[https://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=102](https://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=102)

リリーススケジュールやその他の情報については以下も参照してください:

[https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering210](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering210)
