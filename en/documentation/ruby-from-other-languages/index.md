---
layout: page
title: "Ruby From Other Languages"
lang: en
---

When you first look at some Ruby code, it will likely remind you of
other programming languages you’ve used. This is on purpose. Much of the
syntax is familiar to users of Perl, Python, and Java (among other
languages), so if you’ve used those, learning Ruby will be a piece of
cake.
{: .summary}

This document contains two major sections. The first attempts to be a
rapid-fire summary of what you can expect to see when going from
language *X* to Ruby. The second section tackles the major language
features and how they might compare to what you’re already familiar
with.

## What to Expect: *Language X* to Ruby

* [To Ruby From C and C++](to-ruby-from-c-and-cpp/)
* [To Ruby From Java](to-ruby-from-java/)
* [To Ruby From Perl](to-ruby-from-perl/)
* [To Ruby From PHP](to-ruby-from-php/)
* [To Ruby From Python](to-ruby-from-python/)
* [To Ruby From JavaScript](to-ruby-from-javascript/)

## Important Language Features And Some Gotchas

Here are some pointers and hints on major Ruby features you’ll see while
learning Ruby.

### Iteration

Two Ruby features that are a bit unlike what you may have seen before,
and which take some getting used to, are “blocks” and iterators. Instead
of looping over an index (like with C, C++, or pre-1.5 Java), or looping
over a list (like Perl’s `for (@a) {...}`, or Python’s
`for i in aList: ...`), with Ruby you’ll very often instead see

{% highlight ruby %}
some_list.each do |this_item|
  # We're inside the block.
  # deal with this_item.
end
{% endhighlight %}

For more info on `each` (and its friends `collect`, `find`, `inject`,
`sort`, etc.), see `ri Enumerable` (and then `ri Enumerable#some_method`).

### Everything has a value

There’s no difference between an expression and a statement. Everything
has a value, even if that value is `nil`. This is possible:

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

### Symbols are not lightweight Strings

Many Ruby newbies struggle with understanding what Symbols are, and what
they can be used for.

Symbols can best be described as identities. A symbol is all about
**who** it is, not **what** it is. Fire up `irb` and see the difference:

{% highlight irb %}
irb(main):001:0> :george.object_id == :george.object_id
=> true
irb(main):002:0> "george".object_id == "george".object_id
=> false
irb(main):003:0>
{% endhighlight %}

The `object_id` methods returns the identity of an Object. If two
objects have the same `object_id`, they are the same (point to the same
Object in memory).

As you can see, once you have used a Symbol once, any Symbol with the
same characters references the same Object in memory. For any given two
Symbols that represent the same characters, the `object_id`s match.

Now take a look at the String (“george”). The `object_id`s don’t match.
That means they’re referencing two different objects in memory. Whenever
you use a new String, Ruby allocates memory for it.

If you’re in doubt whether to use a Symbol or a String, consider what’s
more important: the identity of an object (i.e. a Hash key), or the
contents (in the example above, “george”).

### Everything is an Object

“Everything is an object” isn’t just hyperbole. Even classes and
integers are objects, and you can do the same things with them as with
any other object:

{% highlight ruby %}
# This is the same as
# class MyClass
#   attr_accessor :instance_var
# end
MyClass = Class.new do
  attr_accessor :instance_var
end
{% endhighlight %}

### Variable Constants

Constants are not really constant. If you modify an already initialized
constant, it will trigger a warning, but not halt your program. That
isn’t to say you **should** redefine constants, though.

### Naming conventions

Ruby enforces some naming conventions. If an identifier starts with a
capital letter, it is a constant. If it starts with a dollar sign (`$`),
it is a global variable. If it starts with `@`, it is an instance
variable. If it starts with `@@`, it is a class variable.

Method names, however, are allowed to start with capital letters. This
can lead to confusion, as the example below shows:

{% highlight ruby %}
Constant = 10
def Constant
  11
end
{% endhighlight %}

Now `Constant` is 10, but `Constant()` is 11.

### Keyword arguments

Like in Python, since Ruby 2.0 methods can be defined
using keyword arguments:

{% highlight ruby %}
def deliver(from: "A", to: nil, via: "mail")
  "Sending from #{from} to #{to} via #{via}."
end

deliver(to: "B")
# => "Sending from A to B via mail."
deliver(via: "Pony Express", from: "B", to: "A")
# => "Sending from B to A via Pony Express."
{% endhighlight %}

### The universal truth

In Ruby, everything except `nil` and `false` is considered true. In
C, Python and many other languages, 0 and possibly other values, such as
empty lists, are considered false. Take a look at the following Python
code (the example applies to other languages, too):

