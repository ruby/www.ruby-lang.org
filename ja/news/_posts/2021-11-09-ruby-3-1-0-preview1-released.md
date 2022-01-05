---
layout: news_post
title: "Ruby 3.1.0 Preview 1 リリース"
author: "naruse"
translator: "jinroq"
date: 2021-11-09 00:00:00 +0000
lang: ja
---

{% assign release = site.data.releases | where: "version", "3.1.0-preview1" | first %}

Ruby 3.1 に向けてフィードバックを得るためのリリースである、Ruby {{ release.version }} が公開されました。

## YJIT： 新しいインプロセス JIT コンパイラ (experimental)

Ruby 3.1 には、Shopify 社が開発した新しいインプロセス JIT コンパイラである YJIT をマージしています。

[2018 年に Ruby 2.6 が MJIT を導入](https://www.ruby-lang.org/en/news/2018/12/25/ruby-2-6-0-released/)して以降、パフォーマンスは大幅に向上し、ついに[昨年 Ruby3x3 を達成しました](https://www.ruby-lang.org/en/news/2020/12/25/ruby-3-0-0-released/)。しかし、この JIT は Optcarrot では目覚ましい速度改善を示したものの、実世界のプロダクトで運用するには厳しいものでした。

近年 Shopify 社は Rails アプリケーションを高速化するために Ruby へ多くの改善をしてくれました。その中でも YJIT は重要な貢献であり、また、Rails アプリケーションのパフォーマンス向上を目的としています。

MJIT はメソッドベースの JIT コンパイラであり、外部 C コンパイラを使用します。一方、YJIT は Basic Block Versioning を使用し、その中に JIT コンパイラを含みます。 Lazy Basic Block Versioning（LBBV）では、最初にメソッドの先頭をコンパイルし、引数と変数の型が動的に決定されると、残りをインクリメンタルにコンパイルします。詳細な概要については [YJIT: a basic block versioning JIT compiler for CRuby](https://dl.acm.org/doi/10.1145/3486606.3486781) を参照してください。

この技術により、YJIT は実世界の多くのプロダクトで高速な起動時間とパフォーマンス向上の両方を実現しています。railsbench 上で 22％、liquid-render 上で 39％ の改善を実現しています。

<!-- 試す人向けのお知らせ -->

YJIT はまだ実験的な機能であるため、デフォルトでは無効になっています。使用するにはコマンドラインオプション `--yjit` を指定して YJIT を有効にします。また YJIT が仕様できる環境は、現時点では x86-64 プラットフォーム搭載の macOS および Linux に限定されています。

* [https://bugs.ruby-lang.org/issues/18229](https://bugs.ruby-lang.org/issues/18229)
* [https://shopify.engineering/yjit-just-in-time-compiler-cruby](https://shopify.engineering/yjit-just-in-time-compiler-cruby)
* [https://www.youtube.com/watch?v=PBVLf3yfMs8](https://www.youtube.com/watch?v=PBVLf3yfMs8)

## debug gem： 新しいデバッガ

新しいデバッガ [debug.gem](https://github.com/ruby/debug) がバンドルされています。 debug.gem は高速なデバッガであり、リモートデバッグ、色付き REPL、IDE integration（VSCode）など多くの機能を提供します。これは標準添付ライブラリの `lib/debug.rb` に置き換えられます。

## error_highlight： バックトレース内でさらに詳細なエラー箇所を示す機能

組み込み gem である error_highlight が導入されました。バックトレース内でさらに詳細なエラー箇所を示すことができます:

```
$ ruby test.rb
test.rb:1:in `<main>': undefined method `time' for 1:Integer (NoMethodError)

1.time {}
 ^^^^^
Did you mean?  times
```

この gem はデフォルトで有効になっています。コマンドラインオプション `--disable-error_highlight` を使用して無効にできます。詳細は[リポジトリ](https://github.com/ruby/error_highlight)を参照してください。

## Irb の改善

次の preview 版で説明します。

## その他の主要な新機能

### 言語仕様

* ハッシュリテラルとキーワード引数の値は省略できます [Feature #14579]
  * `{x:, y:}` は `{x: x, y: y}` の糖衣構文です
  * `foo(x:, y:)` は `foo(x: x, y: y)` の糖衣構文です

* パターンマッチングのピン演算子が式を受け取るようになりました [Feature #17411]

```ruby
Prime.each_cons(2).lazy.find_all{_1 in [n, ^(n + 2)]}.take(3).to_a
#=> [[3, 5], [5, 7], [11, 13]]
```

### RBS

RBS は Ruby プログラムの構造を記述するための言語です。詳細は[リポジトリ](https://github.com/ruby/rbs)を参照してください。

Ruby 3.0.0 からの変更点:

* gem の RBS を管理する `rbs collection` が導入されています [[doc]](https://github.com/ruby/rbs/blob/master/docs/collection.md)
* 組み込みライブラリおよび標準添付ライブラリの多くのシグネチャが追加/更新されています
* 多くのバグ修正とパフォーマンスの改善も含まれています

詳細は [CHANGELOG.md](https://github.com/ruby/rbs/blob/master/CHANGELOG.md) を参照してください。

### TypeProf

TypeProf は Ruby の静的型解析器です。型注釈のない Ruby コードから RBS のプロトタイプを生成します。詳細は[ドキュメント](https://github.com/ruby/typeprof/blob/master/doc/doc.md)を参照してください。

Ruby 3.0.0 からの変更点:

* [IDE サポート](https://github.com/ruby/typeprof/blob/master/doc/ide.md)が実装されました (Experimental)
* 多くのバグ修正とパフォーマンスの改善も含まれています

## パフォーマンスの改善

* MJIT
  * Rails のようなワークロードのために、`--jit-max-cache` のデフォルト値を 100 から 10000 に変更しています。
    JIT コンパイラは 1000 命令列長より長いメソッドのコンパイルをスキップしなくなりました
  * Rails の Zeitwerk モードをサポートするために、クラスイベントで TracePoint が有効になっている場合に JIT コンパイルされたコードをキャンセルしなくなりました

## その他の注目すべき 3.0 からの変更点

* 1 行パターンマッチ（例： `ary => [x, y, z]`）が experimental ではなくなりました
* 多重代入の評価順序が若干変更されました [[Bug #4443]](https://bugs.ruby-lang.org/issues/4443)
  * Ruby 3.0では `foo[0], bar[0] = baz, qux` は `baz`, `qux`,`foo`, `bar` の順に評価されていました。Ruby 3.1 からは `foo`,`bar`, `baz`,`qux` の順に評価されるようになります
* 文字列の可変幅割り当て (experimental) [[Bug #18239]](https://bugs.ruby-lang.org/issues/18239)

### 標準添付ライブラリの更新

* いくつかの標準添付ライブラリが更新されています
  * RubyGems
  * Bundler
  * RDoc 6.4.0
  * ReLine
  * JSON 2.6.0
  * Psych 4.0.2
  * FileUtils 1.6.0
  * Fiddle
  * StringIO 3.0.1
  * IO::Console 0.5.9
  * IO::Wait 0.2.0
  * CSV
  * Etc 1.3.0
  * Date 3.2.0
  * Zlib 2.1.1
  * StringScanner
  * IpAddr
  * Logger 1.4.4
  * OStruct 0.5.0
  * Irb
  * Racc 1.6.0
  * Delegate 0.2.0
  * Benchmark 0.2.0
  * CGI 0.3.0
  * Readline(C-ext) 0.1.3
  * Timeout 0.2.0
  * YAML 0.2.0
  * URI 0.11.0
  * OpenSSL
  * DidYouMean
  * Weakref 0.1.1
  * Tempfile 0.1.2
  * TmpDir 0.1.2
  * English 0.7.1
  * Net::Protocol 0.1.2
  * Net::Http 0.2.0
  * BigDecimal
  * OptionParser 0.2.0
  * Set
  * Find 0.1.1
  * Rinda 0.1.1
  * Erb
  * NKF 0.1.1
  * Base64 0.1.1
  * OpenUri 0.2.0
  * SecureRandom 0.1.1
  * Resolv 0.2.1
  * Resolv::Replace 0.1.0
  * Time 0.2.0
  * PP 0.2.1
  * Prettyprint 0.1.1
  * Drb 2.1.0
  * Pathname 0.2.0
  * Digest 3.1.0.pre2
  * Un 0.2.0
* 以下のバンドルされた gems が更新されています
  * minitest 5.14.4
  * power_assert 2.0.1
  * rake 13.0.6
  * test-unit 3.5.0
  * rbs 1.6.2
  * typeprof 0.20.0
* 以下のデフォルト gems がバンドルされた gem になりました
  * net-ftp
  * net-imap
  * net-pop
  * net-smtp
  * matrix
  * prime

詳細は [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md) か [commit logs](https://github.com/ruby/ruby/compare/v3_0_0...{{ release.tag }}) を参照してください。

なお、こうした変更により、Ruby 3.0.0 以降では [{{ release.stats.files_changed }} 個のファイルに変更が加えられ、 {{ release.stats.insertions }} 行の追加と {{ release.stats.deletions }} 行の削除が行われました](https://github.com/ruby/ruby/compare/v3_0_0...{{ release.tag }}#file_bucket)！

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

Ruby はまつもとゆきひろ（Matz）によって 1993 年に開発が始められ、今もオープンソースソフトウェアとして開発が続けられています。
Ruby は様々なプラットフォームで動き、世界中で、特に Web アプリケーション開発のために使われています。
