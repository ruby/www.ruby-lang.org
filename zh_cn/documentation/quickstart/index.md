---
layout: page
title: "20分钟体验 Ruby - Ruby 官方网站"
lang: zh_cn

header: |
  <div class="multi-page">
    <strong>1</strong>
    <span class="separator"> | </span>
    <a href="2/" title="Part 2">2</a>
    <span class="separator"> | </span>
    <a href="3/" title="Part 3">3</a>
    <span class="separator"> | </span>
    <a href="4/" title="Part 4">4</a>
  </div>
  <h1>20分钟体验 Ruby</h1>

---

## 介绍

这是个不会超过20分钟的 Ruby 简介。阅读前请您先将 Ruby 安装好。（如果您还没有安装Ruby 的话请到
[下载区](/zh_cn/downloads/) 下载并安装。）

## Ruby 的互动性

打开 IRB

* 如果您使用 **macOS** 打开 `Terminal` 然后输入 `irb`，回车
* 如果您使用 **Linux**，打开一个 Shell，然后输入 `irb`，回车
* 如果您使用 **Windows**，打开 开始菜单 -&gt; Ruby -&gt; `Interactive Ruby`

{% highlight irb %}
irb(main):001:0>
{% endhighlight %}

已经打开了。继续？

输入：`"Hello World"`

{% highlight irb %}
irb(main):001:0> "Hello World"
=> "Hello World"
{% endhighlight %}

## Ruby 顺从您！

刚才是怎么回事啊？难道我们刚写了世界上最短的 “Hello World” 程序吗？ 不是的。第二行显示的只是 IRB
给我们的上一个命令的返回值。 如果我们要打印 “Hello World” 的话，还需要更多一点代码：

{% highlight irb %}
irb(main):002:0> puts "Hello World"
Hello World
=> nil
{% endhighlight %}

`puts` 是 Ruby 语言里用来打印的基本命令。那 `=> nil` 是什么？其实是命令的返回值。 `puts` 命令永远返回
nil，nil 也是 Ruby 的空值。

## 您的免费计算器

我们已经可以使用 IRB 提供的免费计算器啦！

{% highlight irb %}
irb(main):003:0> 3+2
=> 5
{% endhighlight %}

三加二很简单。三减二呢？您可以试试啊。虽然输入的命令很短，不过您可以在原来命令的基础上进行修改。 试着按一下 **上方键**
看看是不是打出了原来输入的 `3+2`。 如果能正常显示出的话，您可以用**左方键**来移动光标直到 `+`，然后按退格删除它 并输入 `*`。

{% highlight irb %}
irb(main):004:0> 3*2
=> 6
{% endhighlight %}

下面我们来试试次方：

{% highlight irb %}
irb(main):005:0> 3**2
=> 9
{% endhighlight %}

在 Ruby 里 `**` 是“次方”的意思。但如果您想开根号呢？

{% highlight irb %}
irb(main):006:0> Math.sqrt(9)
=> 3.0
{% endhighlight %}

等一下！上面那个东西是什么？您猜想：“它是不是真的对 9 开了平方呢？” 您猜对了！我们还是来仔细看一下。第一，什么是 `Math`？

## 模块，给代码分组

`Math` 是一个自带的数学模块。模块在 Ruby 里有两个作用。第一： 把功能相似的函数放到同一个名称下。`Math` 模块还有
`sin()` 和 `tan()` 这样的函数。

接下来的是一个点。点是干什么用的？点是用来告诉一个接收者它所要接受的信息。 什么是信息？在这个例子里面，信息就是
`sqrt(9)`，意思就是调用 `sqrt` 函数， 并给它 `9` 作为参数。当然 `sqrt` 就是 “square root” 的缩写。

这个函数的返回值是 `3.0`。您一定发现了它不光只是`3`，还多了小数部分。 这是因为大多数情况下，开方的结果并不是整数，所以` sqrt`
始终会返回浮点数。

如果我们想记住运算结果呢？存到变量里吧。

{% highlight irb %}
irb(main):007:0> a = 3 ** 2
=> 9
irb(main):008:0> b = 4 ** 2
=> 16
irb(main):009:0> Math.sqrt(a+b)
=> 5.0
{% endhighlight %}

尽管这是个非常好的计算器，我们已经要从基本的 `Hello World` 程序向更有意思的领域迈进了。[现在就开始吧](2/)
