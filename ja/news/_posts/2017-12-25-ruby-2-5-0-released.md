---
layout: news_post
title: "Ruby 2.5.0 リリース"
author: "naruse"
translator:
date: 2017-12-25 00:00:00 +0000
lang: ja
---

Ruby 2.5シリーズの最初の安定版である、Ruby 2.5.0がリリースされました。

Ruby 2.5.0には、多くの新しい機能やパフォーマンスの改善が含まれています。
その一部を以下に紹介します。

## 新機能

- `rescue`/`else`/`ensure` が `do`/`end` ブロック内にも直接書けるようになりました。 [[Feature #12906]](https://bugs.ruby-lang.org/issues/12906)
- `yield_self` が追加されました。与えられたブロックをそのコンテキストでyieldします。`tap`と異なり、`yield_self` はブロックの値を返します。[[Feature #6721]](https://bugs.ruby-lang.org/issues/6721)
- 分岐カバレッジとメソッドカバレッジの計測がサポートされました。分岐カバレッジは分岐が実行されたかどうかを表します。またメソッドカバレッジはメソッドが呼び出されたかどうかを測定します。テストスイートをこれらの新機能を用いて実行することにより、どの分岐およびメソッドが実行されたかを知ることができるため、テストスイートのカバレッジをより厳密に評価することができます。 [[Feature #13901]](https://bugs.ruby-lang.org/issues/13901)
- Hash#slice [[Feature #8499]](https://bugs.ruby-lang.org/issues/8499) とHash#transform_keys [[Feature #13583]](https://bugs.ruby-lang.org/issues/13583) が追加されました。
- トップレベルの定数検索は削除されました。[[Feature #11547]](https://bugs.ruby-lang.org/issues/11547)
- みなさんに最も愛されているライブラリの一つである pp.rb が自動的にロードされるようになりました。もう `require "pp"` と書く必要はありません。[[Feature #14123]](https://bugs.ruby-lang.org/issues/14123)
- バックトレースおよびエラーメッセージが逆順(古い呼び出しが先、最新の呼び出しが後)に表示されるようになりました。これにより、長いバックトレースが端末(TTY)に表示された場合に、エラーの原因行が末尾に表示されて見つけやすくなります。なお、この逆順表示はこれらが端末に直接表示される場合にのみ有効となります。[[Feature #8661]](https://bugs.ruby-lang.org/issues/8661) [experimental]

## パフォーマンスの改善

- 命令列中のすべての `trace` 命令を削除することで、5～10% の高速化を実現しました。`trace` 命令は `TracePoint` をサポートするために挿入されていましたが、ほとんどの場合、`TracePoint` は有効にされず、これらの命令は無用なオーバヘッドとなっていました。Ruby 2.5 では、`trace` 命令を用いる代わりに、動的書き換えを利用します。詳細は [[Feature #14104]](https://bugs.ruby-lang.org/issues/14104) をご覧ください。
- ブロックパラメータによるブロック渡し（例：`def foo(&b); bar(&b); end`）が、"Lazy Proc allocation" というテクニックを用いることで、Ruby 2.4 と比べて約3倍高速化しました。渡されたブロックを、さらに他のメソッドに渡したい場合、ブロックパラメータを利用する必要があります。しかし、ブロックパラメータは `Proc` オブジェクトの生成が必要であり、ブロック渡しのためにはこれが大きなオーバヘッドとなっていました。"Lazy Proc allocation" はこの問題を解決します。詳細は [[Feature #14045]](https://bugs.ruby-lang.org/issues/14045) をご覧ください。
- Mutex がよりコンパクトかつ高速に書き直されました。 [[Feature #13517]](https://bugs.ruby-lang.org/issues/13517)
- ERB は Ruby 2.4 に比べて 2 倍の速度でテンプレートからコードを生成するようになりました。
- `Array#concat`、`Enumerable#sort_by`、`String#concat`、`String#index`、`Time#+`、などの組み込みメソッドの速度が向上しました。
- IO.copy_streamがcopy_file_range(2)を使ってコピーのオフロードを試みるようになりました。 [[Feature #13867]](https://bugs.ruby-lang.org/issues/13867)

## その他の注目すべき 2.4 からの変更点

- SecureRandom は OpenSSL よりも OS の提供する乱数ソースを優先するようになりました。 [[Bug #9569]](https://bugs.ruby-lang.org/issues/9569)
- cmath, csv, date, dbm, etc, fcntl, fiddle, fileutils, gdbm, ipaddr, scanf, sdbm, stringio, strscan, webrick, zlib が
  default gems になりました
- Onigmo 6.1.3 が取り込まれました。
  - [非包含オペレータ](https://github.com/k-takata/Onigmo/issues/87) が追加されています。
  - なお、この変更は [Ruby 2.4.1](https://www.ruby-lang.org/ja/news/2017/03/22/ruby-2-4-1-released/) にも取り込まれました。
- Psych 3.0.2 が取り込まれました。
- RubyGems 2.7.3 が取り込まれました。
- RDoc 6.0.1 が取り込まれました。
  - [IRB ベースだった文法解析器が Ripper ベースになり](https://github.com/ruby/rdoc/pull/512)、ドキュメント生成速度が向上しています。
  - また、
    - ここ10年余りで累積した多数のバグが修正されています。
    - 近年 Ruby に追加された新しい文法がサポートされています。
- サポートしている Unicode のバージョンが 10.0.0 に更新されました。
- `Thread.report_on_exception` のデフォルト値が true になりました。マルチスレッドプログラムのデバッグの助けになるでしょう。 [[Feature #14143]](https://bugs.ruby-lang.org/issues/14143)
- IO#writeが複数の引数を受け取るようになりました。 [[Feature #9323]](https://bugs.ruby-lang.org/issues/9323)

その他詳細については、[NEWS](https://github.com/ruby/ruby/blob/v2_5_0/NEWS) ファイルまたは[コミットログ](https://github.com/ruby/ruby/compare/v2_4_0...v2_5_0)を参照してください。

なお、こうした変更により、Ruby 2.4.0 以降では [6158 個のファイルに変更が加えられ348484の挿入と 82747 行の削除が行われました](https://github.com/ruby/ruby/compare/v2_4_0...v2_5_0) !

メリークリスマス。Ruby とともに良いお年を！

## Download

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0.tar.gz>

      SIZE:   15834941 bytes
      SHA1:   58f77301c891c1c4a08f301861c26b1ea46509f6
      SHA256: 46e6f3630f1888eb653b15fa811d77b5b1df6fd7a3af436b343cfe4f4503f2ab
      SHA512: 0712fe68611f5d0cd6dd54b814f825478e64b6a62bdf67bce431f4dca2dc00b1a33f77bebfbcd0a151118a1152554ab457decde435b424aa1f004bc0aa40580d

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0.zip>

      SIZE:   19495617 bytes
      SHA1:   700b6f55d689a5c8051c8c292b9e77a1b50bf96e
      SHA256: 94559ea6e3c619423da604e503ce1dc1c465d6e0747a07fbdc5f294acaf14c24
      SHA512: e4324064cee8c65b80192e3eff287e915d2d40464d300744c36fb326ae4b1846911400a99d4332192d8a217009d3a5209b43eb5e8bc0b739035bef89cc493e84

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0.tar.bz2>

      SIZE:   13955820 bytes
      SHA1:   827b9a3bcffa86d1fc9ed96d403cb9dc37731688
      SHA256: d87eb3021f71d4f62e5a5329628ac9a6665902173296e551667edd94362325cc
      SHA512: 8f6fdf6708e7470f55bc009db2567cd8d4e633ad0678d83a015441ecf5b5d88bd7da8fb8533a42157ff83b74d00b6dc617d39bbb17fc2c6c12287a1d8eaa0f2c

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0.tar.xz>

      SIZE:   11292472 bytes
      SHA1:   9c7babcf9e299be3f197d9091024ae458f1a1273
      SHA256: 1da0afed833a0dab94075221a615c14487b05d0c407f991c8080d576d985b49b
      SHA512: 55714a33d7661fe8b432f73c34fd67b49699f8b79df1cbd680a74899124d31111ab0f444677672aac1ba725820182940d485efb2db0bf2bc96737c5d40c54578
