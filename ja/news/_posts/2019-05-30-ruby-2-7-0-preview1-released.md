---
layout: news_post
title: "Ruby 2.7.0-preview1 リリース"
author: "naruse"
translator:
date: 2019-05-30 00:00:00 +0000
lang: ja
---

Ruby 2.7シリーズの最初のプレビュー版である、Ruby 2.7.0-preview1をリリースします。

プレビュー版は、年末の正式リリースに向け、新たな機能を試し、フィードバックを集めるために提供されています。
Ruby 2.7.0-preview1では、多くの新しい機能やパフォーマンスの改善が含まれています。 その一部を以下に紹介します。

## Compaction GC

断片化したメモリをデフラグするCompaction GCが導入されました。

一部のマルチスレッドなRubyプログラムを長期間動かし、マーク&スイープ型GCを何度も実行していると、メモリが断片化してメモリ使用量の増大や性能の劣化を招くことが知られています。

Ruby 2.7では`GC.compact` というメソッドを導入し、ヒープをコンパクションすることが出来るようになります。ヒープ内の生存しているオブジェクトを他のページに移動し、不要なページを解放できるようになるとともに、ヒープをCoW (Copy on Write) フレンドリーにすることが出来ます。 [#15626](https://bugs.ruby-lang.org/issues/15626)

## Pattern Matching [Experimental]

関数型言語で広く使われているパターンマッチという機能が実験的に導入されました。
渡されたオブジェクトの構造がパターンと一致するかどうかを調べ、一致した場合にその値を変数に代入するといったことができるようになります。 [#14912](https://bugs.ruby-lang.org/issues/14912)

```ruby
case JSON.parse('{...}', symbolize_names: true)
in {name: "Alice", children: [{name: "Bob", age: age}]}
  p age
  ...
end
```

詳細については https://speakerdeck.com/k_tsj/pattern-matching-new-feature-in-ruby-2-dot-7 を参照してください。

## REPL improvement

Ruby に添付されている REPL (Read-Eval-Print-Loop) である `irb` で、複数行編集がサポートされました。これは `reline` という `readline` 互換のピュア Ruby 実装によるものです。
また、rdoc 連携も提供されるようになっています。`irb` 内で、クラス、モジュール、メソッドのリファレンスをその場で確認できるようになりました。 [#14683](https://bugs.ruby-lang.org/issues/14683), [#14787](https://bugs.ruby-lang.org/issues/14787), [#14918](https://bugs.ruby-lang.org/issues/14918)
これに加え、`binding.irb`で表示される周辺のコードや、コアクラスのオブジェクトのinspect結果に色がつくようになっています。

<video autoplay="autoplay" controls="controls" muted="muted" width="576" height="259">
  <source src="https://cache.ruby-lang.org/pub/media/irb_improved_with_key_take2.mp4" type="video/mp4">
</video>

## 主要な新機能

* メソッド参照演算子 <code>.:</code> が試験的に導入されました。[#12125](https://bugs.ruby-lang.org/issues/12125), [#13581](https://bugs.ruby-lang.org/issues/13581)

* デフォルトのブロックの仮引数として番号指定パラメータが試験的に導入されました。[#4475](https://bugs.ruby-lang.org/issues/4475)

* 開始値省略範囲式が試験的に導入されました。これは終了値省略範囲式ほど有用ではないと思われますが、しかし DSL のような目的には役立つかもしれません。 [#14799](https://bugs.ruby-lang.org/issues/14799)

      ary[..3]  # identical to ary[0..3]
      rel.where(sales: ..100)

* `Enumerable#tally` が追加されました。各要素の出現回数を数えます。

      ["a", "b", "c", "b"].tally
      #=> {"a"=>1, "b"=>2, "c"=>1}

## パフォーマンスの改善

* JIT [Experimental]

  * 最適化の際の仮定が無効とされた場合、JIT 化されていたコードがより最適化度が低いコードに再コンパイルされるようになりました。

  * あるメソッドが「純粋」であると判定された場合、メソッドのインライン化が行われるようになりました。この最適化はまだ実験的であり、また多数のメソッドが今はまだ「純粋」と判定されないままです。

  * `--jit-min-calls` オプションのデフォルト値が 5 から 10,000 に変更されました。

  * `--jit-max-cache` オプションのデフォルト値が 1,000 から 100 に変更されました。


## その他の注目すべき 2.6 からの変更点

* ブロックを渡すメソッド呼び出し中の、ブロックを伴わない `Proc.new` と `proc` が警告されるようになりました。

* ブロックを渡すメソッド呼び出し中の、ブロックを伴わない `lambda` はエラーとなるようになりました。

* Unicode および Emoji のバージョンが 11.0.0 から 12.0.0 になりました。[[Feature #15321]](https://bugs.ruby-lang.org/issues/15321)

* Unicode のバージョンが 12.1.0 となり、新元号「令和」を表す合字 U+32FF がサポートされました。[[Feature #15195]](https://bugs.ruby-lang.org/issues/15195)

* `Date.jisx0301`, `Date#jisx0301`, および `Date.parse` で非公式に新元号に仮対応しました。これは JIS X 0301 の新しい版で正式な仕様が決定されるまでの暫定的なものです。[[Feature #15742]](https://bugs.ruby-lang.org/issues/15742)

* Ruby のビルドに C99 に対応したコンパイラが必要になりました。[[Misc #15347]](https://bugs.ruby-lang.org/issues/15347)
  * 本件についての詳細: <https://bugs.ruby-lang.org/projects/ruby-trunk/wiki/C99>

なお、こうした変更により、Ruby 2.6.0 以降では [6376 個のファイルに変更が加えられ、227364 行の追加と 51599 行の削除が行われました](https://github.com/ruby/ruby/compare/v2_6_0...v2_7_0_preview1) !

Ruby 2.7 でプログラミングをお楽しみください！

## Download

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview1.tar.gz>

      SIZE:   16020363 bytes
      SHA1:   db070c20aceb235907e6a773dd147a292cb2a7ca
      SHA256: f0305c4d2a78d66c3cf91c3509a027753888d9b7fba28b8e6bc165854a58fc0b
      SHA512: d763a4330d43c7ffe16d20f95e8c695f29fafec7cea96953697dd07079e6daab23266a133c3f4e7a971a1781eb29388bafc305f9ad3a68ba4fed6c72f539dd04
* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview1.zip>

      SIZE:   20283369 bytes
      SHA1:   3ab08e70e15a6d4205c543478abd0dfb9a4aa751
      SHA256: 1ccc2fc75d2eb72b8a684272db5fb657cd1aa560f6eadae16cb5d97d0547c223
      SHA512: 0ff8bd687775c1d34d0e3eeccde7359990d94688ef4914f645db4e8b59586dcdc0817708505c127b1de1bb1406ecc8d1538370113f202e7bc69d8eceb5104383
* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview1.tar.bz2>

      SIZE:   14039220 bytes
      SHA1:   041ce5746424cf07f02282f7c9b774e509de4071
      SHA256: 6b7e57399ac3be3233148e902bf3008fff3ad0b7bb2bb0ec57e6aaa85f79dd8b
      SHA512: e112a0d52509fe4b6954e08c3b67f2fb408784bc0df1c63828728c3f8d88a8917c6451606e2d9f35b6fefaa5ee648b0a3d51417456a5979bde2d079726479a24
* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview1.tar.xz>

      SIZE:   11437508 bytes
      SHA1:   009c197ceb96a6b4330048804e30ba351c3bc15b
      SHA256: 5fa3d54b3610fe57d129b304ca88849663dbd892b7f04a926952a1b254c0565e
      SHA512: 4940e0d879367946823284cf694975d479ce34fd77d3736dc2e4f5d9c601d085821d5112e59e4781d213e6c3dd0e1fa54d1244a32aac07868a1fe70d76b97572

## Ruby とは

Rubyはまつもとゆきひろ (Matz) によって1993年に開発が始められ、今もオープンソースソフトウェアとして開発が続けられています。Rubyは様々なプラットフォームで動き、世界中で、特にWebアプリケーション開発のために使われています。