{% highlight python %}
# in Python
if 0:
  print("0 is true")
else:
  print("0 is false")
{% endhighlight %}

This will print “0 is false”. The equivalent Ruby:

{% highlight ruby %}
# in Ruby
if 0
  puts "0 is true"
else
  puts "0 is false"
end
{% endhighlight %}

Prints “0 is true”.

### Access modifiers apply until the end of scope

In the following Ruby code,

{% highlight ruby %}
class MyClass
  private
  def a_method; true; end
  def another_method; false; end
end
{% endhighlight %}

You might expect `another_method` to be public. Not so. The `private`
access modifier continues until the end of the scope, or until another
access modifier pops up, whichever comes first. By default, methods are
public:

{% highlight ruby %}
class MyClass
  # Now a_method is public
  def a_method; true; end

  private

  # another_method is private
  def another_method; false; end
end
{% endhighlight %}

`public`, `private` and `protected` are really methods, so they can take
parameters. If you pass a Symbol to one of them, that method’s visibility is
altered.

### Method access

In Java, `public` means a method is accessible by anyone. `protected`
means the class’s instances, instances of descendant classes, and
instances of classes in the same package can access it, but not anyone
else, and `private` means nobody besides the class’s instances can
access the method.

Ruby differs slightly. `public` is, naturally, public. `private` means
the method(s) are accessible only when they can be called without an
explicit receiver. Only `self` is allowed to be the receiver of a
private method call.

`protected` is the one to be on the lookout for. A protected method can be
called from a class or descendant class instances, but also with another
instance as its receiver.
Here is an example (adapted from [The Ruby Language FAQ][faq]):

{% highlight ruby %}
class Test
  # public by default
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

# now make `identifier' protected; it still works
# because protected allows `other' as receiver

class Test
  protected :identifier
end

t1 == t2  # => true

# now make `identifier' private

class Test
  private :identifier
end

t1 == t2
# NoMethodError: private method `identifier' called for #<Test:0x342784>
{% endhighlight %}

### Classes are open

Ruby classes are open. You can open them up, add to them, and change them at
any time. Even core classes, like `Integer` or even `Object`, the parent of all
objects. Ruby on Rails defines a bunch of methods for dealing with time on
`Integer`. Watch:

{% highlight ruby %}
class Integer
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

In Ruby, methods are allowed to end with question marks or exclamation marks.
By convention, methods that answer questions end in question marks
(e.g. `Array#empty?`, which returns `true` if the receiver is empty).
Potentially “dangerous” methods by convention end with exclamation marks
(e.g. methods that modify `self` or the arguments, `exit!`, etc.).
Not all methods that change their arguments end with exclamation marks, though.
`Array#replace` replaces the contents of an array with the contents
of another array. It doesn’t make much sense to have a method like that
that **doesn’t** modify self.

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
`method_missing` raises a NameError exception, but you can redefine it to
better fit your application, and many libraries do. Here is an example:

{% highlight ruby %}
# id is the name of the method called, the * syntax collects
# all the arguments in an array named 'arguments'
def method_missing(id, *arguments)
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
def block(&the_block)
  # Inside here, the_block is the block passed to the method
  the_block # return the block
end
adder = block { |a, b| a + b }
# adder is now a Proc object
adder.class # => Proc
{% endhighlight %}

You can create blocks outside of method calls, too, by calling `Proc.new`
with a block or calling the `lambda` method.

Similarly, methods are also Objects in the making:

{% highlight ruby %}
method(:puts).call "puts is an object!"
# => puts is an object!
{% endhighlight %}

### Operators are syntactic sugar

Most operators in Ruby are just syntactic sugar (with some precedence
rules) for method calls. You can, for example, override Integer’s `+`
method:

{% highlight ruby %}
class Integer
  # You can, but please don't do this
  def +(other)
    self - other
  end
end
{% endhighlight %}

You don’t need C++’s `operator+`, etc.

You can even have array-style access if you define the `[]` and `[]=` methods.
To define the unary + and - (think +1 and -2), you must define the `+@` and
`-@` methods, respectively. The operators below are **not** syntactic sugar,
though. They are not methods, and cannot be redefined:

{% highlight ruby %}
=, .., ..., not, &&, and, ||, or, ::
{% endhighlight %}

In addition, `+=`, `*=` etc. are just abbreviations for `var = var + other_var`,
`var = var * other_var`, etc. and therefore cannot be redefined.

## Finding Out More

When you are ready for more Ruby knowledge, see our
[Documentation](/en/documentation/) section.



[faq]: http://ruby-doc.org/docs/ruby-doc-bundle/FAQ/FAQ.html
