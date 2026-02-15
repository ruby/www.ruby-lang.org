---
layout: news_post
title: "Ruby 1.9.3 p0 リリース"
author: "Shota Fukumori"
lang: ja
---

Ruby 1.9.3 の最初の正式版である ruby-1.9.3-p0 がリリースされました。これはRuby 1.9系統の最新版です。

## 所在

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p0.tar.bz2&gt;][1]
  * SIZE: 9554576 bytes
  * MD5: 65401fb3194cdccd6c1175ab29b8fdb8
  * SHA256: ca8ba4e564fc5f98b210a5784e43dfffef9471222849e46f8e848b37e9f38acf

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p0.tar.gz&gt;][2]
  * SIZE: 12223217 bytes
  * MD5: 8e2fef56185cfbaf29d0c8329fc77c05
  * SHA256: 3b910042e3561f4296fd95d96bf30322e53eecf083992e5042a7680698cfa34e

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p0.zip&gt;][3]
  * SIZE: 13691314 bytes
  * MD5: 437ac529a7872c8dcc956eab8e7e6f76
  * SHA256: 1be16d0172e9cf9e5078a7bee2465a9f3af431920e1e3d9417a4fc2ee074bca4

## 1.9.2からの変更点

### ライセンス

ライセンスが変更されました。

* RubyはGPLv2と\"Ruby\'s\"ライセンスでリリースされてきました。Ruby 1.9.3は[2-clause
  BSDL][4]と[Ruby\'sライセンス][5]でリリースされます。

### エンコーディング

* Ruby 1.9.\[0-2\]ではSJISはShift\_JISのaliasでしたが、Windows-31Jのaliasになりました。
* UTF-16、UTF-32、CP950、CP951という新しいエンコーディングが追加されました。
* RegexpsはUnicode 6.0の新しい文字とスクリプトをサポートするようになりました。

### 組み込みクラス

* ARGFにARGF.printやARGF.read\_nonblockなどの新しいメソッドが追加されました。
* Array#pack、String#unpackにエンディアンを明示的に指定する修飾子が追加されました。
* Bignumで、大きな桁（内部表現で150桁以上）の整数の掛け算がToom-3アルゴリズムを使うようになり、高速化しました。
* File::NULLとFile::DIRECTという定数が追加されました。
* IO#putcがマルチバイト文字に対応しました。
* IO#advise、IO.write、IO.binwriteメソッドが追加されました。
* \#\_\_id\_\_はBasicObjectのメソッドになりました。
* Kernel#randの引数としてRangeオブジェクトがサポートされました。
* Module#private\_constant、Module#public\_constantメソッドが追加されました。
* Random.randの引数に範囲を指定できるようになりました。
* String#prepend、String#bytesliceが追加されました。
* Time#strftimeが%:zと%::z.をサポートしました。
* Process#maxgroups と Process#maxgroups=
  は、補助グループを採用していない環境ではNotImplementedErrorがあがるようになりました。

### 標準添付ライブラリ

* io/console: 新しいライブラリです。
* openssl: 活発なメンテナを得たお陰で特段に改善してきています。
* test/unit: テストの並列実行をサポートします。

### 実装

* pathnameライブラリとdateライブラリはCで再実装されました。これによりパフォーマンスが向上します。
* VMのロック戦略が変わりました。

### バグ修正以外の互換性の問題

* Rational#to\_dの挙動が変わりました。精度として0または負の数を与えるとエラーになるようになりました。

詳しくは[NEWS][6]や[ChangeLog][7]をご覧ください。

また、日本語で書かれた紹介資料としては、[&lt;URL:http://www.slideshare.net/mrkn/ruby-193&gt;][8]などもどうぞ。



[1]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p0.tar.bz2
[2]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p0.tar.gz
[3]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p0.zip
[4]: http://en.wikipedia.org/wiki/BSD_licenses#2-clause_license_.28.22Simplified_BSD_License.22_or_.22FreeBSD_License.22.29
[5]: {{ site.url }}{{ site.license.url }}
[6]: https://github.com/ruby/ruby/blob//v1_9_3_0/NEWS
[7]: https://github.com/ruby/ruby/blob//v1_9_3_0/ChangeLog
[8]: http://www.slideshare.net/mrkn/ruby-193
