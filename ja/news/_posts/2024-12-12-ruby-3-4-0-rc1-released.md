---
layout: news_post
title: "Ruby 3.4.0-rc1 リリース"
author: "naruse"
translator: "npakk"
date: 2024-12-12 00:00:00 +0000
lang: ja
---

{% assign release = site.data.releases | where: "version", "3.4.0-rc1" | first %}
Ruby {{ release.version }} が公開されました。

## デフォルトのパーサをPrismに変更

デフォルトで使用するパーサーを parse.y から生成するパーサーから Prism へと変更しました。 [[Feature #20564]]

## Modular GC

* Modular GC 機能により Ruby 標準とは異なる ガベージ・コレクタ (GC) の実装を動的にロードすることができるようになりました。この機能を使うには Ruby をビルドする時に `--with-modular-gc` を指定してください。GC ライブラリは環境変数 `RUBY_GC_LIBRARY` を用いて Ruby のランタイムにロードすることができます。[[Feature #20351]]

* Ruby 組み込みのガベージ・コレクタは `gc/default/default.c` ファイルに分割され、 Ruby ランタイムとのやりとりは `gc/gc_impl.h` に定義される API を用いて行われます。組み込みのガベージコレクタは `make modular-gc MODULAR_GC=default` というコマンドを用いてライブラリとしてもビルドすることができ、環境変数として `RUBY_GC_LIBRARY=default` を定義することで有効にすることができます。 [[Feature #20470]]

* [MMTk](https://www.mmtk.io/) をベースとした実験的な GC ライブラリが提供されました。このライブラリは`make modular-gc MODULAR_GC=mmtk` コマンドによってビルドし、環境変数 `RUBY_GC_LIBRARY=mmtk` によって有効化します。この機能を使うにはビルドを行うマシンに Rust のビルドツールを必要とします。 [[Feature #20860]]

## 言語機能の変更

* マジックコメント `frozen_string_literal` のないファイル中の文字列リテラルは、freeze されているかのように振る舞うようになり、破壊的な変更時に警告を表示するようになりました。これらの警告はコマンドラインオプション `-W:deprecated` か Ruby プログラムで `Warning[:deprecated] = true` を指定すると表示されます。
これら無効にするにはコマンドラインオプション `--disable-frozen-string-literal` を追加して Ruby を実行してください。 [[Feature #20205]]

* ブロックパラメータに名前をつけずに参照する `it` が追加されました。 [[Feature #18980]]

* メソッド呼び出し時の `nil` 展開キーワードがサポートされました。
  `**nil` は `**{}` と同様に扱われ、キーワードは渡せません。
  また、あらゆる変換のためのメソッドも呼ばれません。[[Bug #20064]]

* インデックスにブロックを渡せなくなりました。[[Bug #19918]]

* インデックスにキーワード引数を渡せなくなりました。[[Bug #20218]]

## YJIT

### TL;DR

* x86-64 と arm64 の両方のプラットフォームにおいて、ほとんどのベンチマークのパフォーマンスが向上しました。
* コンパイルメタデータのメモリ使用量を削減しました。
* 様々な不具合修正: YJIT はより堅牢になり、より多くの環境でテストされました。

### 新機能

* `--yjit-mem-size` による統一的なメモリ制限が指定可能になりました(デフォルトは 128MiB)。
  このオプションはすべての YJIT のメモリ使用量を監視し、従来の `--yjit-exec-mem-size` オプションよりも直感的に使用できます。
* `RubyVM::YJIT.runtime_stats` からより多くの統計情報を取得できるようになりました。
* `--yjit-log` オプションを用いて、コンパイルログを監視できるようになりました。
    * `RubyVM::YJIT.log` を用いてコンパイルログの末尾を取得することができるようになりました。
* マルチ Ractor モードにおける定数共有をサポートしました。
* `--yjit-trace-exits=COUNTER`オプションを用いて、カウントされたexitを監視できるようになりました。

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
* その他、様々な段階的な最適化を行いました。

## コアクラスのアップデート

注: 複数のアップデートの中から注目すべきアップデートのみを掲載しています。

* Exception

  * `Exception#set_backtrace` は `Thread::Backtrace::Location` の配列を受け取れる様になりました。.
    `Kernel#raise`, `Thread#raise` や `Fiber#raise` も同じ配列を受け取れます。[[Feature #13557]]

* Range

  * `Range#size` は範囲オブジェクトが反復可能ではない場合は `TypeError` 例外を出すようになりました。[[Misc #18984]]

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

## C API のアップデート

* `rb_newobj` と `rb_newobj_of` (と対応するマクロの `RB_NEWOBJ`, `RB_NEWOBJ_OF`, `NEWOBJ`, `NEWOBJ_OF`) は削除されました。 [[Feature #20265]]
* 非推奨とされていた `rb_gc_force_recycle` は削除されました。 [[Feature #18290]]

## その他の変更

* 渡されたブロックを使用しないメソッドにブロックを渡すと、verboseモード(`-w`) で警告が表示されるようになりました。[[Feature #15554]]

* `String.freeze` や `Integer#+` のような JIT とインタプリタによって特別に最適化されたメソッドを再定義すると、performance 警告(`-W:performance` または`Warning[:performance] = true` で有効化)が表示されるようになりました。 [[Feature #20429]]

default gemsやbundled gemsの詳細については[Logger](https://github.com/ruby/logger/releases)などのChangeLogを参照してください。

より詳細な情報は [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
か [commit logs](https://github.com/ruby/ruby/compare/v3_3_0...{{ release.tag }}) を参照してください。

これらの変更により、Ruby 3.3.0から [{{ release.stats.files_changed }} ファイルが変更され、 {{ release.stats.insertions }} 行が追加され、 {{ release.stats.deletions }} 行が削除されました！](https://github.com/ruby/ruby/compare/v3_3_0...{{ release.tag }}#file_bucket)

## ダウンロード

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

## Ruby とは

Rubyはまつもとゆきひろ (Matz) によって1993年に開発が始められ、今もオープンソースソフトウェアとして開発が続けられています。Rubyは様々なプラットフォームで動き、世界中で、特にWebアプリケーション開発のために使われています。

[Feature #13557]: https://bugs.ruby-lang.org/issues/13557
[Feature #15554]: https://bugs.ruby-lang.org/issues/15554
[Feature #16495]: https://bugs.ruby-lang.org/issues/16495
[Feature #18290]: https://bugs.ruby-lang.org/issues/18290
[Feature #18980]: https://bugs.ruby-lang.org/issues/18980
[Misc #18984]:    https://bugs.ruby-lang.org/issues/18984
[Feature #19117]: https://bugs.ruby-lang.org/issues/19117
[Bug #19918]:     https://bugs.ruby-lang.org/issues/19918
[Bug #20064]:     https://bugs.ruby-lang.org/issues/20064
[Feature #20182]: https://bugs.ruby-lang.org/issues/20182
[Feature #20205]: https://bugs.ruby-lang.org/issues/20205
[Bug #20218]:     https://bugs.ruby-lang.org/issues/20218
[Feature #20265]: https://bugs.ruby-lang.org/issues/20265
[Feature #20351]: https://bugs.ruby-lang.org/issues/20351
[Feature #20429]: https://bugs.ruby-lang.org/issues/20429
[Feature #20470]: https://bugs.ruby-lang.org/issues/20470
[Feature #20564]: https://bugs.ruby-lang.org/issues/20564
[Feature #20860]: https://bugs.ruby-lang.org/issues/20860
