---
layout: news_post
title: "Ruby 3.2.0 Preview 3 リリース"
author: "naruse"
translator:
date: 2022-11-11 00:00:00 +0000
lang: ja
---

Ruby 3.2系のプレビューリリースである、Ruby 3.2.0 Preview 3 が公開されました。Ruby 3.2では多くの機能を追加しています。

{% assign release = site.data.releases | where: "version", "3.2.0-preview3" | first %}


## WASIベースのWebAssemblyサポート

WASIベースのWebAssemblyへのコンパイルがサポートされました。これにより、ブラウザやサーバーレスエッジ環境、その他のWebAssembly/WASI環境でCRubyのバイナリが利用できるようになります。現在この移植版はThread API以外のbasic testとbootstrap testをパスしています。

![](https://i.imgur.com/opCgKy2.png)

### Background

もともと[WebAssembly (Wasm)](https://webassembly.org/)が導入されたのは、プログラムをブラウザの上で安全かつ高速に実行するためでした。しかし、様々な環境で安全かつ効率的にプログラムを実行するという目的は、Webだけでなく一般的なアプリケーションで長らく求められていたものです

[WASI (The WebAssembly System Interface)](https://wasi.dev/)はそのようなユースケースのために設計されました。そのようなアプリケーションはOSと通信する必要がありますが、WebAssembly自体はシステムインターフェイスを持たないVMの上で実行されます。WASIはこのシステムインターフェイスを規格化します。

RubyのWebAssembly/WASIサポートは、このようなプロジェクトを活用することを狙っています。これにより、Ruby開発者がそのような有望なプラットフォームで動くアプリケーションを書けるようになります。

### ユースケース

このサポートは、開発者がCRubyをWebAssembly環境で利用することを促進します。たとえば、[TryRuby playground](https://try.ruby-lang.org/playground/)のCRubyサポートです。CRubyをウェブブラウザの上で試すことができるようになりました。

### 技術的な話

現時点のWASIとWebAssemblyには、Fiberや例外やGCを実装するための機能に一部足りないものがあります。CRubyではこのギャップを埋めるために、ユーザランドで実行を制御できるAsyncifyというバイナリ変換技術を使っています。

さらに、[WASIの上にVFS](https://github.com/kateinoigakukun/wasi-vfs/wiki/Getting-Started-with-CRuby)を実装しました。これにより、Rubyアプリを単一の.wasmファイルに容易にパッケージ化できます。Rubyアプリの配布が少しかんたんになります。

### 参考文献

* [Add WASI based WebAssembly support #5407](https://github.com/ruby/ruby/pull/5407)
* [An Update on WebAssembly/WASI Support in Ruby](https://itnext.io/final-report-webassembly-wasi-support-in-ruby-4aface7d90c9)

## ReDoSに対するRegexpの改善

正規表現マッチングは予想外に時間がかかることがあることが知られています。もし信頼できない入力に対して非効率な可能性のある正規表現をマッチしていると、Denial of Service攻撃を効率的にできてしまう可能性があります（正規表現DoS、ReDoSなどと言われます）。

Ruby 3.2では、ReDoSを大幅に軽減する2つの改善を導入しました。

### Regexpのマッチングアルゴリズムの改善

Ruby 3.2から、Regexpのマッチングアルゴリズム自体がメモ化の最適化によって大幅に改善されました。

```
# 次のマッチングはRuby 3.1では10秒かかりますが、Ruby 3.2では0.003秒で終わります

/^a*b?a*$/ =~ "a" * 50000 + "x"
```

このアルゴリズムの改善で、ほとんどの（我々の実験では90%程度の）正規表現が線形時間でマッチ判定できるようになります。

（プレビューリリースのユーザへ：この最適化は、マッチングのたびに入力長に比例したメモリを消費することがあります。このメモリ確保は通常遅延され、また、通常の正規表現であれば入力長のたかだか10倍程度のメモリを消費するだけなので、実用上の問題は発生しないと考えています。もし実アプリの正規表現マッチングでメモリ不足に陥った場合は報告してください）

提案チケットは <https://bugs.ruby-lang.org/issues/19104> です。

### Regexpのタイムアウトの導入

上記の最適化は、ある種の正規表現には適用できません。たとえば、後方参照や先読み・後読みのような発展的機能や、非常に大きい固定回数繰り返しを使っている場合には適用されません。この場合の対策として、正規表現マッチングのタイムアウト機能が導入されました。

```ruby
Regexp.timeout = 1.0

/^a*b?a*()\1$/ =~ "a" * 50000 + "x"
#=> 1秒後にRegexp::TimeoutError
```

なお、Regexp.timeoutはグローバルな設定です。もし一部の特別な正規表現にだけ異なるタイムアウトを設定したい場合は、`Regexp.new`の`timeout`キーワードを指定してください。

```ruby
Regexp.timeout = 1.0

# This regexp has no timeout
long_time_re = Regexp.new('^a*b?a*()\1$', timeout: Float::INFINITY)

long_time_re =~ "a" * 50000 + "x" # never interrupted
```

提案チケットは <https://bugs.ruby-lang.org/issues/17837> です。

## その他の主要な新機能

### 言語機能

* Find patternが実験的機能ではなくなりました。


### 3rd パーティライブラリのソースコード同梱廃止

* `libyaml` や `libffi` のような 3rd パーティのライブラリのソースコードの同梱を廃止しました

    * Psych に同梱していた `libyaml` のソースコードは削除されました。ユーザーは自身で Ubuntu や Debian プラットフォームなら `libyaml-dev` パッケージをインストールする必要があります。このパッケージ名称はプラットフォームごとに異なります。

    * Fiddle に同梱していた `libffi` のソースコードも削除されました


## パフォーマンスの改善

### YJIT

* Support arm64 / aarch64 on UNIX platforms.
* Building YJIT requires Rust 1.58.1+. [[Feature #18481]]

## その他の注目すべき 3.1 からの変更点

* Hash
    * Hash#shift now always returns nil if the hash is
      empty, instead of returning the default value or
      calling the default proc. [[Bug #16908]]

* MatchData
    * MatchData#byteoffset has been added. [[Feature #13110]]

* Module
    * Module.used_refinements has been added. [[Feature #14332]]
    * Module#refinements has been added. [[Feature #12737]]
    * Module#const_added has been added. [[Feature #17881]]

* Proc
    * Proc#dup returns an instance of subclass. [[Bug #17545]]
    * Proc#parameters now accepts lambda keyword. [[Feature #15357]]

* Refinement
    * Refinement#refined_class has been added. [[Feature #12737]]

* RubyVM::AbstractSyntaxTree
    * Add `error_tolerant` option for `parse`, `parse_file` and `of`. [[Feature #19013]]

* Set
    * Set is now available as a builtin class without the need for `require "set"`. [[Feature #16989]]
      It is currently autoloaded via the `Set` constant or a call to `Enumerable#to_set`.

* String
    * String#byteindex and String#byterindex have been added. [[Feature #13110]]
    * Update Unicode to Version 14.0.0 and Emoji Version 14.0. [[Feature #18037]]
      (also applies to Regexp)
    * String#bytesplice has been added.  [[Feature #18598]]

* Struct
    * A Struct class can also be initialized with keyword arguments
      without `keyword_init: true` on `Struct.new` [[Feature #16806]]

## 標準添付ライブラリのアップデート

* SyntaxSuggest

  * `syntax_suggest`（旧名：`dead_end`）という機能がRuby本体に統合されました。[[Feature #18159]]

* ErrorHighlight
  * TypeErrorとArgumentErrorの引数を下線表示するようになりました

```
test.rb:2:in `+': nil can't be coerced into Integer (TypeError)

sum = ary[0] + ary[1]
               ^^^^^^
```

* 以下の default gems のバージョンがアップデートされました。

    * TBD

* 以下の bundled gems のバージョンがアップデートされました。

    * TBD

* 以下のライブラリが新たに bundled gems になりました。Bundler から利用する場合は Gemfile に明示的に指定してください。

    * TBD

その他詳細については、[NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md) ファイルまたは[コミットログ](https://github.com/ruby/ruby/compare/v3_1_0...{{ release.tag }})を参照してください。

なお、こうした変更により、Ruby 3.1.0 以降では [{{ release.stats.files_changed }} 個のファイルに変更が加えられ、{{ release.stats.insertions }} 行の追加と {{ release.stats.deletions }} 行の削除が行われました](https://github.com/ruby/ruby/compare/v3_1_0...{{ release.tag }}#file_bucket) !

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



[Feature #12005]: https://bugs.ruby-lang.org/issues/12005
[Feature #12655]: https://bugs.ruby-lang.org/issues/12655
[Feature #12737]: https://bugs.ruby-lang.org/issues/12737
[Feature #13110]: https://bugs.ruby-lang.org/issues/13110
[Feature #14332]: https://bugs.ruby-lang.org/issues/14332
[Feature #15231]: https://bugs.ruby-lang.org/issues/15231
[Feature #15357]: https://bugs.ruby-lang.org/issues/15357
[Bug #15928]:     https://bugs.ruby-lang.org/issues/15928
[Feature #16131]: https://bugs.ruby-lang.org/issues/16131
[Bug #16466]:     https://bugs.ruby-lang.org/issues/16466
[Feature #16806]: https://bugs.ruby-lang.org/issues/16806
[Bug #16889]:     https://bugs.ruby-lang.org/issues/16889
[Bug #16908]:     https://bugs.ruby-lang.org/issues/16908
[Feature #16989]: https://bugs.ruby-lang.org/issues/16989
[Feature #17351]: https://bugs.ruby-lang.org/issues/17351
[Feature #17391]: https://bugs.ruby-lang.org/issues/17391
[Bug #17545]:     https://bugs.ruby-lang.org/issues/17545
[Feature #17881]: https://bugs.ruby-lang.org/issues/17881
[Feature #18037]: https://bugs.ruby-lang.org/issues/18037
[Feature #18159]: https://bugs.ruby-lang.org/issues/18159
[Feature #18351]: https://bugs.ruby-lang.org/issues/18351
[Bug #18487]:     https://bugs.ruby-lang.org/issues/18487
[Feature #18571]: https://bugs.ruby-lang.org/issues/18571
[Feature #18585]: https://bugs.ruby-lang.org/issues/18585
[Feature #18598]: https://bugs.ruby-lang.org/issues/18598
[Bug #18625]:     https://bugs.ruby-lang.org/issues/18625
[Bug #18633]:     https://bugs.ruby-lang.org/issues/18633
[Feature #18685]: https://bugs.ruby-lang.org/issues/18685
[Bug #18782]:     https://bugs.ruby-lang.org/issues/18782
[Feature #18788]: https://bugs.ruby-lang.org/issues/18788
[Feature #18809]: https://bugs.ruby-lang.org/issues/18809
[Feature #18481]: https://bugs.ruby-lang.org/issues/18481
[Bug #19100]:     https://bugs.ruby-lang.org/issues/19100
[Feature #19013]: https://bugs.ruby-lang.org/issues/19013
