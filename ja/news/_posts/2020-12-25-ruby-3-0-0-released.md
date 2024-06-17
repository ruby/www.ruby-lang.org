---
layout: news_post
title: "Ruby 3.0.0 リリース"
author: "naruse"
translator:
date: 2020-12-25 00:00:00 +0000
lang: ja
---

Ruby 3.0系初のリリースである、Ruby 3.0.0 が公開されました。

{% assign release = site.data.releases | where: "version", "3.0.0" | first %}

これまで、Ruby3に向けてパフォーマンスの改善、並行処理、静的解析という3つの目標を掲げて、活発に開発が行われてきました。特にパフォーマンスの改善については、[Ruby 3x3](https://blog.heroku.com/ruby-3-by-3) として「Ruby3はRuby2の3倍速くする」ことを目指してきました。

<img src='https://cache.ruby-lang.org/pub/media/ruby3x3.png' alt='Optcarrot 3000 frames' width='100%' />

Ruby 3.0では開発の指標の一つとしてきた[Optcarrotベンチマーク](https://github.com/mame/optcarrot)で3倍を達成するとともに、以下のような取り組みが行われています。<details>[github.com/ruby/ruby/tree/master/benchmark](https://github.com/ruby/ruby/tree/master/benchmark) に書かれている環境で計測されました。 [8c510e4095](https://github.com/ruby/ruby/commit/8c510e4095) が Ruby 3.0 として使われています。環境やベンチマークによっては3倍にならないかもしれません。</details>


Ruby 3 では以下の目標を達成しました。
* パフォーマンスの改善
  * MJIT
* 並行処理
  * Ractor
  * Fiber Scheduler
* 静的解析
  * RBS
  * TypeProf

他にも、Ruby 3.0 では Ruby 2.7 に比べて、多くの新しい機能やパフォーマンスの改善が含まれます。 その一部を以下に紹介します。

## パフォーマンスの改善

> わたしが最初にRuby3x3というスローガンを宣言した時、コアチームメンバーを含むほとんどの人は、「またそんな夢物語を」と思ったことでしょう。実際、わたしもそう思ってました。しかし、皆の努力によって(ある程度)達成できました。この成果をこころから誇りに思います。 --- Matz

### MJIT

様々な改善がMJITに実装されました。詳細はNEWSをご覧ください。

Ruby 3.0の時点では、JITはいくつかの限られたワークロードで性能を改善します。例えば ゲーム ([Optcarrot](https://github.com/mame/optcarrot))、AI ([Rubykon](https://github.com/benchmark-driver))、その他多くの時間を少数のメソッドをたくさん呼び出すことに費すアプリケーションなどが挙げられます。

Ruby 3.0では[生成コードのサイズを大幅に削減した](https://twitter.com/k0kubun/status/1256142302608650244)ものの、Railsのような、様々なメソッドを満遍なく呼び出すi-cacheへの負荷が大きいワークロードでは、JITがその負荷を大きくしてしまうため性能を改善できる状態にはまだ至っていません。Ruby 3.1での改善にご期待ください。

## Concurrency / Parallel

> マルチコア時代と呼んでも過言ではない現代、コンカレンシーは非常に重要です。RactorとAsync Fiberの導入でようやくRubyもコンカレント言語になれそうです。 -- Matz

### Ractor (experimental)

Ractor はアクターモデル風の並行・並列制御機構であり、スレッド安全に関する懸念なく、Rubyで並列処理を行うための機能として設計されています。

複数のRactorを作成すると、それらは並列計算機上で並列に実行されます。Ractor間では、ほとんどのオブジェクトが共有できないように設計されているため、スレッド安全なプログラムにすることができます。メッセージの送受信により、Ractor間のコミュニケーションを行うことが可能です。

Ractor間でのオブジェクトの共有を制限するために、複数Ractorでの実行時には、いくつかのRubyの機能に制限が入ります（ただし、複数のRactorを用いない場合には、これまでのRubyと何も変わりません）。

Ractorの仕様と実装は、まだ発展途上であるため、実験的機能として提供されます。初回のRactorの生成時には実験的機能であることが警告で表示されます。

次の小さなプログラムでは、有名なベンチマーク用関数である竹内関数（[竹内関数 - Wikipedia](https://ja.wikipedia.org/wiki/%E7%AB%B9%E5%86%85%E9%96%A2%E6%95%B0) ）を用いて、4回逐次的に実行する場合と、Ractorを用いて4並列で実行する場合で、それぞれ実行時間を計測しています。

``` ruby
def tarai(x, y, z) =
  x <= y ? y : tarai(tarai(x-1, y, z),
                     tarai(y-1, z, x),
                     tarai(z-1, x, y))
require 'benchmark'
Benchmark.bm do |x|
  # sequential version
  x.report('seq'){ 4.times{ tarai(14, 7, 0) } }

  # parallel version
  x.report('par'){
    4.times.map do
      Ractor.new { tarai(14, 7, 0) }
    end.each(&:take)
  }
end
```

```
Benchmark result:
          user     system      total        real
seq  64.560736   0.001101  64.561837 ( 64.562194)
par  66.422010   0.015999  66.438009 ( 16.685797)
```

結果は Ubuntu 20.04, Intel(R) Core(TM) i7-6700 (4 cores, 8 hardware threads) で実行したものになります。逐次実行したときよりも、並列化によって3.87倍の高速化していることがわかります。


より詳細は、[doc/ractor.md](https://docs.ruby-lang.org/en/3.0/ractor_md.html) をご覧ください。

### Fiber Scheduler

I/Oなど、処理をブロックさせる操作をフックするための `Fiber#scheduler` が導入されました。この機能により、既存のコードを変更せずに、軽量な並行制御を実現できます。概要と、どのように動作するのかは、 ["Don't Wait For Me, Scalable Concurrency for Ruby 3"](https://www.youtube.com/watch?v=Y29SSOS4UOc) をご覧ください。

現在サポートされているクラス・メソッドは次の通りです。

- `Mutex#lock`, `Mutex#unlock`, `Mutex#sleep`
- `ConditionVariable#wait`
- `Queue#pop`, `SizedQueue#push`
- `Thread#join`
- `Kernel#sleep`
- `Process.wait`
- `IO#wait`, `IO#read`, `IO#write` と、関連するメソッド (e.g. `#wait_readable`, `#gets`, `#puts` など).
- `IO#select` は *対応していません*

次のプログラムは、いくつかの HTTP リクエストを並行に処理します。

``` ruby
require 'async'
require 'net/http'
require 'uri'

Async do
  ["ruby", "rails", "async"].each do |topic|
    Async do
      Net::HTTP.get(URI "https://www.google.com/search?q=#{topic}")
    end
  end
end
```

ここでは、イベントループを提供する [async](https://github.com/socketry/async) を用いています。このイベントループは、`Net::HTTP` をノンブロックとするために、`Fiber#scheduler` フックを用いています。他の gem も、このインターフェースを用いることで、Ruby をノンブロックで実行することができます。そして、それらの gem は、このインターフェースに対応しているその他の Ruby 実装（例えば、JRuby や TruffleRuby）でも互換にすることができます。

## 静的解析

> 2010年代は静的型言語の時代でした。Rubyは抽象解釈を武器に、型宣言なしで静的型チェックする未来を目指します。RBSとTypeProfはその第一歩です。Rubyがもたらす誰も見たことがない静的型の世界を見守ってください --- Matz

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

* IRB への長いコードの貼り付けは、Ruby 2.7.0 にバンドルされているものと比較して 53 倍の速さになります。例えば、[このサンプルコード](https://gist.github.com/aycabta/30ab96334275bced5796f118c9220b0b)の貼り付けに要する時間は、11.7 秒から 0.22 秒になります。

<video autoplay="autoplay" controls="controls" muted="muted" width="764" height="510" poster="https://cache.ruby-lang.org/pub/media/ruby-3.0-irb-highspeed.png">
  <source src="https://cache.ruby-lang.org/pub/media/ruby-3.0-irb-highspeed.mp4" type="video/mp4">
</video>


* IRB に `measure` コマンドが追加されました。簡単な実行時間計測が可能です。

  ```
  irb(main):001:0> 3
  => 3
  irb(main):002:0> measure
  TIME is added.
  => nil
  irb(main):003:0> 3
  processing time: 0.000058s
  => 3
  irb(main):004:0> measure :off
  => nil
  irb(main):005:0> 3
  => 3
  ```

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
  * 詳しくは[ドキュメント](https://docs.ruby-lang.org/en/3.0/syntax/pattern_matching_rdoc.html)を見てください。
* `$SAFE` の機能が完全に削除され、ただのグローバル変数となりました。
* バックトレースの順序は2.5で逆転しましたが、3.0ではこれを取りやめることになりました。例外が起きた行が先に表示され、呼び出し元が後に表示されるように戻ります。
* いくつかの標準ライブラリがアップデートされました。
  * RubyGems 3.2.3
  * Bundler 2.2.3
  * IRB 1.3.0
  * Reline 0.2.0
  * Psych 3.3.0
  * JSON 2.5.1
  * BigDecimal 3.0.0
  * CSV 3.1.9
  * Date 3.1.0
  * Digest 3.0.0
  * Fiddle 1.0.6
  * StringIO 3.0.0
  * StringScanner 3.0.0
  * etc.
* 以下のライブラリは標準添付ライブラリから削除されました。3.0 以降で使いたい場合は rubygems から利用してください。
  * sdbm
  * webrick
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

その他詳細については、[NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md) ファイルまたは[コミットログ](https://github.com/ruby/ruby/compare/v2_7_0...{{ release.tag }})を参照してください。

なお、こうした変更により、Ruby 2.7.0 以降では [{{ release.stats.files_changed }} 個のファイルに変更が加えられ、{{ release.stats.insertions }} 行の追加と {{ release.stats.deletions }} 行の削除が行われました](https://github.com/ruby/ruby/compare/v2_7_0...{{ release.tag }}#file_bucket) !

> Ruby3.0はマイルストーンです。言語は互換性を保ったまま大きく進化しました。しかし、これで終わりではありません。今後もRubyは進化し続け、より偉大な言語になることでしょう。ご期待下さい！。 --- Matz

メリークリスマス、様々な機能が追加された Ruby 3.0 をぜひお楽しみ下さい！

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
