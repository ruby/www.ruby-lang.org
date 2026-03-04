---
layout: page
title: "Official Ruby FAQ"
lang: ru

header: |
  <div class="multi-page">
    <a href="../" title="Content">Content</a>
    <span class="separator"> | </span>
    <a href="../1/" title="Part 1">1</a>
    <span class="separator"> | </span>
    <a href="../2/" title="Part 2">2</a>
    <span class="separator"> | </span>
    <a href="../3/" title="Part 3">3</a>
    <span class="separator"> | </span>
    <a href="../4/" title="Part 4">4</a>
    <span class="separator"> | </span>
    <a href="../5/" title="Part 5">5</a>
    <span class="separator"> | </span>
    <a href="../6/" title="Part 6">6</a>
    <span class="separator"> | </span>
    <strong>7</strong>
    <span class="separator"> | </span>
    <a href="../8/" title="Part 8">8</a>
    <span class="separator"> | </span>
    <a href="../9/" title="Part 9">9</a>
    <span class="separator"> | </span>
    <a href="../10/" title="Part 10">10</a>
    <span class="separator"> | </span>
    <a href="../11/" title="Part 11">11</a>
  </div>
  <h1>Official Ruby FAQ</h1>

---

{% include faq-notice.md %}

## Methods

### How does Ruby choose which method to invoke?

Ruby binds all messages to methods dynamically. It searches first for
singleton methods in the receiver, then for methods defined in the receiver's
own class, and finally for methods defined in the receiver's superclasses
(including any modules which may have been mixed in). You can see the order
of searching by displaying `ClassName.ancestors`, which shows the ancestor
classes and modules of `ClassName`.

If after searching the alternatives a matching method could not be found,
Ruby tries to invoke a method called `method_missing`, repeating the same
search procedure to find it. This allows you to handle messages to unknown
methods, and is often used to provide dynamic interfaces to classes.

~~~
module Emphasizable
  def emphasize
    "**#{self}**"
  end
end

class String
  include Emphasizable
end

String.ancestors
  # => [String, Emphasizable, Comparable, Object, Kernel, BasicObject]

"Wow!".emphasize  # => "**Wow!**"
~~~

When the method `emphasize` is searched for, it is not found in class
`String`, so Ruby searches next in the module `Emphasizable`.

In order to override a method that already exists in the receiver's class,
e.g. `String#capitalize`, you need to insert the module into the
ancestor chain in front of that class, by using `prepend`:

~~~
module PrettyCapitalize
  def capitalize
    "**#{super}**"
  end
end

class String
  prepend PrettyCapitalize
end

String.ancestors
  # => [PrettyCapitalize, String, Comparable, Object, Kernel, BasicObject]

"hello".capitalize  # => "**Hello**"
~~~

### Are `+`, `-`, `*`, ... operators?

`+`, `-`, and the like are not operators but method calls.
They can, therefore, be overloaded by new definitions.

~~~
class MyString < String
  def -(other)
    self[0...other.size]  # self truncated to other's size
  end
end
~~~

However, the following are built-in control structures, not methods,
which cannot be overridden:

~~~
=, .., ..., not, ||, &&, and, or, ::
~~~

To overload or to define the unary `+` and `-` operators,
you need to use `+@` and `-@` as the method names.

`=` is used to define a method to set an attribute of the object:

~~~
class Test
  def attribute=(val)
    @attribute = val
  end
end

t = Test.new
t.attribute = 1
~~~

If operators such as `+` and `-` are defined, Ruby automatically handles
the self assignment forms (`+=`, `-=`, and so on).

### Where are `++` and `--` ?

Ruby does not have the autoincrement and autodecrement operators.
You can use `+= 1` and `-= 1` instead.

