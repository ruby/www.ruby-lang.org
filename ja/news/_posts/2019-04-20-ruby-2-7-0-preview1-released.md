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

<video autoplay="autoplay" loop="loop" width="478" height="202">
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

      SIZE:   16020966 bytes
      SHA1:   f968d0c6117a7767af0b354458195de1df628b93
      SHA256: b61dba9ed01e855000111964363fbd691219ab3c567455434717ecba962747ea
      SHA512: 820ac03c08fd6e8283275a0d37caac9787afb85426bbb27e2105d8007bbc7ad6a35b2b40c8af81cdbb7a00347d44e92b5ff9b6e7f48f22d05584cedb85578409
* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview1.zip>

      SIZE:   20283209 bytes
      SHA1:   fc31cb0620962f0aa73c902edfc8523ec5b2a2ec
      SHA256: 59da2314822add396f68ce3e8e43e98843d41f4eab2354edc7f793a1ec3f3359
      SHA512: e6726f21dc5e90f42e762a81cbf88caef325fe2d589d75a81d82663652695ed94b3be6e12fe238fc82e5caebb16e626456d9e9dfa4ecc6a55e532ba372b2d4de
* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview1.tar.bz2>

      SIZE:   14040553 bytes
      SHA1:   0a03aa856d87110e14a621d5bf7378de59a9d682
      SHA256: b20c80adc1324c0ec87bf3f4a66b837771d7a30fc876d83e68e519c623cf0369
      SHA512: 282d51ab6a76f40014e7c1738a1a02484e12bd52057db953e356b300974f5a1603a14dc23e436587870767213816c5adda335e6f8716de02c8fd853c85447250
* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview1.tar.xz>

      SIZE:   11440260 bytes
      SHA1:   c7297e4a9e81657a9c8731da8de2e2aa4d4879c3
      SHA256: 540f11753f5805c1bf560c54a44d1ea04414217c7d319cac165de964e269399f
      SHA512: 78afd2b167658d0edb368a3f5f91446a5f6f63b451bfc1966af8964579bc74f6c6a2d227c8715ab742e97c6895ce4006b56ba0eed97b6effcd93555b43d90313

## Ruby とは

Rubyはまつもとゆきひろ (Matz) によって1993年に開発が始められ、今もオープンソースソフトウェアとして開発が続けられています。Rubyは様々なプラットフォームで動き、世界中で、特にWebアプリケーション開発のために使われています。
