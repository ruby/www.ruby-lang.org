---
layout: news_post
title: "Ruby 3.0.0 RC1 リリース"
author: "naruse"
translator:
date: 2020-12-20 00:00:00 +0000
lang: ja
---

Ruby 3.0に向けてフィードバックを得るためのリリースである、Ruby 3.0.0-rc1が公開されました。

Ruby 3.0には、多くの新しい機能やパフォーマンスの改善が含まれます。 その一部を以下に紹介します。

## 静的解析

### RBS

RBSはRubyプログラムの型を記述するための言語です。

TypeProfなどの型検査ツールを初めとする静的解析を行うツールは、RBSを利用することでRubyプログラムをより精度良く解析することができます。

RBSでは、Rubyプログラムのクラスやモジュールの型を定義します。メソッドやインスタンス変数、定数とその型、継承やmixinなどの関係などが記述できます。

RBSはRubyプログラムに頻出するパターンをサポートするように設計されており、ユニオン型、メソッドオーバーロード、ジェネリクスなどの機能を提供します。さらに「インタフェース型」によってダックタイピングをサポートします。

Ruby 3.0には、このRBS言語で書かれた型定義を処理するためのライブラリである `rbs` gemが同梱されています。

クラスやモジュール、定数を定義する、簡単なRBSの例を示します。

``` rbs
module ChatApp
  VERSION: String
  class Channel
    attr_reader name: String
    attr_reader messages: Array[Message]
    attr_reader users: Array[User | Bot]              # `|` は `User` か `Bot` のインスタンスを表現する「ユニオン型」です
    def initialize: (String) -> void
    def post: (String, from: User | Bot) -> Message   # メソッドオーバーロードを記述することもできます
            | (File, from: User | Bot) -> Message
  end
end
```