### What is a singleton method?
{: #singleton-method}

A singleton method is an instance method associated with one specific object.

You create a singleton method by including the object in the definition:

~~~
class Foo; end

foo = Foo.new
bar = Foo.new

def foo.hello
  puts "Hello"
end

foo.hello
bar.hello
~~~

Produces:

~~~
Hello
prog.rb:11:in `<main>': undefined method `hello' for #<Foo:0x000000010f5a40> (NoMethodError)
~~~

Singleton methods are useful when you want to add a method to an object and
creating a new subclass is not appropriate.

### All these objects are fine, but does Ruby have any simple functions?

Yes and no. Ruby has methods that look like functions in languages such
as C or Perl:

~~~
def hello(name)
  puts "Hello, #{name}!"
end

hello("World")
~~~

Produces:

~~~
Hello, World!
~~~

However, they are actually method calls with the receiver omitted.
In this case, Ruby assumes the receiver is self.

So, `hello` resembles a function but it's actually a method belonging to
class `Object` and sent as a message to the hidden receiver self.
Ruby is a pure object-oriented language.

Of course you can use such methods as if they were functions.

### So where do all these function-like methods come from?

Almost all classes in Ruby are derived from class `Object`. The definition
of class `Object` mixes in the methods defined in the `Kernel` module.
These methods are therefore available within every object in the system.

Even if you are writing a simple Ruby program without classes, you are
actually working inside class `Object`.

### Can I access an object's instance variables?

An object's instance variables (those variables starting with `@`) are not
directly accessible outside the object. This promotes good encapsulation.
However, Ruby makes it easy for you to define accessors to these instance
variables in such a way that users of your class can treat instance variables
just like attributes. Just use one or more of `attr_reader`, `attr_writer`,
or `attr_accessor`.

~~~
class Person
  attr_reader   :name           # read only
  attr_accessor :wearing_a_hat  # read/write

  def initialize(name)
    @name = name
  end
end

p = Person.new("Dave")
p.name           # => "Dave"
p.wearing_a_hat  # => nil
p.wearing_a_hat = true
p.wearing_a_hat  # => true
~~~

You can also define your own accessor functions (perhaps to perform
validation, or to handle derived attributes). The read accessor is simply a
method that takes no parameters, and the assignment accessor is a method name
ending in `=` that takes a single parameter. Although there can be no space
between the method name and the `=` in the method definition, you can insert
spaces there when you call the method, making it look like any other
assignment. You can also utilize self assignments such as `+=` and `-=`,
as long as the corresponding `+` or `-` methods are defined.

### What's the difference between `private` and `protected`?

The visibility keyword `private` makes a method callable only in a function
form, without an explicit receiver, and so it can only have `self` as its
receiver. A private method is callable only within the class in which the
method was defined or in its subclasses.

~~~
class Test
  def foo
    99
  end

  def test(other)
    p foo
    p other.foo
  end
end

t1 = Test.new
t2 = Test.new

t1.test(t2)

# Now make `foo' private

class Test
  private :foo
end

t1.test(t2)
~~~

Produces:

~~~
99
99
99
prog.rb:8:in `test': private method `foo' called for #<Test:0x00000000b57a48> (NoMethodError)
        from prog.rb:23:in `<main>'
~~~

Protected methods are also callable only from within their own class or
its subclasses, but they can be called both in function form and using
a receiver. For example:

~~~
def <=>(other)
  age <=> other.age
end
~~~

Will compile if `age` is a protected method, but not if it is private.

These features help you control access to your class's internals.

### How can I change the visibility of a method?

You change the visibility of methods using `private`, `protected`, and
`public`. When used without parameters during a class definition, they affect
the visibility of subsequent methods. When used with parameters, they change
the visibility of the named methods.

~~~
class Foo
  def test
    puts "hello"
  end
  private :test
end

foo = Foo.new
foo.test
~~~

Produces:

~~~
prog.rb:9:in `<main>': private method `test' called for #<Foo:0x0000000284dda0> (NoMethodError)
~~~

You can make a class method private using `private_class_method`.

~~~
class Foo
  def self.test
    puts "hello"
  end
  private_class_method :test
end

Foo.test
~~~

Produces:

~~~
prog.rb:8:in `<main>': private method `test' called for Foo:Class (NoMethodError)
~~~

The default visibility for the methods defined in a class is public.
The exception is the instance initializing method, `initialize`.

Methods defined at the toplevel are also public by default.

### Can an identifier beginning with a capital letter be a method name?

Yes, it can, but we don't do it lightly! If Ruby sees a capitalized name
followed by a space, it will probably (depending on the context) assume it's
a constant, not a method name. So, if you use capitalized method names,
always remember to put parameter lists in parentheses, and always put the
parentheses next to the method name with no intervening spaces.
(This last suggestion is a good idea anyway!)

### Calling `super` gives an `ArgumentError`.

Invoking `super` with no parameters in a method passes all the arguments of
that method to a method of the same name in a superclass. If the number of
arguments to the original method disagrees with that of the higher-level
method, an `ArgumentError` is raised. To get around this, simply call `super`
and pass a suitable number of arguments.

### How can I call the method of the same name two levels up?

`super` invokes the same named method one level up. If you are overloading a
method in a more distant ancestor, use `alias` to give it a new name before
masking it with your method definition. You can then call it using that
aliased name.

### How can I invoke an original built-in method after redefining it?

Within the method definition, you can use `super`. You can also use `alias`
to give it an alternative name. Finally, you can call the original method as
a singleton method of `Kernel`.

### What is a destructive method?
{: #destructive-method}

A destructive method is one which alters the state of an object. `String`,
`Array`, `Hash`, and others have such methods. Often there are two
versions of a method, one with a plain name, the other with the same name,
but followed by `!`. The plain version creates a copy of the receiver, makes
its change to it, and returns the copy. The “bang” version (with the `!`)
modifies the receiver in place.

Beware, however, that there are a fair number of destructive methods that
do not have an `!`, including assignment methods (`name=`), array assignment
(`[]=`), and methods such as `Array.delete`.

### Why can destructive methods be dangerous?

Remember that assignment in most cases just copies object references, and that
parameter passing is equivalent to assignment. This means you can end up with
multiple variables referencing the same object. If one of those variables is
used to invoke a destructive method, the object referenced by all of them will
be changed.

~~~
def foo(str)
  str.sub!(/foo/, "baz")
end

obj = "foo"
foo(obj)     # => "baz"
obj          # => "baz"
~~~

In this case the actual argument is altered.

### Can I return multiple values from a method?

Yes and no.

~~~
def m1
  return 1, 2, 3
end

def m2
  [1, 2, 3]
end

m1  # => [1, 2, 3]
m2  # => [1, 2, 3]
~~~

So, only one thing is returned, but that thing can be an arbitrarily complex
object. In the case of arrays, you can use multiple assignment to get the
effect of multiple return values. For example:

~~~
def foo
  [20, 4, 17]
end

a, b, c = foo
a              # => 20
b              # => 4
c              # => 17
~~~
