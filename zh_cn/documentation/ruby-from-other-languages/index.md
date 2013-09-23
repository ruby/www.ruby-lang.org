---
layout: page
title: "从其它语言到 Ruby - Ruby 官方网站"
lang: zh_cn
---

当您初次看到 Ruby 语言代码的时候，它很可能让您想起您使用过的其他编程语言。这是当然的， 因为 Ruby 的大部分语法是
Perl、Python 和 Java（以及其他语言）的用户所熟悉的。 如果您曾经使用过这这些语言，学习 Ruby 就是小菜一碟。

本文包含了两部分。第一部分说的是从其他语言到 Ruby 时的一些小窍门； 第二部分介绍了 Ruby 语言和其他语言相比较时的一些特性。

## 可以期待什么: *从语言 X* 到 Ruby

* [从 C/C++ 到
  Ruby](/zh_cn/documentation/ruby-from-other-languages/to-ruby-from-c-and-cpp/)
* [从 Java 到
  Ruby](/zh_cn/documentation/ruby-from-other-languages/to-ruby-from-java/)
* [从 Perl 到
  Ruby](/zh_cn/documentation/ruby-from-other-languages/to-ruby-from-perl/)
* [从 PHP 到
  Ruby](/zh_cn/documentation/ruby-from-other-languages/to-ruby-from-php/)
* [从 Python 到
  Ruby](/zh_cn/documentation/ruby-from-other-languages/to-ruby-from-python/)

## 重要的语言特性和一些小技巧

这里介绍了学习 Ruby 语言时应该注意的 Ruby 语言的特性

### 迭代器

代码块和迭代是 Ruby 语言和其他语言不太一样的地方。我们可以以索引做循环（比如 C, C++, 或者 1.5 版本以前的
Java），或者以列表做循环（比如 Perl 的 <tt>for (@a) \{...}</tt>， 还有 Python 的 <tt>for i
in aList: ...</tt>），但是在 Ruby 中，我们常会看到

{% highlight ruby %}
some_list.each do |this_item|
  # We're inside the block.
  # deal with this_item.
end
{% endhighlight %}

关于更多 `each` 的信息（还有 `collect`, `find`, `inject`, `sort`, etc.），请参考 `ri
Enumerable` （和 <tt>ri Enumerable#*func\_name*</tt>）。

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

{% highlight ruby %}
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
# This is the same as
# class MyClass
#   attr_accessor :instance_var
# end
MyClass = Class.new do
  attr_accessor :instance_var
end
{% endhighlight %}

### 可以改变的常量

常量并不是真正恒定的。如果您改变了一个常量，会有警告，但程序不会中止。 当然这也不是说您“**应该**”改变常量。

### 命名约定

Ruby 强制了一些命名约定。大写字母开头的是一个常量；美元符号($)开头的是全局变量； `@` 开头的是实例变量； `@@` 开头的是类变量。 然而函数的名字却可以大写字母开头。这可能会导致一些混淆，比如下面的例子：

{% highlight ruby %}
Constant = 10
def Constant
  11
end
{% endhighlight %}

这里 `Constant` 是 10，而 `Constant()` 是 11。

### 虚拟命名参数

Ruby 并不像 Python 一样支持命名参数，但可以用符和字典来替代。 Ruby on Rails 和其他的一些 Ruby
程序都使用了这种方法。例如：

{% highlight ruby %}
def some_keyword_params( params )
  params
end
some_keyword_params( :param_one => 10, :param_two => 42 )
# => {:param_one=>10, :param_two=>42}
{% endhighlight %}

### 全是真值

Ruby 把任何不是 **nil** 和 **false** 的值当作真值。在 C，Python 和其他语言里，0 和一些其他的值，
比如空的列表，会被当作假值。看一看下面的 Python 代码（这个例子也可以被应用到其他语言）：

{% highlight python %}
# in Python
if 0:
  print "0 is true"
else:
  print "0 is false"
{% endhighlight %}

这会打印出 “0 is false”，而在 Ruby 中：

{% highlight ruby %}
# in Ruby
if 0
  puts "0 is true"
else
  puts "0 is false"
end
{% endhighlight %}

会打印出 “0 is true”。

### 权限声明应用到范围的底线

下面的 Ruby 代码中，

{% highlight ruby %}
class MyClass
  private
  def a_method; true; end
  def another_method; false; end
end
{% endhighlight %}

您可能认为 `another_method` 是公开的。并不是这样的，”private” 权限声明会一直应用到类声明底线，
或者直到另外一个权限声明开始起作用。函数默认是公开的：

{% highlight ruby %}
class MyClass
  # Now a_method is public
  def a_method; true; end

  private

  # another_method is private
  def another_method; false; end
end
{% endhighlight %}

`public`， `private` 和 `protected` 其实都是函数， 所以他们可以接受参数。如果您给他们传递一个符号的话，那么符号所代表的函数的可见性会被改变。

### 函数访问

在 Java 里，`public` 表示函数可以被任何人访问。`protected` 表示此类实例、此继承类的实例及在
同一个包内的所有类的实例可以访问，其他人则不能。`private` 表示任何此类实例外的人都不能访问。

Ruby 有些不同。`public` 还是公开的。`private`
表示只有不需要给出接受者（receiver）的调用才是允许的。**self** 是隐藏 函数唯一承认的接收者。

`protected` 应该特别注意。保护函数可以被类及继承类的实例调用，当其他实例作为接收者时，也可以被调用。 来自[Ruby FAQ][1] 的例子:

