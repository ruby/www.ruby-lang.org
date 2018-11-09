---
layout: news_post
title: "Ruby 2.6.0-preview3 Released"
author: "naruse"
translator:
date: 2018-11-06 00:00:00 +0000
lang: ja
---

Ruby 2.6.0に向けた3つ目のプレビューである、Ruby 2.6.0-preview3がリリースされました。

Ruby 2.6.0-preview3は、リリース前に出されるRelease Candidateに向けて最新の機能を試せるようにするためリリースされています。

## JIT

Ruby 2.6ではJIT (Just-in-time) コンパイラが導入されました。

JITコンパイラはあらゆるRubyプログラムの実行を高速化することを目的としています。
他言語の一般的なJITコンパイラと異なり、RubyのJITコンパイラはC言語のソースコードをファイルとしてディスクに書き、通常のCコンパイラを用いてネイティブコードに変換することでJITコンパイルを行うという手法を用いています。(参考: [MJIT organization by Vladimir Makarov](https://github.com/vnmakarov/ruby/tree/rtl_mjit_branch#mjit-organization))

JITコンパイルを有効にするには `--jit` オプションをコマンドラインまたは$RUBYOPT環境変数を指定します。`--jit-verbose=1`を指定すれば指定すれば実行中のJITコンパイルの基本的な情報を表示します。その他のオプションについては `ruby --help` を参照ください。

今回のリリースはこのJITコンパイル機能を皆さんの環境で動作を確認して頂くとともに、セキュリティ上の問題が無いかを早期に確認するために行っています。
現在のJITコンパイラを利用するためには、GCC、Clang、あるいはMicrosoft VC++によってビルドされたRubyでかつ、そのコンパイラが実行時に利用可能である必要があります。

Ruby 2.6.0-preview3の時点で、OptcarrotというCPU負荷中心のベンチマークにおいてRuby 2.5の約1.7倍の性能向上を達成しました。 <https://gist.github.com/k0kubun/d7f54d96f8e501bbbc78b927640f4208>
Railsアプリケーションなどのメモリ負荷の高い環境における性能は現在改善中です。

引き続き新時代のRubyの実効性能にご期待ください。

## RubyVM::AST [Experimental]

Ruby 2.6では `RubyVM::AST` モジュールが導入されました。

このモジュールには、文字列をパースしてAST(抽象構文木)のNodeを返す`parse`メソッド、ファイルをパースする`parse_file`メソッドが実装されています。
`RubyVM::AST::Node` も導入されました。このクラスのインスタンスから位置情報や子ノードを取得することができます。この機能はexperimentalです。また、ASTの構造に関する互換性は保証されていません。

## 新機能

* `Kernel#yield_self` の別名として `then` が追加されました [[Feature #14594]](https://bugs.ruby-lang.org/issues/14594)

* `rescue` 無しの `else` が文法エラーとなるようになりました  [EXPERIMENTAL]

* ASCII以外の大文字でも定数を定義出来るようになりました [[Feature #13770]](https://bugs.ruby-lang.org/issues/13770)

* 終端なしRange [[Feature #12912]](https://bugs.ruby-lang.org/issues/12912)

  終端なしRange `(1..)` が導入されました。これは終端を持ちません。これが典型的な用途です:

      ary[1..]                          # マジックナンバー -1 なしで ary[1..-1] と同じ意味
      (1..).each {|index| ... }         # index が 1 から始まる無限ループ
      ary.zip(1..) {|elem, index| ... } # ary.each.with_index(1) { ... }

* Binding#source_location の追加 [[Feature #14230]](https://bugs.ruby-lang.org/issues/14230)
  * `binding`のソースコード上の位置を `__FILE__` と `__LINE__` の二要素配列として返します。従来でも `eval("[__FILE__, __LINE__]", binding)` とすることでこれらの情報は得られましたが、将来的に `Kernel#eval` はbindingのソースコード行を無視する変更を予定しているため [[Bug #4352]](https://bugs.ruby-lang.org/issues/4352)、この新しいメソッドを用いることが今後は推奨されます。
* Kernel#system の失敗時に、falseを返す代わりに例外を上げさせる :exception オプションを追加 [[Feature #14386]](https://bugs.ruby-lang.org/issues/14386)

* Coverage の oneshot_lines モードの追加 [Feature#15022]
  * This mode checks "whether each line was executed at least once or not", instead of "how many times each line was executed".  A hook for each line is fired at most once, and after it is fired the hook flag is removed, i.e., it runs with zero overhead.
  * Add +:oneshot_lines+ keyword argument to Coverage.start.
  * Add +:stop+ and +:clear+ keyword arguments to Coverage.result. If +clear+ is true, it clears the counters to zero.  If +stop+ is true, it disables coverage measurement.
  * Coverage.line_stub, which is a simple helper function that creates the "stub" of line coverage from a given source code.

* FileUtils#cp_lr.  [Feature #4189]

## パフォーマンスの改善

* transient heap（メモ）
* 後述の$SAFEの変更に伴って考慮すべきことが減ったため、`Proc#call`が高速化されました [[Feature #14318]](https://bugs.ruby-lang.org/issues/14318)
  `Proc#call` を大量に呼び出す `lc_fizzbuzz` ベンチマークにおいては、1.4倍高速化されています [[Bug #10212]](https://bugs.ruby-lang.org/issues/10212)。
* `block` がブロックパラメータである時、`block.call`が高速化されました [[Feature #14330]](https://bugs.ruby-lang.org/issues/14330)
  Ruby 2.5ではブロック渡しの性能が改善されましたが [[Feature #14045]](https://bugs.ruby-lang.org/issues/14045)、加えてRuby 2.6では渡されたブロックの呼び出しも改善されました。
  マイクロベンチマークにおいては2.6倍高速化されています。

## その他の注目すべき 2.5 からの変更点

* $SAFE はプロセスグローバルで扱われることになると共に、0以外を設定した後に0に戻せるようになりました [[Feature #14250]](https://bugs.ruby-lang.org/issues/14250)
* `ERB.new`に`safe_level`を渡すのは非推奨になりました。また、`trim_mode`と`eoutvar`はキーワード引数に変更されました。 [[Feature #14256]](https://bugs.ruby-lang.org/issues/14256)
* RubyGems 3.0.0.beta2 をマージしました。 `--ri` と `--rdoc` オプションは使えなくなりました。`--document` または `--no-document` を利用してください。
* [Bundler](https://github.com/bundler/bundler) を Default gems として標準添付しました。

その他詳細については、[NEWS](https://github.com/ruby/ruby/blob/v2_6_0_preview3/NEWS) ファイルまたは[コミットログ](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_preview3)を参照してください。

なお、こうした変更により、Ruby 2.5.0 以降では [6474 個のファイルに変更が加えられ、171888 行の追加と 46617 行の削除が行われました](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_preview3) !

みなさんもRuby 2.6.0-preview3で楽しいプログラミングを！

## Download

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview3.tar.gz>

      SIZE:   17071670 bytes
      SHA1:   67836fda11fa91e0b988a6cc07989fbceda025b4
      SHA256: 60243e3bd9661e37675009ab66ba63beacf5dec748885b9b93916909f965f27a
      SHA512: 877278cd6e9b947f5bb6ed78136efb232dcc9c5c218b7236576171e7c3cd7f6b7d10d07d8402014a14aba1fcd1913a4370f0725c561ead41d8a3fe92029f7f76

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview3.zip>

      SIZE:   21537655 bytes
      SHA1:   45f3c90dfffe03b746f21f24152666e361cbb41a
      SHA256: 9152af9e700349dcfa2eec196dd91587d42d70a6837fa2c415ebba1167587be1
      SHA512: 335de36cf56706326f4acc4bbd35be01e0ac5fff30d0a69b2e1630ba4c78f0e711822d1623d0099a517c824b154917d2f60be192dfb143a422cf1d17b38e1183

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview3.tar.bz2>

      SIZE:   14973451 bytes
      SHA1:   5f2df5d8c5a3888ccb915d36a3532ba32cda8791
      SHA256: 1f09a2ac1ab26721923cbf4b9302a66d36bb302dc45e72112b41d6fccc5b5931
      SHA512: d1693625723796e8902f3e4c4fae444f2912af9173489f7cf18c99db2a217afc971b082fce7089e39f8edd54d762d2b4e72843c8306ed29b05ccb15ac03dbb5b

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview3.tar.xz>

      SIZE:   12291692 bytes
      SHA1:   7f8216247745215e9645568e7a02140f9a029b31
      SHA256: 9856d9e0e32df9e5cdf01928eec363d037f1a76dab2abbf828170647beaf64fe
      SHA512: b4d3b17ecf96272c43cd7518c0b54dee63fc1150ad143e1d9c9d708506fe78676c80eb96cc47b8d46d1128bd483a53f16c944963a03d1f99f00131b74714df7b
