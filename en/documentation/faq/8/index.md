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

{% include faq-notice.md %}

## Classes and modules

### Can a class definition be repeated?

A class can be defined repeatedly. Each definition is added to the last
definition. If a method is redefined, the former one is overridden and lost.

### Are there class variables?

There are. A variable prefixed with two at signs (`@@`) is a class variable,
accessible within both instance and class methods of the class.

~~~
class Entity

  @@instances = 0

  def initialize
    @@instances += 1
    @number = @@instances
  end

  def who_am_i
   "I'm #{@number} of #{@@instances}"
  end

  def self.total
    @@instances
  end
end

entities = Array.new(9) { Entity.new }

entities[6].who_am_i  # => "I'm 7 of 9"
Entity.total          # => 9
~~~

However, you probably should use _class instance variables_ instead.

### What is a class instance variable?

Here the example of the previous section rewritten
using a class instance variable:

~~~
class Entity

  @instances = 0

  class << self
    attr_accessor :instances  # provide class methods for reading/writing
  end

  def initialize
    self.class.instances += 1
    @number = self.class.instances
  end

  def who_am_i
   "I'm #{@number} of #{self.class.instances}"
  end

  def self.total
    @instances
  end
end

entities = Array.new(9) { Entity.new }

entities[6].who_am_i  # => "I'm 7 of 9"
Entity.instances      # => 9
Entity.total          # => 9
~~~

Here, `@instances` is a _class_ instance variable. It does not belong
to an instance of class `Entity`, but to the class object `Entity`,
which is an instance of class `Class`.

Class instance variables are directly accessible only within class methods
of the class.

### What is the difference between class variables and class instance variables?

The main difference is the behavior concerning inheritance:
class variables are shared between a class and all its subclasses,
while class instance variables only belong to one specific class.

Class variables in some way can be seen as global variables within
the context of an inheritance hierarchy, with all the problems
that come with global variables.
For instance, a class variable might (accidentally) be reassigned
by any of its subclasses, affecting all other classes:

~~~
class Woof

  @@sound = "woof"

  def self.sound
    @@sound
  end
end

Woof.sound  # => "woof"

class LoudWoof < Woof
  @@sound = "WOOF"
end

LoudWoof.sound  # => "WOOF"
Woof.sound      # => "WOOF" (!)
~~~

Or, an ancestor class might later be reopened and changed,
with possibly surprising effects:

~~~
class Foo

  @@var = "foo"

  def self.var
    @@var
  end
end

Foo.var  # => "foo" (as expected)

class Object
  @@var = "object"
end

Foo.var  # => "object" (!)
~~~

So, unless you exactly know what you are doing and explicitly need
this kind of behavior, you better should use class instance variables.

### Does Ruby have class methods?
{: #class-method}

A [singleton method](../7/#singleton-method) of a class object is called a
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

Instance methods which are defined in class `Class` can be used
as class methods for every(!) class.

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
foo.hello         # => "hello, I'm Tom"
Foo.new.hello     # => "hello"
~~~

We've customized `foo` without changing the characteristics of `Foo`.

### What is a module function?

{% include warnings/faq_out_of_date.html %}

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
(`<`, `<=`, `==`, `>=`, `>`, `between?`). It defines these in terms
of calls to the general comparison method, `<=>`. However, it does
not itself define `<=>`.

Say you want to create a class where comparisons are based on the number of
legs an animal has:

~~~
class Animal
  include Comparable

  attr_reader :legs

  def initialize(name, legs)
    @name, @legs = name, legs
  end

  def <=>(other)
    legs <=> other.legs
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

### What is the difference between `include` and `extend`?

{% include warnings/faq_out_of_date.html %}

`include` mixes a module into a class or another module. Methods from that
module are called function-style (without a receiver).

`extend` is used to include a module in an object (instance).
Methods in the module become methods in the object.

### What does `self` mean?

`self` is the currently executing receiver, the object to which a method
is applied. A function-style method call implies `self` as the receiver.