{% highlight ruby %}
$ irb
irb(main):001:0> class Test
irb(main):002:1>   # public by default
irb(main):003:1*   def func
irb(main):004:2>     99
irb(main):005:2>   end
irb(main):006:1>
irb(main):007:1*   def ==(other)
irb(main):008:2>     func == other.func
irb(main):009:2>   end
irb(main):010:1> end
=> nil
irb(main):011:0>
irb(main):012:0* t1 = Test.new
=> #<Test:0x34ab50>
irb(main):013:0> t2 = Test.new
=> #<Test:0x342784>
irb(main):014:0> t1 == t2
=> true
irb(main):015:0> # now make `func` protected, still works
irb(main):016:0* # because protected allows the other reference
irb(main):017:0* class Test
irb(main):018:1>   protected :func
irb(main):019:1> end
=> Test
irb(main):020:0> t1 == t2
=> true
irb(main):021:0> # now make `func` private
irb(main):022:0* class Test
irb(main):023:1>   private :func
irb(main):024:1> end
=> Test
irb(main):025:0> t1 == t2
NoMethodError: private method `func' called for #<Test:0x342784>
        from (irb):8:in `=='
        from (irb):25
        from :0
irb(main):026:0>
{% endhighlight %}

### Classes are open

Ruby classes are open. You can open them up, add to them, and change them at any time. Even core classes, like `Fixnum` or even `Object`, the parent of all objects. Ruby on Rails defines a bunch of methods for dealing with time on `Fixnum`. Watch:

{% highlight ruby %}
class Fixnum
  def hours
    self * 3600 # number of seconds in an hour
  end
  alias hour hours
end

# 14 hours from 00:00 January 1st
# (aka when you finally wake up ;)
Time.mktime(2006, 01, 01) + 14.hours # => Sun Jan 01 14:00:00
{% endhighlight %}

### Funny method names

In Ruby, methods are allowed to end with question marks or exclamation marks. By convention, methods that answer questions (i.e. <tt>Array#empty?</tt> returns **true** if the receiver is empty) end in question marks. Potentially “dangerous” methods (ie methods that modify **self** or the arguments, `exit!` etc.) by convention end with exclamation marks. All methods that change their arguments don’t end with exclamation
marks, though. <tt>Array#replace</tt> replaces the contents of an array
with the contents of another array. It doesn’t make much sense to have a
method like that that **doesn’t** modify self.

### Singleton methods

Singleton methods are per-object methods. They are only available on the
Object you defined it on.

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

# Other objects are not affected
other_car = Car.new
other_car.inspect # => Cheap car
{% endhighlight %}

### Missing methods

Ruby doesn’t give up if it can’t find a method that responds to a
particular message. It calls the `method_missing` method with the name
of the method it couldn’t find and the arguments. By default,
method\_missing raises a NameError exception, but you can redefine it to
better fit your application, and many libraries do. Here is an example:

{% highlight ruby %}
# id is the name of the method called, the * syntax collects
# all the arguments in an array named 'arguments'
def method_missing( id, *arguments )
  puts "Method #{id} was called, but not found. It has " +
       "these arguments: #{arguments.join(", ")}"
end

__ :a, :b, 10
# => Method __ was called, but not found. It has these
# arguments: a, b, 10
{% endhighlight %}

The code above just prints the details of the call, but you are free to
handle the message in any way that is appropriate.

### Message passing, not function calls

A method call is really a **message** to another object:

{% highlight ruby %}
# This
1 + 2
# Is the same as this ...
1.+(2)
# Which is the same as this:
1.send "+", 2
{% endhighlight %}

### Blocks are Objects, they just don’t know it yet

Blocks (closures, really) are heavily used by the standard library. To
call a block, you can either use `yield`, or make it a `Proc` by
appending a special argument to the argument list, like so:

{% highlight ruby %}
def block( &the_block )
  # Inside here, the_block is the block passed to the method
  the_block # return the block
end
adder = block { |a, b| a + b }
# adder is now a Proc object
adder.class # => Proc
{% endhighlight %}

You can create blocks outside of method calls, too, by calling Proc.new
with a block or calling the `lambda` method.

Similarly, methods are also Objects in the making:

{% highlight ruby %}
method(:puts).call "puts is an object!"
# => puts is an object!
{% endhighlight %}

### Operators are syntactic sugar

Most operators in Ruby are just syntactic sugar (with some precedence
rules) for method calls. You can, for example, override Fixnums +
method:

{% highlight ruby %}
class Fixnum
  # You can, but please don't do this
  def +( other )
    self - other
  end
end
{% endhighlight %}

You don’t need C++’s `operator+`, etc.

You can even have array-style access if you define the `[]` and `[]=` methods. To define the unary + and – (think +1 and -2), you must define the `+@` and `-@` methods, respectively. The operators below are **not** syntactic sugar, though. They are not
methods, and cannot be redefined:

{% highlight ruby %}
=, .., ..., !, not, &&, and, ||, or, !=, !~, ::
{% endhighlight %}

In addition, +=, \*= etc. are just abbrevations for `var = var + other_var`, `var = var * other_var`, etc. and therefore cannot be redefined.

## Finding Out More

When you are ready for more Ruby knowledge, see our
[Documentation](/zh_cn/documentation/) section.



[1]: http://www.rubycentral.com/faq/rubyfaq-7.html
