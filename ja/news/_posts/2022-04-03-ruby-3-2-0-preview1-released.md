---
layout: news_post
title: "Ruby 3.2.0 Preview 1 リリース"
author: "naruse"
translator:
date: 2022-04-03 00:00:00 +0000
lang: ja
---

Ruby 3.2系最初のプレビューリリースである、Ruby 3.2.0 Preview 1 が公開されました。Ruby 3.2では多くの機能を追加しています。

{% assign release = site.data.releases | where: "version", "3.2.0-preview1" | first %}


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

## Regexp timeout

正規表現マッチングにタイムアウトを指定できるようになりました。

```ruby
Regexp.timeout = 1.0

/^a*b?a*$/ =~ "a" * 50000 + "x" #=> 1秒後にRegexp::TimeoutError
```

正規表現マッチングは予想外に時間がかかることがあることが知られています。もし信頼できない入力に対して非効率な可能性のある正規表現をマッチしていると、Denial of Service攻撃を効率的にできてしまう可能性があります（正規表現DoS、ReDoSなどと言われます）。

あなたのRubyアプリケーションの要件に基づいて適切に`Regexp.timeout`を設定することで、DoSのリスクを防止、または大幅に緩和できます。ぜひあなたのアプリケーションで試してみてください。フィードバックを歓迎します。

なお、Regexp.timeoutはグローバルな設定です。もし一部の特別な正規表現にだけ異なるタイムアウトを設定したい場合は、`Regexp.new`の`timeout`キーワードを指定してください。

```ruby
Regexp.timeout = 1.0

long_time_re = Regexp.new("^a*b?a*$", timeout: nil) # タイムアウトなし

long_time_re =~ "a" * 50000 + "x" # 割り込まれない
```

機能提案のチケット：https://bugs.ruby-lang.org/issues/17837


## その他の主要な新機能

### 言語機能

* Find patternが実験的機能ではなくなりました。


### 非互換な変更

* `libyaml` や `libffi` のような 3rd パーティのライブラリのソースコードの同梱を廃止しました

    * Psych に同梱していた `libyaml` のソースコードは削除されました。ユーザーは自身で Ubuntu や Debian プラットフォームなら `libyaml-dev` パッケージをインストールする必要があります。このパッケージ名称はプラットフォームごとに異なります。

    * Fiddle に同梱していた `libffi` のソースコードは preview2 で削除する予定です。


## パフォーマンスの改善




## その他の注目すべき 3.1 からの変更点




## 標準添付ライブラリのアップデート

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
