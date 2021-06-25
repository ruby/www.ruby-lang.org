---
layout: page
title: "20分ではじめるRuby"
lang: ja

header: |
  <div class="multi-page">
    <a href="../" title="Part 1">1</a>
    <span class="separator"> | </span>
    <strong>2</strong>
    <span class="separator"> | </span>
    <a href="../3/" title="Part 3">3</a>
    <span class="separator"> | </span>
    <a href="../4/" title="Part 4">4</a>
  </div>
  <h1>20分ではじめるRuby</h1>

---

いちいち入力せずに、何度も“Hello”と言いたい時にはどうすればいいでしょうか？
メソッドを定義しましょう！

{% highlight irb %}
irb(main):010:0> def hi
irb(main):011:1> puts "Hello World!"
irb(main):012:1> end
=> :hi
{% endhighlight %}

`def hi`というコードがメソッド定義のはじまりになります。
これは、`hi`という名前のメソッドを定義しようとしていることをRubyに伝えるものです。
次の行はメソッドの本体になります。この行は、すでに見た行、`puts "Hello World"`と
同じものです。
そして、最後の行の `end` は、メソッド定義が終わったことをRubyに伝えます。
Rubyのレスポンス `=> :hi` は、メソッド定義の終了を理解したことを表しています。
なお、Ruby 2.0やそれ以前のバージョンのRubyでは、このレスポンスは `=> nil`
になります。が、その違いはここでは特に重要なことではないので、先に進みます。

## 簡潔で繰り返せるメソッド

それではこのメソッドを何度か実行してみましょう。

{% highlight irb %}
irb(main):013:0> hi
Hello World!
=> nil
irb(main):014:0> hi()
Hello World!
=> nil
{% endhighlight %}

簡単ですね。Rubyでのメソッド呼び出しはその名前をRubyに伝えるのと同じくらい簡単です。
引数がなければ、名前以外は不要です。
メソッドが引数を持たない場合、メソッド名の後ろに空のカッコをつけることができますが、
省略しても構いません。

全世界ではなく、特定の人にhelloと言いたい場合はどうすればいいでしょうか？
名前を引数としてとるように`hi`を再定義すればいいのです。

{% highlight irb %}
irb(main):015:0> def hi(name)
irb(main):016:1> puts "Hello #{name}!"
irb(main):017:1> end
=> :hi
irb(main):018:0> hi("Matz")
Hello Matz!
=> nil
{% endhighlight %}

ちゃんと動いているようです。しかし、ここで何が起きているのか、ちょっと詳しく見てみましょう。

## Stringに穴を開ける

`#{name}`とは一体何なのでしょうか。これは、文字列に何かを挿入する際の
Rubyでのやり方なのです。
ブレースの間にあるものは（もし文字列でなければ）文字列に変換され、
その外側の文字列の中に置き換えられます。
このしくみは、誰かの名前を正しくcapitalizedするのにも使えます。

{% highlight irb %}
irb(main):019:0> def hi(name = "World")
irb(main):020:1> puts "Hello #{name.capitalize}!"
irb(main):021:1> end
=> :hi
irb(main):022:0> hi "chris"
Hello Chris!
=> nil
irb(main):023:0> hi
Hello World!
=> nil
{% endhighlight %}

ここでは他にもいろいろなトリックが使われています。
一つはカッコなしでメソッド呼び出しが使われていることです。
何をやっているか明確であれば、カッコは省略できます。
それ以外のトリックは、デフォルト引数の`World`です。
これは、「もしnameが与えられなければ、nameのデフォルト値である`"World"`を
使う」という定義になります。

## 挨拶人(Greeter)への進化

もし本物の挨拶人がいたのなら、あなたの名前を覚えてくれる上、
歓迎し、いつでも丁重に扱ってくれるでしょう。
そのためにオブジェクトを使いたくなりそうです。
“Greeter”クラスを作ってみましょう。

{% highlight irb %}
irb(main):024:0> class Greeter
irb(main):025:1>   def initialize(name = "World")
irb(main):026:2>     @name = name
irb(main):027:2>   end
irb(main):028:1>   def say_hi
irb(main):029:2>     puts "Hi #{@name}!"
irb(main):030:2>   end
irb(main):031:1>   def say_bye
irb(main):032:2>     puts "Bye #{@name}, come back soon."
irb(main):033:2>   end
irb(main):034:1> end
=> :say_bye
{% endhighlight %}

新しいキーワードは`class`です。これはGreeterという新しいクラスと、
そのクラスのメソッドをいくつか定義しています。また、`@name`にも
気づいたかもしれません。これはインスタンス変数で、このクラスにある
全てのメソッドで使うことができます。見ての通り、
`say_hi` と `say_bye`で使われています。

さて、どうすればこのGreeterクラスを動かせるでしょうか？
[オブジェクトを作りましょう。](../3/)
