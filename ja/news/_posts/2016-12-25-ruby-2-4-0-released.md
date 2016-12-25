---
layout: news_post
title: "Ruby 2.4.0 リリース"
author: "naruse"
translator:
date: 2016-12-25 00:00:00 +0000
lang: ja
---

Ruby 2.4シリーズの最初の安定版である、Ruby 2.4.0がリリースされました。

Ruby 2.4.0 には以下に示すようなたくさんの新機能が含まれています:

## [Introduce hash table improvement (by Vladimir Makarov)](https://bugs.ruby-lang.org/issues/12142)

従来Rubyのハッシュテーブルの内部実装 (st_table) ではに双方向連結リストとチェイン法を用いた実装が使われていましたが、挿入順の配列にオープンアドレス法を用いることによる高速化が行われました。
この改善に際しては多くの方による議論が行われ、とりわけ Yura Sokolov 氏によって多大な貢献がありました。

## Binding#irb: Start a REPL session similar to `binding.pry`

[pry](https://github.com/pry/pry) を用いると `binding.pry` とアプリケーションに書くことで、その場で対話型実行環境を起動することができ、デバッグの際に便利です。
[r56624](https://github.com/ruby/ruby/commit/493e48897421d176a8faf0f0820323d79ecdf94a) にて `binding.irb` と書くことで同様なことをirbを用いて行える機能が入りました。

## [Unify Fixnum and Bignum into Integer](https://bugs.ruby-lang.org/issues/12005)

Rubyの標準仕様である [ISO/IEC 30170:2012](http://www.iso.org/iso/iso_catalogue/catalogue_tc/catalogue_detail.htm?csnumber=59579) ではIntegerクラスの詳細について定めていませんが、これまでRubyにはFixnumとBignum、2つの整数クラスがありました。
Ruby 2.4では従来抽象クラスであったIntegerクラスにこの2つを統合しています。
FixnumクラスやBignumクラスを扱う全てのC拡張ライブラリは修正が必要になります。

詳細は [Redmineチケット](https://bugs.ruby-lang.org/issues/12005) や [RubyKaigiでの発表](http://www.a-k-r.org/pub/2016-09-08-rubykaigi-unified-integer.pdf)を参照ください。

## [String supports Unicode case mappings](https://bugs.ruby-lang.org/issues/10085)

`String/Symbol#upcase/downcase/swapcase/capitalize(!)` は従来ASCIIの範囲でのみ大文字小文字を変換していましたが、Ruby 2.4ではUnicodeの仕様にのっとった変換を行うようになります。

## Performance improvements

Ruby 2.4 では以下のような言語レベルでの修正を伴う性能改善が行われています。

### [Array#max, Array#min](https://bugs.ruby-lang.org/issues/12172)

一定の条件下において、`[x, y].max` や `[x, y].min` が一時的な配列を生成しないようになりました。

### [Regexp#match?](https://bugs.ruby-lang.org/issues/8110)

バックリファレンスの生成や `$~` の変更を行わないことで、極力オブジェクト生成を減らした `Regexp#match?` が追加されました。

### Other performance improvements

* [speed up instance variable access](https://bugs.ruby-lang.org/issues/12274)

## Debugging

### [Thread#report_on_exception and Thread.report_on_exception](https://bugs.ruby-lang.org/issues/6647)

Rubyでは、あるスレッドで発生した例外は、別のスレッドに join されない限り無視されます。
Ruby 2.4 で `report_on_exception = true` を行うと、あるスレッドが例外で終了した場合、標準エラー出力にその旨が出力されます。

Ruby 2.5 において `report_on_exception` のデフォルトの値がどうあるべきか、ある正常終了したスレッドがGCされた場合に通知する機能も必要かなどについてご意見をお持ちの方はお知らせください。

### [Thread deadlock detection now shows threads with their backtrace and dependency](https://bugs.ruby-lang.org/issues/8214)

Rubyにはスレッド待ちのデッドロックを検出する機能がありましたが、その際のエラー出力はデバッグのための十分な情報を出していませんでした。Ruby 2.4ではスレッドのバックトレースや依存関係などを出力します。

## Other notable changes since 2.3

* Support OpenSSL 1.1.0 (drop support for 0.9.7 or prior)
* ext/tk is now removed from stdlib [Feature #8539](https://bugs.ruby-lang.org/issues/8539)
* XMLRPC is now removed from stdlib [Feature #12160](https://bugs.ruby-lang.org/issues/12160)

See [NEWS](https://github.com/ruby/ruby/blob/v2_4_0/NEWS)
and [ChangeLog](https://github.com/ruby/ruby/blob/v2_4_0/doc/ChangeLog-2.4.0)
for details.

With those changes,
[2523 files changed, 289129 insertions(+), 84670 deletions(-)](https://github.com/ruby/ruby/compare/v2_3_0...v2_4_0)
since Ruby 2.3.0!

メリークリスマス。Ruby とともに良き休日をおすごしください。

## Download

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0.tar.bz2>

      SIZE:   12572424 bytes
      SHA1:   944d2588308391b20a89642472454d1dfe7b2360
      SHA256: 440bbbdc49d08d3650f340dccb35986d9399177ad69a204def56e5d3954600cf
      SHA512: bef7bb53f63fb74073d071cc125fb67b273ed0779ef43c2d2969089b9ca21fff1bd012281c5b748f7a3c24dd26e71730d7248c05a01cb23ab2089eb4d02115fe

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0.tar.gz>

      SIZE:   14104044 bytes
      SHA1:   d44a3c50a0e742341ed3033d5db79d865151a4f4
      SHA256: 152fd0bd15a90b4a18213448f485d4b53e9f7662e1508190aa5b702446b29e3d
      SHA512: 21c9f596b42dd9cba7a53963a59fed0c2e0c1eb960a4ac7087ea3eaa991ce9252d32639e1edcb75b1d709bc07c4820a6dc336ab427d0643c6e6498e0eacdbc8b

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0.tar.xz>

      SIZE:   9906880 bytes
      SHA1:   038804bbd0e77508dd2510b729a9f3b325489b2e
      SHA256: 3a87fef45cba48b9322236be60c455c13fd4220184ce7287600361319bb63690
      SHA512: 975a5388592adc038461e0acebb6c0efee242891b2ea8621476401458efe2bc0fdd317d3bf99beb745b0b3808410efdff33862da29c95c027f457943721e3ab6

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0.zip>

      SIZE:   15758757 bytes
      SHA1:   29e1bab11551011718c35a51827edcb55bd656fc
      SHA256: 5c2bbfa26fd6a15a2d70961874b0f3a386206fcc5f698e240dd8b0c9f0f18c5e
      SHA512: 31d932372ce490eeac0a70bc8dcf842909a90435422398d069c05cf01d994936064b8f4e60879e28a8655c1296eb8e180e348cb95e001ed6ca73cda0ff77de23
