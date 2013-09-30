---
layout: news_post
title: "Ruby 2.1.0-preview1 リリース"
author: "nurse"
translator: "znz"
date: 2013-09-23 07:00:00 UTC
lang: ja
---

Ruby 2.1.0-preview1 をリリースしました。
最終リリースの前に Ruby 2.1 の新機能をお試しください。

## ダウンロード

Fastly による
[http://cache.ruby-lang.org/pub/ruby/2.1/](http://cache.ruby-lang.org/pub/ruby/2.1/)
の利用を推奨します。

* [http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview1.tar.bz2](http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview1.tar.bz2)

      SIZE:   11475553 bytes
      MD5:    d32d1ea23988399afadbd21c5a7a37fc
      SHA256: 860b90d28b214393fd9d77ac2ad65b384d8249cd59b658c668cf0c7bad1db341

* [http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview1.tar.gz](http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview1.tar.gz)

      SIZE:   14449544 bytes
      MD5:    9df4f546f6b961895ba58a8afdf857da
      SHA256: 747472fb33bcc529f1000e5320605a7e166a095d3805520b989e73b33c05b046

* [http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview1.zip](http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview1.zip)

      SIZE:   16124069 bytes
      MD5:    f9bc3f9a10174a022381ce2c60a59e64
      SHA256: 28855621f7d364277e7f258d5cc380e005896ef8ebc36e5cbf78d2bf763c291b

## 変更点

注目すべき変更点は以下の通りです。

* VM (メソッドキャッシュ)
* RGenGC (ささださんの [RubyKaigi での発表](http://rubykaigi.org/2013/talk/S73) や [Euruko での発表](http://www.atdot.net/~ko1/activities/Euruko2013-ko1.pdf) を参照してください)
* refinements
* syntax
* 小数リテラル
* freeze された文字列リテラル
* def の返り値
* Bignum
* 128ビット
* GMP
* String#scrub
* Socket.getifaddrs
* 新しい RubyGems

詳細な変更点は [ruby レポジトリの NEWS (作業中)](https://github.com/ruby/ruby/blob/trunk/NEWS) を参照してください。

ささださんが toruby で発表しました: [Summary of Ruby 2.1](http://www.atdot.net/~ko1/activities/toruby05-ko1.pdf)

Konstantin Haase(@konstantinhaase) さんがブログに良いまとめを書いています: [What's new in Ruby 2.1?](http://rkh.im/ruby-2.1) (英語)

## リリースコメント

既知の問題点:

[http://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=102](http://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=102)

リリーススケジュールやその他の情報については以下も参照してください:

[http://bugs.ruby-lang.org/projects/ruby-trunk/wiki/ReleaseEngineering210](http://bugs.ruby-lang.org/projects/ruby-trunk/wiki/ReleaseEngineering210)
