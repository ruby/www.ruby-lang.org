---
layout: page
title: "Official Ruby FAQ"
lang: en

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
    <a href="../7/" title="Part 7">7</a>
    <span class="separator"> | </span>
    <strong>8</strong>
    <span class="separator"> | </span>
    <a href="../9/" title="Part 9">9</a>
    <span class="separator"> | </span>
    <a href="../10/" title="Part 10">10</a>
    <span class="separator"> | </span>
    <a href="../11/" title="Part 11">11</a>
  </div>
  <h1>Official Ruby FAQ</h1>

---

{% include faq-notice.html %}

## Classes and modules

### Can a class definition be repeated?

A class can be defined repeatedly. Each definition is added to the last
definition. If a method is redefined, the former one is overridden and lost.

### Are there class variables?

As of Ruby 1.5.3, there are. A variable prefixed with two at signs (`@`)
is a class variable, accessible within both instance and class methods
of the class.

~~~
class CountEm
  @@children = 0

  def initialize
    @@children += 1
    @my_number = @@children
  end

  def who_am_i
   "I'm child number #{@my_number} (out of #{@@children})"
  end

  def self.total_children
    @@children
  end
end

c1 = CountEm.new
c2 = CountEm.new
c3 = CountEm.new
c1.who_am_i             # => "I'm child number 1 (out of 3)"
c3.who_am_i             # => "I'm child number 3 (out of 3)"
CountEm.total_children  # => 3
~~~

Earlier versions of Ruby do not have class variables. However, container
classes (`Array`, `Hash`, etc) assigned to a class constant can be used to
give the same effect. This example uses an array. Some folks feel hashes are
better.

~~~
class Foo
  F = [0]      # pseudo class variable - Array `F'

  def foo
    F[0] += 1
    puts F[0]
  end
end
~~~

This reports on the number of times foo is called across all instances of
class Foo.

### What is a class instance variable?

~~~
class Foo
  @a = 123  # (1)

  def foo
    p @a    # (2) ... nil, not 123
  end
end
~~~

(1) is a class instance variable, and (2) is an ordinary instance variable
(which, not having been initialized, has a value of `nil`). (2) belongs to an
instance of class `Foo`, and (1) belongs to the class object `Foo`, which is
an instance of class `Class`. (phew!)

There is no way to access class instance variables from instance methods.

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

### Does Ruby have class methods?
{: #class-method}

A [singleton method](#singleton-method) of a class object is called a
class method.
(Actually, the class method is defined in the metaclass, but that is pretty
much transparent). Another way of looking at it is to say that a class method
is a method whose receiver is a class.

It all comes down to the fact that you can call class methods without having
to have instances of that class (objects) as the receiver.

Let's create a singleton method of class `Foo`:

~~~
class Foo
  def self.test
    "this is foo"
  end
end

# It is invoked this way.

Foo.test  # => "this is foo"
~~~

In this example, `Foo.test` is a class method.

Methods which are defined in class `Class` can be used as class methods for
every(!) class.

### What is a singleton class?

A singleton class is an anonymous class that is created by subclassing the
class associated with a particular object. Singleton classes are another
way of extending the functionality associated with just one object.

Take the lowly `Foo`:

~~~
class Foo
  def hello
    "hello"
  end
end

foo = Foo.new
foo.hello  # => "hello"
~~~

Now let's say we need to add class-level functionality to just this one
instance:

~~~
class << foo
  attr_accessor :name

  def hello
    "hello, I'm #{name}"
  end
end

foo.name = "Tom"
foo.hello  # => "hello, I'm Tom"
~~~

We've customized `foo` without changing the characteristics of `Foo`.

### What is a module function?

A module function is a private, singleton method defined in a module.
In effect, it is similar to a [class method](#class-method),
in that it can be called using the `Module.method` notation:

~~~
Math.sqrt(2)  # => 1.414213562
~~~

However, because modules can be mixed in to classes, module functions can
also be used without the prefix (that's how all those `Kernel` functions are
made available to objects):

~~~
include Math
sqrt(2)  # => 1.414213562
~~~

Use `module_function` to make a method a module function.

~~~
module Test
  def thing
    # ...
  end
  module_function :thing
end
~~~

### What is the difference between a class and a module?

Modules are collections of methods and constants. They cannot generate
instances. Classes may generate instances (objects), and have per-instance
state (instance variables).

Modules may be mixed in to classes and other modules. The mixed in module's
constants and methods blend into that class's own, augmenting the class's
functionality. Classes, however, cannot be mixed in to anything.

A class may inherit from another class, but not from a module.

A module may not inherit from anything.

### Can you subclass modules?

No. However, a module may be included in a class or another module to mimic
multiple inheritance (the mixin facility).

This does not generate a subclass (which would require inheritance), but does
generate an `is_a?` relationship between the class and the module.

### Give me an example of a mixin

The module `Comparable` provides a variety of comparison operators
(`<`, `<=`, `>`, `between?`, and so on). It defines these in terms of calls
to the general comparison method, `<=>`. However, it does not itself define
`<=>`.

Say you want to create a class where comparisons are based on the number of
legs an animal has:

~~~
class Animal
  include Comparable

  attr_reader :legs

  def initialize(name, legs)
    @name, @legs = name, legs
  end

  def <=>(o)
    legs <=> o.legs
  end

  def inspect
    @name
  end
end

c = Animal.new("cat", 4)
s = Animal.new("snake", 0)
p = Animal.new("parrot", 2)

c < s             # => false
s < c             # => true
p >= s            # => true
p.between?(s, c)  # => true
[p, s, c].sort    # => [snake, parrot, cat]
~~~

All `Animal` must do is define its own semantics for the operator `<=>`,
and mix in the `Comparable` module. `Comparable`'s methods now become
indistinguishable from `Animal`'s and your class suddenly sprouts new
functionality. And because the same `Comparable` module is used by many
classes, your new class will share a consistent and well understood semantics.

### Why are there two ways of defining class methods?

You can define a class method in the class definition, and you can define
a class method at the top level.

~~~
class Demo
  def self.class_method
  end
end

def Demo.another_class_method
end
~~~

There is only one significant difference between the two.
In the class definition you can refer to the class's constants directly,
as the constants are within scope. At the top level, you have to use the
`Class::CONST` notation.

### What is the difference between `load` and `require`?

`load` will load and execute a Ruby program (`*.rb`).

`require` loads Ruby programs as well, but will also load binary Ruby
extension modules (shared libraries or DLLs). In addition, `require` ensures
that a feature is never loaded more than once.

### What is the difference between `include` and `extend`?

`include` mixes a module into a class or another module. Methods from that
module are called function-style (without a receiver).

`extend` is used to include a module in an object (instance).
Methods in the module become methods in the object.

### What does `self` mean?

`self` is the currently executing receiver, the object to which a method
is applied. A function-style method call implies `self` as the receiver.

### Why can't I load variables from a separate file?

Say `file1.rb` contains:

~~~
var1 = 99
~~~

and some other file loads it in:

~~~
require_relative "file1"
puts var1
~~~

Produces:

~~~
prog.rb:2:in `<main>': undefined local variable or method `var1' for main:Object (NameError)
~~~

You get an error because `load` and `require` arrange for local variables to
be stored into a separate, anonymous namespace, effectively discarding them.
This is designed to protect your code from being polluted.
