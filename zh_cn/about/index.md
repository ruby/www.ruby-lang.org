---
layout: page
title: "关于 Ruby"
lang: zh_cn
---

想知道 Ruby 为什么会如此受欢迎吗？在粉丝眼中，Ruby 是一门优美而巧妙的语言，他们还认为 Ruby 易于使用，能解决实际问题。想知道受到这些赞誉的原因吗？
{: .summary}

### Ruby 发明者的理想

Ruby 是一个注重均衡的语言，它的发明者[松本行弘（Yukihiro “Matz” Matsumoto）][matz]，混合了他喜欢的多门语言（Perl、Smalltalk、Eiffel、Ada 和 Lisp），创造出了一种兼具函数式编程和命令式编程特色的新语言。

他常说，他是“试着让 Ruby 更自然，而不是更简单”，让一切符合生活常规。

除此之外，他还提到：

> Ruby 就像人的身体一样，表面上看来简单，但是内部却相当复杂。<sup>[1](#fn1)</sup>

### Ruby 的成长

自从 1995 年公开发布以来，Ruby 在全球吸引了许多忠实的程序员。2006 年，Ruby 得到广泛接受，各大城市都有活跃的用户组，以及 Ruby 相关的开发者大会。

在主要的[邮件列表](/zh_cn/community/mailing-lists/) Ruby-Talk 中，讨论 Ruby 语言的消息攀升到每日 200 封。近几年，消息数量有所下降，因为社区在不断变大，由一个集中的邮件列表分成了很多小型的讨论组。

Ruby 经常位于全球编程语言成长和流行度指数的前十名（比如[TIOBE][tiobe]）。造成 Ruby 如此快速成长的原因很大程度上是因为使用 Ruby 编写的 Web 框架 [Ruby on Rails][ror] 非常受欢迎。

Ruby [完全免费]({{ site.license.url }})，除了不收费之外，还可以自由使用、复制、修改和分发。

### 把一切视为对象

最初，Matz 从其它语言中找寻理想的语法。回想他的研究，他说，“我想要一种比 Perl 更强大、比 Python 更面向对象的脚本语言”。<sup>[2](#fn2)</sup>

在 Ruby 中，一切皆对象。所有的信息和代码都拥有属性和行为。面向对象编程称属性为实例变量（*instance variables*），称行为为方法（*methods*）。 从下列代码可以看出，Ruby 能给数字赋于行为，从这一点可以证明，Ruby 是纯面向对象的语言。

{% highlight ruby %}
5.times { print "We *love* Ruby -- it's outrageous!" }
{% endhighlight %}

在许多语言中，数字和其它基本类型都不是对象。而 Ruby 受 Smalltalk
语言影响，所有类型都可以赋予方法和实例变量。这一点让 Ruby 特别易于使用，因为适用于对象的规则适用于 Ruby 中的一切。

### Ruby 的灵活性

Ruby 是一门相当灵活的语言，允许用户改变自身。 Ruby 的核心部分可以更改，也可以重新定义。此外，还可以在现有功能的基础上增加新功能。Ruby 不想阻碍程序员的创造力。

比如，加号（`+`）是做加法的运算符。如果你更喜欢使用易读的 `plus` 的话，可以给 Ruby 内置的 `Numeric` 类添加一个函数。

{% highlight ruby %}
class Numeric
  def plus(x)
    self.+(x)
  end
end

y = 5.plus 6
# y 现在等于 11
{% endhighlight %}

Ruby 的运算符只是语法糖 (syntactic sugar)，随时可以重定义。

### 代码块：表现力强大的特性

Ruby 的代码块非常灵活。程序员可以给任何方法添加闭包，指明方法该如何工作。闭包也叫代码块，是从其他命令式语言（比如 PHP、Visual Basic 等）转到 Ruby 的初学者最喜欢使用的特性。

代码块取自函数式语言。Matz 说：“我希望在 Ruby 的闭包中融入 Lisp 的文化。”<sup>[3](#fn3)</sup>

{% highlight ruby %}
search_engines =
  %w[Google Yahoo MSN].map do |engine|
    "http://www." + engine.downcase + ".com"
  end
{% endhighlight %}

在上述代码中，代码块使用 `do ... end` 结构表述。`map` 方法把代码块应用到单词列表上。Ruby 中有很多方法都留出了切入点，让程序员编写代码块，控制方法具体的操作细节。

### Ruby 中的混入

与其他面向对象语言不同，Ruby“有意”只提供单继承。不过 Ruby 有模块（在 Objective-C 中叫做类别）。模块是一系列方法。

类可以混入模块，得到模块中的所有方法。例如，所有实现 `each` 方法的类可以混入 `Enumerable` 模块，得到这个模块提供的所有方法，当然这些方法都会调用 `each` 做循环。

{% highlight ruby %}
class MyArray
  include Enumerable
end
{% endhighlight %}

一般来说，Ruby 高手认为这种方式比多重继承更简洁。多重继承复杂，而且可能有太多限制。

### Ruby 的视觉呈现

尽管 Ruby 只用很少的符号，而且偏向使用英文单词做关键字，但是也用一些符号装饰 Ruby。在 Ruby 中，不需要提前声明变量。Ruby 使用简单的命名约定指明变量的作用域。

* `var` 可能是局部变量
* `@var` 是实例变量
* `$var` 是全局变量

这些符号能让程序员轻易识别变量的作用。此外，实例成员前面无需加上烦人的 `self.`。

### 更上层楼

Ruby 还有其他众多特性，下面列举一些：

* Ruby 的异常处理特性与 Java 和 Python 类似，易于处理错误。

* Ruby 拥有一个针对所有对象的标识-清扫（mark-and-sweep）式垃圾回收程序）。使用者无需维护扩展库中的引用计数。正如   Matz 所说：“这对您的健康有益。”

* 为 Ruby 写 C 扩展比 Perl 和 Python 容易，因为 Ruby 有一个非常雅致的 API，能从 C 语言中调用 Ruby。例如，调用软件中内嵌的 Ruby，当做脚本语言使用。此外，还有 SWIG 接口可用。

* 如果操作系统允许，Ruby 可以动态加载扩展库。

* Ruby 提供不依赖操作系统的线程。所以，不管操作系统是否支持，Ruby 支持的所有操作系统都可以使用多线程，甚至是 MS-DOS!

* Ruby 高度可移植：它主要在 GNU/Linux 上开发，但也支持很多类型的 UNIX，以及 macOS，Windows，DOS，BeOS，OS/2 等。

### Ruby 的其他实现

作为一门语言，Ruby 有不同的实现。本页讨论的是推荐的实现，社区通常称之为 **MRI**（“Matz’s Ruby Interpreter”）或 **CRuby**（因为是用 C 语言写的）。不过，还有一些别的实现。其他实现通常在特定的场合中有用，集成了其他语言或环境，或者有 MRI 不具有的特性。

下面列出一些其他实现：

* [JRuby][jruby] 是基于 JVM（Java Virtual Machine）的 Ruby 实现，利用了 JVM 中优秀的 JIT 编译器、垃圾回收程序、并发线程、工具生态系统和大量的库。
* [Rubinius][rubinius] 是用“Ruby 编写的 Ruby”。构建于 LLVM 之上，Rubinius 跑在一个很灵活的虚拟机上，别的语言也可以构建于这个虚拟机上。
* [mruby][mruby] 是 Ruby 语言的轻量级实现，可以链接或嵌入到程序之中。mruby 由 Ruby 的创建者松本行弘（Matz）领导开发。
* [IronRuby][ironruby] 是一个“与 .NET 框架紧密集成”的实现。
* [MagLev][maglev] 是“一个快速、稳定的 Ruby 实现，支持集成对象持久化和分布式共享缓存”。
* [Cardinal][cardinal] 是一个“为 [Parrot][parrot] 虚拟机 （Perl 6）编写的 Ruby 编译器”。

### 参考资料

<sup>1</sup> [2000 年 5 月 12 日][blade]，Matz 在 Ruby-Talk 邮件列表中发布的消息。
{: #fn1}

<sup>2</sup> 2001 年 11 月 29 日，Matz 在[接受采访][linuxdevcenter]时说的话。
{: #fn2}

<sup>3</sup> 摘自 2003 年 12 月 22 日发布的文章——“[Blocks and Closures in Ruby][artima]”。
{: #fn3}



[matz]: http://www.rubyist.net/~matz/
[blade]: https://blade.ruby-lang.org/ruby-talk/2773
[ror]: http://rubyonrails.org/
[linuxdevcenter]: http://www.linuxdevcenter.com/pub/a/linux/2001/11/29/ruby.html
[artima]: http://www.artima.com/intv/closures2.html
[tiobe]: http://www.tiobe.com/index.php/content/paperinfo/tpci/index.html
[jruby]: http://jruby.org
[rubinius]: http://rubini.us
[mruby]: http://www.mruby.org/
[ironruby]: http://www.ironruby.net
[maglev]: http://maglev.github.io
[cardinal]: https://github.com/parrot/cardinal