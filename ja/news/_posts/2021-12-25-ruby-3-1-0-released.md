---
layout: news_post
title: "Ruby 3.1.0 リリース"
author: "naruse"
translator:
date: 2021-12-25 00:00:00 +0000
lang: ja
---

Ruby 3.1系初のリリースである、Ruby 3.1.0 が公開されました。Ruby 3.1は3.0と高い互換性を保ちながら、多くの機能を追加しています。

{% assign release = site.data.releases | where: "version", "3.1.0" | first %}


## YJIT: New experimental in-process JIT compiler

Ruby 3.1では、Shopifyが開発した新しいプロセス内JITコンパイラであるYJITをマージしました。

[2018年のRuby 2.6でMJITをマージ](https://www.ruby-lang.org/ja/news/2018/12/25/ruby-2-6-0-released/)して以来、そのパフォーマンスは年々改善され、去年には[Ruby3x3を無事達成](https://www.ruby-lang.org/ja/news/2020/12/25/ruby-3-0-0-released/)しました。比較的大規模なOptcarrotベンチマークでは輝かしい高速化を達成したMJITですが、一方で現実の業務アプリケーションの性能はこれまで改善出来ていませんでした。

近年Shopifyは彼らのRailsアプリケーションを高速化するため、Rubyに対して多くの貢献をしてきました。YJITはその中でも重要な貢献であり、Railsアプリケーションをさらに高速化するために開発されました。

MJITがメソッドベースのJITコンパイラであり、外部のCコンパイラを利用しているのに対し、YJITではBasic Block Versioningという技術を用いた独自のJITコンパイラをRuby内部に持っています。YJITの用いているLazy Basic Block Versioning (LBBC)では、まずメソッドの冒頭のみをコンパイルし、実行時に実際に値が渡されて引数や変数の値が明らかになってから残りをコンパイルするという手法を用いることで、動的プログラミング言語においても効率のよいJITを実現しています。詳細は [YJIT: a basic block versioning JIT compiler for CRuby](https://dl.acm.org/doi/10.1145/3486606.3486781) を参照ください。

これらの技術によって、YJITでは素早い起動と高速な実行を多くの実世界のアプリケーションに対して実現しており、railsbenchでは最大22%、liquied-renderでは39%の高速化を達成しています。

YJITはまだ実験的機能なため、デフォルトでは無効化されています。試してみたい場合には `--yjit` コマンドラインオプションを指定することでYJITを有効化出来ます。現在YJITはx86-64上のUnix系プラットフォームでのみ実行出来ます。

* https://bugs.ruby-lang.org/issues/18229
* https://shopify.engineering/yjit-just-in-time-compiler-cruby
* https://www.youtube.com/watch?v=PBVLf3yfMs8

## debug gem: 新しいデバッガ

完全に0から書き直したデバッガである [debug.gem](https://github.com/ruby/debug) が同梱されました。次のような特徴があります。

* デバッグ時の速度低下を極力生じないよう改善
* リモートデバッグのサポート
* リッチなデバッガフロントエンドに対応（現在 VSCode と Chrome ブラウザに対応）
* マルチプロセス、マルチスレッドプログラムのデバッグに対応
* カラフルな REPL
* そのほか、Record & Replay 機能やトレース機能など、様々な便利機能

<video autoplay="autoplay" controls="controls" muted="muted" width="764" height="510" poster="https://cache.ruby-lang.org/pub/media/ruby310_debug_demo.jpg">
  <source src="https://cache.ruby-lang.org/pub/media/ruby310_debug_demo.mp4" type="video/mp4">
</video>

Rubyにはこれまでも lib/debug.rb が同梱されていましたが、あまりメンテナンスされておらず、性能や機能に問題がありました。debug.gem はこれを完全に置き換えます。

## error_highlight: バックトレース中の詳細なエラー位置表示

error_highlightという組み込みgemが導入されました。これにより、バックトレース中でエラーが発生した詳細な位置が表示されます。

```
$ ruby test.rb
test.rb:1:in `<main>': undefined method `time' for 1:Integer (NoMethodError)

1.time {}
 ^^^^^
Did you mean?  times
```

現在のところ、位置が表示されるのは`NoMethodError`のみです。

このgemはデフォルトで有効になっています。`--disable-error_highlight`コマンドラインオプションを指定することで無効化できます。詳しくは[ruby/error_highlightリポジトリ](https://github.com/ruby/error_highlight)を見てください。

## IRB のオートコンプリートとドキュメント表示

IRB にオートコンプリート機能が実装され、コードを入力するだけで補完候補ダイアログが表示されるようになりました。Tab と Shift+Tab で上下に移動できます。

また、補完候補を選択している時に、ドキュメントがインストールされている場合、補完候補ダイアログの横にドキュメントダイアログが表示され、内容が一部表示されます。Alt+d を押すことでドキュメント全文を読むことができます。

<video autoplay="autoplay" controls="controls" muted="muted" width="764" height="510" poster="https://cache.ruby-lang.org/pub/media/ruby310_irb_dialog.png">
  <source src="https://cache.ruby-lang.org/pub/media/ruby310_irb_dialog.mp4" type="video/mp4">
</video>

## その他の主要な新機能

### 言語機能

* ハッシュリテラルやキーワード引数の値が省略可能になりました。 [Feature #14579]
  * `{x:, y:}` は、`{x: x, y: y}` の糖衣構文です。
  * `foo(x:, y:)` は、`foo(x: x, y: y)` の糖衣構文です。

* パターンマッチ中のピン演算子に任意の式を書けるようになりました。 [Feature #17411]

```ruby
Prime.each_cons(2).lazy.find_all{_1 in [n, ^(n + 2)]}.take(3).to_a
#=> [[3, 5], [5, 7], [11, 13]]
```

* 一行パターンマッチで括弧が省略できるようになりました. [Feature #16182]

```ruby
[0, 1] => _, x
{y: 2} => y:
x #=> 1
y #=> 2
```


### RBS

[RBS](https://github.com/ruby/rbs)はRubyプログラムの型を定義するための言語です。

3.0.0からは、次の様なアップデートがありました。

* ジェネリクスの型パラメータに制約を与えることができるようになりました。 ([PR](https://github.com/ruby/rbs/pull/844))
* ジェネリックな型エイリアスが定義できようになりました。 ([PR](https://github.com/ruby/rbs/pull/823))
* gemのRBSを管理するための`rbs collection`コマンドが導入されました。 ([doc](https://github.com/ruby/rbs/blob/master/docs/collection.md))
* いろいろな組み込みクラスの型定義が追加、更新されました。
* 多数のバグ修正と性能の改善が含まれています。

詳しくは[CHANGELOG.md](https://github.com/ruby/rbs/blob/master/CHANGELOG.md)を確認してください。

### TypeProf

TypeProfはRubyの静的型解析器です。型注釈のないRubyコードから、RBSのプロトタイプを生成します。詳しくは[ドキュメント](https://github.com/ruby/typeprof/blob/master/doc/doc.md)をご参照ください.

Ruby 3.0.0からの主なアップデートは、"TypeProf for IDE"という実験的なIDEサポートです。

![Demo of TypeProf for IDE](https://cache.ruby-lang.org/pub/media/ruby310_typeprof_ide_demo.png)

このVSCode拡張は、推定された（またはRBSファイルに手で明記された）メソッドのシグネチャを、各メソッド定義の上に表示します。
また、NameErrorやTypeErrorを起こしうるコードを赤い下線で示します。
さらに、メソッド名の補完（メソッド名の候補の表示）を行います。
詳しくは[ドキュメント](https://github.com/ruby/typeprof/blob/master/doc/ide.md)をご参照ください。

また、数多くのバグ修正やパフォーマンス向上がなされています。

## パフォーマンスの改善

* MJIT
  * For workloads like Rails, the default `--jit-max-cache` is changed from 100 to 10000.
    The JIT compiler no longer skips compilation of methods longer than 1000 instructions.
  * To support Zeitwerk of Rails, JIT-ed code is no longer cancelled
    when a TracePoint for class events is enabled.


## その他の注目すべき 3.0 からの変更点

* 一行パターンマッチ（たとえば `ary => [x, y, z]`）が実験的機能ではなくなりました。

* 多重代入の評価順序が若干変更されました。[[Bug #4443]](https://bugs.ruby-lang.org/issues/4443)
  * `foo[0], bar[0] = baz, qux` は、Ruby 3.0 では `baz`, `qux`, `foo`, `bar` という順序で評価されていましたが、Ruby 3.1 では `foo`, `bar`, `baz`, `qux` の順で表kされます。

* 可変幅アロケーション（Variable Width Allocation）が実装されました。現在は試験的にStringが対応しています。 [[Bug #18239]](https://bugs.ruby-lang.org/issues/18239)

* Psych 4.0 では `Psych.load` が `safe_load` を利用するように変更されました。この挙動が影響ある場合は、従来の挙動である `unsafe_load` を利用する Psych 3.3.2 を移行パスとして利用できます。[[Bug #17866]](https://bugs.ruby-lang.org/issues/17866)

## 標準添付ライブラリのアップデート

* 以下の default gems のバージョンがアップデートされました。
    * RubyGems 3.3.3
    * base64 0.1.1
    * benchmark 0.2.0
    * bigdecimal 3.1.1
    * bundler 2.3.3
    * cgi 0.3.1
    * csv 3.2.2
    * date 3.2.2
    * did_you_mean 1.6.1
    * digest 3.1.0
    * drb 2.1.0
    * erb 2.2.3
    * error_highlight 0.3.0
    * etc 1.3.0
    * fcntl 1.0.1
    * fiddle 1.1.0
    * fileutils 1.6.0
    * find 0.1.1
    * io-console 0.5.10
    * io-wait 0.2.1
    * ipaddr 1.2.3
    * irb 1.4.1
    * json 2.6.1
    * logger 1.5.0
    * net-http 0.2.0
    * net-protocol 0.1.2
    * nkf 0.1.1
    * open-uri 0.2.0
    * openssl 3.0.0
    * optparse 0.2.0
    * ostruct 0.5.2
    * pathname 0.2.0
    * pp 0.3.0
    * prettyprint 0.1.1
    * psych 4.0.3
    * racc 1.6.0
    * rdoc 6.4.0
    * readline 0.0.3
    * readline-ext 0.1.4
    * reline 0.3.0
    * resolv 0.2.1
    * rinda 0.1.1
    * ruby2_keywords 0.0.5
    * securerandom 0.1.1
    * set 1.0.2
    * stringio 3.0.1
    * strscan 3.0.1
    * tempfile 0.1.2
    * time 0.2.0
    * timeout 0.2.0
    * tmpdir 0.1.2
    * un 0.2.0
    * uri 0.11.0
    * yaml 0.2.0
    * zlib 2.1.1
* 以下の bundled gems のバージョンがアップデートされました。
    * minitest 5.15.0
    * power_assert 2.0.1
    * rake 13.0.6
    * test-unit 3.5.3
    * rexml 3.2.5
    * rbs 2.0.0
    * typeprof 0.21.1
* 以下のライブラリが新たに bundled gems になりました。Bundler から利用する場合は Gemfile に明示的に指定してください。
    * net-ftp 0.1.3
    * net-imap 0.2.2
    * net-pop 0.1.1
    * net-smtp 0.3.1
    * matrix 0.4.2
    * prime 0.1.2
    * debug 1.4.0


その他詳細については、[NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md) ファイルまたは[コミットログ](https://github.com/ruby/ruby/compare/v3_0_0...{{ release.tag }})を参照してください。

なお、こうした変更により、Ruby 3.0.0 以降では [{{ release.stats.files_changed }} 個のファイルに変更が加えられ、{{ release.stats.insertions }} 行の追加と {{ release.stats.deletions }} 行の削除が行われました](https://github.com/ruby/ruby/compare/v3_0_0...{{ release.tag }}#file_bucket) !

メリークリスマス、様々な機能が追加された Ruby 3.1 をぜひお楽しみ下さい！

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
