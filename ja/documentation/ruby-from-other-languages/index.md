---
layout: page
title: "他言語からのRuby入門"
lang: ja
---

Rubyのコードを目にすると、
他の言語と似た部分があることに気が付くはずです。
構文の多くは、(他の言語の中でも特に)PerlやPython、
Javaプログラマーにとって馴染みのあるものになっています。
もしあなたがそうした言語に慣れ親しんでいるのなら、
Rubyを学ぶのはおそらくどうってことないはずです。
{: .summary}

このドキュメントは2部構成になっています。
このページでは、プログラミング言語*X*からRubyへ移ってくる際に役立つ情報をざっと紹介します。
個別のページでは、Rubyの主な言語機能を紹介しつつ、
あなたが慣れ親しんできた言語との比較を行います。

## 求められていること: *言語X*からRubyへ

* [C・C++からRubyへ](to-ruby-from-c-and-cpp/)
* [JavaからRubyへ](to-ruby-from-java/)
* [PerlからRubyへ](to-ruby-from-perl/)
* [PHPからRubyへ](to-ruby-from-php/)
* [PythonからRubyへ](to-ruby-from-python/)

## 重要な言語機能と知っておくべきこと

ここでは、Rubyを学習する中で出会ういくつかの主要な機能について、
参照先やヒントを示します。

### イテレーション

Rubyの特徴であるブロックとイテレータは、
これまでにあまり見たことがない、あるいは使い慣れていないものかもしれません。
(CやC++、1.5以前のJavaのような)インデックスを使った繰り返し処理や、
(Perlの`for (@a) {...}`やPythonの`for i in aList: ...`のような)
リストをループする処理の代わりに、
Rubyでは次のようなコードをよく見ることになるでしょう。

{% highlight ruby %}
some_list.each do |this_item|
  # ここはブロックの中になります。
  # this_itemを扱う処理をここに書きます。
end
{% endhighlight %}

`each`(や`collect`、`find`、`inject`、`sort`など)について詳しくは、
`ri Enumerable`を参照してみてください（そして、次に
`ri Enumerable#some_method`として具体的なメソッドを参照してみてください)。

### すべては値

式と文に違いはありません。
すべては値を持ちます。`nil`であっても例外ではありません。
Rubyでは次のように書くことが可能です。

{% highlight ruby %}
x = 10
y = 11
z = if x < y
      true
    else
      false
    end
z # => true
{% endhighlight %}

### シンボルは軽量文字列ではない

多くのRuby初学者はシンボルが何であるか、どう使えばよいのかを理解するのに苦戦します。

シンボルは識別子として記述するのに適しています。
シンボルは、**どんな物か**ではなく、**何者であるか**がすべてです。
`irb`を立ち上げて、次の違いを見てみてください。

{% highlight irb %}
irb(main):001:0> :george.object_id == :george.object_id
=> true
irb(main):002:0> "george".object_id == "george".object_id
=> false
irb(main):003:0>
{% endhighlight %}

`object_id`メソッドはオブジェクトのIDを返します。
もし二つのオブジェクトが同じ`object_id`を持っていれば、
それらはメモリ上の同じ実体を指すものであると言えます。

上記で見たとおり、一度でもシンボルを使ったなら、
同じ文字からなるシンボルは、いずれもメモリ内の同じオブジェクトを参照します。
同じ文字で表された2つのシンボルは、同じ`object_id`を指します。

次に文字列("george")の方を見てみましょう。
`object_id`は一致していません。
これは、二つの文字列が異なる実体を指していることを示しています。
新しい文字列を使うと、Rubyは毎回その文字列のために新しいメモリ領域を確保します。

シンボルを使うか文字列を使うかで迷ったなら、
ハッシュのキーのようにオブジェクトを識別したいのか、
それとも前述の"george"などのようにコンテンツを表したいのかを、
選択の指針にしてください。

### すべてはオブジェクト

「すべてはオブジェクト」は誇張ではありません。
クラスや整数でさえオブジェクトです。
他のオブジェクトと同じように扱うことができます。

{% highlight ruby %}
# 以下のクラス定義と同じことを行っています
# class MyClass
#   attr_accessor :instance_var
# end
MyClass = Class.new do
  attr_accessor :instance_var
end
{% endhighlight %}

### 可変な定数

定数は厳密な意味での定数ではありません。
初期化済みの定数を変更したとしても、
警告はされますが、プログラムは停止しません。
だからと言って、定数を再定義するべきだということではありません。

### 名前付けの規約

Rubyにはいくつか名前付けについての規約があります。
大文字から始まる識別子は定数です。
ドルマーク(`$`)から始まる識別子はグローバル変数、
`@`から始まる識別子はインスタンス変数、
`@@`から始まる識別子はクラス変数になります。

