---
layout: news_post
title: "Ruby 2.5.0-rc1 リリース"
author: "naruse"
translator: "usa"
date: 2017-12-14 00:00:00 +0000
lang: ja
---

Ruby 2.5.0-rc1 をリリースしたことをお知らせします。

Ruby 2.5.0-rc1 は、来る Ruby 2.5.0 に向けての検証用事前リリースです。
これには、幾つかの新しい機能やパフォーマンスの改善が含まれています。
例えば、以下のようなものがあります。

## 新機能

* STDERR が変更されておらず、かつ tty である場合、バックトレースおよびエラーメッセージが逆順に出力されるようになりました。
  [Feature #8661] [experimental]

* トップレベルの定数検索は削除されました。[Feature #11547]

* rescue/else/ensure が do/end ブロック内にも直接書けるようになりました。 [Feature #12906]

* yield\_self [Feature #6721]

## パフォーマンスの改善

* TracePoint のフックにおいて、"trace" 命令を入れておくのをやめて必要時に動的に実装されるようになりました。通常時のオーバーヘッドが軽減されます。 [Feature #14104]

* Proc の確保を遅延することにより、ブロック引数によるブロック渡しのパフォーマンスが向上しました。 [Feature #14045]

* Mutex がよりコンパクトかつ高速に書き直されました。 [Feature #13517]

* SecureRandom は OpenSSL よりも OS の提供する乱数ソースを優先するようになりました。 [Bug #9569]

## その他の注目すべき 2.4 からの変更点

* Onigmo 6.1.3 が取り込まれました。
  [非包含オペレータ](https://github.com/k-takata/Onigmo/issues/87) が追加されています。
  なお、この変更は Ruby 2.4.1 にも取り込まれました。
* bundler が取り込まれ、標準ライブラリとなりました。
* rubygems-2.7.0 が取り込まれました。
* rdoc-6.0.0 が取り込まれました。
  IRB ベースだった文法解析器が Ripper ベースになっています。
  これにより、ドキュメント生成速度が向上しています。
  https://github.com/ruby/rdoc/pull/512
  また、
  * ここ10年余りで累積した多数のバグが修正されています。
  * 近年 Ruby に追加された新しい文法がサポートされています。
* サポートしている Unicode のバージョンが 10.0.0 に更新されました。

その他詳細については、[NEWS](https://github.com/ruby/ruby/blob/v2_5_0_rc1/NEWS) ファイルまたはコミットログを参照してください。

なお、こうした変更により、Ruby 2.4.0 以降では
[6162 個のファイルに変更が加えられ、339744 行の挿入と 28699 行の削除が行われました](https://github.com/ruby/ruby/compare/v2_4_0...v2_5_0_rc1)!

Enjoy Ruby 2.5.0-rc1!

## Download

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0-rc1.tar.gz>

      SIZE:   31049529 bytes
      SHA1:   15df7e8ff99f360a14f7747a07a3021447d65594
      SHA256: 46c11b347522de174566503d35d2b46e1529b979d292b1f7f7019cfedcd4b07f
      SHA512: 41cd298e99d7a25fe5f2ec42946ae5dbc4421bb18f39350ba8a1b02e999541ec1b21b5f6ce0489b3a159f47e37d409178ba7c21c00e177b0fdb410ca6e9d6142

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0-rc1.zip>

      SIZE:   35579788 bytes
      SHA1:   b7ae42eb733d4a0e3a2d135c9f8d4af043daa728
      SHA256: 9858e39fd2e7bf207cc9f8846197b11ada5f4424f433ff4df149fe3d48be8e36
      SHA512: 86c93791d312fd2175909020e448a44892740feb809a532ed706c6d850cb92722fb7ca02ecbdf7a1fbeb5b4f42f1338ce9a15b7c0a41055937bd1fdfb4be6f11

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0-rc1.tar.bz2>

      SIZE:   29238901 bytes
      SHA1:   6aad74ed3d30de63c6ff22048cd0fcbcbe123586
      SHA256: 862a8e9e52432ba383660a23d3e87af11dbc18c863a19ef6367eb8259fc47c09
      SHA512: bf0eb114097f9e505ff846f25e7556a2fb393573b4e8b773f94cf5b47998e221f3962a291db15a3cdbdf4ced5a523812937f80d95f4ee3f7b13c4e37f178d7a7

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0-rc1.tar.xz>

      SIZE:   26096412 bytes
      SHA1:   05cacd0341b7a23cc68239c2061640643a30da38
      SHA256: a479a1bce69b2cf656821f10104dcb8b426922b56d3d6cbdf48318842fae752c
      SHA512: 9f9040abf69337439a3f31b80d440d97736555b0df6533d9d34c141ce52226bc40c3f4f7e596e74b080c879e933649c17a073c893be1a304d9a883bab02e9494