詳細については、[rbs gemのREADME](https://github.com/ruby/rbs)を参照してください。

### TypeProf

TypeProf は Ruby パッケージに同梱された型解析ツールです。

TypeProf の現在の主な用途は一種の型推論です。

型注釈の無い普通の Ruby コードを入力し、どんなメソッドが定義されどのように使われているかを解析し、型シグネチャのプロトタイプを RBS フォーマットで生成します。

次は TypeProf の簡単なデモです。

サンプル入力

``` ruby
# test.rb
class User
  def initialize(name:, age:)
    @name, @age = name, age
  end
  attr_reader :name, :age
end
User.new(name: "John", age: 20)
```

サンプル出力

```
$ typeprof test.rb
# Classes
class User
  attr_reader name : String
  attr_reader age : Integer
  def initialize : (name: String, age: Integer) -> [String, Integer]
end
```

サンプル入力を"test.rb"という名前で保存し、`typeprof test.rb`というコマンドで TypeProf の解析ができます。

[TypeProf をオンラインで試す](https://mame.github.io/typeprof-playground/#rb=%23+test.rb%0Aclass+User%0A++def+initialize%28name%3A%2C+age%3A%29%0A++++%40name%2C+%40age+%3D+name%2C+age%0A++end%0A++%0A++attr_reader+%3Aname%2C+%3Aage%0Aend%0A%0AUser.new%28name%3A+%22John%22%2C+age%3A+20%29&rbs=)こともできます（サーバサイドで TypeProf を動かしているので、サーバが落ちたらごめんなさい）。

詳しくは[ドキュメント](https://github.com/ruby/typeprof/blob/master/doc/doc.md)や[デモ](https://github.com/ruby/typeprof/blob/master/doc/demo.md)を見てください。

残念ながら TypeProf はまだ実験的で、あまり完成度は高くありません。Ruby 言語のサブセットだけがサポートされていて、型エラー検出の機能は限定的です。ですがいま急速に改良中であり、言語機能のカバレッジ増強、解析効率の向上、利便性の向上などを行っています。フィードバックを歓迎します。

## Ractor (experimental)

Ractor はアクターモデル風の並行・並列制御機構であり、スレッド安全に関する懸念なく、Rubyで並列処理を行うための機能として設計されています。

複数のRactorを作成すると、それらは並列計算機上で並列に実行されます。Ractor間では、ほとんどのオブジェクトが共有できないように設計されているため、スレッド安全なプログラムにすることができます。メッセージの送受信により、Ractor間のコミュニケーションを行うことが可能です。

Ractor間でのオブジェクトの共有を制限するために、複数Ractorでの実行時には、いくつかのRubyの機能に制限が入ります（ただし、複数のRactorを用いない場合には、これまでのRubyと何も変わりません）。

Ractorの仕様と実装は、まだ発展途上であるため、実験的機能として提供されます。初回のRactorの生成時には実験的機能であることが警告で表示されます。

次の小さなプログラムでは、二つのRactorを用いて`n.prime?`（`n`は比較的大きな値）の計算を並列に実行します。動かしてみると、逐次実行にくらべて、2コア以上の計算機で計算時間が半分程度になることが確認できます。

``` ruby
require 'prime'
# n.prime? with sent integers in r1, r2 run in parallel
r1, r2 = *(1..2).map do
  Ractor.new do
    n = Ractor.receive
    n.prime?
  end
end
# send parameters
r1.send 2**61 - 1
r2.send 2**61 + 15
# wait for the results of expr1, expr2
p r1.take #=> true
p r2.take #=> true
```

より詳細は、[doc/ractor.md](https://github.com/ruby/ruby/blob/master/doc/ractor.md) をご覧ください。

## Scheduler (experimental)

`Thread#scheduler` is introduced for intercepting blocking operations. This allows for light-weight concurrency without changing existing code. Watch ["Don't Wait For Me, Scalable Concurrency for Ruby 3"](https://www.youtube.com/watch?v=Y29SSOS4UOc) for an overview of how it works.
Currently supported classes/methods:

- `Mutex#lock`, `Mutex#unlock`, `Mutex#sleep`
- `ConditionVariable#wait`
- `Queue#pop`, `SizedQueue#push`
- `Thread#join`
- `Kernel#sleep`
- `IO#wait`, `IO#read`, `IO#write` and related methods (e.g. `#wait_readable`, `#gets`, `#puts` and so on).
- `IO#select` is *not supported*.

The current entry point for concurrency is `Fiber.schedule{...}` however this is subject to change by the time Ruby 3 is released.

Currently, there is a test scheduler available in [`Async::Scheduler`](https://github.com/socketry/async/pull/56). See [`doc/scheduler.md`](https://github.com/ruby/ruby/blob/master/doc/scheduler.md) for more details.

## その他の主要な新機能

* 1行パターンマッチが再設計されました。 (experimental)

    * `=>` を新たに使うようになりました。右代入のように使うことができます。

      ```ruby
      0 => a
      p a #=> 0

      {b: 0, c: 1} => {b:}
      p b #=> 0
      ```

    * `in` は `true` または `false` を返すようになりました。

      ```ruby
      # version 3.0
      0 in 1 #=> false

      # version 2.7
      0 in 1 #=> raise NoMatchingPatternError
      ```

* findパターンが追加されました。 (experimental)

  ``` ruby
  case ["a", 1, "b", "c", 2, "d", "e", "f", 3]
  in [*pre, String => x, String => y, *post]
    p pre  #=> ["a", 1]
    p x    #=> "b"
    p y    #=> "c"
    p post #=> [2, "d", "e", "f", 3]
  end
  ```

* 一行メソッド定義が書けるようになりました。

  ``` ruby
  def square(x) = x * x
  ```

* `Hash#except` が組み込みになりました。

  ``` ruby
  h = { a: 1, b: 2, c: 3 }
  p h.except(:a) #=> {:b=>2, :c=>3}
  ```

## パフォーマンスの改善

* MJITに多数の改善が行われています。詳細はNEWSを参照してください。
* IRB への長いコードの貼り付けは、Ruby 2.7.0 にバンドルされているものと比較して 53 倍の速さになります。例えば、[このサンプルコード](https://gist.github.com/aycabta/30ab96334275bced5796f118c9220b0b)の貼り付けに要する時間は、11.7 秒から 0.22 秒になります。

## その他の注目すべき 2.7 からの変更点

* キーワード引数が通常の引数から分離されました。
  * 原則として、2.7 で警告の出ていたコードは動かなくなります。詳細は[別ドキュメント](https://www.ruby-lang.org/en/news/2019/12/12/separation-of-positional-and-keyword-arguments-in-ruby-3-0/)を参照してください。
  * 関連して、引数のフォワーディングの記法で先頭に引数を書けるようになりました。

    ``` ruby
    def method_missing(meth, ...)
      send(:"do_#{ meth }", ...)
    end
    ```

* パターンマッチ(`case`/`in`)が実験的な機能ではなくなりました。
* `$SAFE` の機能が完全に削除され、ただのグローバル変数となりました。
* バックトレースの順序は2.5で逆転しましたが、3.0ではこれを取りやめることになりました。例外が起きた行が先に表示され、呼び出し元が後に表示されるように戻ります。
* いくつかの標準ライブラリがアップデートされました。
  * RubyGems 3.2.2
  * Bundler 2.2.2
  * IRB 1.2.6
  * Reline 0.1.5
  * Psych 3.2.1
  * JSON 2.4.1
  * BigDecimal 3.0.0
  * CSV 3.1.9
  * Digest 3.0.0
  * Fiddle 1.0.4
  * StringIO 3.0.0
  * StringScanner 3.0.0
* 以下のライブラリは標準添付ライブラリから削除されました。3.0 以降で使いたい場合は rubygems から利用してください。
  * net-telnet
  * xmlrpc
* 以下のライブラリが新たに bundled gems になりました。Bundler から利用する場合は Gemfile に明示的に指定してください。
  * rexml
  * rss
* 以下のライブラリが新たに default gems になりました。rubygems.org からアップデート可能です。
  * English
  * abbrev
  * base64
  * drb
  * debug
  * erb
  * find
  * net-ftp
  * net-http
  * net-imap
  * net-protocol
  * open-uri
  * optparse
  * pp
  * prettyprint
  * resolv-replace
  * resolv
  * rinda
  * set
  * securerandom
  * shellwords
  * tempfile
  * tmpdir
  * time
  * tsort
  * un
  * weakref
  * digest
  * io-nonblock
  * io-wait
  * nkf
  * pathname
  * syslog
  * win32ole

その他詳細については、[NEWS](https://github.com/ruby/ruby/blob/v3_0_0_rc1/NEWS.md) ファイルまたは[コミットログ](https://github.com/ruby/ruby/compare/v2_7_0...v3_0_0_rc1)を参照してください。

{% assign release = site.data.releases | where: "version", "3.0.0-rc1" | first %}

なお、こうした変更により、Ruby 2.7.0 以降では [{{ release.stats.files_changed }} 個のファイルに変更が加えられ、{{ release.stats.insertions }} 行の追加と {{ release.stats.deletions }} 行の削除が行われました](https://github.com/ruby/ruby/compare/v2_7_0...v3_0_0) !

ぜひ Ruby 3.0.0-rc1 を試して、フィードバックをお願いします！

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
