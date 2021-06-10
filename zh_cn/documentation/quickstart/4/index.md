---
layout: page
title: "20分钟体验 Ruby，第4页 - Ruby 官方网站"
lang: zh_cn

header: |
  <div class="multi-page">
    <a href="../" title="Part 1">1</a>
    <span class="separator"> | </span>
    <a href="../2/" title="Part 2">2</a>
    <span class="separator"> | </span>
    <a href="../3/" title="Part 3">3</a>
    <span class="separator"> | </span>
    <strong>4</strong>
  </div>
  <h1>20分钟体验 Ruby</h1>

---

下面我们来看看这个新的程序。请注意由 (#) 开始的第一行。 在 Ruby 里面，任何代码中井字符后面的内容都会被解释器忽略。
而第一行有点特别，因为在 Unix 操作系统下， 井字符开头的第一行告诉了系统的 Shell
如何执行这个文件。其他井字符引导的注释只是起说明的作用。

我们熟悉的 `say_hi` 函数也了有点变化：

{% highlight ruby %}
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
{% endhighlight %}

它现在会根据 `@names` 参数的不同而采取不同的行动。如果参数是 nil，它会打印三个点。没有理由和空气问好对吗？

## 循环，迭代

如果 `@names` 对象可以回应 `each` 函数，那它就是可以被迭代的， 于是我们对它做迭代，向每个人问好。最后如果 `@names`
是其他的类， 就把它转化为字符串，用默认的方式问好。

下面看一看这个迭代结构

{% highlight ruby %}
@names.each do |name|
  puts "Hello #{name}!"
end
{% endhighlight %}

`each` 是一个可以接受代码块的函数。它在迭代每一个元素时都会调用一次之前所接受到的代码块。 代码块像是一个不需要命名的函数，和
`lambda` 类似。 在`|  |`之间的就是传输给代码块的参数。

具体来说就是在每一次循环中，`name` 首先被赋值为 `list` 里面一个对应元素的值， 然后作为参数传递到 `puts "Hello
#{name}!"` 这句命令里。

大多数编程语言都是用 `for` 循环来完成迭代的，比如在 C 里面：

{% highlight c %}
for (i=0; i<number_of_elements; i++)
{
  do_something_with(element[i]);
}
{% endhighlight %}

这样也成，不过不那么优美。您需要一个没什么意思的 `i` 来监控列表长度和检测循环退出的判断。 Ruby
的方法对比来看就更清爽，所有的清理工作都被隐藏在 `each` 函数里了， 您只需要告诉它您想做什么。在 `each`
函数内部，实际上会去自动调用 `yield "Albert"`，`yield "Brenda"`，`yield "Charles"`，等等。

## 代码块，让 Ruby 闪亮

代码块最有用的地方是用来处理比迭代列表更繁琐的工作。除了一般家务活之外， 您可以用它来自动安装卸载或处理运行错误。真正做到让用户省心、放心。

{% highlight ruby %}
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
{% endhighlight %}

`say_bye` 函数并没有用到 `each`，而是查看 `@names` 是否支持 `join`
函数。如果是的话就调用，否则就简单的将变量转化为字符串。
这种不在乎*类*的作风就是常说的“鸭子型”，意思就是说“如果它走起来像鸭子，叫起来像鸭子，
那它一定是鸭子”。这种思想的好处就是不限制函数所支持的参数类别。 如果有人写了一个新的类，只要它像其他列表类一样回应 `join` 这个函数，
那它就可以被相应的其他函数所使用。

## 让脚本跑起来

这就是 MegaGreeter 类的所有内容了。剩下的代码就只是调用一下这个类的函数。 还有最后一点小技术在这里：

{% highlight ruby %}
if __FILE__ == $0
{% endhighlight %}

`__FILE__` 是一个魔法值，它存有现在运行的脚本文件的名字。`$0` 是启动脚本的名字。 代码里的比较结构的意思是
“如果这是启动脚本的话...” 这允许代码作为库调用的时候不运行启动代码， 而在作为执行脚本的时候调用启动代码。

## 就这么多啦

Ruby 20分钟体验已经结束了，但 Ruby 还有无数值得探索的地方：代码块与 `yield`， 模块与 mixins，等等。在简短的体验了
Ruby 语言后，希望您愿意进一步接触它。

如果您希望进一步了解 Ruby，可以到我们的 [文档](/zh_cn/documentation/) 部分。
那里汇集了更多的手册和介绍，全部免费的哦。
