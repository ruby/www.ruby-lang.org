---
layout: news_post
title: "Ruby 2.6.0 Released"
author: "naruse"
translator:
date: 2018-12-25 00:00:00 +0000
lang: ja
---

Ruby 2.6シリーズの最初の安定版である、Ruby 2.6.0がリリースされました。

Ruby 2.6.0には、多くの新しい機能やパフォーマンスの改善が含まれています。 その一部を以下に紹介します。

## JIT [Experimental]

Ruby 2.6ではJIT (Just-in-time) コンパイラが導入されました。

JITコンパイラはあらゆるRubyプログラムの実行を高速化することを目的としています。
他言語の一般的なJITコンパイラと異なり、RubyのJITコンパイラはC言語のソースコードをファイルとしてディスクに書き、通常のCコンパイラを用いてネイティブコードに変換することでJITコンパイルを行うという手法を用いています。(参考: [MJIT organization by Vladimir Makarov](https://bugs.ruby-lang.org/projects/ruby/wiki/MJIT#MJIT-organization))

JITコンパイルを有効にするには `--jit` オプションをコマンドラインまたは$RUBYOPT環境変数を指定します。`--jit-verbose=1`を指定すれば指定すれば実行中のJITコンパイルの基本的な情報を表示します。その他のオプションについては `ruby --help` か[ドキュメント](https://bugs.ruby-lang.org/projects/ruby/wiki/MJIT#Basic-usage)をご参照ください。

現在のJITコンパイラを利用するためには、GCC、Clang、あるいはMicrosoft VC++によってビルドされたRubyでありかつ、そのコンパイラが実行時に利用可能である必要があります。

Ruby 2.6.0の時点で、[Optcarrot](https://github.com/mame/optcarrot)というCPU負荷中心のベンチマークにおいてRuby 2.5の[約1.7倍の性能向上](https://gist.github.com/k0kubun/d7f54d96f8e501bbbc78b927640f4208)を達成しました。一方、Railsアプリケーションなどのメモリ負荷の高い環境における性能は現在改善中で、まだ性能向上が期待できる状態には達しておりません。詳細は[Ruby 2.6 JIT - Progress and Future](https://medium.com/@k0kubun/ruby-2-6-jit-progress-and-future-84e0a830ecbf)をご覧ください。

引き続き新時代のRubyの実効性能にご期待ください。

## `RubyVM::AbstractSyntaxTree` [Experimental]

Ruby 2.6では抽象構文木を扱う `RubyVM::AbstractSyntaxTree` モジュールが導入されました。

このモジュールには、文字列をパースしてAST(抽象構文木)のNodeを返す`parse`メソッド、ファイルをパースする`parse_file`メソッドが実装されています。
`RubyVM::AbstractSyntaxTree::Node` も導入されました。このクラスのインスタンスから位置情報や子ノードを取得することができます。この機能はexperimentalです。また、ASTの構造に関する互換性は保証されていません。

## 主要な新機能

* `Kernel#yield_self` の別名として `then` が追加されました [[Feature #14594]](https://bugs.ruby-lang.org/issues/14594)

* ASCII以外の大文字でも定数を定義出来るようになりました [[Feature #13770]](https://bugs.ruby-lang.org/issues/13770)

* 終端なしRange [[Feature #12912]](https://bugs.ruby-lang.org/issues/12912)

  終わりがないRange `(1..)` が書けるようになりました。始点から無限大までのような範囲を直観的に表現できるようになります。以下に典型的な用途を示します。

      ary[1..]                          # マジックナンバー -1 なしで ary[1..-1] と同じ意味
      (1..).each {|index| ... }         # index が 1 から始まる無限ループ
      ary.zip(1..) {|elem, index| ... } # ary.each.with_index(1) { ... }

* `Enumerable#chain` と `Enumerator#+` が追加されました [[Feature #15144]](https://bugs.ruby-lang.org/issues/15144)

* Procを関数合成するオペレータ `Proc#<<` 、`Proc#>>` が追加されました [[Feature #6284]](https://bugs.ruby-lang.org/issues/6284)

      f = proc{|x| x + 2}
      g = proc{|x| x * 3}
      (f << g).call(3) # -> 11; identical to f(g(3))
      (f >> g).call(3) # -> 15; identical to g(f(3))

* `Binding#source_location` の追加 [[Feature #14230]](https://bugs.ruby-lang.org/issues/14230)

  * `binding`のソースコード上の位置を `__FILE__` と `__LINE__` の二要素配列として返します。従来でも `eval("[__FILE__, __LINE__]", binding)` とすることでこれらの情報は得られましたが、将来的に `Kernel#eval` はbindingのソースコード行を無視する変更を予定しているため [[Bug #4352]](https://bugs.ruby-lang.org/issues/4352)、この新しいメソッドを用いることが今後は推奨されます。

* `Kernel#system` の失敗時に、falseを返す代わりに例外を上げさせる `exception:` オプションを追加 [[Feature #14386]](https://bugs.ruby-lang.org/issues/14386)

* Coverage の oneshot_lines モードの追加 [[Feature#15022]](https://bugs.ruby-lang.org/issues/15022)

  * コードカバレッジの測定で、「各ソースコード行を何回実行したか」ではなく、「各ソースコード行を1回でも実行したか否か」を記録するモード `oneshot_lines` が導入されました。各行に設定されたフックは高々1回しか実行されません。1回実行されたフックは除去されるので、その後はオーバーヘッド無しで実行されます。
  * `Coverage.start` に `oneshot_lines:` キーワード引数を追加しました。
  * `Coverage.result` に `stop:` と `clear:` キーワードを追加しました。`clear` が真のとき、カウンタが0クリアされます。`stop`が真のとき、カバレッジ測定を終了します。
  * `Coverage.line_stub` を追加しました。これは、指定されたソースコードの行カバレッジの「スタブ」を生成する簡単な補助関数です。

* `FileUtils#cp_lr` が追加されました。ディレクトリ構造を再帰的に再現し、各ファイルは元のファイルへのハードリンクとするコピーです（cp -lrと同様の効果）。[[Feature #4189]](https://bugs.ruby-lang.org/issues/4189)

## パフォーマンスの改善

* 後述の`$SAFE`の変更に伴って考慮すべきことが減ったため、`Proc#call`が高速化されました [[Feature #14318]](https://bugs.ruby-lang.org/issues/14318)
  `Proc#call` を大量に呼び出す `lc_fizzbuzz` ベンチマークにおいては、1.4倍高速化されています [[Bug #10212]](https://bugs.ruby-lang.org/issues/10212)。

* `block` がブロックパラメータである時、`block.call`が高速化されました [[Feature #14330]](https://bugs.ruby-lang.org/issues/14330)
  Ruby 2.5ではブロック渡しの性能が改善されましたが [[Feature #14045]](https://bugs.ruby-lang.org/issues/14045)、加えてRuby 2.6では渡されたブロックの呼び出しも改善されました。マイクロベンチマークは2.6倍の高速化が確認されています。

* Transient Heap (`theap`) が導入されました。[[Bug #14858]](https://bugs.ruby-lang.org/issues/14858) [[Feature #14989]](https://bugs.ruby-lang.org/issues/14989)

  theap は、特定のクラスが利用する短寿命メモリを管理します。現状、`Array`、`Object`（ユーザー定義オブジェクト）、`Struct`および8要素以下の小さな`Hash`オブジェクトが theap に対応しています。小さな短寿命`Hash`オブジェクトの生成は2倍程度高速になりました。`rdoc` ベンチマークでは、6～7%の性能改善が計測されています。

* コルーチンをネイティブ実装することによって、Fiberのコンテキスト切り替えの性能が大幅に向上しました（`arm32`、`arm64`、`ppc64le`、`win32`、`win64`、`x86`、`amd64`)。[[Feature ＃14739]](https://bugs.ruby-lang.org/issues/14739)

  `Fiber.yield`と`Fiber＃resume`は64ビットLinuxでは約5倍高速です。`Fiber`を多用するプログラムでは、全体で最大5％の改善が見込まれます。

## その他の注目すべき 2.5 からの変更点

* `$SAFE` はプロセスグローバルで扱われることになると共に、`0`以外を設定した後に`0`に戻せるようになりました [[Feature #14250]](https://bugs.ruby-lang.org/issues/14250)

* `ERB.new`に`safe_level`を渡すのは非推奨になりました。また、`trim_mode`と`eoutvar`はキーワード引数に変更されました。 [[Feature #14256]](https://bugs.ruby-lang.org/issues/14256)

* サポートする Unicode のバージョンを 11 に更新しました。[新元号用合字対応](http://blog.unicode.org/2018/09/new-japanese-era.html)のため、Ruby 2.6 では今後の TEENY リリースで、12 そして 12.1 への更新が予定されています。

* RubyGems 3.0.1 をマージしました。 `--ri` と `--rdoc` オプションは使えなくなりました。`--document` または `--no-document` を利用してください。

* [Bundler](https://github.com/bundler/bundler) を Default gems として標準添付しました。

* `rescue` 無しの `else` が文法エラーとなるようになりました  [EXPERIMENTAL][[Feature #14606]](https://bugs.ruby-lang.org/issues/14606)

その他詳細については、[NEWS](https://github.com/ruby/ruby/blob/v2_6_0/NEWS) ファイルまたは[コミットログ](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0)を参照してください。

なお、こうした変更により、Ruby 2.5.0 以降では [6437 個のファイルに変更が加えられ、231471 行の追加と 98498 行の削除が行われました](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0) !

メリークリスマス。Ruby 2.6 とともに良いお年を！

## Download

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0.tar.gz>

      SIZE:   16687800 bytes
      SHA1:   c95f4e86e21390270dad3ebb94491fd42ee2ce69
      SHA256: f3c35b924a11c88ff111f0956ded3cdc12c90c04b72b266ac61076d3697fc072
      SHA512: 01f886b0c0782a06315c4a46414e9f2b66ee634ba4349c8e0697f511793ae3c56d2ad3cad6563f2b0fdcedf0ff3eba51b9afab907e7e1ac243475772f8688382

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0.zip>

      SIZE:   20582054 bytes
      SHA1:   a804e63d18da12107e1d101918a3d8f4c5462a27
      SHA256: 8a4fb6ca58202495c9682cb88effd804398bd0ef023e3e36f001ca88d8b5855a
      SHA512: 16d66ec4a2c6a2e928d5b50e094a5efa481ac6e4d5ed77459d351ef19fe692aa59b68307e3e25229eec5f30ae2f9adae2663bafe9c9d44bfb45d3833d77839d4

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0.tar.bz2>

      SIZE:   14585856 bytes
      SHA1:   b8638eb806efbf7b6af87b24ccc6ad915f262318
      SHA256: c89ca663ad9a6238f4b1ec4d04c7dff630560c6e6eca6d30857c4d394f01a599
      SHA512: ca3daf9acf11d3db2900af21b66231bd1f025427a9d2212b35f6137ca03f77f57171ddfdb99022c8c8bcd730ff92a7a4af54e8a2a770a67d8e16c5807aa391f1

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0.tar.xz>

      SIZE:   11918536 bytes
      SHA1:   9ddaeba3505d2855460c8c653159fc0ac8928c0f
      SHA256: acb00f04374899ba8ee74bbbcb9b35c5c6b1fd229f1876554ee76f0f1710ff5f
      SHA512: c56eaf85ef7b79deb34ee4590b143c07f4fc83eb79775290761aee5a7c63374659613538a41f25706ed6e19e49d5c67a1014c24d17f29948294c7abd0b0fcea8
