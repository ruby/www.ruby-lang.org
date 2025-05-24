---
layout: page
title: "从其它语言到 Ruby"
lang: zh_cn
---

当您初次看到 Ruby 语言代码的时候，它很可能让您想起您使用过的其他编程语言。这是当然的， 因为 Ruby 的大部分语法是
Perl、Python 和 Java（以及其他语言）的用户所熟悉的。 如果您曾经使用过这这些语言，学习 Ruby 就是小菜一碟。

本文包含了两部分。第一部分简明扼要地概述了当你从 *X* 到 Ruby 语言的一些所见所闻； 第二部分介绍了 Ruby 语言主要特性以及与你所熟悉的语言之间的差异。

## 可以期待什么: *从语言 X* 到 Ruby

* [从 C/C++ 到 Ruby](to-ruby-from-c-and-cpp/)
* [从 Java 到 Ruby](to-ruby-from-java/)
* [从 Perl 到 Ruby](to-ruby-from-perl/)
* [从 PHP 到 Ruby](to-ruby-from-php/)
* [从 Python 到 Ruby](to-ruby-from-python/)

## 重要的语言特性和一些小技巧

这里介绍了学习 Ruby 语言时应该注意的 Ruby 语言的特性。

### 迭代器

代码块和迭代是 Ruby 语言和其他语言不太一样的地方。我们可以以索引做循环（比如 C, C++, 或者 1.5 版本以前的
Java），或者以列表做循环（比如 Perl 的 `for (@a) {...}`， 还有 Python 的
`for i in aList: ...`），但是在 Ruby 中，我们常会看到

{% highlight ruby %}
some_list.each do |this_item|
  # 我们在代码块内内部。
  # 使用 this_item。
end
{% endhighlight %}

关于更多 `each`（还有 `collect`、`find`、`inject`、`sort` 等）的信息，请参考
`ri Enumerable` （和 `ri Enumerable#some_method`）。

### 一切表达方法皆有值

表达式和语句没有区别。任何表达方法都有返回值，即使那个值是 **nil**，比如下面的用法：

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

### 符号不是轻量的字符串

很多 Ruby 初学者都在想办法搞清楚什么是符号和怎么使用符号。

符号最好的描述是身份证。一个符号代表了它是“谁”，而不是代表了它是“什么”。 打开 `irb` 来看一看他们的区别：

{% highlight irb %}
irb(main):001:0> :george.object_id == :george.object_id
=> true
irb(main):002:0> "george".object_id == "george".object_id
=> false
irb(main):003:0>
{% endhighlight %}

`object_id` 函数返回的是对象的身份标识。如果两个对象有相同的 `object_id`， 那么他们就是相同的（指向同一个内存地址）。 可以看出，当符号在使用过一次后，任何相同字符的符号都会在内存中指向同一个对象地址。 也就是说任何相同字符的符号的 `object_id`
都是相同的。

(“george”)的字符串的 `object_id` 并不相同，这表示他们在内存种指向不同对象地址。 每当您创建一个新的字符串的时候，Ruby
会在内存中为它分配新的空间。

当您犹豫该用符号还是字符串的时候，想一下究竟字符的标识更重要（比如 Hash key）还是内容更重要 （比如前面例子里的 “george” ）。

### 一切皆是对象

“一切皆是对象”并不是夸张。即使是类和整型变量也都是对象，您可以想使用其他对象一样使用他们：

{% highlight ruby %}
# 等同于
# class MyClass
#   attr_accessor :instance_var
# end
MyClass = Class.new do
  attr_accessor :instance_var
end
{% endhighlight %}

### 可以改变的常量

常量并不是真正恒定的。如果您修改了一个已初始化的常量，会触发警告，但程序不会中止。 当然这也不是说您“**应该**”改变常量。

### 命名约定

Ruby 强制了一些命名约定。大写字母开头的是一个常量；美元符号(`$`)开头的是全局变量； `@` 开头的是实例变量； `@@` 开头的是类变量。 然而函数的名字却可以大写字母开头。这可能会导致一些混淆，比如下面的例子：

{% highlight ruby %}
Constant = 10
def Constant
  11
end
{% endhighlight %}

这里 `Constant` 是 10，而 `Constant()` 是 11。

### 关键字参数

类似 Python, 从 Ruby 2.0 开始，可以使用关键字参数定义方法

{% highlight ruby %}
def deliver(from: "A", to: nil, via: "mail")
  "Sending from #{from} to #{to} via #{via}."
end

deliver(to: "B")
# => "Sending from A to B via mail."
deliver(via: "Pony Express", from: "B", to: "A")
# => "Sending from B to A via Pony Express."
{% endhighlight %}

### 通用真值

Ruby 把任何不是 **nil** 和 **false** 的值当作真值。在 C，Python 和其他语言里，0 和一些其他的值，
比如空的列表，会被当作假值。看一看下面的 Python 代码（这个例子也可以被应用到其他语言）：

{% highlight python %}
# Python 中
if 0:
  print("0 为真")
else:
  print("0 为假")
{% endhighlight %}

这会打印出 “0 为假”，而在 Ruby 中：

{% highlight ruby %}
# Ruby 中
if 0
  puts "0 为真"
else
  puts "0 为假"
end
{% endhighlight %}

会打印出 “0 为真”。

### 权限声明应用至作用域底部

下面的 Ruby 代码中，

{% highlight ruby %}
class MyClass
  private
  def a_method; true; end
  def another_method; false; end
end
{% endhighlight %}

您可能认为 `another_method` 是公有的。并不是这样的，“private” 权限声明会一直应用到类声明底部，
或者直到另外一个权限声明开始起作用。函数默认是公开的：

