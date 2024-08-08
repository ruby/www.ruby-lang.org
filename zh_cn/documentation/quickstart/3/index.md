---
layout: page
title: "20分钟体验 Ruby，第3页 - Ruby 官方网站"
lang: zh_cn

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
  <h1>20分钟体验 Ruby</h1>

---

我们来建立一个 greeter 对象然后使用它：

{% highlight irb %}
irb(main):035:0> g = Greeter.new("Pat")
=> #<Greeter:0x16cac @name="Pat">
irb(main):036:0> g.say_hi
Hi Pat!
=> nil
irb(main):037:0> g.say_bye
Bye Pat, come back soon.
=> nil
{% endhighlight %}

当 `g` 对象被建立后，它就记住了名字属性的值 Pat。Hmm… 如果我们想直接读取名字的值呢？

{% highlight irb %}
irb(main):038:0> g.@name
SyntaxError: compile error
(irb):52: syntax error
        from (irb):52
{% endhighlight %}

晕，做不到。

## 揭开对象的面纱

实例变量是被隐藏起来的，但他们并不是被完全的隐藏起来。
当您检查一个对象的时候还是可以看到他们的。Ruby采用了面向对象的思想，将内部属性保护了起来。

到底 Greeter 有哪些函数呢？

{% highlight irb %}
irb(main):039:0> Greeter.instance_methods
=> ["method", "send", "object_id", "singleton_methods",
    "__send__", "equal?", "taint", "frozen?",
    "instance_variable_get", "kind_of?", "to_a",
    "instance_eval", "type", "protected_methods", "extend",
    "eql?", "display", "instance_variable_set", "hash",
    "is_a?", "to_s", "class", "tainted?", "private_methods",
    "untaint", "say_hi", "id", "inspect", "==", "===",
    "clone", "public_methods", "respond_to?", "freeze",
    "say_bye", "__id__", "=~", "methods", "nil?", "dup",
    "instance_variables", "instance_of?"]
{% endhighlight %}

哇。。。有这么多！可我们只定义了两个啊，怎么回事？这里列出的其实是 Greeter 对象包含的 **所有**
的函数，当然也就包括了它所继承的类的函数了。如果我们只希望列出 Greeter 自己的函数，可以提供一个 `false` 参数给
`instance_methods`，表示我们不希望列出祖先类的函数。

{% highlight irb %}
irb(main):040:0> Greeter.instance_methods(false)
=> ["say_bye", "say_hi"]
{% endhighlight %}

看起来好多了。我们来看看 greeter 会对哪些函数作出回应：

{% highlight irb %}
irb(main):041:0> g.respond_to?("name")
=> false
irb(main):042:0> g.respond_to?("say_hi")
=> true
irb(main):043:0> g.respond_to?("to_s")
=> true
{% endhighlight %}

它知道 `say_hi` 和 `to_s`（意思是把什么东西转换成字符串，这是每个对象都有的功能）， 但是它不知道 `name`。

## 改变类吧，永远都不晚

假如您想获取甚至改变名字属性呢？Ruby 提供了一个简单的方法来访问属性。

{% highlight irb %}
irb(main):044:0> class Greeter
irb(main):045:1>   attr_accessor :name
irb(main):046:1> end
=> [:name, :name=]
{% endhighlight %}

在 Ruby 里，您可以把一个类打开然后改变它。这些改变会对以后生成的甚至是已经生成的对象产生即时效果。 下面我们来建一个新的 Greeter
对象，然后看一看它的 `@name` 属性。

{% highlight irb %}
irb(main):047:0> g = Greeter.new("Andy")
=> #<Greeter:0x3c9b0 @name="Andy">
irb(main):048:0> g.respond_to?("name")
=> true
irb(main):049:0> g.respond_to?("name=")
=> true
irb(main):050:0> g.say_hi
Hi Andy!
=> nil
irb(main):051:0> g.name="Betty"
=> "Betty"
irb(main):052:0> g
=> #<Greeter:0x3c9b0 @name="Betty">
irb(main):053:0> g.name
=> "Betty"
irb(main):054:0> g.say_hi
Hi Betty!
=> nil
{% endhighlight %}

`attr_accessor` 会自动为我们定义两个新的函数， `name` 用来读取变量的值， `name=` 用来给变量赋值。

## 见面熟的 MegaGreeter！

已经建立好的这个 greeter 不是那么有新意，它一次只能向一个人问好。如果我们有一个 MegaGreeter
可以同时向世界，一个人，甚至向一群人问好，那该多好啊？

我们不再使用互动 Ruby 的解析器 IRB 了，而是把代码写到一个文件里。

输入 “exit” 或者按下 Control-D 退出 IRB。

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

把这个文件储存到 “ri20min.rb”， 然后在命令行输入 “ruby ri20min.rb” 来运行它。 您应该可以看到：:

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

这个例子里有很多新鲜的代码，我们还是来[仔细的瞧瞧](../4/)
