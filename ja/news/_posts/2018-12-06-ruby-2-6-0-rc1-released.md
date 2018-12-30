---
layout: news_post
title: "Ruby 2.6.0-rc1 Released"
author: "naruse"
translator:
date: 2018-12-06 00:00:00 +0000
lang: ja
---

Ruby 2.6.0に向けた最初のリリース候補である、Ruby 2.6.0-rc1がリリースされました。

Ruby 2.6.0-rc1は、リリース前に出されるRelease Candidateに向けて最新の機能を試せるようにするためリリースされています。

## JIT

Ruby 2.6ではJIT (Just-in-time) コンパイラが導入されました。

JITコンパイラはあらゆるRubyプログラムの実行を高速化することを目的としています。
他言語の一般的なJITコンパイラと異なり、RubyのJITコンパイラはC言語のソースコードをファイルとしてディスクに書き、通常のCコンパイラを用いてネイティブコードに変換することでJITコンパイルを行うという手法を用いています。(参考: [MJIT organization by Vladimir Makarov](https://github.com/vnmakarov/ruby/tree/rtl_mjit_branch#mjit-organization))

JITコンパイルを有効にするには `--jit` オプションをコマンドラインまたは$RUBYOPT環境変数を指定します。`--jit-verbose=1`を指定すれば指定すれば実行中のJITコンパイルの基本的な情報を表示します。その他のオプションについては `ruby --help` を参照ください。

今回のリリースはこのJITコンパイル機能を皆さんの環境で動作を確認して頂くとともに、セキュリティ上の問題が無いかを早期に確認するために行っています。
現在のJITコンパイラを利用するためには、GCC、Clang、あるいはMicrosoft VC++によってビルドされたRubyでかつ、そのコンパイラが実行時に利用可能である必要があります。

Ruby 2.6.0-rc1の時点で、OptcarrotというCPU負荷中心のベンチマークにおいてRuby 2.5の約1.7倍の性能向上を達成しました。 <https://gist.github.com/k0kubun/d7f54d96f8e501bbbc78b927640f4208>
Railsアプリケーションなどのメモリ負荷の高い環境における性能は現在改善中です。

引き続き新時代のRubyの実効性能にご期待ください。

## RubyVM::AbstractSyntaxTree [Experimental]

Ruby 2.6では `RubyVM::AbstractSyntaxTree` モジュールが導入されました。

このモジュールには、文字列をパースしてAST(抽象構文木)のNodeを返す`parse`メソッド、ファイルをパースする`parse_file`メソッドが実装されています。
`RubyVM::AbstractSyntaxTree::Node` も導入されました。このクラスのインスタンスから位置情報や子ノードを取得することができます。この機能はexperimentalです。また、ASTの構造に関する互換性は保証されていません。

## 新機能

* `Kernel#yield_self` の別名として `then` が追加されました [[Feature #14594]](https://bugs.ruby-lang.org/issues/14594)

* `rescue` 無しの `else` が文法エラーとなるようになりました  [EXPERIMENTAL]

* ASCII以外の大文字でも定数を定義出来るようになりました [[Feature #13770]](https://bugs.ruby-lang.org/issues/13770)

* 終端なしRange [[Feature #12912]](https://bugs.ruby-lang.org/issues/12912)

  終端なしRange `(1..)` が導入されました。これは終端を持ちません。これが典型的な用途です:

      ary[1..]                          # マジックナンバー -1 なしで ary[1..-1] と同じ意味
      (1..).each {|index| ... }         # index が 1 から始まる無限ループ
      ary.zip(1..) {|elem, index| ... } # ary.each.with_index(1) { ... }

* `Binding#source_location` の追加 [[Feature #14230]](https://bugs.ruby-lang.org/issues/14230)
  * `binding`のソースコード上の位置を `__FILE__` と `__LINE__` の二要素配列として返します。従来でも `eval("[__FILE__, __LINE__]", binding)` とすることでこれらの情報は得られましたが、将来的に `Kernel#eval` はbindingのソースコード行を無視する変更を予定しているため [[Bug #4352]](https://bugs.ruby-lang.org/issues/4352)、この新しいメソッドを用いることが今後は推奨されます。

* `Kernel#system` の失敗時に、falseを返す代わりに例外を上げさせる `:exception` オプションを追加 [[Feature #14386]](https://bugs.ruby-lang.org/issues/14386)

* Coverage の oneshot_lines モードの追加 [[Feature#15022]](https://bugs.ruby-lang.org/issues/15022)
  * This mode checks "whether each line was executed at least once or not", instead of "how many times each line was executed".  A hook for each line is fired at most once, and after it is fired the hook flag is removed, i.e., it runs with zero overhead.
  * Add `:oneshot_lines` keyword argument to Coverage.start.
  * Add `:stop` and `:clear` keyword arguments to Coverage.result. If `clear` is true, it clears the counters to zero.  If `stop` is true, it disables coverage measurement.
  * Coverage.line_stub, which is a simple helper function that creates the "stub" of line coverage from a given source code.

* `FileUtils#cp_lr`.  [[Feature #4189]](https://bugs.ruby-lang.org/issues/4189)

## パフォーマンスの改善

* 後述の`$SAFE`の変更に伴って考慮すべきことが減ったため、`Proc#call`が高速化されました [[Feature #14318]](https://bugs.ruby-lang.org/issues/14318)
  `Proc#call` を大量に呼び出す `lc_fizzbuzz` ベンチマークにおいては、1.4倍高速化されています [[Bug #10212]](https://bugs.ruby-lang.org/issues/10212)。
* `block` がブロックパラメータである時、`block.call`が高速化されました [[Feature #14330]](https://bugs.ruby-lang.org/issues/14330)
  Ruby 2.5ではブロック渡しの性能が改善されましたが [[Feature #14045]](https://bugs.ruby-lang.org/issues/14045)、加えてRuby 2.6では渡されたブロックの呼び出しも改善されました。
  マイクロベンチマークにおいては2.6倍高速化されています。
* Transient Heap (theap) is introduced. [[Bug #14858]](https://bugs.ruby-lang.org/issues/14858) [[Feature #14989]](https://bugs.ruby-lang.org/issues/14989)
  theap is managed heap for short-living memory objects which are pointed by
  specific classes (Array, Hash, Object, and Struct). For example, making small
  and short-living Hash object is x2 faster. With rdoc benchmark, we observed
  6-7% performance improvement.

## その他の注目すべき 2.5 からの変更点

* `$SAFE` はプロセスグローバルで扱われることになると共に、`0`以外を設定した後に`0`に戻せるようになりました [[Feature #14250]](https://bugs.ruby-lang.org/issues/14250)
* `ERB.new`に`safe_level`を渡すのは非推奨になりました。また、`trim_mode`と`eoutvar`はキーワード引数に変更されました。 [[Feature #14256]](https://bugs.ruby-lang.org/issues/14256)
* サポートする Unicode のバージョンを 11 に更新しました。Ruby 2.6 では今後の TEENY リリースで、12 そして 12.1 への更新が予定されています。
* RubyGems 3.0.0.beta3 をマージしました。 `--ri` と `--rdoc` オプションは使えなくなりました。`--document` または `--no-document` を利用してください。
* [Bundler](https://github.com/bundler/bundler) を Default gems として標準添付しました。

その他詳細については、[NEWS](https://github.com/ruby/ruby/blob/v2_6_0_rc1/NEWS) ファイルまたは[コミットログ](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_rc1)を参照してください。

なお、こうした変更により、Ruby 2.5.0 以降では [6376 個のファイルに変更が加えられ、227364 行の追加と 51599 行の削除が行われました](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_rc1) !

みなさんもRuby 2.6.0-rc1で楽しいプログラミングを！

## Download

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-rc1.tar.gz>

      SIZE:   16823448 bytes
      SHA1:   889db7731fd43f6dbf7f31ffdb0a29bba1a8d356
      SHA256: 6d6183639ed9c02320d7132e97c65489a39e24d8b55fc4ed35ac53d1189cb61d
      SHA512: ad101adee5c43f3645561e73970f15d4e9141f707da69a92e224575c665949e18ca53389e5315fca2ea3934d77967a59e304353cde4a915537e7c4e4ee20be73

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-rc1.zip>

      SIZE:   20737499 bytes
      SHA1:   457e39aee1978da5e42af42a6ad230421544aa07
      SHA256: 2bcdf468de499e4d6983d60d63dcc883f4c54fdc05a08a54eb93d315477bc4cc
      SHA512: 0842fae8a199f6c1e76f5d775edbf468e18a54f0419324eb73595e0268c728c71733371d71dc2fa342105dbc487987ca5556948a9ef067276a7b5f552462802a

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-rc1.tar.bz2>

      SIZE:   14607078 bytes
      SHA1:   269fe9d414d7731e4a63959fadffe5c50c08ce0e
      SHA256: b4e9c0e8801946e9f0baba30948955f4341e9e04f363c206b7bd774208053eb5
      SHA512: cbd6281b2aab6fbce3f699c1ab57e5423304dca7a547a0b3cd4e8e980326dc7b85b2ca2bfaf3f3a648d40f4222fdf1740d81d422790ee7ae1ba1ed33eb11e3e8

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-rc1.tar.xz>

      SIZE:   11851908 bytes
      SHA1:   3b93fdf1c5bd969ab4fe0a8176a6cf64e4597e6e
      SHA256: 21d9d54c20e45ccacecf8bea4dfccd05edc52479c776381ae98ef6a7b4afa739
      SHA512: 3d93d8d80e4900e8b3a27f904ed60581cebc6c55f4ab7acafc81e95001f92f3ea4ddec2da6169b1ed5e0146f7b7c35c1c13b3243955d5825c72170834fe933f3
