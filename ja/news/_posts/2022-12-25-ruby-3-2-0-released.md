---
layout: news_post
title: "Ruby 3.2.0 リリース"
author: "naruse"
translator:
date: 2022-12-25 00:00:00 +0000
lang: ja
---

Ruby 3.2.0 が公開されました。Ruby 3.2では多くの機能を追加するとともに、様々な改善が行われています。

{% assign release = site.data.releases | where: "version", "3.2.0" | first %}


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

さらに、[WASIの上にVFS](https://github.com/kateinoigakukun/wasi-vfs/wiki/Getting-Started-with-CRuby)を実装しました。これにより、Rubyアプリを単一の.wasmファイルに容易にパッケージ化できます。Rubyアプリの配布が少し簡単になります。

### 参考文献

* [Add WASI based WebAssembly support #5407](https://github.com/ruby/ruby/pull/5407)
* [An Update on WebAssembly/WASI Support in Ruby](https://itnext.io/final-report-webassembly-wasi-support-in-ruby-4aface7d90c9)

## 実用段階になったYJIT

![](https://i.imgur.com/X9ulfac.png)

* YJIT は実験段階ではなくなりました
    * 1年以上にわたって本番環境でテストされ、安定して稼働する実績があります。
* YJIT は x86-64 と arm64/aarch64 の CPU アーキテクチャと Linux, MacOS, BSD とその他の UNIX プラットフォームをサポートしました
    * このリリースでは Mac の M1/M2, AWS Graviton と Raspberry Pi 4 の ARM64 プロセッサに対応してます。
* YJIT をビルドするためには Rust 1.58.0 以降が必要となります [[Feature #18481]]
    * CRuby を YJIT を有効としてビルドするためには、rustc >= 1.58.0 をインストールした上で `./configure` を実行する必要があります
    * もし、実行時に何かしらの問題に遭遇した場合は YJIT チームに連絡してください
* Ruby 3.2 の YJIT は Ruby 3.1 よりも速くなりました。またメモリのオーバーヘッドが 1/3 となりました。
  * YJIT は [yjit-bench](https://github.com/Shopify/yjit-bench) にあるように通常の Ruby インタプリタより 41% 速くなりました
  * JIT のための物理メモリは遅延して確保するようになりました。 Ruby 3.1 と異なり `--yjit-exec-mem-size` に
    よって確保された仮想メモリのページは物理メモリのページにJITによって実際に使われるまで
    割り当てられなくなったため Ruby プロセスのRSS はより小さくなりました。
  * JIT によるメモリ消費が `--yjit-exec-mem-size` に達したときに、全てのコードページを解放するコードGCを導入しました。
  * `RubyVM::YJIT.runtime_stats` は、既存の `inline_code_size` と `outlined_code_size` キーに加えて、
    `code_gc_count`, `live_page_count`, `freed_page_count` と `freed_code_size` を コードGC のメトリクスとして表示します
* リリースビルドから `RubyVM::YJIT.runtime_stats` によって統計の大部分を得られるようになりました
    * ruby コマンドに `--yjit-stats` を付与することで単純に表示することができます (ただしランタイムのオーバーヘッドは生じます)
* YJIT へ object shapes による最適化が行われました [[Feature #18776]]
* 定数を無効化する粒度を細かくすることで、新しい定数を定義する際に無効化するコードの量を少なくしました [[Feature #18589]]
* `--yjit-exec-mem-size` のデフォルト値は 64 (MiB) と変更されました.
* `--yjit-call-threshold` のデフォルト値は 30 と変更されました

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

この最適化は、マッチングのたびに入力長に比例したメモリを消費することがあります。このメモリ確保は通常遅延され、また、通常の正規表現であれば入力長のたかだか10倍程度のメモリを消費するだけなので、実用上の問題は発生しないと考えています。もし実アプリの正規表現マッチングでメモリ不足に陥った場合は報告してください

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

### SyntaxSuggest

* `syntax_suggest` の機能が Ruby に統合されました。`syntax_suggest` は、Ruby のコードの実行時に以下の例のようにエラーが起きた場所を容易に発見する機能を提供します。

  ```
  Unmatched `end', missing keyword (`do', `def`, `if`, etc.) ?

    1  class Dog
  > 2    defbark
  > 3    end
    4  end
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

* 匿名の可変長引数と可変長キーワード引数はメソッドパラメータとしてだけではなく、引数としても
  使えるようになりました
  [[Feature #18351]]

    ```ruby
    def foo(*)
      bar(*)
    end
    def baz(**)
      quux(**)
    end
    ```

* 1つの引数と残りをキーワードとして受け取る proc は引数を自動で展開されなくなりました
  [[Bug #18633]]

  ```ruby
  proc{|a, **k| a}.call([1, 2])
  # Ruby 3.1 and before
  # => 1
  # Ruby 3.2 and after
  # => [1, 2]
  ```

* 定数代入時の評価順序が単一の代入時と同じ評価順序となり一貫性を持つようになりました。
  以下のようなコードの場合

    ```ruby
    foo::BAR = baz
    ```

  `foo` は `baz` よりも先に評価されます. 同様に複数の定数代入についても、左から右へ
  順に評価されます。以下のようなコードの場合

    ```ruby
      foo1::BAR1, foo2::BAR2 = baz1, baz2
    ```

  以下のように評価されます

  1. `foo1`
  2. `foo2`
  3. `baz1`
  4. `baz2`

  [[Bug #15928]]

* Find patternが実験的機能ではなくなりました。
  [[Feature #18585]]

* 可変長パラメータ (`*args` など) を受け取るメソッドで、 `foo(*args)` を通してキーワード引数を委譲したい場合は、
  `ruby2_keywords` でマークしなければならなくなりました。
  言い換えれば, `*args` などを用いてキーワードを引数を例外を起こさずに委譲したい全てのメソッドは `ruby2_keywords`
  によってマークする必要があると言うことです。
  これによって Ruby 3 以降のバージョンへ委譲を用いている処理を有するライブラリを簡単に対応できるようになります。
  以前はメソッドが `*args` を受け取る場合、`ruby2_keywords` フラグが保持されていました。しかし、これには一貫性がない
  と言う不具合がありました。
  今まではキーワード引数を複数のメソッドにまたがって委譲するする時に、 `ruby2_keywords` を正しく使っているかを確認するために
  全てに対して`puts nil, caller, nil` を追加していましたが、この変更によりテストを実行するときに `ruby2_keywords` が
  必要であるにもかかわらず使われていないものを見つける良い手段となります。
  [[Bug #18625]] [[Bug #16466]]

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

### MJIT

* MJIT コンパイラが `ruby_vm/mjit/compiler` として Ruby で再実装されました。
* MJIT コンパイラは MJIT ワーカーによって呼ばれた native スレッドの代わりに
  fork されたプロセスによって実行されるようになりました。 [[Feature #18968]]
    * そのため、Microsoft Visual Studio (MSWIN) はサポート対象外となりました
* MinGW はサポート対象外となりました [[Feature #18824]]
* `--mjit-min-calls` は `--mjit-call-threshold` にリネームされました
* `--mjit-max-cache` のデフォルト値は 10000 から 100 に戻されました

### PubGrub

* Bundler 2.4 は利用する依存解決ライブラリを [Molinillo](https://github.com/CocoaPods/Molinillo) から [PubGrub](https://github.com/jhawthorn/pub_grub) に変更しました。

  * PubGrub は Dart 言語のパッケージマネージャである `pub` で使われている次世代の依存解決アルゴリズムです。
  * この変更により、bundler を実行後に異なるライブラリの依存解決結果となる可能性があります。もし、不具合や気になる点を見つけた方は [RubyGems/Bundler issues](https://github.com/rubygems/rubygems/issues) までご報告ください。

* RubyGems は Ruby 3.2 では引き続き Molinillo ライブラリを利用しています。今後、RubyGems も PubGrub に変更し、Bundler と同じライブラリを使う予定です。

## その他の注目すべき 3.1 からの変更点
* Data
    * 単純かつ不変な値オブジェクトを表現するための新たなコアクラス Data が追加されました。
      Data は Struct によく似ており、部分的に実装を共有しています。しかし、より限定的かつ
      少ないAPIとなっています。 [[Feature #16122]]

        ```ruby
        Measure = Data.define(:amount, :unit)
        distance = Measure.new(100, 'km')            #=> #<data Measure amount=100, unit="km">
        weight = Measure.new(amount: 50, unit: 'kg') #=> #<data Measure amount=50, unit="kg">
        weight.with(amount: 40)                      #=> #<data Measure amount=40, unit="kg">
        weight.amount                                #=> 50
        weight.amount = 40                           #=> NoMethodError: undefined method `amount='
        ```

* Hash
    * `Hash#shift` はハッシュが空の時には、デフォルト値やデフォルトの proc を呼ぶ代わりに常に nil を返します。
      [[Bug #16908]]

* MatchData
    * `MatchData#byteoffset` が追加されました [[Feature #13110]]

* Module
    * `Module.used_refinements` が追加されました [[Feature #14332]]
    * `Module#refinements` が追加されました [[Feature #12737]]
    * `Module#const_added` が追加されました [[Feature #17881]]

* Proc
    * `Proc#dup` はサブクラスのインスタンスを返すようになりました [[Bug #17545]]
    * `Proc#parameters` が `lambda` キーワードを受け取ることができるようになりました [[Feature #15357]]

* Refinement
    * `Refinement#refined_class` が追加されました [[Feature #12737]]

* RubyVM::AbstractSyntaxTree
    * `parse`, `parse_file`, `of` へ `error_tolerant` オプションが追加されました [[Feature #19013]]
      このオプションを指定した場合
        1. SyntaxError が発生しなくなります
        2. 文法上正しくない入力に対しても抽象構文木を返します
        3. 入力を最後まで読んだときに`end`が不足していた場合、`end`を補って構文解析を行います
        4. インデントをもとに`end`をキーワードとして扱います

        ```ruby
        # Without error_tolerant option
        root = RubyVM::AbstractSyntaxTree.parse(<<~RUBY)
        def m
          a = 10
          if
        end
        RUBY
        # => <internal:ast>:33:in `parse': syntax error, unexpected `end' (SyntaxError)

        # With error_tolerant option
        root = RubyVM::AbstractSyntaxTree.parse(<<~RUBY, error_tolerant: true)
        def m
          a = 10
          if
        end
        RUBY
        p root # => #<RubyVM::AbstractSyntaxTree::Node:SCOPE@1:0-4:3>

        # `end` is treated as keyword based on indent
        root = RubyVM::AbstractSyntaxTree.parse(<<~RUBY, error_tolerant: true)
        module Z
          class Foo
            foo.
          end

          def bar
          end
        end
        RUBY
        p root.children[-1].children[-1].children[-1].children[-2..-1]
        # => [#<RubyVM::AbstractSyntaxTree::Node:CLASS@2:2-4:5>, #<RubyVM::AbstractSyntaxTree::Node:DEFN@6:2-7:5>]
        ```

    * `parse`, `parse_file`, `of` へ `keep_tokens`オプションが追加されました [[Feature #19070]]

        ```ruby
        root = RubyVM::AbstractSyntaxTree.parse("x = 1 + 2", keep_tokens: true)
        root.tokens # => [[0, :tIDENTIFIER, "x", [1, 0, 1, 1]], [1, :tSP, " ", [1, 1, 1, 2]], ...]
        root.tokens.map{_1[2]}.join # => "x = 1 + 2"
        ```

* Set
    * `Set` は `require "set"` を実行しなくても使用できる組み込みのクラスとなりました。 [[Feature #16989]]
      この機能は `Set` を参照した時、または `Enumerable#to_set` を呼んだ時に有効となります。

* String
    * `String#byteindex` と `String#byterindex` が追加されました [[Feature #13110]]
    * Unicode のバージョンを 15.0.0 へ、絵文字のバージョンを 15.0 へとアップデートしました [[Feature #18639]]
      (この変更は正規表現にも反映されます)
    * `String#bytesplice` が追加されました  [[Feature #18598]]

* Struct
    * Structクラスは `Struct.new` の実行時に `keyword_init: true` をつけなくても
      キーワード引数によって初期化できるようになりました。 [[Feature #16806]]

        ```ruby
        Post = Struct.new(:id, :name)
        Post.new(1, "hello") #=> #<struct Post id=1, name="hello">
        # From Ruby 3.2, the following code also works without keyword_init: true.
        Post.new(id: 1, name: "hello") #=> #<struct Post id=1, name="hello">
        ```

## 互換性に関する変更

### 定数の削除

以下の非推奨定数は削除されました

* `Fixnum` と `Bignum` [[Feature #12005]]
* `Random::DEFAULT` [[Feature #17351]]
* `Struct::Group`
* `Struct::Passwd`

### メソッドの削除

以下の非推奨のメソッドは削除されました

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

## C API の変更

### C API の更新

以下の API が更新されました

* PRNG の更新
  * `rb_random_interface_t` が更新され、新しいバージョンとなりました。
    古いバージョンを用いている拡張ライブラリは新しいインターフェイスを使う必要があります。
    また `init_int32` 関数を定義する必要があります。

### C API の削除

以下の非推奨の API は削除されました

* `rb_cData` 変数
* "taintedness" と "trustedness" 関数 [[Feature #16131]]

## 標準添付ライブラリのアップデート


* Bundler

    * gem を Rust で書くための雛形作成コマンドとして `bundle gem --ext=rust` をサポートしました。[[GH-rubygems-6149]]
    * `git clone` をより速く実行できるように改善しました [[GH-rubygems-4475]]

* RubyGems

    * cargo builder を mswin 環境でサポートしました. [[GH-rubygems-6167]]

* ERB

    * `ERB::Util.html_escape` が `CGI.escapeHTML` よりも高速化されました
        * エスケープが必要な文字列がない場合、String オブジェクトを確保しません
        * 引数が String の場合、`#to_s` を呼ばずにスキップします
        * `ERB::Escape.html_escape` が `ERB::Util.html_escape` のエイリアスになりました、そのため Rails にモンキーパッチ
          する必要がなくなります。

* IRB

    * debug.gem と統合したコマンドが複数追加されました: `debug`, `break`, `catch`,
      `next`, `delete`, `step`, `continue`, `finish`, `backtrace`, `info`
        * これらは Gemfile に `gem "debug"` と記述しなくても動かすことができます
        * 詳しくは [What's new in Ruby 3.2's IRB?](https://st0012.dev/whats-new-in-ruby-3-2-irb) をみてください。
    * Pry のようなコマンドや機能が複数追加されました。
        * `edit` と `show_cmds` (Pry の `help` コマンド相当) が追加されました
        * `ls` コマンドに出力をフィルタするための `-g` または `-G` オプションが追加されました
        * `show_source` のエイリアスとして `$` が追加されました、また引数をクオートする必要がなくなりました
        * `whereami` のエイリアスとして `@` が追加されました

* 以下の default gems のバージョンがアップデートされました。

    * RubyGems 3.4.1
    * abbrev 0.1.1
    * benchmark 0.2.1
    * bigdecimal 3.1.3
    * bundler 2.4.1
    * cgi 0.3.6
    * csv 3.2.6
    * date 3.3.3
    * delegate 0.3.0
    * did_you_mean 1.6.3
    * digest 3.1.1
    * drb 2.1.1
    * english 0.7.2
    * erb 4.0.2
    * error_highlight 0.5.1
    * etc 1.4.2
    * fcntl 1.0.2
    * fiddle 1.1.1
    * fileutils 1.7.0
    * forwardable 1.3.3
    * getoptlong 0.2.0
    * io-console 0.6.0
    * io-nonblock 0.2.0
    * io-wait 0.3.0
    * ipaddr 1.2.5
    * irb 1.6.2
    * json 2.6.3
    * logger 1.5.3
    * mutex_m 0.1.2
    * net-http 0.3.2
    * net-protocol 0.2.1
    * nkf 0.1.2
    * open-uri 0.3.0
    * open3 0.1.2
    * openssl 3.1.0
    * optparse 0.3.1
    * ostruct 0.5.5
    * pathname 0.2.1
    * pp 0.4.0
    * pstore 0.1.2
    * psych 5.0.1
    * racc 1.6.2
    * rdoc 6.5.0
    * readline-ext 0.1.5
    * reline 0.3.2
    * resolv 0.2.2
    * resolv-replace 0.1.1
    * securerandom 0.2.2
    * set 1.0.3
    * stringio 3.0.4
    * strscan 3.0.5
    * syntax_suggest 1.0.2
    * syslog 0.1.1
    * tempfile 0.1.3
    * time 0.2.1
    * timeout 0.3.1
    * tmpdir 0.1.3
    * tsort 0.1.1
    * un 0.2.1
    * uri 0.12.0
    * weakref 0.1.2
    * win32ole 1.8.9
    * yaml 0.2.1
    * zlib 3.0.0

* 以下の bundled gems のバージョンがアップデートされました。

    * minitest 5.16.3
    * power_assert 2.0.3
    * test-unit 3.5.7
    * net-ftp 0.2.0
    * net-imap 0.3.3
    * net-pop 0.1.2
    * net-smtp 0.3.3
    * rbs 2.8.2
    * typeprof 0.21.3
    * debug 1.7.1

default gems と bundled gems の詳細については [Logger の GitHub Releases](https://github.com/ruby/logger/releases) のような GitHub releases または changelog ファイルを参照してください。


その他詳細については、[NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md) ファイルまたは[コミットログ](https://github.com/ruby/ruby/compare/v3_1_0...{{ release.tag }})を参照してください。

なお、こうした変更により、Ruby 3.1.0 以降では [{{ release.stats.files_changed }} 個のファイルに変更が加えられ、{{ release.stats.insertions }} 行の追加と {{ release.stats.deletions }} 行の削除が行われました](https://github.com/ruby/ruby/compare/v3_1_0...{{ release.tag }}#file_bucket) !

メリークリスマス、Ruby 3.2 とともによいお年をお迎えください！

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

[Feature #12005]:     https://bugs.ruby-lang.org/issues/12005
[Feature #12084]:     https://bugs.ruby-lang.org/issues/12084
[Feature #12655]:     https://bugs.ruby-lang.org/issues/12655
[Feature #12737]:     https://bugs.ruby-lang.org/issues/12737
[Feature #13110]:     https://bugs.ruby-lang.org/issues/13110
[Feature #14332]:     https://bugs.ruby-lang.org/issues/14332
[Feature #15231]:     https://bugs.ruby-lang.org/issues/15231
[Feature #15357]:     https://bugs.ruby-lang.org/issues/15357
[Bug #15928]:         https://bugs.ruby-lang.org/issues/15928
[Feature #16122]:     https://bugs.ruby-lang.org/issues/16122
[Feature #16131]:     https://bugs.ruby-lang.org/issues/16131
[Bug #16466]:         https://bugs.ruby-lang.org/issues/16466
[Feature #16663]:     https://bugs.ruby-lang.org/issues/16663
[Feature #16806]:     https://bugs.ruby-lang.org/issues/16806
[Bug #16889]:         https://bugs.ruby-lang.org/issues/16889
[Bug #16908]:         https://bugs.ruby-lang.org/issues/16908
[Feature #16989]:     https://bugs.ruby-lang.org/issues/16989
[Feature #17351]:     https://bugs.ruby-lang.org/issues/17351
[Feature #17391]:     https://bugs.ruby-lang.org/issues/17391
[Bug #17545]:         https://bugs.ruby-lang.org/issues/17545
[Bug #17767]:         https://bugs.ruby-lang.org/issues/17767
[Feature #17837]:     https://bugs.ruby-lang.org/issues/17837
[Feature #17881]:     https://bugs.ruby-lang.org/issues/17881
[Feature #18033]:     https://bugs.ruby-lang.org/issues/18033
[Feature #18159]:     https://bugs.ruby-lang.org/issues/18159
[Feature #18239]:     https://bugs.ruby-lang.org/issues/18239#note-17
[Feature #18351]:     https://bugs.ruby-lang.org/issues/18351
[Feature #18367]:     https://bugs.ruby-lang.org/issues/18367
[Bug #18435]:         https://bugs.ruby-lang.org/issues/18435
[Feature #18462]:     https://bugs.ruby-lang.org/issues/18462
[Feature #18481]:     https://bugs.ruby-lang.org/issues/18481
[Bug #18487]:         https://bugs.ruby-lang.org/issues/18487
[Feature #18564]:     https://bugs.ruby-lang.org/issues/18564
[Feature #18571]:     https://bugs.ruby-lang.org/issues/18571
[Feature #18585]:     https://bugs.ruby-lang.org/issues/18585
[Feature #18589]:     https://bugs.ruby-lang.org/issues/18589
[Feature #18595]:     https://bugs.ruby-lang.org/issues/18595
[Feature #18598]:     https://bugs.ruby-lang.org/issues/18598
[Bug #18625]:         https://bugs.ruby-lang.org/issues/18625
[Feature #18630]:     https://bugs.ruby-lang.org/issues/18630
[Bug #18633]:         https://bugs.ruby-lang.org/issues/18633
[Feature #18639]:     https://bugs.ruby-lang.org/issues/18639
[Feature #18685]:     https://bugs.ruby-lang.org/issues/18685
[Bug #18729]:         https://bugs.ruby-lang.org/issues/18729
[Bug #18751]:         https://bugs.ruby-lang.org/issues/18751
[Feature #18774]:     https://bugs.ruby-lang.org/issues/18774
[Feature #18776]:     https://bugs.ruby-lang.org/issues/18776
[Bug #18782]:         https://bugs.ruby-lang.org/issues/18782
[Feature #18788]:     https://bugs.ruby-lang.org/issues/18788
[Feature #18798]:     https://bugs.ruby-lang.org/issues/18798
[Feature #18809]:     https://bugs.ruby-lang.org/issues/18809
[Feature #18821]:     https://bugs.ruby-lang.org/issues/18821
[Feature #18822]:     https://bugs.ruby-lang.org/issues/18822
[Feature #18824]:     https://bugs.ruby-lang.org/issues/18824
[Feature #18832]:     https://bugs.ruby-lang.org/issues/18832
[Feature #18875]:     https://bugs.ruby-lang.org/issues/18875
[Feature #18925]:     https://bugs.ruby-lang.org/issues/18925
[Feature #18944]:     https://bugs.ruby-lang.org/issues/18944
[Feature #18949]:     https://bugs.ruby-lang.org/issues/18949
[Feature #18968]:     https://bugs.ruby-lang.org/issues/18968
[Feature #19008]:     https://bugs.ruby-lang.org/issues/19008
[Feature #19013]:     https://bugs.ruby-lang.org/issues/19013
[Feature #19026]:     https://bugs.ruby-lang.org/issues/19026
[Feature #19036]:     https://bugs.ruby-lang.org/issues/19036
[Feature #19060]:     https://bugs.ruby-lang.org/issues/19060
[Feature #19070]:     https://bugs.ruby-lang.org/issues/19070
[Feature #19071]:     https://bugs.ruby-lang.org/issues/19071
[Feature #19078]:     https://bugs.ruby-lang.org/issues/19078
[Bug #19087]:         https://bugs.ruby-lang.org/issues/19087
[Bug #19100]:         https://bugs.ruby-lang.org/issues/19100
[Feature #19104]:     https://bugs.ruby-lang.org/issues/19104
[Feature #19135]:     https://bugs.ruby-lang.org/issues/19135
[Feature #19138]:     https://bugs.ruby-lang.org/issues/19138
[Feature #19194]:     https://bugs.ruby-lang.org/issues/19194
[Molinillo]:          https://github.com/CocoaPods/Molinillo
[PubGrub]:            https://github.com/jhawthorn/pub_grub
[GH-net-protocol-14]: https://github.com/ruby/net-protocol/pull/14
[GH-pathname-20]:     https://github.com/ruby/pathname/pull/20
[GH-6791]:            https://github.com/ruby/ruby/pull/6791
[GH-6868]:            https://github.com/ruby/ruby/pull/6868
[GH-rubygems-4475]:   https://github.com/rubygems/rubygems/pull/4475
[GH-rubygems-6149]:   https://github.com/rubygems/rubygems/pull/6149
[GH-rubygems-6167]:   https://github.com/rubygems/rubygems/pull/6167
[sec-156615]:         https://hackerone.com/reports/156615
[CVE-2021-33621]:     https://www.ruby-lang.org/en/news/2022/11/22/http-response-splitting-in-cgi-cve-2021-33621/
[wasm/README.md]:     https://github.com/ruby/ruby/blob/master/wasm/README.md
[ruby.wasm]:          https://github.com/ruby/ruby.wasm
