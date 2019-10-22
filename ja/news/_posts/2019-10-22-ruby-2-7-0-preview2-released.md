---
layout: news_post
title: "Ruby 2.7.0-preview2 リリース"
author: "naruse"
translator:
date: 2019-10-22 12:00:00 +0000
lang: ja
---

Ruby 2.7シリーズのプレビュー版である、Ruby 2.7.0-preview2をリリースします。

プレビュー版は、年末の正式リリースに向け、新たな機能を試し、フィードバックを集めるために提供されています。
Ruby 2.7.0-preview2では、多くの新しい機能やパフォーマンスの改善が含まれています。 その一部を以下に紹介します。

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

詳細については [Pattern matching - New feature in Ruby 2.7](https://speakerdeck.com/k_tsj/pattern-matching-new-feature-in-ruby-2-dot-7) を参照してください。

## REPL improvement

Ruby に添付されている REPL (Read-Eval-Print-Loop) である `irb` で、複数行編集がサポートされました。これは `reline` という `readline` 互換のピュア Ruby 実装によるものです。
また、rdoc 連携も提供されるようになっています。`irb` 内で、クラス、モジュール、メソッドのリファレンスをその場で確認できるようになりました。 [#14683](https://bugs.ruby-lang.org/issues/14683), [#14787](https://bugs.ruby-lang.org/issues/14787), [#14918](https://bugs.ruby-lang.org/issues/14918)
これに加え、`binding.irb`で表示される周辺のコードや、コアクラスのオブジェクトのinspect結果に色がつくようになっています。

<video autoplay="autoplay" controls="controls" muted="muted" width="576" height="259">
  <source src="https://cache.ruby-lang.org/pub/media/irb_improved_with_key_take2.mp4" type="video/mp4">
</video>

## キーワード引数を通常の引数から分離

キーワード引数とpositionalな引数（ふつうの引数）の間の自動変換が非推奨となりました。この変換はRuby 3で除去される予定です。[[Feature #14183]](https://bugs.ruby-lang.org/issues/14183)

* メソッド呼び出しにおいて最後の引数としてハッシュオブジェクトを渡し、他にキーワード引数を渡さず、かつ、呼ばれたメソッドがキーワード引数を受け取るとき、警告が表示されます。キーワード引数として扱いたい場合は、明示的にdouble splat演算子（`**`）を足すことで警告を回避できます。このように書けばRuby 3でも同じ意味で動きます。

    ```ruby
    def foo(key: 42); end; foo({key: 42})   # warned
    def foo(**kw);    end; foo({key: 42})   # warned
    def foo(key: 42); end; foo(**{key: 42}) # OK
    def foo(**kw);    end; foo(**{key: 42}) # OK
    ```

* キーワード引数を受け取るメソッドにキーワード引数を渡すが、必須引数が不足している場合に、キーワード引数は最後の必須引数として解釈され、警告が表示されます。警告を回避するには、キーワードではなく明示的にハッシュとして渡してください。このように書けばRuby 3でも同じ意味で動きます。

    ```ruby
    def foo(h, **kw); end; foo(key: 42)      # warned
    def foo(h, key: 42); end; foo(key: 42)   # warned
    def foo(h, **kw); end; foo({key: 42})    # OK
    def foo(h, key: 42); end; foo({key: 42}) # OK
    ```

* メソッドがキーワード引数を受け取るがdouble splat引数は受け取らず、かつ、メソッド呼び出しでSymbolと非Symbolの混ざったハッシュを渡す（もしくはハッシュをdouble splatでキーワードとして渡す）場合、ハッシュは分割され、警告が表示されます。Ruby 3でもハッシュの分割を続けたい場合は、呼び出し側で明示的に分けるようにしてください。

    ```ruby
    def foo(h={}, key: 42); end; foo("key" => 43, key: 42)   # warned
    def foo(h={}, key: 42); end; foo({"key" => 43, key: 42}) # warned
    def foo(h={}, key: 42); end; foo({"key" => 43}, key: 42) # OK
    def foo(h={}, key: 42); end; foo({"key" => 43}, key: 42) # OK
    ```

* メソッドがキーワード引数を受け取らず、呼び出し側でキーワード引数を渡した場合、ハッシュの引数としてみなされる挙動は変わらず、警告も表示されません。Ruby 3でもこのコードは動き続ける予定です。

    ```ruby
    def foo(opt={});  end; foo( key: 42 )   # OK
    ```

* メソッドが任意のキーワードを受け取る場合、非Symbolがキーワード引数のキーとして許容されるようになります。[[Feature #14183]](https://bugs.ruby-lang.org/issues/14183)

    ```ruby
    def foo(**kw); p kw; end; foo("str" => 1) #=> {"str"=>1}
    ```

* メソッド定義で<code>**nil</code>と書くことで、このメソッドがキーワードを受け取らないことを明示できるようになりました。このようなメソッドをキーワード引数付きで呼び出すとArgumentErrorになります。[[Feature #14183]](https://bugs.ruby-lang.org/issues/14183)

    ```ruby
    def foo(h, **nil); end; foo(key: 1)       # ArgumentError
    def foo(h, **nil); end; foo(**{key: 1})   # ArgumentError
    def foo(h, **nil); end; foo("str" => 1)   # ArgumentError
    def foo(h, **nil); end; foo({key: 1})     # OK
    def foo(h, **nil); end; foo({"str" => 1}) # OK
    ```

* キーワード引数を受け取らないメソッドに対して空のハッシュをdouble splatで渡すとき、空のハッシュが渡る挙動はなくなりました。ただし、必須引数が不足する場合は空のハッシュが渡され、警告が表示されます。ハッシュの引数として渡したい場合はdouble splatをつけないようにしてください。

    ```ruby
    h = {}; def foo(*a) a end; foo(**h) # []
    h = {}; def foo(a) a end; foo(**h)  # {} and warning
    h = {}; def foo(*a) a end; foo(h)   # [{}]
    h = {}; def foo(a) a end; foo(h)    # {}
    ```

## 主要な新機能

* メソッド参照演算子 <code>.:</code> が試験的に導入されました。[#12125](https://bugs.ruby-lang.org/issues/12125), [#13581](https://bugs.ruby-lang.org/issues/13581)

* デフォルトのブロックの仮引数として番号指定パラメータが試験的に導入されました。[#4475](https://bugs.ruby-lang.org/issues/4475)

* 開始値省略範囲式が試験的に導入されました。これは終了値省略範囲式ほど有用ではないと思われますが、しかし DSL のような目的には役立つかもしれません。 [#14799](https://bugs.ruby-lang.org/issues/14799)

      ary[..3]  # identical to ary[0..3]
      rel.where(sales: ..100)

* `Enumerable#tally` が追加されました。各要素の出現回数を数えます。

      ["a", "b", "c", "b"].tally
      #=> {"a"=>1, "b"=>2, "c"=>1}

* レシーバを`self`としてprivateメソッドを呼び出すことが許容されるようになりました。[Feature #11297] [Feature #16123]

      def foo
      end
      private :foo
      self.foo

* `Enumerator::Lazy#eager` が追加されました。lazyなEnumeratorを非lazyなEnumeratorに変換します。

      a = %w(foo bar baz)
      e = a.lazy.map {|x| x.upcase }.map {|x| x + "!" }.eager
      p e.class               #=> Enumerator
      p e.map {|x| x + "?" }  #=> ["FOO!?", "BAR!?", "BAZ!?"]

## パフォーマンスの改善

* JIT [Experimental]

  * 最適化の際の仮定が無効とされた場合、JIT 化されていたコードがより最適化度が低いコードに再コンパイルされるようになりました。

  * あるメソッドが「純粋」であると判定された場合、メソッドのインライン化が行われるようになりました。この最適化はまだ実験的であり、また多数のメソッドが今はまだ「純粋」と判定されないままです。

  * `--jit-min-calls` オプションのデフォルト値が 5 から 10,000 に変更されました。

  * `--jit-max-cache` オプションのデフォルト値が 1,000 から 100 に変更されました。

* `Symbol#to_s`, `Module#name`, `true.to_s`, `false.to_s` `nil.to_s` は常にfrozenな文字列を返すようになりました。返された文字列は常に同じオブジェクトとなります。 [Experimental]  [[Feature #16150]](https://bugs.ruby-lang.org/issues/16150)

* CGI.escapeHTMLのパフォーマンスが改善されました。
  * https://github.com/ruby/ruby/pull/2226

## その他の注目すべき 2.6 からの変更点

* いくつかの標準ライブラリがアップデートされました。
  * Bundler 2.1.0.pre.1
  * RubyGems 3.1.0.pre.1
  * CSV 3.1.2 ([NEWS](https://github.com/ruby/csv/blob/master/NEWS.md))
  * Racc 1.4.15
  * REXML 3.2.3 ([NEWS](https://github.com/ruby/rexml/blob/master/NEWS.md))
  * RSS 0.2.8 ([NEWS](https://github.com/ruby/rss/blob/master/NEWS.md))
  * StringScanner 1.0.3
  * 独自のバージョン番号を持たないその他のライブラリの一部も更新されています。

* ブロックを渡すメソッド呼び出し中の、ブロックを伴わない `Proc.new` と `proc` が警告されるようになりました。

* ブロックを渡すメソッド呼び出し中の、ブロックを伴わない `lambda` はエラーとなるようになりました。

* Unicode および Emoji のバージョンが 11.0.0 から 12.0.0 になりました。[[Feature #15321]](https://bugs.ruby-lang.org/issues/15321)

* Unicode のバージョンが 12.1.0 となり、新元号「令和」を表す合字 U+32FF がサポートされました。[[Feature #15195]](https://bugs.ruby-lang.org/issues/15195)

* `Date.jisx0301`, `Date#jisx0301`, および `Date.parse` で非公式に新元号に仮対応しました。これは JIS X 0301 の新しい版で正式な仕様が決定されるまでの暫定的なものです。[[Feature #15742]](https://bugs.ruby-lang.org/issues/15742)

* Ruby のビルドに C99 に対応したコンパイラが必要になりました。[[Misc #15347]](https://bugs.ruby-lang.org/issues/15347)
  * 本件についての詳細: <https://bugs.ruby-lang.org/projects/ruby-trunk/wiki/C99>

なお、こうした変更により、Ruby 2.6.0 以降では [3670 個のファイルに変更が加えられ、201242 行の追加と 88066 行の削除が行われました](https://github.com/ruby/ruby/compare/v2_6_0...v2_7_0_preview2) !

Ruby 2.7 で楽しいプログラミングを！

## Download

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview2.tar.bz2>

      SIZE:   14555229 bytes
      SHA1:   7d9eed71115acfc8851747517904c1c6809872a9
      SHA256: 417c84346ba84d664a13833c94c6d9f888c89bb9bee9adf469580441eaede30b
      SHA512: 7066ececebbbba4b2933ba1a4f70cdef373169910802259a3e52b4fc144ba298f3cffda4be5fe8a7be8ef769ed43076fa046a9ac2c13bb733475b9852112c6f0
* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview2.tar.gz>

      SIZE:   16622499 bytes
      SHA1:   5e998eb37ef54e650c0206184d56f506359d5477
      SHA256: bda4b8dc340fad425c8099400fe3ef8e7393837d7e6e1bfae41843d1d938ebc4
      SHA512: dbf05d6ddab59062f507342b25b8c21670b02bdd49e77bda947870607f4bf9049e5e7ddfde6bbce2e1749ca92568da9be3e5f30601b1eb450f10d8add952239a
* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview2.tar.xz>

      SIZE:   11874200 bytes
      SHA1:   4356e1726027795a5c6b08572bb37bcb5a8c55d6
      SHA256: fa39f088331f6d505154aa9d025aab177fdffedfbbabccd900b8c02e745bc077
      SHA512: a057a186d85fcdf123abd69d584ef3adb20ad4397521e14306395d34102c3d818fe2d34a6476db01effcde479da9a77076cbb6d30bca40f1471ce3f5d3a995a9
* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview2.zip>

      SIZE:   20576618 bytes
      SHA1:   891b70ec76e9e776774a49b3ce24832a944422b3
      SHA256: 81a240bead4438b064cb4cde562b483b82ec8e414bac057a6df43df5a247545c
      SHA512: 1a8d4503374d31abf43182e2af6902ea6e5295f55d539415c8268b1d6a0fa83a975648c225ae986e687d5283dc2d180cf1e608841485506e4b0ac5efc154949a

## Ruby とは

Rubyはまつもとゆきひろ (Matz) によって1993年に開発が始められ、今もオープンソースソフトウェアとして開発が続けられています。Rubyは様々なプラットフォームで動き、世界中で、特にWebアプリケーション開発のために使われています。