{% highlight ruby %}
class MyClass
  # a_method 为公有
  def a_method; true; end

  private

  # another_method 为私有
  def another_method; false; end
end
{% endhighlight %}

`public`、`private` 和 `protected` 其实都是方法， 所以他们可以接受参数。如果您给他们传递一个符号的话，那么符号所代表的函数的可见性会被改变。

### 函数访问

在 Java 里，`public` 表示方法可以被任何人访问。`protected` 表示此类实例、继承此类的实例及在同一个包内的所有类的实例可以访问，其他人则不能。`private` 表示任何此类实例外的人都不能访问。

Ruby 有些不同。`public` 还是公开的。`private` 表示只有非明确指定接收者（receiver）才允许调用。私有方法调用只允许 **self** 为接收者。

`protected` 应该特别注意。受保护的方法可以被类及继承类的实例调用，同一个类的其他实例也可以调用。 来自[Ruby Language FAQ][faq] 的例子:

{% highlight ruby %}
class Test
  # 默认公开
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

# 修改 `identifier' 为受保护方法，仍然可用
# 因为受保护方法允许其他引用

class Test
  protected :identifier
end

t1 == t2  # => true

# 修改 `identifier' 为私有方法

class Test
  private :identifier
end

t1 == t2
# NoMethodError: private method `identifier' called for #<Test:0x342784>
{% endhighlight %}

### 类是开放的

Ruby 的类是开放的。任何时候你都可以打开它进行增加和修改。即使像 `Integer` 这样的核心类，甚至是所有对象的父类 `Object` 类都可以打开。Ruby on Rails 在 `Fixnum` 类里定义了一大堆方法来处理时间问题。请看：

{% highlight ruby %}
class Integer
  def hours
    self * 3600 # 一小时有多少秒
  end
  alias hour hours
end

# 一月一号之后的 14 个小时
# （也就是你醒来的时间）
Time.mktime(2006, 01, 01) + 14.hours # => Sun Jan 01 14:00:00
{% endhighlight %}

### 有趣的方法名

Ruby 的方法名允许以问号或感叹号结尾。习惯上，以问号结尾的方法返回布尔值（如：如果接收者为空的话 `Array#empty?` 返回 **true** ）。潜在“危险”方法（如修改 **self** 或参数的方法，`exit!` 等）以感叹号结尾。也不是所有修改参数的方法以感叹号结尾。 比如 `Array#replace` 方法将当前列表替换成另一个列表。毕竟这些方法就是为此而生的，**不修改**自身就没什么意义了。

### 单例方法（Singleton methods）

单例方法是单一对象方法。只在定义过的对象上可用。

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

# 其他对象不受影响
other_car = Car.new
other_car.inspect # => Cheap car
{% endhighlight %}

### Missing 方法

针对不存在的方法，Ruby 同样会进行处理。它会将这个不存在的方法名作为参数传递给 `method_missing`。`method_missing` 默认会抛出一个 NameError 异常，可以根据你的应用场景重新定义这个方法，许多库都是这么做的。看下面这个例子：

{% highlight ruby %}
# id 是被调用的方法，* 号语法将所有参数收集到 "arguments" 数组内
def method_missing(id, *arguments)
  puts "调用了不存在的方法：#{id}。它的参数：#{arguments.join(", ")}"
end

__ :a, :b, 10
# => 调用了不存在的方法：__。它的参数：a, b, 10
{% endhighlight %}

上面的代码会打印出调用细节，你也可以选择任何适当的方式处理这个消息。

### 消息传递，非函数调用

方法调用实际将一条 **消息** 传递给另一个对象：

{% highlight ruby %}
# 这个
1 + 2
# 跟下面这一样
1.+(2)
# 跟下面这个也一样
1.send "+", 2
{% endhighlight %}

### 代码块也是对象，只是它们自己还不知道

代码块（实际是闭包）广泛应用于标准库。可以使用 `yield` 调用一个代码块，或者像下面这样，通过一个特殊的参数将它变为一个 `Proc`：

{% highlight ruby %}
def block(&the_block)
  # 这里，the_block 是被传递进来的代码块
  the_block # 返回这个代码块
end
adder = block { |a, b| a + b }
# adder 现在是一个 Proc 对象
adder.class # => Proc
{% endhighlight %}

调用 `lambda` 或 `Proc.new` 均可在方法外部创建代码块。

方法同样也是对象。

{% highlight ruby %}
method(:puts).call "puts 是一个对象!"
# => puts 是一个对象!
{% endhighlight %}

### 操作符是语法糖

Ruby 中的大部分操作符仅仅是方法调用（根据一些优先级）的语法糖。例如，你可以覆盖 Integer 的 + 方法：

{% highlight ruby %}
class Integer
  # 请不要这么做，虽然你可以
  def +(other)
    self - other
  end
end
{% endhighlight %}

你不需要 C++ 的 `operator+` 等。

定义了 `[]` 和 `[]=` 方法后，你甚至拥有了数组风格的访问方法。要想定义一元操作符 + 和 -,你也必须定义相应的 `+@` 和 `-@` 方法。下面的操作符 **不是** 语法糖，它们不是方法，无法重新被定义：

{% highlight ruby %}
=, .., ..., not, &&, and, ||, or, ::
{% endhighlight %}

此外，`+=`、`*=` 等类似操作符只是 `var = var + other_var`、 `var = var * other_var`等的简写。因此也无法重新被定义。

## 查找更多资料

当你准备学习更多 Ruby 知识的时候，请查看[文档](/zh_cn/documentation/)部分。



[faq]: http://ruby-doc.org/docs/ruby-doc-bundle/FAQ/FAQ.html