メソッド名は大文字から始めることもできます。
けれど、それは次のような混乱を招くことになるでしょう。

{% highlight ruby %}
Constant = 10
def Constant
  11
end
{% endhighlight %}

こうすると、`Constant`は10ですが、`Constant()`は11になります。

### キーワード引数

メソッドはRuby 2.0から、Pythonのように、
キーワード引数を定義できるようになりました。

{% highlight ruby %}
def deliver(from: "A", to: nil, via: "mail")
  "Sending from #{from} to #{to} via #{via}."
end

deliver(to: "B")
# => "Sending from A to B via mail."
deliver(via: "Pony Express", from: "B", to: "A")
# => "Sending from B to A via Pony Express."
{% endhighlight %}

### 普遍の真理

Rubyでは、`nil`と`false`を除くすべてのものは真と評価されます。
CやPythonを始めとする多くの言語では、0あるいはその他の値、空のリストなどは
偽と評価されます。次に示すPythonコードをみてください
(他の言語でもだいたい同じようなコードになるでしょう)。

{% highlight python %}
# Python版
if 0:
  print("0 is true")
else:
  print("0 is false")
{% endhighlight %}

このコードを実行すると「0 is false」と出力されます。
同じコードをRubyで書くと以下のようになります。

{% highlight ruby %}
# Ruby版
if 0
  puts "0 is true"
else
  puts "0 is false"
end
{% endhighlight %}

このコードを実行すると、
「0 is true」が出力されることになります。

### アクセス修飾子はスコープの最後まで適用される

次のRubyコードを見てください。

{% highlight ruby %}
class MyClass
  private
  def a_method; true; end
  def another_method; false; end
end
{% endhighlight %}

`another_method`がpublicメソッドになることを期待するかもしれませんが、
結果はそうなりません。
`private`アクセス修飾子はスコープの終わりか、他のアクセス修飾子が
あらわれるまで継続されます。
デフォルトでは、メソッドはpublicになります。

{% highlight ruby %}
class MyClass
  # a_methodはpublicです
  def a_method; true; end

  private

  # another_methodはprivateです
  def another_method; false; end
end
{% endhighlight %}

`public`、`private`、`protected`は実際にはメソッドになるので、
引数を受けることができます。これらにシンボルを渡した場合には、
そのメソッドの可視性が変更されます。

### アクセス制御

Javaでは、`public`は誰でもアクセスできることを意味しています。
そして、`protected`はクラスおよび継承関係にあるクラスのインスタンス、
クラスと同じパッケージにあるクラスのインスタンスからアクセスできること、
`private`はクラスのインスタンスからのみアクセスできることを、
ぞれぞれ意味します。

Rubyでは扱いが若干異なります。
`public`はそのままの意味になります。
`private`は、レシーバなしで呼び出すことができる場合に、
そのメソッドへアクセス可能となります。
つまり、`self`のみがprivateメソッドを呼び出す際のレシーバとなります。

`protected`は気をつけて扱う必要があります。
protectedメソッドはクラスか継承関係にあるクラスのインスタンスからのみ
呼び出すことができます。しかしまた、
レシーバとしてインスタンスを指定しても呼び出すことができてしまいます。
以下に例を示します([The Ruby Language FAQ][faq]から引用)。

{% highlight ruby %}
class Test
  # デフォルトはpublic
  def identifier
    99
  end

  def ==(other)
    identifier == other.identifier
  end
end

t1 = Test.new  # => #<Test:0x34ab50>
t2 = Test.new  # => #<Test:0x342784>
t1 == t2       # => true

# ここで`identifier'をprotectedにする。
# protected はレシーバとして`other'を許容するため、これは動作する。

class Test
  protected :identifier
end

t1 == t2  # => true

# ここで`identifier'をprivateにする。

class Test
  private :identifier
end

t1 == t2
# NoMethodError: private method `identifier' called for #<Test:0x342784>
{% endhighlight %}

### クラスは開いている

Rubyのクラスは開いています。
いつでもクラスを開いて、定義を足したり、変更することができます。
`Integer`や、すべてのオブジェクトの祖先である`Object`のようなクラスであっても、
自由に再定義することが可能です。Ruby on Railsは、次のような
`Integer`に時間を扱うメソッド群を定義しています。

{% highlight ruby %}
class Integer
  def hours
    self * 3600 # 1時間あたりの秒数を返します
  end
  alias hour hours
end

# 1月1日の0時0分から14時間後
Time.mktime(2006, 01, 01) + 14.hours # => Sun Jan 01 14:00:00
{% endhighlight %}

### 不思議なメソッド名

