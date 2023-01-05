---
layout: news_post
title: "Ruby 3.2.0 RC 1 リリース"
author: "naruse"
translator:
date: 2022-12-06 00:00:00 +0000
lang: ja
---

Ruby 3.2.0 Release Candidate 1 が公開されました。Ruby 3.2では多くの機能を追加しています。

{% assign release = site.data.releases | where: "version", "3.2.0-rc1" | first %}


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

![](https://cache.ruby-lang.org/pub/media/ruby320_regex_1.png)
![](https://cache.ruby-lang.org/pub/media/ruby320_regex_2.png)

このアルゴリズムの改善で、ほとんどの（我々の実験では90%程度の）正規表現が線形時間でマッチ判定できるようになります。

（プレビューリリースのユーザへ：この最適化は、マッチングのたびに入力長に比例したメモリを消費することがあります。このメモリ確保は通常遅延され、また、通常の正規表現であれば入力長のたかだか10倍程度のメモリを消費するだけなので、実用上の問題は発生しないと考えています。もし実アプリの正規表現マッチングでメモリ不足に陥った場合は報告してください）

提案チケットは https://bugs.ruby-lang.org/issues/19104 です。

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

提案チケットは https://bugs.ruby-lang.org/issues/17837 です。

## その他の主要な新機能

### SyntaxSuggest

* `syntax_suggest` の機能が Ruby に統合されました。`syntax_suggest` は、Ruby のコードの実行時に以下の例のようにエラーが起きた場所を容易に発見する機能を提供します。

  ```
  Unmatched `end', missing keyword (`do', `def`, `if`, etc.) ?

    1  class Dog
  > 2    defbark
  > 4    end
    5  end
  ```

  [[Feature #18159]]

### ErrorHighlight

* TypeErrorとArgumentErrorの引数を下線表示するようになりました

```
test.rb:2:in `+': nil can't be coerced into Integer (TypeError)

sum = ary[0] + ary[1]
               ^^^^^^
```
### 言語機能

* Anonymous rest and keyword rest arguments can now be passed as
  arguments, instead of just used in method parameters.
  [[Feature #18351]]

    ```ruby
    def foo(*)
      bar(*)
    end
    def baz(**)
      quux(**)
    end
    ```

* A proc that accepts a single positional argument and keywords will
  no longer autosplat. [[Bug #18633]]

  ```ruby
  proc{|a, **k| a}.call([1, 2])
  # Ruby 3.1 and before
  # => 1
  # Ruby 3.2 and after
  # => [1, 2]
  ```

* Constant assignment evaluation order for constants set on explicit
  objects has been made consistent with single attribute assignment
  evaluation order. With this code:

    ```ruby
    foo::BAR = baz
    ```

  `foo` is now called before `baz`. Similarly, for multiple assignments
  to constants,  left-to-right evaluation order is used. With this
  code:

    ```ruby
      foo1::BAR1, foo2::BAR2 = baz1, baz2
    ```

  The following evaluation order is now used:

  1. `foo1`
  2. `foo2`
  3. `baz1`
  4. `baz2`

  [[Bug #15928]]

* Find patternが実験的機能ではなくなりました。
  [[Feature #18585]]

* Methods taking a rest parameter (like `*args`) and wishing to delegate keyword
  arguments through `foo(*args)` must now be marked with `ruby2_keywords`
  (if not already the case). In other words, all methods wishing to delegate
  keyword arguments through `*args` must now be marked with `ruby2_keywords`,
  with no exception. This will make it easier to transition to other ways of
  delegation once a library can require Ruby 3+. Previously, the `ruby2_keywords`
  flag was kept if the receiving method took `*args`, but this was a bug and an
  inconsistency. A good technique to find the potentially-missing `ruby2_keywords`
  is to run the test suite, for where it fails find the last method which must
  receive keyword arguments, use `puts nil, caller, nil` there, and check each
  method/block on the call chain which must delegate keywords is correctly marked
  as `ruby2_keywords`. [[Bug #18625]] [[Bug #16466]]

    ```ruby
    def target(**kw)
    end

    # Accidentally worked without ruby2_keywords in Ruby 2.7-3.1, ruby2_keywords
    # needed in 3.2+. Just like (*args, **kwargs) or (...) would be needed on
    # both #foo and #bar when migrating away from ruby2_keywords.
    ruby2_keywords def bar(*args)
      target(*args)
    end

    ruby2_keywords def foo(*args)
      bar(*args)
    end

    foo(k: 1)
    ```

## パフォーマンスの改善

### YJIT

* YJIT now supports both x86-64 and arm64/aarch64 CPUs on Linux, MacOS, BSD and other UNIX platforms.
    * This release brings support for Mac M1/M2, AWS Graviton and Raspberry Pi 4 ARM64 processors.
* Building YJIT requires Rust 1.58.0+. [[Feature #18481]]
    * In order to ensure that CRuby is built with YJIT, please install rustc >= 1.58.0 and
      run `./configure` with `--enable-yjit`.
    * Please reach out to the YJIT team should you run into any issues.
* Physical memory for JIT code is lazily allocated. Unlike Ruby 3.1,
  the RSS of a Ruby process is minimized because virtual memory pages
  allocated by `--yjit-exec-mem-size` will not be mapped to physical
  memory pages until actually utilized by JIT code.
* Introduce Code GC that frees all code pages when the memory consumption
  by JIT code reaches `--yjit-exec-mem-size`.
    * RubyVM::YJIT.runtime_stats returns Code GC metrics in addition to
      existing `inline_code_size` and `outlined_code_size` keys:
      `code_gc_count`, `live_page_count`, `freed_page_count`, and `freed_code_size`.
* Most of the statistics produced by RubyVM::YJIT.runtime_stats are now available in release builds.
    * Simply run ruby with `--yjit-stats` to compute stats (incurs some run-time overhead).
* YJIT is now optimized to take advantage of object shapes. [[Feature #18776]]
* Take advantage of finer-grained constant invalidation to invalidate less code when defining new constants. [[Feature #18589]]

### PubGrub

* Bundler 2.4 は利用する依存解決ライブラリを [Molinillo](https://github.com/CocoaPods/Molinillo) から [PubGrub](https://github.com/jhawthorn/pub_grub) に変更しました。

  * PubGrub は次世代の Dart 言語のパッケージマネージャである `pub` で使われている次世代の依存解決アルゴリズムです。
  * この変更により、bundler を実行後に異なるライブラリの依存解決結果となる可能性があります。もし、不具合や気になる点を見つけた方は [RubyGems/Bundler issues](https://github.com/rubygems/rubygems/issues) までご報告ください。

* RubyGems は Ruby 3.2 では引き続き Molinillo ライブラリを利用しています。今後、RubyGems も PubGrub 変更し、Bundler と同じライブラリを使う予定です。

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
    * Update Unicode to Version 15.0.0 and Emoji Version 15.0. [[Feature #18639]]
      (also applies to Regexp)
    * String#bytesplice has been added.  [[Feature #18598]]

* Struct
    * A Struct class can also be initialized with keyword arguments
      without `keyword_init: true` on `Struct.new` [[Feature #16806]]

## 互換性に関する変更

### Removed constants

The following deprecated constants are removed.

* `Fixnum` and `Bignum` [[Feature #12005]]
* `Random::DEFAULT` [[Feature #17351]]
* `Struct::Group`
* `Struct::Passwd`

### Removed methods

The following deprecated methods are removed.

* `Dir.exists?` [[Feature #17391]]
* `File.exists?` [[Feature #17391]]
* `Kernel#=~` [[Feature #15231]]
* `Kernel#taint`, `Kernel#untaint`, `Kernel#tainted?`
  [[Feature #16131]]
* `Kernel#trust`, `Kernel#untrust`, `Kernel#untrusted?`
  [[Feature #16131]]

## 標準添付ライブラリの互換性に関する変更

### 3rd パーティライブラリのソースコード同梱廃止

* `libyaml` や `libffi` のような 3rd パーティのライブラリのソースコードの同梱を廃止しました

    * Psych に同梱していた `libyaml` のソースコードは削除されました。ユーザーは自身で Ubuntu や Debian プラットフォームなら `libyaml-dev` パッケージをインストールする必要があります。このパッケージ名称はプラットフォームごとに異なります。

    * Fiddle に同梱していた `libffi` のソースコードも削除されました

* Psych と fiddle には特定バージョンの `libyaml` や `libffi` のソースコードを静的リンクするための機能が追加されました。`libyaml-0.2.5` をリンクしてビルドする場合は以下のように実行します。

    ```bash
    $ ./configure --with-libyaml-source-dir=/path/to/libyaml-0.2.5
    ```

    同様に、`libffi-3.4.4` を fiddle にリンクする場合は以下のように実行します。

    ```bash
    $ ./configure --with-libffi-source-dir=/path/to/libffi-3.4.4
    ```

## C API updates

### Updated C APIs

The following APIs are updated.

* PRNG update
  `rb_random_interface_t` updated and versioned.
  Extension libraries which use this interface and built for older versions.
  Also `init_int32` function needs to be defined.

### Removed C APIs

The following deprecated APIs are removed.

* `rb_cData` variable.
* "taintedness" and "trustedness" functions. [[Feature #16131]]

## 標準添付ライブラリのアップデート

* 以下の default gems のバージョンがアップデートされました。
    * RubyGems 3.4.0.dev
    * benchmark 0.2.1
    * bigdecimal 3.1.3
    * bundler 2.4.0.dev
    * cgi 0.3.6
    * date 3.3.0
    * delegate 0.3.0
    * did_you_mean 1.6.2
    * digest 3.1.1
    * drb 2.1.1
    * erb 4.0.2
    * error_highlight 0.5.1
    * etc 1.4.1
    * fcntl 1.0.2
    * fiddle 1.1.1
    * fileutils 1.7.0
    * forwardable 1.3.3
    * getoptlong 0.2.0
    * io-console 0.5.11
    * io-nonblock 0.2.0
    * io-wait 0.3.0.pre
    * ipaddr 1.2.5
    * irb 1.5.1
    * json 2.6.2
    * logger 1.5.2
    * mutex_m 0.1.2
    * net-http 0.3.1
    * net-protocol 0.2.0
    * nkf 0.1.2
    * open-uri 0.3.0
    * openssl 3.1.0.pre
    * optparse 0.3.0
    * ostruct 0.5.5
    * pathname 0.2.1
    * pp 0.4.0
    * pstore 0.1.2
    * psych 5.0.0
    * racc 1.6.1
    * rdoc 6.5.0
    * reline 0.3.1
    * resolv 0.2.2
    * securerandom 0.2.1
    * set 1.0.3
    * stringio 3.0.3
    * syntax_suggest 1.0.1
    * timeout 0.3.1
    * tmpdir 0.1.3
    * tsort 0.1.1
    * un 0.2.1
    * uri 0.12.0
    * win32ole 1.8.9
    * zlib 3.0.0
* 以下の bundled gems のバージョンがアップデートされました。
    * minitest 5.16.3
    * power_assert 2.0.2
    * test-unit 3.5.5
    * net-ftp 0.2.0
    * net-imap 0.3.1
    * net-pop 0.1.2
    * net-smtp 0.3.3
    * rbs 2.8.1
    * typeprof 0.21.3
    * debug 1.7.0

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
[Bug #19013]:     https://bugs.ruby-lang.org/issues/19013
