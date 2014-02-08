---
layout: page
title: "关于 Ruby - Ruby 官方网站"
lang: zh_cn
---

想知道 Ruby 为什么会如此受欢迎吗？为什么使用过它的支持者都称赞它为巧妙、优雅且易用更实用有趣的语言？

### Ruby 发明者的理想

Ruby 是一个注重均衡的语言，它的发明者[松本行弘 Yukihiro “Matz” Matsumoto][matz]，混合了他喜欢的语言（Perl、
Smalltalk、 Eiffel、 Ada 和 Lisp ） 产生了一种具有函数式及指令程序设计特性的新语言。

他常说，他是“试着让 Ruby 更自然，而不是简单，就像生活一样”。

除此之外，他还提到：

Ruby 就像人的身体一样，表面上看来简单，但是内部却相当的复杂[\[1\]](#fn1)。

### Ruby 的成长

在 1993 年，没有人会相信一个由日本业余语言设计者创建的面向对象的语言，能最终在世界范围内被广泛使用并且变得几乎像 Perl 那样流行。自从
1995 年 Ruby 公开发表以来，Ruby 在全球吸引了许多忠实的程序设计员。在 2006 年，Ruby
被广泛接受。在各大城市都有活跃的使用者并通过社区举办许许多多场场爆满的研讨会。

![Graph courtesy of
Gmane.](http://gmane.org/plot-rate.php?group=gmane.comp.lang.ruby.general&amp;width=320&amp;height=160&amp;title=Ruby-Talk+Activity
"Graph courtesy of Gmane."){: style="padding-left:8px;"}
{: style="float:right"}

在 Ruby-Talk，主要的[ 邮件列表](/zh_cn/community/mailing-lists/) 上，讨论 Ruby
语言的文章爬升到每日 200 封。

在 [TIOBE][tiobe]， 最流行的开发语言排名调查中， Ruby 排名为全球第 11 位。 根据这样的成长情况，他们预测“在半年之中
Ruby 将会进入最受欢迎开发语言的前 10 名。”有越来越多受欢迎的软件如 [Ruby on Rails][ror]
web framework 是使用 Ruby 撰写而成，也是造成 Ruby 如此快速成长的原因。

Ruby 是[开源软件]({{ site.license.url }})。 不只是免费，而且可以自由的使用、复制、修改与发布。

### 所见到的都是对象

最初，Matz
从其它语言中找寻理想的语法，在网络上他做了一段时间的调查，找到候选如“Perl“和“Python“。但都不是他想要的，他需要一个比 Perl
更强大、比 Python 更面向对象的语言[\[2\]](#fn2)。

在 Ruby 中，所有的东西都是对象，所有的信息和代码都可以给它们所拥有的属性和行为。面向对象程序设计中称属性为实例变量（*instance
variables*），称命令为方法 （*methods*）。 从下列程序代码中看到 Ruby 能够给数字赋于行为，从这点可以证明 Ruby
是纯面向对象的语言。

{% highlight ruby %}
5.times { print "We *love* Ruby -- it's outrageous!" }
{% endhighlight %}

在许多语言中，数字和其它原生的类型都不是对象。而 Ruby 受 Smalltalk
语言影响，让所有的类型都可以赋予方法及产生实例变量，并让这些规则适用于 Ruby 所有对象。

### Ruby 的灵活性

Ruby 是一个相当灵活的语言，她允许用户去改变她本身。 Ruby 的核心部分可以被更改或重新定义，模块可以被添加。Ruby
试着不去妨碍程序员。

比如(`+`) 是用做加法的运算符。如果你更喜欢使用易读的 `plus` 的话，你可以给 Ruby 的内建 `Numeric` 类添加一个函数。

{% highlight ruby %}
class Numeric
  def plus(x)
    self.+(x)
  end
end

y = 5.plus 6
# y is now equal to 11
{% endhighlight %}

Ruby 的符号只是语法的甜头 (syntactic sugar)。你可以随时重定义他们。

### Blocks，一个独特且强大的特性

Ruby 的代码块是非常强大的。程序员可以给任何函数添加一个密封 (closure)
来表述这个函数该如何工作。密封也被叫做代码块，是用过其他比如 PHP, Visual Basic 等规则语言的 Ruby
的初学者最喜欢使用的一个功能。

代码块取自函数语言。Matz 说：“我希望在 Ruby 的密封中融入 Lisp 的文化 [\[3\]](#fn3)。”

{% highlight ruby %}
search_engines =
  %w[Google Yahoo MSN].map do |engine|
    "http://www." + engine.downcase + ".com"
  end
{% endhighlight %}

在上面的代码中，代码块是在 `do ... end` 中的结构。 `map` 函数将代码块应用到一个词的列表中。Ruby
的其他函数经常会为程序员留出一个空当给代码块来控制函数的功能。

### Ruby 与 Mixin

于其他面向对象语言不同，Ruby “有意”只提供单继承。不过 Ruby 拥有模块（在 Objective-C
里面叫做类别）。模块是把许多方法放在了一个类别里。

类可以混合一个模块，得到这个模块提供的所有方法。比如所有提供 `each` 方法的类可以混合 `Enumerable`
模块，来得到这个模块提供的所有方法，当然这些方法都会调用 `each` 做循环。

{% highlight ruby %}
class MyArray
  include Enumerable
end
{% endhighlight %}

一般来说，Ruby 爱好者相对于复杂和限制颇多的多态继承方法来讲更偏向于这种混合方法。

### Ruby 的面貌

尽管 Ruby 只用很少的符号并且偏向与英文单词做关键字，但是少量的符号也被用来装饰 Ruby。Ruby
不需要提前定义变量。它用简单的命名法来提示变量存在的范围。

* `var` 可以是局部变量。
* `@var` 是一个实例变量。
* `$var` 是一个全局变量。

这些信号让程序员更清楚的看到每一个变量的角色，增强了程序的可读性，也不需要在实例变量前面加上 `self.` 了。

### 更上一层楼

Ruby 还有其他丰富的特性：

* Ruby 有类似于 Java 和 Python 的异常处理，使处理错误更方便。

* Ruby 拥有一个针对所有对象的标识-清扫(mark-and-sweep)式垃圾收集器(garbage collector)。使用者无需维护扩展库中的引用计数(reference counts)。正如
  Matz 所说：“这对您的健康有益。”

* 为 Ruby 写 C 的扩展比 Perl 和 Python 更容易。Ruby 有一个非常雅致的 API 从 C 语言调用 Ruby。这包括把
  Ruby 作为嵌入式脚本语言时，从其他软件里调用 Ruby。SWIG 界面也是可选的。

* Ruby 可以在操作系统允许的情况下动态调用库。

* Ruby 提供不依赖操作系统的线程。所以在所有 Ruby 支持的操作系统里都可以使用多线程处理，不管操作系统支不支持，比如 MS-DOS!

* Ruby 极为轻便：它主要是在 GNU/Linux 上开发的，但也支持很多类型的 UNIX，以及 Mac OS X, Windows
  95/98/Me/NT/2000/XP，DOS，BeOS，OS/2 等。

### 参考资料

<sup>1</sup> Matz, 在 Ruby-Talk 邮件列表, [5月12日, 2000][blade].
{: #fn1}

<sup>2</sup> Matz, 在 [Ruby 创造者的采访][linuxdevcenter], 11月29日, 2001.
{: #fn2}

<sup>3</sup> Matz, 在 [Ruby 的代码块和闭合][artima], 12月22日, 2003.
{: #fn3}



[matz]: http://www.rubyist.net/~matz/
[blade]: http://blade.nagaokaut.ac.jp/cgi-bin/scat.rb/ruby/ruby-talk/2773
[ror]: http://rubyonrails.org/
[linuxdevcenter]: http://www.linuxdevcenter.com/pub/a/linux/2001/11/29/ruby.html
[artima]: http://www.artima.com/intv/closures2.html
[tiobe]: http://www.tiobe.com/index.php/content/paperinfo/tpci/index.html
