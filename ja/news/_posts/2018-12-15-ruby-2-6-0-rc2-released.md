---
layout: news_post
title: "Ruby 2.6.0-rc2 Released"
author: "naruse"
translator:
date: 2018-12-15 00:00:00 +0000
lang: ja
---

Ruby 2.6.0に向けた二番目のリリース候補である、Ruby 2.6.0-rc2がリリースされました。

Ruby 2.6.0-rc2 は添付する Bundler のバージョンを 2.0 から 1.17 にダウングレードしています。


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

* `rescue` 無しの `else` が文法エラーとなるようになりました  [EXPERIMENTAL][[Feature #14606]](https://bugs.ruby-lang.org/issues/14606)

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

その他詳細については、[NEWS](https://github.com/ruby/ruby/blob/v2_6_0_rc2/NEWS) ファイルまたは[コミットログ](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_rc2)を参照してください。

なお、こうした変更により、Ruby 2.5.0 以降では [6411 個のファイルに変更が加えられ、228864 行の追加と 97600 行の削除が行われました](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_rc2) !

みなさんもRuby 2.6.0-rc2で楽しいプログラミングを！

## Download

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-rc2.tar.gz>

      SIZE:   16723556 bytes
      SHA1:   a4d7f8c8c3584a60fe1a57d03d80162361fe3c78
      SHA256: 9c0245e96379246040f1fd0978f8e447e7f47cdccbdaffdb83302a995276b62b
      SHA512: 789f608f93db6e12835911f3105d9abe2fabb67cd22dc3bafdff38716ac56974925738e7f7788ebef5bdf67b6fd91f84a4ee78a3e5d072cfc8ee0972de737b08

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-rc2.zip>

      SIZE:   20643747 bytes
      SHA1:   c1a2898949d929dd952880f1c1c2bac2ef2609b4
      SHA256: e8a446cf1f2ffc14483604de0a5e12c2578dd2f672ae87798ca2bbb9b7b73899
      SHA512: 2d06feae13f485f5da59574672b14d03881ed532d652648f94e2435f5d81df623b5ef532b8ba8e0b9bc4ee6baf7c0328a5610eab753a9020a0fea2673254c76c

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-rc2.tar.bz2>

      SIZE:   14581998 bytes
      SHA1:   94bbee97de4955e67effb7f512c58300617a3a09
      SHA256: b3d03e471e3136f43bb948013d4f4974abb63d478e8ff7ec2741b22750a3ec50
      SHA512: 9bfbe83fd3699b71bae2350801d8c967eb128e79b62a9d36fc0f011b83c53cab28a280939f4cc9f0a28f9bf02dce8eea30866ca4d06480dc44289400abf580ba

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-rc2.tar.xz>

      SIZE:   11908088 bytes
      SHA1:   13a7f06d832dc28989e3e4321490a6ba528ed023
      SHA256: d620b3d87b3190867304067f3ce77f5305f7ec1b2e73b09c17710c97c028986d
      SHA512: a3dc43c0bc70dfdb9ff0d18b5b9797bbf332524f5d3bbb7940cf4e32286ca715808acfd11ebf3cdbe358a2466b7c6b5be3a7a784af7eb95c071fe1f8b4ab1261
