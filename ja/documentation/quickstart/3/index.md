---
layout: page
title: "20分ではじめるRuby"
lang: ja

header: |
  <div class="multi-page">
    <a href="../" title="Part 1">1</a>
    <span class="separator"> | </span>
    <a href="../2/" title="Part 2">2</a>
    <span class="separator"> | </span>
    <strong>3</strong>
    <span class="separator"> | </span>
    <a href="../4/" title="Part 4">4</a>
  </div>
  <h1>20分ではじめるRuby</h1>

---

それではgreeterオブジェクトを作り、使ってみましょう。

{% highlight irb %}
irb(main):035:0> greeter = Greeter.new("Pat")
=> #<Greeter:0x16cac @name="Pat">
irb(main):036:0> greeter.say_hi
Hi Pat!
=> nil
irb(main):037:0> greeter.say_bye
Bye Pat, come back soon.
=> nil
{% endhighlight %}

一度`greeter` オブジェクトを作ると、Patという名前をおぼえてくれます。
ふむ、名前を直接取得しようとするとどうなるでしょう？

{% highlight irb %}
irb(main):038:0> greeter.@name
SyntaxError: (irb):38: syntax error, unexpected tIVAR, expecting '('
{% endhighlight %}

おっと、これはできませんでした。

## Objectの殻の中

インスタンス変数はオブジェクトの内側に隠されています。とはいえ完全に
見えないようになっているのではなく、オブジェクトをinspectすれば
いつでも見ることはできますし、他にもアクセスする手段はあるのですが、
Rubyはデータを隠しておく、適切なオブジェクト指向アプローチをとっています。

では、Greeterオブジェクトにはどんなメソッドがあるのでしょうか？

{% highlight irb %}
irb(main):039:0> Greeter.instance_methods
=> [:say_hi, :say_bye, :instance_of?, :public_send,
    :instance_variable_get, :instance_variable_set,
    :instance_variable_defined?, :remove_instance_variable,
    :private_methods, :kind_of?, :instance_variables, :tap,
    :is_a?, :extend, :define_singleton_method, :to_enum,
    :enum_for, :<=>, :===, :=~, :!~, :eql?, :respond_to?,
    :freeze, :inspect, :display, :send, :object_id, :to_s,
    :method, :public_method, :singleton_method, :nil?, :hash,
    :class, :singleton_class, :clone, :dup, :itself, :taint,
    :tainted?, :untaint, :untrust, :trust, :untrusted?, :methods,
    :protected_methods, :frozen?, :public_methods, :singleton_methods,
    :!, :==, :!=, :__send__, :equal?, :instance_eval, :instance_exec, :__id__]
{% endhighlight %}

おー。メソッドがいっぱいありますね。
メソッドは2つしか定義していないのに。
ここでは何が起こっているのでしょうか？
そう、これはGreeterオブジェクトの **すべての** メソッドで、
親やその上の祖先のクラスで定義されたメソッドを含めた、
完全なリストになっているのです。
Greeterで定義されたメソッドだけを一覧したいのなら、引数`false`を渡します。
これは祖先のクラスで定義されたメソッドが不要であることを意味します。

{% highlight irb %}
irb(main):040:0> Greeter.instance_methods(false)
=> [:say_hi, :say_bye]
{% endhighlight %}

お、こちらの方がよさそうですね。では、greeterオブジェクトがどのメソッドに
反応するか見てみましょう。

{% highlight irb %}
irb(main):041:0> greeter.respond_to?("name")
=> false
irb(main):042:0> greeter.respond_to?("say_hi")
=> true
irb(main):043:0> greeter.respond_to?("to_s")
=> true
{% endhighlight %}

このように、`say_hi` と`to_s`（何かを文字列に変換するもので、
すべてのオブジェクトに標準で定義されているメソッドです）
は知っていましたが、`name`は知りませんでした。

## クラスの変更 - まだ間に合います

