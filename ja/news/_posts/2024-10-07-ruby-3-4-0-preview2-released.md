---
layout: news_post
title: "Ruby 3.4.0 preview2 リリース"
author: "naruse"
translator: "motohiro-mm"
date: 2024-10-07 00:00:00 +0000
lang: ja
---

{% assign release = site.data.releases | where: "version", "3.4.0-preview2" | first %}
Ruby {{ release.version }}がリリースされました。

## Prism

デフォルトのパーサーを parse.y から Prism に変更しました。　[[Feature #20564]]

## 言語機能の変更

* `frozen_string_literal`のコメントがないファイルで文字列リテラルが凍結されたように振る舞うようになりました。
  文字列リテラルが破壊的に変更された場合、非推奨の警告が表示されます。
  この警告は `-W:deprecated` または `Warning[:deprecated] = true` で有効にすることができます。
  コマンドライン引数で`--disable-frozen-string-literal` を指定してRubyを実行すると、この変更を無効にできます。 [[Feature #20205]]

* `it`がブロックパラメータを参照するために追加されました。 [[Feature #18980]]

* メソッド呼び出し時のnilのキーワードスプラットが使えるようになりました。
  `**nil`は`**{}`と同様に扱われ、キーワードは渡されず、変換メソッドも呼び出されません。 [[Bug #20064]]

* インデックスにブロックを渡せなくなりました。 [[Bug #19918]]

* インデックスにキーワード引数が使えなくなりました。 [[Bug #20218]]

## コアクラスの更新
注：特に重要なクラスアップデートのみを掲載しています。

* Exception

  * Exception#set_backtraceが`Thread::Backtrace::Location`の配列を受け付けるようになりました。
    `Kernel#raise`と`Thread#raise`、`Fiber#raise`も同様に新しいフォーマットを受け付けます。[[Feature #13557]]

* Range

  * rangeが列挙可能でない場合、`Range#size`がTypeErrorを発生させるようになりました。[[Misc #18984]]


## 互換性に関する変更

注：バグフィックスは掲載していません。

* エラーメッセージとバックトレースの表示が変更されました。
  * 冒頭の引用符にはバッククォートの代わりにシングルクォートを使用します。 [[Feature #16495]]
  * メソッド名の前にクラス名を表示します(クラスが永続的な名前を持つ場合のみ)。 [[Feature #19117]]
  * `Kernel#caller`、`Thread::Backtrace::Location`のメソッドなどがそれに応じて変更されました。

  ```
  Old:
  test.rb:1:in `foo': undefined method `time' for an instance of Integer
          from test.rb:2:in `<main>'
  New:
  test.rb:1:in 'Object#foo': undefined method 'time' for an instance of Integer
          from test.rb:2:in `<main>'
  ```

* `Hash#inspect`の出力を変更しました。 [[Bug #20433]]
  * キーがシンボルの場合は、コロン形式を使用するようになりました。`"{user: 1}"`
  * キーがシンボルでない場合は、`=>`の前後にスペースを追加します。`'{"user" => 1}'`
    以前：`'{"user"=>1}'`


## C API更新

* `rb_newobj`と`rb_newobj_of` (および対応するマクロ `RB_NEWOBJ`、`RB_NEWOBJ_OF`、`NEWOBJ`、`NEWOBJ_OF`)が削除されました。 [[Feature #20265]]
* 廃止予定だった関数`rb_gc_force_recycle`が削除されました。 [[Feature #18290]]

## 実装の改善

* `Array#each`がRubyで書き直され、パフォーマンスが改善されました。 [[Feature #20182]].

## その他の変更

* 渡されたブロックを使用しないメソッドにブロックを渡すと、verboseモード (`-w`) で警告が表示されるようになりました。 [[Feature #15554]]

* `String.freeze`や`Integer#+`のようなインタプリタやJITによって特別に最適化されたコアメソッドを再定義すると、パフォーマンスクラスの警告（`-W:performance`または`Warning[:performance] = true`）が出るようになりました。　[[Feature #20429]]

default gemやbundled gemの詳細については、[Logger](https://github.com/ruby/logger/releases)などのGitHubのリリースやchangelogを参照してください。

詳細は[NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
か[commit logs](https://github.com/ruby/ruby/compare/v3_3_0...{{ release.tag }})を参照してください。

これらの変更により、Ruby 3.3.0から[{{ release.stats.files_changed }} ファイルが変更され、{{ release.stats.insertions }} 行が追加され、 {{ release.stats.deletions }} 行が削除されました！](https://github.com/ruby/ruby/compare/v3_3_0...{{ release.tag }}#file_bucket)


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

[Feature #13557]: https://bugs.ruby-lang.org/issues/13557
[Feature #15554]: https://bugs.ruby-lang.org/issues/15554
[Feature #16495]: https://bugs.ruby-lang.org/issues/16495
[Feature #18290]: https://bugs.ruby-lang.org/issues/18290
[Feature #18980]: https://bugs.ruby-lang.org/issues/18980
[Misc #18984]:    https://bugs.ruby-lang.org/issues/18984
[Feature #19117]: https://bugs.ruby-lang.org/issues/19117
[Bug #19918]:     https://bugs.ruby-lang.org/issues/19918
[Bug #20064]:     https://bugs.ruby-lang.org/issues/20064
[Feature #20182]: https://bugs.ruby-lang.org/issues/20182
[Feature #20205]: https://bugs.ruby-lang.org/issues/20205
[Bug #20218]:     https://bugs.ruby-lang.org/issues/20218
[Feature #20265]: https://bugs.ruby-lang.org/issues/20265
[Feature #20429]: https://bugs.ruby-lang.org/issues/20429
[Feature #20564]: https://bugs.ruby-lang.org/issues/20564
[Bug #20433]:     https://bugs.ruby-lang.org/issues/20433
