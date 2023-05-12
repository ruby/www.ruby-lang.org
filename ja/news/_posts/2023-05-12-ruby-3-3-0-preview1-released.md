---
layout: news_post
title: "Ruby 3.3.0-preview1 リリース"
author: "naruse"
translator:
date: 2023-05-12 00:00:00 +0000
lang: ja
---

Ruby 3.3.0-preview1 が公開されました。Ruby 3.3ではRJITという新たなJITの仕組みを追加するとともに、YJITの高速化など様々な改善が行われています。

{% assign release = site.data.releases | where: "version", "3.3.0-preview1" | first %}

## RJIT

* Introduced a pure-Ruby JIT compiler RJIT and replaced MJIT.
  * RJIT supports only x86\_64 architecture on Unix platforms.
  * Unlike MJIT, it doesn't require a C compiler at runtime.
* RJIT exists only for experimental purposes.
  * You should keep using YJIT in production.
* If you are interested in developing JIT for Ruby, please check out [k0kubun's presentation on Day 3 of RubyKaigi](https://rubykaigi.org/2023/presentations/k0kubun.html#day3).

## Use Lrama instead of Bison

* Replace Bison with [Lrama LALR parser generator](https://github.com/yui-knk/lrama) [Feature #19637]
  * If you have interest, please see [The future vision of Ruby Parser](https://rubykaigi.org/2023/presentations/spikeolaf.html)
  * See also: [Ruby Parser開発日誌 (5) - Lrama LALR (1) parser generatorを実装した](https://yui-knk.hatenablog.com/entry/2023/03/13/101951)


## YJIT

* Significant performance improvements over 3.2
  * Splat and rest arguments support has been improved.
  * Registers are allocated for stack operations of the virtual machine.
  * More calls with optional arguments are compiled.
  * `Integer#!=`, `String#!=`, `Kernel#block_given?`, `Kernel#is_a?`,
    `Kernel#instance_of?`, `Module#===` are specially optimized.
  * Instance variables no longer exit to the interpreter
    with megamorphic Object Shapes.
* Metadata for compiled code uses a lot less memory.
* Improved code generation on ARM64
* Option to start YJIT in paused mode and then later enable it manually
  * `--yjit-pause` and `RubyVM::YJIT.resume`
  * This can be used to enable YJIT only once your application is done booting
* Exit tracing option now supports sampling
  * `--trace-exits-sample-rate=N`
* Multiple bug fixes

*

## その他の主要な新機能

### 言語機能


## パフォーマンスの改善

## その他の注目すべき 3.2 からの変更点

## 互換性に関する変更

### 定数の削除

以下の非推奨定数は削除されました



### メソッドの削除

以下の非推奨のメソッドは削除されました


## 標準添付ライブラリの互換性に関する変更

### `ext/readline` の削除

* 今後は Ruby で書かれた GNU Readline の互換ライブラリである `reline` をすべての環境で標準で利用し、`ext/readline` は削除されました。以前の `ext/readline` が必要なユーザーは `gem install readline-ext` でインストールすることができます。
* この変更により、Ruby のインストール時に `libreadline` や `libedit` などのライブラリのインストールは不要となります。

## C API の変更

### C API の更新

以下の API が更新されました

### C API の削除

以下の非推奨の API は削除されました


## 標準添付ライブラリのアップデート



* 以下の default gems のバージョンがアップデートされました。

* RubyGems 3.5.0.dev
* bigdecimal 3.1.4
* bundler 2.5.0.dev
* csv 3.2.7
* fiddle 1.1.2
* fileutils 1.7.1
* irb 1.6.4
* optparse 0.4.0.pre.1
* psych 5.1.0
* reline 0.3.3
* stringio 3.0.7
* strscan 3.0.7
* syntax_suggest 1.0.4
* time 0.2.2
* timeout 0.3.2
* uri 0.12.1

* 以下の bundled gems のバージョンがアップデートされました。

* minitest 5.18.0
* rbs 3.1.0
* typeprof 0.21.7
* debug 1.8.0



default gems と bundled gems の詳細については [Logger の GitHub Releases](https://github.com/ruby/logger/releases) のような GitHub releases または changelog ファイルを参照してください。


その他詳細については、[NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md) ファイルまたは[コミットログ](https://github.com/ruby/ruby/compare/v3_2_0...{{ release.tag }})を参照してください。

なお、こうした変更により、Ruby 3.2.0 以降では [{{ release.stats.files_changed }} 個のファイルに変更が加えられ、{{ release.stats.insertions }} 行の追加と {{ release.stats.deletions }} 行の削除が行われました](https://github.com/ruby/ruby/compare/v3_2_0...{{ release.tag }}#file_bucket) !

メリークリスマス、Ruby 3.3 とともによいお年をお迎えください！

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