しかし、名前を表示したり変えたりしたい場合はどうでしょう？
Rubyはオブジェクトの変数にアクセスできる簡単な方法を用意しています。

{% highlight irb %}
irb(main):044:0> class Greeter
irb(main):045:1>   attr_accessor :name
irb(main):046:1> end
=> [:name, :name=]
{% endhighlight %}

Rubyでは、定義されたクラスをさらに変更できます。
この変更は新たに作られたオブジェクトすべてはもちろん、すでにあるオブジェクトにも
反映されます。それでは、`@name`属性のついた新しくオブジェクトを作って
試してみましょう。

{% highlight irb %}
irb(main):047:0> greeter = Greeter.new("Andy")
=> #<Greeter:0x3c9b0 @name="Andy">
irb(main):048:0> greeter.respond_to?("name")
=> true
irb(main):049:0> greeter.respond_to?("name=")
=> true
irb(main):050:0> greeter.say_hi
Hi Andy!
=> nil
irb(main):051:0> greeter.name="Betty"
=> "Betty"
irb(main):052:0> greeter
=> #<Greeter:0x3c9b0 @name="Betty">
irb(main):053:0> greeter.name
=> "Betty"
irb(main):054:0> greeter.say_hi
Hi Betty!
=> nil
{% endhighlight %}

`attr_accessor`を使うと2つの新しいメソッドが定義されます。
`name`は値を参照するメソッドで、`name=`は値を設定するメソッドです。

## 何にでも挨拶してくれる、MegaGreeterは無視しない！

このgreeterはそれほど興味深いものではないですが、一度に扱えるのは
1人だけです。世界にも、1人の人にも、リストの全員にも挨拶してくれる
MegaGreeterのようなものがあればどうでしょう？

対話式RubyインタプリタのIRBで直接書くのではなく、ファイルに書いてみましょう。

IRBを抜けるには、“quit”や“exit”とタイプするか、コントロールキーを押しながらDキーを押します。

{% highlight ruby %}
#!/usr/bin/env ruby

class MegaGreeter
  attr_accessor :names

  # Create the object
  def initialize(names = "World")
    @names = names
  end

  # Say hi to everybody
  def say_hi
    if @names.nil?
      puts "..."
    elsif @names.respond_to?("each")
      # @names is a list of some kind, iterate!
      @names.each do |name|
        puts "Hello #{name}!"
      end
    else
      puts "Hello #{@names}!"
    end
  end

  # Say bye to everybody
  def say_bye
    if @names.nil?
      puts "..."
    elsif @names.respond_to?("join")
      # Join the list elements with commas
      puts "Goodbye #{@names.join(", ")}.  Come back soon!"
    else
      puts "Goodbye #{@names}.  Come back soon!"
    end
  end
end


if __FILE__ == $0
  mg = MegaGreeter.new
  mg.say_hi
  mg.say_bye

  # Change name to be "Zeke"
  mg.names = "Zeke"
  mg.say_hi
  mg.say_bye

  # Change the name to an array of names
  mg.names = ["Albert", "Brenda", "Charles",
              "Dave", "Engelbert"]
  mg.say_hi
  mg.say_bye

  # Change to nil
  mg.names = nil
  mg.say_hi
  mg.say_bye
end
{% endhighlight %}

このファイルを“ri20min.rb”という名前で保存して、“ruby ri20min.rb”と
実行しましょう。結果は以下のようになるはずです。

    Hello World!
    Goodbye World.  Come back soon!
    Hello Zeke!
    Goodbye Zeke.  Come back soon!
    Hello Albert!
    Hello Brenda!
    Hello Charles!
    Hello Dave!
    Hello Engelbert!
    Goodbye Albert, Brenda, Charles, Dave, Engelbert.  Come
    back soon!
    ...
    ...
{: .code}

この最後の例では新しいことがたくさん詰め込まれています。
[詳しく見てみましょう。](../4/)
