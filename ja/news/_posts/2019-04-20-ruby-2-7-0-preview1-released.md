---
layout: news_post
title: "Ruby 2.7.0-preview1 リリース"
author: "naruse"
translator:
date: 2019-04-20 00:00:00 +0000
lang: ja
---

Ruby 2.7シリーズの最初のプレビュー版である、Ruby 2.7.0-preview1をリリースします。

プレビュー版は、年末の正式リリースに向け、新たな機能を試し、フィードバックを集めるために提供されています。
Ruby 2.7.0-preview1では、多くの新しい機能やパフォーマンスの改善が含まれています。 その一部を以下に紹介します。

## Compaction GC

断片化したメモリをデフラグするCompaction GCが導入されました。

一部のマルチスレッドなRubyプログラムを長期間動かし、マーク&スイープ型GCを何度も実行していると、メモリが断片化してメモリ使用量の増大や性能の劣化を招くことが知られています。

Ruby 2.7では`GC.compact` というメソッドを導入し、ヒープをコンパクションすることが出来るようになります。ヒープ内の生存しているオブジェクトを他のページに移動し、不要なページを解放できるようになるとともに、ヒープをCoW (Copy on Write) フレンドリーにすることが出来ます。 [#15626](https://bugs.ruby-lang.org/issues/15626)

既知の問題: MJITと同時に用いると Segmentation Fault を引き起こすことがあります。MJITとCompation GCを同時に使わないようにして下さい。

## Pattern Matching [Experimental]

関数型言語で広く使われているパターンマッチという機能が実験的に導入されました。
渡されたオブジェクトの構造がパターンと一致するかどうかを調べ、一致した場合にその値を変数に代入するといったことができるようになります。 [#14683](https://bugs.ruby-lang.org/issues/14683) [#14787](https://bugs.ruby-lang.org/issues/14787) [#14918](https://bugs.ruby-lang.org/issues/14918)

```ruby
case JSON.parse('{...}', symbolize_names: true)
in {name: "Alice", children: [{name: "Bob", age: age}]}
  p age
  ...
end
```

## REPL improvement

Ruby に添付されている REPL (Read-Eval-Print-Loop) である `irb` で、複数行編集がサポートされました。これは `reline` という `readline` 互換のピュア Ruby 実装によるものです。
また、rdoc 連携も提供されるようになっています。`irb` 内で、クラス、モジュール、メソッドのリファレンスをその場で確認できるようになりました。 [#14918](https://bugs.ruby-lang.org/issues/14918)

<video autoplay="autoplay" loop="loop" width="478" height="202">
  <source src="//ftp.ruby-lang.org/pub/media/irb_multiline.mp4" type="video/mp4">
</video>

## 主要な新機能

* メソッド参照演算子 <code>.:</code> が試験的に導入されました。[#12125]( https://bugs.ruby-lang.org/issues/12125) [#13581]( https://bugs.ruby-lang.org/issues/13581)

* デフォルトのブロックの仮引数として番号指定パラメータが試験的に導入されました。[#4475](https://bugs.ruby-lang.org/issues/4475)

* 開始値省略範囲式が試験的に導入されました。これは終了値省略範囲式ほど有用ではないと思われますが、しかし DSL のような目的には役立つかもしれません。 [#14912](https://bugs.ruby-lang.org/issues/14912)

      ary[..3]  # identical to ary[0..3]
      where(sales: ..100)


## パフォーマンスの改善

* JIT [Experimental]

  * 最適化の際の仮定が無効とされた場合、JIT 化されていたコードがより最適化度が低いコードに再コンパイルされるようになりました。

  * あるメソッドが「純粋」であると判定された場合、メソッドのインライン化が行われるようになりました。この最適化はまだ実験的であり、また多数のメソッドが今はまだ「純粋」と判定されないままです。

  * +--jit-min-calls+ オプションのデフォルト値が 5 から 10,000 に変更されました。

  * +--jit-max-cache+ オプションのデフォルト値が 1,000 から 100 に変更されました。


## その他の注目すべき 2.6 からの変更点

* ブロックを渡すメソッド呼び出し中の、ブロックを伴わない Proc.new と proc が警告されるようになりました。

* ブロックを渡すメソッド呼び出し中の、ブロックを伴わない lambda はエラーとなるようになりました。

* Unicode および Emoji のバージョンが 11.0.0 から 12.0.0 になりました。[Feature #15321]

* Unicode のバージョンが 12.1.0 となり、新元号「令和」を表す U+32FF がサポートされました。[Feature #15195]

* Date.jisx0301, Date#jisx0301, および Date.parse で非公式に新元号に仮対応しました。これは JIS X 0301 の新しい版で正式な仕様が決定されるまでの暫定的なものです。[Feature #15742]

* Ruby のビルドに C99 に対応したコンパイラが必要になりました。[Misc #15347]
  * 本件についての詳細: https://bugs.ruby-lang.org/projects/ruby-trunk/wiki/C99

なお、こうした変更により、Ruby 2.6.0 以降では [6376 個のファイルに変更が加えられ、227364 行の追加と 51599 行の削除が行われました](https://github.com/ruby/ruby/compare/v2_6_0...v2_7_0) !

Ruby 2.7 でプログラミングをお楽しみください！

## Download



## Ruby とは

Rubyはまつもとゆきひろ (Matz) によって1993年に開発が始められ、今もオープンソースソフトウェアとして開発が続けられています。Rubyは様々なプラットフォームで動き、世界中で、特にWebアプリケーション開発のために使われています。
