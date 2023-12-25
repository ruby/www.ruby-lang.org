---
layout: news_post
title: "Ruby 3.3.0 リリース"
author: "naruse"
translator:
date: 2023-12-25 00:00:00 +0000
lang: ja
---

{% assign release = site.data.releases | where: "version", "3.3.0" | first %}
Ruby {{ release.version }} が公開されました。Ruby 3.3ではPrismという新しいパーサーの追加、新しいパーサージェネレーターであるLramaによるBisonの置き換え、RJITという新たなJITの仕組みを追加、YJITの高速化など様々な改善が行われています。

## Prism

* default gemとして[Prismパーサ](https://github.com/ruby/prism)を導入しました。
    * Prismは、Ruby言語のためのポータブルで、エラートレラントで、保守可能な再帰下降パーサです。
* Prismは本番環境で使用する準備が整っており、積極的にメンテナンスされています。Ripperの代わりに使用することができます。
    * Prismの使用方法については、[詳細なドキュメンテーション](https://ruby.github.io/prism/)があります。
    * Prismは、CRubyに内部的に使用されるCライブラリと、Rubyコードを解析する必要がある任意のツールに使用できるRuby gemの2つのコンポーネントを持っています。
    * Prism APIの注目すべきメソッドには以下のものがあります。
        * `Prism.parse(source)` は、パース結果オブジェクトの一部としてASTを返します。
        * `Prism.parse_comments(source)` はコメントを返します。
        * `Prism.parse_success?(source)` はエラーがない場合にtrueを返します。
* Prism開発への貢献に興味がある場合は、[Prismリポジトリ](https://github.com/ruby/prism)に直接Pull RequestやIssueを作成することができます。
* 今後は `ruby --parser=prism` または `RUBYOPT="--parser=prism"` を使用してPrismコンパイラを試すことができます。ただし、このフラグはデバッグ用であることに注意してください。

## Bisonの代わりにLramaを使用

* Bisonを[Lrama LALRパーサジェネレータ](https://github.com/ruby/lrama)に置き換えました。 [[Feature #19637]](https://bugs.ruby-lang.org/issues/19637)
  * 興味がある方は、[The future vision of Ruby Parser](https://rubykaigi.org/2023/presentations/spikeolaf.html)という発表をご覧ください。
  * 参考：[Ruby Parser開発日誌 (5) - Lrama LALR (1) parser generatorを実装した](https://yui-knk.hatenablog.com/entry/2023/03/13/101951)
  * Lramaの内部パーサは、保守性のためにRaccによって生成されたLRパーサに置き換えられました。
* パラメータ化ルール `(?, *, +)` がサポートされ、CRubyのparse.yで使用されます。

## YJIT

* 大幅なパフォーマンスの改善
  * `*` を使った引数のサポートが改善されました。
  * 仮想マシンのスタック操作のためにレジスタが使われるようになりました。
  * オプション引数を持つ呼び出しで全ての組合せがコンパイルされます。例外ハンドラもコンパイルされます。
  * サポートされていない呼び出し方や分岐の数の多い呼出しでのインタプリタへのフォールバックが行なわれなくなりました。
  * Railsの `#blank?` や [特別化された `#present?`](https://github.com/rails/rails/pull/49909) などの単純なメソッドがインライン化されます。
  * `Integer#*`、`Integer#!=`、`String#!=`、`String#getbyte`、`Kernel#block_given?`、`Kernel#is_a?`、`Kernel#instance_of?`、および `Module#===` が特別に最適化されます。
  * コンパイル速度はRuby 3.2よりわずかに速くなりました。
  * Optcarrotでは、インタプリタよりも3倍以上速くなりました！
* メモリ使用量の大幅な改善
  * コンパイルされたコードのメタデータは、はるかに少ないメモリを使用します。
  * アプリケーションが4万個以上のISEQを持つ場合、`--yjit-call-threshold` は自動的に30から120に上げられます。
  * 呼出しの少ないISEQのコンパイルをスキップするために `--yjit-cold-threshold` が追加されました。
  * Arm64ではよりコンパクトなコードが生成されます。
* コードGCはデフォルトで無効になりました
  * `--yjit-exec-mem-size` は新しいコードのコンパイルが停止するハードリミットとして扱われます。
  * これにより、デフォルトではコードGC実行によるパフォーマンスの急激な低下がなくなりました。[Pitchfork](https://github.com/shopify/pitchfork) を使って定期的にforkするサーバーでのコピーオンライトの挙動が改善されました。
  * 必要に応じて `--yjit-code-gc` でコードGCを有効にすることもできます。
* `RubyVM::YJIT.enable` を追加し、実行時にYJITを有効にできるようにしました
  * コマンドライン引数や環境変数を変更せずにYJITを開始できます。Rails 7.2はこの方法を使用して [デフォルトでYJITを有効にします](https://github.com/rails/rails/pull/49947)。
  * これはまた、アプリケーションの起動が完了した後にのみYJITを有効にするために使用できます。YJITの他のオプションを使用しながら起動時にYJITを無効にしたい場合は、`--yjit-disable` を使用できます。
* デフォルトで利用可能なYJITの統計が増えました
  * `yjit_alloc_size` およびその他いくつかのメタデータ関連の統計がデフォルトで利用可能になりました。
  * `--yjit-stats` によって生成される `ratio_in_yjit` 統計は、リリースビルドで利用可能になりました。特別な統計や開発ビルドは、ほとんどの統計にアクセスするためにはもはや必要ありません。
* プロファイリング機能を追加
  * Linux perfでのプロファイリングを容易にするために `--yjit-perf` が追加されました。
  * `--yjit-trace-exits` は、`--yjit-trace-exits-sample-rate=N` を使用したサンプリングをサポートします。
* より網羅的なテストと複数のバグ修正

## RJIT

* Rubyで書かれたJITコンパイラであるRJITを導入し、MJITを置き換えました。
  * RJITはUnixプラットフォーム上のx86\_64アーキテクチャのみをサポートします。
  * MJITとは異なり、実行時にCコンパイラを必要としません。
* RJITは実験的な目的のためだけに存在します。
  * 本番環境ではYJITを引き続き使用してください。
* RubyのJITの開発に興味がある場合は、[RubyKaigiの3日目のk0kubunの発表](https://rubykaigi.org/2023/presentations/k0kubun.html#day3)をご覧ください。

## M:N スレッドスケジューラ

* M:N スレッドスケジューラが導入されました。[[Feature #19842]](https://bugs.ruby-lang.org/issues/19842)
  * M個のRuby スレッドを、N個のネイティブスレッド（OSスレッド）で管理するので、生成管理のコストを抑えることができるようになりました。
  * C拡張ライブラリの互換性に問題が生じる可能性があるため、メインRactorでのM:Nスレッドスケジューラはデフォルトでは無効にされています。
    * `RUBY_MN_THREADS=1` と環境変数を設定することで、メインRactorでM:Nスレッドスケジューラを有効にします。
    * メインRactor以外ではM:Nスレッドスケジューラが常に有効です。
  * `RUBY_MAX_CPU=n` と環境変数を設定することで、Nの最大数（利用するネイティブスレッドの最大数）を設定できます。デフォルトは8です。
    * 一つの Ractor ではたかだか1つのスレッドしか同時に実行されないので、実際に利用するネイティブスレッド数は、`RUBY_MAX_CPU`で指定した数か実行中のRactorの数の少ないほうになります。つまり、Ractorの数が1つのアプリケーション（多くのアプリケーション）では1つのネイティブスレッドだけ利用されます。
    * ブロックする処理をサポートするため、N個以上のネイティブスレッドが利用されることがあります。

## パフォーマンスの改善

* `defined?(@ivar)` is optimized with Object Shapes.
* `Socket.getaddrinfo` などの名前解決を中断できるようになりました (pthread が利用できる環境のみ)。[[Feature 19965]](https://bugs.ruby-lang.org/issues/19965)
* 環境変数 `RUBY_GC_HEAP_REMEMBERED_WB_UNPROTECTED_OBJECTS_LIMIT_RATIO` が追加されました。[[Feature #19571]](https://bugs.ruby-lang.org/issues/19571)
* GCで古いオブジェクトの子オブジェクトがすぐにプロモートされなくなりました。[[Feature #19678]](https://bugs.ruby-lang.org/issues/19678)
* GCに弱参照が追加されました。[[Feature #19783]](https://bugs.ruby-lang.org/issues/19783)

## その他の注目すべき 3.2 からの変更点

### IRB

IRBは様々な機能強化を行いました。主なものは以下の通りです。

* IRBとrdbgの連携 pry-byebugのような使い心地でデバッグできるようになりました。([使い方](https://github.com/ruby/irb#debugging-with-irb))
* lsコマンドやshow_cmdsの出力がPagerで表示されるようになりました。
* lsコマンドやshow_sourceコマンドがより便利で詳細な情報を出力するようになりました。
* 型情報を使った補完が実験的に実装されました。([有効化するには](https://github.com/ruby/irb#type-based-completion))
* Reline::Faceクラスの導入により、補完ダイアログの色や文字装飾を変更できるようになりました。（[使い方](https://github.com/ruby/ruby/blob/master/doc/reline/face.md)）

また、機能強化以外にも、数多くのバグ修正および将来的な機能拡張を見越した大規模なリファクタリングを行ないました。


## 互換性に関する変更

* ブロック内での引数なし `it` の呼び出しは非推奨になりました。
  Ruby 3.4から最初のブロック引数を参照するようになります。
  [[Feature #18980]](https://bugs.ruby-lang.org/issues/18980)

### 環境変数の削除

以下の非推奨の環境変数は削除されました

* 環境変数 `RUBY_GC_HEAP_INIT_SLOTS` は非推奨になり、何もしなくなりました。環境変数 `RUBY_GC_HEAP_{0,1,2,3,4}_INIT_SLOTS` を使ってください。[[Feature #19785]](https://bugs.ruby-lang.org/issues/19785)

## 標準添付ライブラリの互換性に関する変更

### `ext/readline` の削除

* 今後は Ruby で書かれた GNU Readline の互換ライブラリである `reline` をすべての環境で標準で利用し、`ext/readline` は削除されました。以前の `ext/readline` が必要なユーザーは `gem install readline-ext` でインストールすることができます。
* この変更により、Ruby のインストール時に `libreadline` や `libedit` などのライブラリのインストールは不要となります。

## 標準添付ライブラリのアップデート

RubyGems と Bundler は将来リリースされる Ruby で bundled gems となる予定の gem が Gemfile または gemspec に存在しない状態で require された際に警告を行う機能が追加されました。

この警告は bootsnap gem を使っている場合には 3.3.0 の時点では機能上の制限により出力されません。そのため、環境変数として `DISABLE_BOOTSNAP=1` などを設定して、少なくとも1度はアプリケーションを実行することを推奨します。

以下のライブラリが警告の対象となります。
  * abbrev
  * base64
  * bigdecimal
  * csv
  * drb
  * getoptlong
  * mutex_m
  * nkf
  * observer
  * racc
  * resolv-replace
  * rinda
  * syslog


以下の default gem が追加されました。

* prism 0.19.0

以下の default gems のバージョンがアップデートされました。

* RubyGems 3.5.3
* abbrev 0.1.2
* base64 0.2.0
* benchmark 0.3.0
* bigdecimal 3.1.5
* bundler 2.5.3
* cgi 0.4.1
* csv 3.2.8
* date 3.3.4
* delegate 0.3.1
* drb 2.2.0
* english 0.8.0
* erb 4.0.3
* error_highlight 0.6.0
* etc 1.4.3
* fcntl 1.1.0
* fiddle 1.1.2
* fileutils 1.7.2
* find 0.2.0
* getoptlong 0.2.1
* io-console 0.7.1
* io-nonblock 0.3.0
* io-wait 0.3.1
* ipaddr 1.2.6
* irb 1.11.0
* json 2.7.1
* logger 1.6.0
* mutex_m 0.2.0
* net-http 0.4.0
* net-protocol 0.2.2
* nkf 0.1.3
* observer 0.1.2
* open-uri 0.4.1
* open3 0.2.1
* openssl 3.2.0
* optparse 0.4.0
* ostruct 0.6.0
* pathname 0.3.0
* pp 0.5.0
* prettyprint 0.2.0
* pstore 0.1.3
* psych 5.1.2
* rdoc 6.6.2
* readline 0.0.4
* reline 0.4.1
* resolv 0.3.0
* rinda 0.2.0
* securerandom 0.3.1
* set 1.1.0
* shellwords 0.2.0
* singleton 0.2.0
* stringio 3.1.0
* strscan 3.0.7
* syntax_suggest 2.0.0
* syslog 0.1.2
* tempfile 0.2.1
* time 0.3.0
* timeout 0.4.1
* tmpdir 0.2.0
* tsort 0.2.0
* un 0.3.0
* uri 0.13.0
* weakref 0.1.3
* win32ole 1.8.10
* yaml 0.3.0
* zlib 3.1.0

新たに以下の gem が default gems から bundled gems に変更されました。

* racc 1.7.3

以下の bundled gems のバージョンがアップデートされました。

* minitest 5.20.0
* rake 13.1.0
* test-unit 3.6.1
* rexml 3.2.6
* rss 0.3.0
* net-ftp 0.3.3
* net-imap 0.4.9
* net-smtp 0.4.0
* rbs 3.4.0
* typeprof 0.21.9
* debug 1.9.1

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
