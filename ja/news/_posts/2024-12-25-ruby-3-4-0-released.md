---
layout: news_post
title: "Ruby 3.4.0 リリース"
author: "naruse"
translator:
date: 2024-12-25 00:00:00 +0000
lang: ja
---

{% assign release = site.data.releases | where: "version", "3.4.0" | first %}
Ruby {{ release.version }} が公開されました。Ruby 3.4では、ブロックパラメータ参照の `it` の追加、
デフォルトパーサーのPrismへの変更、Socket ライブラリの Happy Eyeballs Version 2 (RFC 8305) 対応、YJITの改善、
Modular GCの導入など様々な改善が行われています。

## `it` の追加

ブロックパラメータに名前をつけずに参照する `it` が追加されました。 [[Feature #18980]]

```ruby
ary = ["foo", "bar", "baz"]

p ary.map { it.upcase } #=> ["FOO", "BAR", "BAZ"]
```

`it` は `_1` とほとんど同じように動作します。ブロック内で `_1` のみを使用する意図がある場合に `_1` を使うと、`_2` や `_3` などの他の番号付きパラメータが現れる可能性が示唆され、認知的負荷が高い問題がありました。そのため、`it` は便利なエイリアスとして導入されました。一行ブロックなど、`it`の意味が一目でわかる簡単なケースにご利用ください。

## デフォルトのパーサをPrismに変更

デフォルトで使用するパーサーを parse.y から生成するパーサーから Prism へと変更しました。 [[Feature #20564]]

これは内部的な改善であり、ユーザーにはほとんど変化が見られないはずです。互換性の問題にお気づきの場合は、ご報告ください。

従来のパーサーを使用するにはコマンドライン引数 `--parser=parse.y` を使用してください。

## Socket ライブラリの Happy Eyeballs Version 2 (RFC 8305) 対応

Socket ライブラリの `TCPSocket.new` (`TCPSocket.open`) と `Socket.tcp` が多数のプログラミング言語で、より良いネットワーク接続の方法として広く標準採用されている [Happy Eyeballs Version 2 (RFC 8305)](https://datatracker.ietf.org/doc/html/rfc8305) に対応しました。この改善により、Ruby は IPv6 と IPv4 が混在するような最新のインターネット環境においても、効率的で信頼性の高いネットワーク接続が可能となりました。

Ruby 3.3 までは上記の2つのメソッドは名前解決と接続試行をシリアルに実行していました。Happy Eyeballs Version 2 のアルゴリズムでは以下のように実行します。

1. IPv6とIPv4の名前解決を同時実行する。
2. 解決されたIPアドレスへの接続を、IPv6を優先して、250ミリ秒間隔で並行して試みる。
3. 最初に成功した接続を返し、他の接続はキャンセルする。

このアルゴリズムによって、特定のプロトコルや IP アドレスが遅延したり利用できない場合でも、接続遅延を最小限に抑えることが可能となります。

この機能は標準で有効になるため、追加の設定は必要ありません。Ruby 全体で無効にしたい場合は環境変数として `RUBY_TCP_NO_FAST_FALLBACK=1` を設定するか、`Socket.tcp_fast_fallback=false` を Ruby プログラムの中で呼び出してください。またはメソッド単位で無効化する場合、`TCPSocket.new` (`TCPSocket.open`) と `Socket.tcp` のキーワード引数として `fast_fallback: false` を利用してください。

## YJIT

### TL;DR

* x86-64 と arm64 の両方のプラットフォームにおいて、ほとんどのベンチマークのパフォーマンスが向上しました。
* メタデータの圧縮と統一的なメモリ使用量制限によりメモリ使用量を削減しました。
* 様々な不具合修正: YJIT はより堅牢になり、より多くの環境でテストされました。

### 新機能

* コマンドラインオプション
    * `--yjit-mem-size` による統一的なメモリ制限が指定可能になりました(デフォルトは 128MiB)。
      このオプションはすべての YJIT のメモリ使用量を監視し、従来の `--yjit-exec-mem-size` オプションよりも直感的に使用できます。
    * `--yjit-log` オプションを用いて、コンパイルログを監視できるようになりました。
* Ruby API
    * `RubyVM::YJIT.log` を用いてコンパイルログの末尾を取得することができるようになりました。
* YJIT の統計情報
    * `RubyVM::YJIT.runtime_stats` からインバリデーション、インライン化、メタデータエンコーディングに関する追加の統計情報をいつでも取得できるようになりました。

### 新しい最適化

* コンテキストの圧縮化により YJIT のメタデータ保管に必要なメモリを削減しました。
* ローカル変数やRubyのメソッドの引数のためにレジスタを割り当てるようになりました。
* YJIT が有効な場合に Ruby で実装されたコアクラスを使うようになりました。
    * Ruby で書き直された `Array#each`, `Array#select`, `Array#map` はより良いパフォーマンスを提供します。 [[Feature #20182]].
* 以下のような小さいメソッドをインライン化できるようになりました:
    * 空メソッド
    * 定数を返すメソッド
    * `self` を返すメソッド
    * 引数を直接返すメソッド
* 組み込みメソッドに特化したコード生成の対象を広げました
* `String#getbyte`, `String#setbyte` など、String のメソッドの最適化を行いました。
* 低レベルの bit/byte 操作を高速化するためにビット演算を最適化しました
* マルチ Ractor モードにおける定数共有をサポートしました。
* その他、様々な段階的な最適化を行いました。

## Modular GC

* Modular GC 機能により Ruby 標準とは異なる ガベージ・コレクタ (GC) の実装を動的にロードすることができるようになりました。この機能を使うには Ruby をビルドする時に `--with-modular-gc` を指定してください。GC ライブラリは環境変数 `RUBY_GC_LIBRARY` を用いて Ruby のランタイムにロードすることができます。[[Feature #20351]]

* Ruby 組み込みのガベージ・コレクタは `gc/default/default.c` ファイルに分割され、 Ruby ランタイムとのやりとりは `gc/gc_impl.h` に定義される API を用いて行われます。組み込みのガベージコレクタは `make modular-gc MODULAR_GC=default` というコマンドを用いてライブラリとしてもビルドすることができ、環境変数として `RUBY_GC_LIBRARY=default` を定義することで有効にすることができます。 [[Feature #20470]]

* [MMTk](https://www.mmtk.io/) をベースとした実験的な GC ライブラリが提供されました。このライブラリは`make modular-gc MODULAR_GC=mmtk` コマンドによってビルドし、環境変数 `RUBY_GC_LIBRARY=mmtk` によって有効化します。この機能を使うにはビルドを行うマシンに Rust のビルドツールを必要とします。 [[Feature #20860]]

## 言語機能の変更

* マジックコメント `frozen_string_literal` のないファイル中の文字列リテラルは、freeze されているかのように振る舞うようになり、破壊的な変更時に警告を表示するようになりました。これらの警告はコマンドラインオプション `-W:deprecated` か Ruby プログラムで `Warning[:deprecated] = true` を指定すると表示されます。
これら無効にするにはコマンドラインオプション `--disable-frozen-string-literal` を追加して Ruby を実行してください。 [[Feature #20205]]

* メソッド呼び出し時の `nil` 展開キーワードがサポートされました。
  `**nil` は `**{}` と同様に扱われ、キーワードは渡せません。
  また、あらゆる変換のためのメソッドも呼ばれません。[[Bug #20064]]

* インデックスにブロックを渡せなくなりました。[[Bug #19918]]

* インデックスにキーワード引数を渡せなくなりました。[[Bug #20218]]

* トップレベルに `::Ruby` を予約しました。
  `Warning[:deprecated]` が有効な場合、既に定義済みの場合は警告されます。[[Feature #20884]]

## コアクラスのアップデート

注: 複数のアップデートの中から注目すべきアップデートのみを掲載しています。

* Exception

  * `Exception#set_backtrace` は `Thread::Backtrace::Location` の配列を受け取れる様になりました。.
    `Kernel#raise`, `Thread#raise` や `Fiber#raise` も同じ配列を受け取れます。[[Feature #13557]]

* GC

    * `GC.config` がガベージ・コレクタの設定変更を可能とするために追加されました。[[Feature #20443]]

    * GC の設定用のパラメータとして `rgengc_allow_full_mark` が追加されました。このパラメータを `false`
      とすると、GC は young オブジェクトのみを GC 用にマークします。デフォルト値は `true` です。
      [[Feature #20443]]

* Ractor

    * Ractor の中で `require` が可能となりました。この `require` の処理はメインの Ractor で行われます。
      また、メインの Ractor には `require` 処理のために `Ractor._require(feature)` が追加されました。
      [[Feature #20627]]

    * `Ractor.main?` が追加されました。[[Feature #20627]]

    * 現在実行中の Ractor の Ractor ローカルストレージにアクセスするためのメソッドとして `Ractor.[]` and `Ractor.[]=` が追加されました。 [[Feature #20715]]

    * スレッドセーフに Ractor ローカル変数を初期化するためのメソッド `Ractor.store_if_absent(key){ init }` が追加されました。 [[Feature #20875]]

* Range

  * `Range#size` は範囲オブジェクトが反復可能ではない場合は `TypeError` 例外を出すようになりました。[[Misc #18984]]


## 標準ライブラリのアップデート

注: 複数のアップデートの中から注目すべき標準ライブラリのアップデートのみを掲載しています。

* RubyGems
    * `gem push` コマンドに `--attestation` オプションが追加されました。このオプションをつけると [sigstore](https://www.sigstore.dev/) に gem の署名情報が保存されます。

* Bundler
    * ロックファイルの新規作成時に gem の checksum を保存する `lockfile_checksums` オプションが `bundle config` に設定可能になりました。
    * 既存のロックファイルに使用している gem の checksum を付与するためのコマンドとして `bundle lock --add-checksums` が追加されました。

* JSON

    * `JSON.parse` が Ruby 3.3 シリーズに添付されている json-2.7.x と比較して 1.5 倍程度高速になりました。

* Tempfile

    * `Tempfile.create` に `anonymous: true` キーワードが追加されました。
      `Tempfile.create(anonymous: true)` は作成した一時ファイルを即座に削除します。この機能を用いることで、アプリケーションは独自にファイル削除を行う必要がなくなります。 [[Feature #20497]]

* win32/sspi.rb

    * Windows で SSPI 機能を提供するライブラリは Ruby のリポジトリから [ruby/net-http-sspi] に移動しました。 [[Feature #20775]]

新たに以下の gem が default gems から bundled gems に変更されました。

- mutex_m 0.3.0
- getoptlong 0.2.1
- base64 0.2.0
- bigdecimal 3.1.8
- observer 0.1.2
- abbrev 0.1.2
- resolv-replace 0.1.1
- rinda 0.2.0
- drb 2.2.1
- nkf 0.2.0
- syslog 0.2.0
- csv 3.3.2
- repl_type_completor 0.1.9

## 互換性に関する変更

注: 不具合修正を除きます。

* エラーメッセージとして表示するバックトレースを変更しました。
  * 開始の引用符は backtick の代わりにシングルクォートを用いるようになりました。[[Feature #16495]]
  * クラス名が変更しないような場合、メソッド名の前にクラス名を表示するようになりました。[[Feature #19117]]
  * `Kernel#caller`, `Thread::Backtrace::Location` などのメソッドはそれらに応じて変更されました。

  ```
  Old:
  test.rb:1:in `foo': undefined method `time' for an instance of Integer
          from test.rb:2:in `<main>'

  New:
  test.rb:1:in 'Object#foo': undefined method 'time' for an instance of Integer
          from test.rb:2:in '<main>'
  ```

* `Hash#inspect` の表示が変わりました。[[Bug #20433]]

    * Symbol キーはコロンを用いたモダンな表示になりました: `"{user: 1}"`
    * 他のキーは従来の `'{"user"=>1}'` とは異なり、 `=>` の前後にスペースを含む表示になりました: `'{"user" => 1}'`。

* `Kernel#Float()` は 10 進表記の小数部がなくても受け付けるようになりました。 [[Feature #20705]]

  ```rb
  Float("1.")    #=> 1.0 (previously, an ArgumentError was raised)
  Float("1.E-1") #=> 0.1 (previously, an ArgumentError was raised)
  ```

* `String#to_f` は 10 進表記の小数部がなくても受け付けるようになりました。指数を指定すると従来とは結果が変わることに注意してください。  [[Feature #20705]]

  ```rb
  "1.".to_f    #=> 1.0
  "1.E-1".to_f #=> 0.1 (previously, 1.0 was returned)
  ```

* `Refinement#refined_class` は削除されました。[[Feature #19714]]

## 標準ライブラリの互換性の変更

* DidYouMean

    * `DidYouMean::SPELL_CHECKERS[]=` と `DidYouMean::SPELL_CHECKERS.merge!` は削除されました。

* Net::HTTP

    * 2012 年から非推奨とされている以下の定数が削除されました。
        * `Net::HTTP::ProxyMod`
        * `Net::NetPrivate::HTTPRequest`
        * `Net::HTTPInformationCode`
        * `Net::HTTPSuccessCode`
        * `Net::HTTPRedirectionCode`
        * `Net::HTTPRetriableCode`
        * `Net::HTTPClientErrorCode`
        * `Net::HTTPFatalErrorCode`
        * `Net::HTTPServerErrorCode`
        * `Net::HTTPResponseReceiver`
        * `Net::HTTPResponceReceiver`

* Timeout

    * `Timeout.timeout` が負の値を受け付けなくなりました。[[Bug #20795]]

* URI

    * デフォルトのパーサーが RFC 2396 準拠のものから RFC 3986 準拠のものに変わりました。 [[Bug #19266]]

## C API のアップデート

* `rb_newobj` と `rb_newobj_of` (と対応するマクロの `RB_NEWOBJ`, `RB_NEWOBJ_OF`, `NEWOBJ`, `NEWOBJ_OF`) は削除されました。 [[Feature #20265]]
* 非推奨とされていた `rb_gc_force_recycle` は削除されました。 [[Feature #18290]]

## その他の変更点

* 渡されたブロックを使用しないメソッドにブロックを渡すと、verboseモード(`-w`) で警告が表示されるようになりました。[[Feature #15554]]

* `String.freeze` や `Integer#+` のような JIT とインタプリタによって特別に最適化されたメソッドを再定義すると、performance 警告(`-W:performance` または`Warning[:performance] = true` で有効化)が表示されるようになりました。 [[Feature #20429]]

より詳細な情報は [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
か [commit logs](https://github.com/ruby/ruby/compare/v3_3_0...{{ release.tag }}) を参照してください。


これらの変更により、Ruby 3.3.0から [{{ release.stats.files_changed }} ファイルが変更され、 {{ release.stats.insertions }} 行が追加され、 {{ release.stats.deletions }} 行が削除されました!deletions(-)](https://github.com/ruby/ruby/compare/v3_3_0...{{ release.tag }}#file_bucket)

メリークリスマス、Ruby 3.4 とともによいお年をお迎えください！

## Download

* <{{ release.url.gz }}>

      SIZE: {{ release.size.gz }}
      SHA1: {{ release.sha1.gz }}
      SHA256: {{ release.sha256.gz }}
      SHA512: {{ release.sha512.gz }}

* <{{ release.url.xz }}>

      SIZE: {{ release.size.xz }}
      SHA1: {{ release.sha1.xz }}
      SHA256: {{ release.sha256.xz }}
      SHA512: {{ release.sha512.xz }}

* <{{ release.url.zip }}>

      SIZE: {{ release.size.zip }}
      SHA1: {{ release.sha1.zip }}
      SHA256: {{ release.sha256.zip }}
      SHA512: {{ release.sha512.zip }}

## What is Ruby

Rubyはまつもとゆきひろ (Matz) によって1993年に開発が始められ、今もオープンソースソフトウェアとして開発が続けられています。Rubyは様々なプラットフォームで動き、世界中で、特にWebアプリケーション開発のために使われています。


[Feature #13557]: https://bugs.ruby-lang.org/issues/13557
[Feature #15554]: https://bugs.ruby-lang.org/issues/15554
[Feature #16495]: https://bugs.ruby-lang.org/issues/16495
[Feature #18290]: https://bugs.ruby-lang.org/issues/18290
[Feature #18980]: https://bugs.ruby-lang.org/issues/18980
[Misc #18984]:    https://bugs.ruby-lang.org/issues/18984
[Feature #19117]: https://bugs.ruby-lang.org/issues/19117
[Bug #19266]:     https://bugs.ruby-lang.org/issues/19266
[Feature #19714]: https://bugs.ruby-lang.org/issues/19714
[Bug #19918]:     https://bugs.ruby-lang.org/issues/19918
[Bug #20064]:     https://bugs.ruby-lang.org/issues/20064
[Feature #20182]: https://bugs.ruby-lang.org/issues/20182
[Feature #20205]: https://bugs.ruby-lang.org/issues/20205
[Bug #20218]:     https://bugs.ruby-lang.org/issues/20218
[Feature #20265]: https://bugs.ruby-lang.org/issues/20265
[Feature #20351]: https://bugs.ruby-lang.org/issues/20351
[Feature #20429]: https://bugs.ruby-lang.org/issues/20429
[Feature #20443]: https://bugs.ruby-lang.org/issues/20443
[Feature #20470]: https://bugs.ruby-lang.org/issues/20470
[Feature #20497]: https://bugs.ruby-lang.org/issues/20497
[Feature #20564]: https://bugs.ruby-lang.org/issues/20564
[Bug #20620]: https://bugs.ruby-lang.org/issues/20620
[Feature #20627]: https://bugs.ruby-lang.org/issues/20627
[Feature #20705]: https://bugs.ruby-lang.org/issues/20705
[Feature #20715]: https://bugs.ruby-lang.org/issues/20715
[Feature #20775]: https://bugs.ruby-lang.org/issues/20775
[Bug #20795]: https://bugs.ruby-lang.org/issues/20795
[Bug #20433]: https://bugs.ruby-lang.org/issues/20433
[Feature #20860]: https://bugs.ruby-lang.org/issues/20860
[Feature #20875]: https://bugs.ruby-lang.org/issues/20875
[Feature #20884]: https://bugs.ruby-lang.org/issues/20884
[sigstore.dev]: sigstore.dev
[ruby/net-http-sspi]: https://github.com/ruby/net-http-sspi
