---
layout: news_post
title: "Ruby 2.6.0-preview2 Released"
author: "naruse"
translator:
date: 2018-05-31 00:00:00 +0000
lang: ja
---

Ruby 2.6.0に向けた二回目のプレビューである、Ruby 2.6.0-preview2がリリースされました。

Ruby 2.6.0-preview2は、重要な新機能であるJITを含むため、例年よりも早期にリリースすることにしました。
その一部を以下に紹介します。

## JIT

Ruby 2.6ではJIT (Just-in-time) コンパイラが導入されました。

JITコンパイラはあらゆるRubyプログラムの実行を高速化することを目的としています。
他言語の一般的なJITコンパイラと異なり、RubyのJITコンパイラはC言語のソースコードをファイルとしてディスクに書き、通常のCコンパイラを用いてネイティブコードに変換することでJITコンパイルを行うという手法を用いています。(参考: [MJIT organization by Vladimir Makarov](https://github.com/vnmakarov/ruby/tree/rtl_mjit_branch#mjit-organization))

JITコンパイルを有効にするには `--jit` オプションをコマンドラインまたは$RUBYOPT環境変数を指定します。`--jit-verbose=1`を指定すれば指定すれば実行中のJITコンパイルの基本的な情報を表示します。その他のオプションについては `ruby --help` を参照ください。

今回のリリースはこのJITコンパイル機能を皆さんの環境で動作を確認して頂くとともに、セキュリティ上の問題が無いかを早期に確認するために行っています。
現在のJITコンパイラはいくつか制限があり、まずgccまたはclangによってビルドされたRubyでかつ、そのコンパイラが実行時に利用可能である必要があります。また、現在はJITコンパイルの基盤を準備している段階で、少数の最適化のみ実装しています。そのため現在でもいくつかのマイクロベンチマークでは潜在的な速度改善が見られるものの、より大きなプログラム、特にRailsアプリケーションなどではJITコンパイラの性能を計測出来る段階ではありません。

今後はインライン化等を実装することでRubyの性能を桁違いに向上させます。また、Visual Studioを筆頭に、サポートする環境も増やしていきます。

引き続き新時代のRubyの実効性能にご期待ください。

## RubyVM::AST [Experimental]

Ruby 2.6では `RubyVM::AST` モジュールが導入されました。

このモジュールには、文字列をパースしてAST(抽象構文木)のNodeを返す`parse`メソッド、ファイルをパースする`parse_file`メソッドが実装されています。
`RubyVM::AST::Node` も導入されました。このクラスのインスタンスから位置情報や子ノードを取得することができます。この機能はexperimentalであり、互換性は保証されていません。

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

## パフォーマンスの改善

* 後述の$SAFEの変更に伴って考慮すべきことが減ったため、`Proc#call`が高速化されました [[Feature #14318]](https://bugs.ruby-lang.org/issues/14318)
  `Proc#call` を大量に呼び出す `lc_fizzbuzz` ベンチマークにおいては、1.4倍高速化されています [[Bug #10212]](https://bugs.ruby-lang.org/issues/10212)。
* `block` がブロックパラメータである時、`block.call`が高速化されました [[Feature #14330]](https://bugs.ruby-lang.org/issues/14330)
  Ruby 2.5ではブロック渡しの性能が改善されましたが [[Feature #14045]](https://bugs.ruby-lang.org/issues/14045)、加えてRuby 2.6では渡されたブロックの呼び出しも改善されました。
  マイクロベンチマークにおいては2.6倍高速化されています。

## その他の注目すべき 2.5 からの変更点

* $SAFE はプロセスグローバルで扱われることになると共に、0以外を設定した後に0に戻せるようになりました [[Feature #14250]](https://bugs.ruby-lang.org/issues/14250)
* `ERB.new`に`safe_level`を渡すのは非推奨になりました。また、`trim_mode`と`eoutvar`はキーワード引数に変更されました。 [[Feature #14256]](https://bugs.ruby-lang.org/issues/14256)
* RubyGems 3.0.0.beta1 をマージしました

その他詳細については、[NEWS](https://github.com/ruby/ruby/blob/v2_6_0_preview2/NEWS) ファイルまたは[コミットログ](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_preview2)を参照してください。

なお、こうした変更により、Ruby 2.5.0 以降では [4699 個のファイルに変更が加えられ、45744 行の追加と 30885 行の削除が行われました](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_preview2) !

みなさんもRuby 2.6.0-preview2で楽しいプログラミングを！

## Download

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview2.tar.gz>

      SIZE:   16170732 bytes
      SHA1:   6867b00e81af0b70fcb6f1aa7fc22d89d48a7d12
      SHA256: ee15ab35f17c942b1f41bd792f2494f639affff6e03babf44708b72fdbb6de34
      SHA512: 95c5a277785dfeb3006503e1b9ccccefdf6ce29669d4576f0191ee6986ba0e3567fbbed18a8d2b1f147d637434e4a3a4fdf47d84995e10ad4a354950e9092690

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview2.zip>

      SIZE:   19850776 bytes
      SHA1:   eba80a09b552ce3142fd571ff5867a13736d170e
      SHA256: 97fc187b90570fce110d22803a319ab04e68700692b2b6b4e9961886f1a931e5
      SHA512: d5501819635bda64ac3dc717815652b692302b44a7cdf4c08edfa5cb9ec7f79a70fffc534879b316a4a9584825ed3c0948667beae2d7c313de58583931b981f4

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview2.tar.bz2>

      SIZE:   14209461 bytes
      SHA1:   a9b1b4f359601b94b3f5b77115fcbf3790ff69cd
      SHA256: d8ede03d5ad3abd9d2c81cf0ad17a41d22b747c003cc16fd59befb2aaf48f0b2
      SHA512: 3872227e9b1c97c206d19bf1e6ce15a38ee15a26c431b4436605dea67affcf16372358984df76b35e7abaa902c15c16f533ac7af47e3031dea9451bbe459b693

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview2.tar.xz>

      SIZE:   11525372 bytes
      SHA1:   e795abe1a4f828b3d851f7148b4bf6c9d9a7e7fd
      SHA256: 00ddfb5e33dee24469dd0b203597f7ecee66522ebb496f620f5815372ea2d3ec
      SHA512: bef3e90e97d6e58889cd500c591c579b728ca5833022b690182c0bf4d661e437b3a2ca33470dac35fcf693897819b9d7f500c0f71b707e2fcdcb0644028f2c03