Rubyでは、メソッド名の最後に疑問符(?)や感嘆符(!)が使われることがあります。
慣習的に、問い合わせ系のメソッドの最後には疑問符が使われます
(例: レシーバが空の場合に`true`を返す`Array#empty?`)。
また、使用に危険を伴うメソッドの最後には感嘆符が使われます
(例: `self`あるいは引数の内容を書き換えるようなメソッド。`exit!`など)。
けれど、危険なメソッドすべてがこの慣習に従っているわけでも
ないことに注意してください。
`Array#replace`は、与えられた配列の内容で配列の内容を置き換えます。
この操作は、自身を**変更しない**ようなメソッド名とは意に反する振る舞いをします。

### 特異メソッド

特異メソッドはオブジェクト単位のメソッドです。
特異メソッドは、定義したオブジェクトからだけ利用できるメソッドになります。

{% highlight ruby %}
class Car
  def inspect
    "Cheap car"
  end
end

porsche = Car.new
porsche.inspect # => Cheap car
def porsche.inspect
  "Expensive car"
end

porsche.inspect # => Expensive car

# 他のオブジェクトには影響しない
other_car = Car.new
other_car.inspect # => Cheap car
{% endhighlight %}

### 「存在しなかった」メソッド

Rubyはメッセージに対応するメソッドを見つけられなかったとしても諦めません。
その場合は、見つけられなかったメソッド名と引数と共に、
`method_missing`メソッドを呼び出します。
`method_missing`メソッドはデフォルトではNameError例外を投げますが、
アプリケーションに合うように再定義することもできます。
実際、多くのライブラリがそのようにしています。
以下がその例です。

{% highlight ruby %}
# idは呼び出されたメソッド名です。
# *構文は「arguments」という名前の配列に
# 呼び出されたメソッドに渡されたすべての引数を格納します。
def method_missing(id, *arguments)
  puts "Method #{id} was called, but not found. It has " +
       "these arguments: #{arguments.join(", ")}"
end

__ :a, :b, 10
# => Method __ was called, but not found. It has these
# arguments: a, b, 10
{% endhighlight %}

このコードは単に呼び出されたメソッドの詳細を出力しているだけですが、
ここには何を書いても良いので、メッセージを受け取って適切な処理を行えます。

### 関数呼び出しではなくメッセージ送信

メソッド呼び出しは実際には他のオブジェクトへの**メッセージ送信**です。

{% highlight ruby %}
# これは
1 + 2
# これと同じで...
1.+(2)
# つまりこういうことです。
1.send "+", 2
{% endhighlight %}

### ブロックは作りかけのオブジェクト

ブロック(実際にはクロージャ)は標準ライブラリでもすごく使われています。
ブロックを呼び出すには、`yield`を使うか、引数リストに特別な引数を追加して
それを`Proc`オブジェクトにします。以下がその例です。

{% highlight ruby %}
def block(&the_block)
  # この内側では、the_blockはメソッドに渡されたブロックになります。
  the_block # ブロックが返ります
end
adder = block { |a, b| a + b }
# adderはここでProcオブジェクトになります
adder.class # => Proc
{% endhighlight %}

`Proc.new`にブロックを渡すか、`lambda`メソッドを呼び出すことで、
メソッド呼び出しの外側でブロックを作成することもできます。

同様に、メソッドもまた作りかけのオブジェクトです。

{% highlight ruby %}
method(:puts).call "putsはオブジェクト!"
# => putsはオブジェクト!
{% endhighlight %}

### 演算子は糖衣構文(シンタックスシュガー)

Rubyにおけるほとんどの演算子は糖衣構文です。
いくつかの優先順位規則にもとづいて、メソッド呼び出しを単に書き換えているだけです。
たとえば、Integerクラスの`+`メソッドを次のようにオーバーライドすることもできます。

{% highlight ruby %}
class Integer
  # できるけれど、しないほうがいいでしょう
  def +(other)
    self - other
  end
end
{% endhighlight %}

C++の`operator+`などは必要ありません。

`[]`や`[]=`といったメソッドを定義すれば、配列のようなスタイルでアクセスすることもできます。
(+1や-2みたいな)単項の+や-を定義するには、`+@`か`-@`といったメソッドを定義する必要があります。
けれど、以下の演算子は糖衣構文では**ありません**。
これらはメソッドではないので、再定義できません。

{% highlight ruby %}
=, .., ..., not, &&, and, ||, or, ::
{% endhighlight %}

加えて`+=`、`*=`などは`var = var + other_var`、`var = var * other_var`
などの処理の略記法になり、これらも再定義できません。

## もっと知りたい

Rubyについてもっと知りたくなったのなら、
[ドキュメント](/ja/documentation/)の
その他のコンテンツを見てみてください。



[faq]: http://ruby-doc.org/docs/ruby-doc-bundle/FAQ/FAQ.html
