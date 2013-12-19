---
layout: page
title: "Offical Ruby FAQ"
lang: en

header: |
  <div class="multi-page">
    <a href="../" title="Part 1">1</a>
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

8. Classes and modules

8.1 Can a class definition be repeated?

A class can be defined repeatedly. Each definition is added to the last definition. If a method is redefined, the former one is overridden and lost.

8.2 Are there class variables?

As of Ruby 1.5.3, there are. A variable prefixed with two at signs is a class variable, accessible within both instance and class methods of the class.

                

  class CountEm
    @@children = 0
    def initialize
      @@children += 1
      @myNumber = @@children
    end
    def whoAmI
     "I'm child number #@myNumber (out of #@@children)"
    end
    def CountEm.totalChildren
      @@children
    end
  end

  c1 = CountEm.new
  c2 = CountEm.new
  c3 = CountEm.new
  c1.whoAmI              # -> "I'm child number 1 (out of 3)"
  c3.whoAmI              # -> "I'm child number 3 (out of 3)"
  CountEm.totalChildren  # -> 3

Earlier versions of Ruby do not have class variables. However, container classes (Array, Hash, etc) assigned to a class constant can be used to give the same effect. This example uses an array. Some folks feel hashes are better.

                

class Foo
  F = [ 0 ]          # pseudo class variable - Array 'F'
  def foo
    F[0] += 1
    puts F[0]
  end
end

This reports on the number of times foo is called across all instances of class Foo.

8.3 What is a class instance variable?

                

class Foo
  @a = 123   # (1)
  def foo
    p @a     # (2) ... nil not 123
  end
end

(1) is a class instance variable, and (2) is an ordinary instance variable (which, not having been initialized, has a value of nil). (2) belongs to an instance of class Foo, and (1) belongs to the class object Foo, which is an instance of Class class. (phew!)

There is no way to access class instance variables from instance methods.

8.4 What is a singleton method?

A singleton method is an instance method associated with one specific object.

You create a singleton method by including the object in the definition:

                

class Foo
end

foo = Foo.new
bar = Foo.new
def foo.hello
  puts "Hello"
end
foo.hello
bar.hello

Produces:

Hello
prog.rb:10: undefined method `hello' for #<Foo:0x401b45f4> (NameError)

Singleton methods are useful when you want to add a method to an object and creating a new subclass is not appropriate.

8.5 Does Ruby have class methods?

A singleton method of a class object is called a class method. (Actually, the class method is defined in the metaclass, but that is pretty much transparent). Another way of looking at it is to say that a class method is a method whose receiver is a class.

It all comes down to the fact that you can call class methods without having to have instances of that class (objects) as the receiver.

Let's create a singleton method of class Foo:

                

class Foo
  def Foo.test
    "this is foo"
  end
end

#It is invoked this way.

Foo.test         # -> "this is foo"

In this example, Foo.test is a class method.

Methods which are defined in class Class can be used as class methods for every class(!)

8.6 What is a singleton class?

A Singleton class is an anonymous class that is created by subclassing the class associated with a particular object. They are another way of extending the functionality associated with just one object.

Take the lowly Foo:
                

class Foo        # -> hello<<7>>nil
  def hello
    print "hello"
  end
end

foo = Foo.new
foo.hello

Now let's say we need to add class-level functionality to just this one instance:

                

class << foo
  attr :name, TRUE
  def hello
    "hello. I'm " +  @name + "\n"
  end
end

foo.name = "Tom"
foo.hello        # -> "hello. I'm Tom\n"

We've customized foo without changing the characteristics of Foo,

8.7 What is a module function?

A module function is a private, singleton method defined in a module. In effect, it is similar to a class method, in that it can be called using the Module.method notation:

                

Math.sqrt(2)     # -> 1.414213562

However, because modules can be mixed in to classes, module functions can also be used without the prefix (that's how all those Kernel functions are made available to objects):

                

include Math
sqrt(2)          # -> 1.414213562

Use module_function to make a method a module function.

                

module Test
  def thing
    # ...
  end
  module_function :thing
end

8.8 What is the difference between a class and a module?

Modules are collections of methods and constants. They cannot generate instances. Classes may generate instances (objects), and have per-instance state (instance variables).

Modules may be mixed in to classes and other modules. The mixed-in module's constants and methods blend into that class's own, augmenting the class's functionality. Classes, however, cannot be mixed in to anything.

A class may inherit from another class, but not from a module.

A module may not inherit from anything.

8.9 Can you subclass modules?

No. However, a module may be included in a class or another module to mimic multiple inheritance (the mixin facility).

This does not generate a subclass (which would require inheritance), but does generate an is_a? relationship between the class and the module.

8.10 Give me an example of a mix-in

The module Comparable provides a variety of comparison operators (<, <=, >, between? and so on). It defines these in terms of calls to the general comparison method, <=>. However, it does not itself define <=>.

Say you want to create a class where comparisons are based on the number of legs an animal has:

                

class MyClass
  include Comparable
  attr :legs
  def initialize(name, legs)
   @name, @legs = name, legs
  end
  def <=>(o)
    return @legs <=> o.legs
  end
end
c = MyClass.new('cat', 4)
s = MyClass.new('snake', 0)
p = MyClass.new('parrot', 2)

c < s          # -> false
s < c          # -> true
p >= s         # -> true
p.between?(s, c)  # -> true
[p, s, c].sort    # -> [snake, parrot, cat]

All MyClass must do is define its own semantics for the operator <=>, and mix-in the Comparable module. Comparable's methods now become indistinguishable from MyClass's and your class suddenly sprouts new functionality. And because the same Comparable module is used my many classes, your new class will share a consistent and well understood semantic.

8.11 Why are there two ways of defining class methods?

You can define a class method in the class definition, and you can define a class method at the top level?

                

class Demo
  def Demo.classMethod
  end
end

def Demo.anotherClassMethod
end

There is only one significant difference between the two. In the class definition you can refer to the class's constants directly, as the constants are within scope. At the top level, you have to use the Class::CONST notation.

8.12 What is the difference between load and require?

load will load and execute a Ruby program (*.rb).

require loads Ruby programs as well, but will also load binary Ruby extension modules (shared libraries or DLLs). In addition, require ensures that a feature is never loaded more than once.

8.13 What is the difference between include and extend?

include mixes a module into a class or another module. Methods from that the module are called function-style (without a receiver).

extend is used to include a module in an object(instance). Methods in the module become methods in the object.

8.14 What does self mean?

self is the currently executing receiver--the object to which a method is applied. A function-style method call implies self as the receiver.

8.15 Why can't I load variables from a separate file?

Say file1 contains:

                

var1 = 99

and some other file loads it in:

                

require 'file1'
puts var1

Produces:

prog.rb:2: undefined local variable or method `var1' for #<Object:0x401c1ce0> (NameError)

You get an error because load and require arrange for local variables to be stored into a separate, anonymous namespace, effectively discarding them. This is designed to protect your code from being polluted. 
