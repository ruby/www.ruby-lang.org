---
layout: page
title: "20分钟体验 Ruby，第2页 - Ruby 官方网站"
lang: zh_cn

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
  <h1>20分钟体验 Ruby</h1>

---

如果您想说很多次“Hello”，却不想把手指累酸的话，是定义一个函数的时候啦！

{% highlight irb %}
irb(main):010:0> def h
irb(main):011:1> puts "Hello World!"
irb(main):012:1> end
=> nil
{% endhighlight %}

`def h` 定义一个函数。它告诉 Ruby 我们的函数名字是 `h`。下一行是函数的内容， 正是我们前面看到过的那行代码：`puts
"Hello World!"`。最后的一行 `end` 告诉 Ruby 函数的定义完成了。

## 函数的周期简短而又频繁

我们来试着把这个函数调用几次：

{% highlight irb %}
irb(main):013:0> h
Hello World!
=> nil
irb(main):014:0> h()
Hello World!
=> nil
{% endhighlight %}

很方便吧。在 Ruby 里调用函数就像提起 Ruby 的名字一样简单。如果函数不需要接受参数，
您只要提到它就够了。您可以加一对括号，但不是必需的。

如果您想对一个人而不是全世界说您好呢？只要让 `h` 函数接受一个参数就可以了。

{% highlight irb %}
irb(main):015:0> def h(name)
irb(main):016:1> puts "Hello #{name}!"
irb(main):017:1> end
=> nil
irb(main):018:0> h("Matz")
Hello Matz!
=> nil
{% endhighlight %}

和期待的一样。让我们再仔细看看究竟发生了什么。

## 在字符串中预留位置

啥是 `#{name}` 啊？这是 Ruby 用来往字符串中插入信息的方法。大括号里面的代码会被替换为评估后的字符串
（如果他们还不是字符串的话）然后插入到包含大括号的原始字符串中去。 您可以用这个方法将人名大写：

{% highlight irb %}
irb(main):019:0> def h(name = "World")
irb(main):020:1> puts "Hello #{name.capitalize}!"
irb(main):021:1> end
=> nil
irb(main):022:0> h "chris"
Hello Chris!
=> nil
irb(main):023:0> h
Hello World!
=> nil
{% endhighlight %}

这里还有几个小窍门。第一是我们又一次省略了函数的括号。如果我们的命令看起来意图很明显的话， 函数的括号是可以省略的。另一个是函数缺省的参数值是
`World`。意思就是说 “如果 name 参数没有给出的话， name 的缺省值就设置为 `“World"`。

## 如何更有礼貌

让我们更有礼貌一些，不光记住您的名字，还在您到来的时候欢迎您，并且始终彬彬有礼。 您可以开始使用对象了。我们先建立 “Greeter”
(有礼貌的人) 类。

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
=> nil
{% endhighlight %}

新的关键字 `class`！ 这个关键字定义了一个新的类 Greeter 和它的一些函数。 特别留意一下
`@name`，这是一个实例变量。类里面的任何函数都可以使用实例变量。 您可以看到 `say_hi` 和 `say_bye` 函数都使用了它。

下面我们要带着 Greeter 类出来活动活动了。[建立对象](../3/)
