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

7. Methods

7.1 How does Ruby choose which method to invoke?

Ruby binds all messages to methods dynamically. It searches first for singleton methods in the receiver, then for methods defined in the receiver's own class, and finally for methods defined in the receiver's superclasses (including any modules which may have been mixed in). You can see the order of searching by displaying Classname.ancestors, which shows the ancestor classes and modules of ClassName.

If after searching the alternatives a matching method could not be found, Ruby tries to invoke a method called method_missing, repeating the same search procedure to find it. This allows you to handle messages to unknown methods, and is often used to provide dynamic interfaces to classes.

                

module Indexed
  def [](n)
    to_a[n]
  end
end
class String
  include Indexed
end
String.ancestors                # -> [String, Indexed, Enumerable, Comparable, Object, Kernel]
"abcde".gsub!(/./, "\\&\n")[1]  # -> 10

This program does not return "b\n" as one expects, but returns 10. When the method [] is searched for, it is found in class String, before searching Indexed. You should directly redefine [] in class String.

7.2 Are +, -, * ... operators?

+, -, and the like are not operators but method calls. They can, therefore, be overloaded by new definitions.

                

class MyString < String
  def -(other)            # New method
    self[0...other.size]  # self truncated to other's size
  end
end

However, the following are built-in control structures, not methods, which cannot be overridden.

                

=, .., ..., !, not, ||, &&, and, or, ::

To overload or to define unary operators, you can use +@ and -@ as the method names.

= is used to define a method to set an attribute of the object:

                

class Test
  def attribute=(val)
    @attribute = val
  end
end
t = Test.new
t.attribute = 1

If operators such as + and - are defined, Ruby automatically handles the self assignment forms (+=, -= and so on).

7.3 Where are ++ and - -?

Ruby does not have the autoincrement and autodecrement operators. You can use += 1 and -= 1 instead.

7.4 All these objects are fine, but does Ruby have any simple functions?

Yes and no. Ruby has methods that look like functions in languages such as C or Perl:

                

def writeln(str)
  print(str, "\n")
end

writeln("Hello, World!")

Produces:

Hello, World!

However, they're actually method calls with the receiver omitted. In this case, Ruby assumes the receiver is self.

So, writeln resembles a function but it's actually a method belonging to class Object and sent as a message to the hidden receiver self. Ruby is a pure object-oriented language..

Of course you can use such methods as if they were functions.

7.5 So where do all these function-like methods come from?

All classes in Ruby are derived from class Object. The definition of class Object mixes-in the methods defined in the Kernel module. These methods are therefore available within every object in the system.

Even if you're writing a simple Ruby program without classes, you're actually working inside class Object.

7.6 Can I access an object's instance variables?

An object's instance variables (those variables starting with @) are not directly accessible outside the object. This promotes good encapsulation. However, Ruby makes it easy for you to define accessors to these instance variables in such a way that users of your class can treat instance variables just like attributes. Just use one or more of Module.attr, attr_reader, attr_writer, or attr_accessor.

                

class Person
  attr           :name           # read only
  attr_accessor  :wearing_a_hat  # read/write
  def initialize(name)
    @name = name
  end
end

p = Person.new("Dave")
p.name           # -> "Dave"
p.wearing_a_hat  # -> nil
p.wearing_a_hat = true
p.wearing_a_hat  # -> true

You can also define your own accessor functions (perhaps to perform validation, or to handle derived attributes). The read accessor is simply a method that takes no parameters, and the assignment accessor is a method name ending in = that takes a single parameter. Although there can be no space between the method name and the = in the method definition, you can insert spaces there when you call the method, making it look like any other assignment. You can also utilize self assignments such as += and -=, as long as the corresponding + or - methods are defined.

7.7 What's the difference between private and protected?

The visibility keyword private makes a method callable only in a function form, and so it can only have self as a receiver. A private method is callable only within the class in which the method was defined or in its subclasses.

                

class Test
  def func
    return 99
  end
  def test(other)
    p func
    p other.func
  end
end
t1 = Test.new
t2 = Test.new

t1.test(t2)

# Now make 'func' private

class Test
  private :func
end

t1.test(t2)

Produces:

99
99
99
prog.rb:7:in `test': private method `func' called for #<Test:0x401b4284> (NameError)
        from prog.rb:21

Protected methods are also callable only from within their own class or its subclasses, but they can be called both as functions form and using a receiver. For example,

                

def <=>(other)
  age <=> other.age
end

Will compile if age is a protected method, but not if it is private.

These features help you control access to your class's internals.

7.8 How can I change the visibility of a method?

You change the visibility of methods using private, protected and public. When used without parameters during a class definition, they affect the visibility of subsequent methods. When used with parameters, they change the visibility of the named methods.

                

class Foo
  def test
    print "hello\n"
  end
  private :test
end

foo = Foo.new
foo.test

Produces:

prog.rb:9: private method `test' called for #<Foo:0x401b4694> (NameError)

You can make a class method private using private_class_method.

                

class Foo
  def Foo.test
    print "hello\n"
  end
  private_class_method :test
end

Foo.test

Produces:

prog.rb:8: private method `test' called for Foo:Class (NameError)

The default visibility for the methods defined in a class is public. The exception is the instance initializing method, initialize.

Methods defined at the toplevel are also public by default.

7.9 Can an identifier beginning with a capital letter be a method name?

Yes, you can, but we don't do it lightly! If Ruby sees a capitalized name followed by a space, it will probably (depending on the context) assume it's a constant, not a method name. So, if you use capitalized method names, always remember to put parameter lists in parentheses, and always put the parentheses next to the method name with no intervening spaces. (This last suggestion is a good idea anyway!)

7.10 Calling super gives an ArgumentError.

Invoking super with no parameters in a method passes all the arguments of that method to a method of the same name in a superclass. If the number of arguments to the original method disagrees with that of the higher-level method, an ArgumentError is raised. To get around this, simply call super and pass a suitable number of arguments.

7.11 How can I call the a method of the same name two levels up?

super invokes the same named method one level up. If you're overloading a method in a more distant ancestor, use alias to give it an new name before masking it with your method definition. You can then call it using that aliased name.

7.12 How can I invoke an original built-in method after redefining it?

Within the method definition, you can use super. You can also use alias to give it an alternative name. Finally, you can call the original method as a singleton method of Kernel.

7.13 What is a destructive method?

A destructive method is one which alters the state of an object. String, Array, and Hash, and others have such methods. Often there are two versions of a method, one with a plain name, the other with the same, but followed by !. The plain version takes a copy of the receiver, makes its change to it, and returns the copy. The version with the ! modifies the receiver in place.

Beware, however, that there are a fair number of destructive methods that don't have an !, including assignment operators (name=), array assignment ([]=), and methods such as Array.delete.

7.14 Why can destructive methods be dangerous?

Remember that assignment in most cases just copies object references, and that parameter passing is equivalent to assignment. This means you can end up with multiple variables referencing the same object. If one of those variables is used to invoke a destructive method, the object referenced by all of them will be changed.

                

def foo(str)
  str.sub!(/foo/, "baz")
end

obj = "foo"
foo(obj)         # -> "baz"
obj              # -> "baz"

In this case the actual argument is altered.

7.15 Can I return multiple values from a method?

Yes and no.

                

def m1
  return 1, 2, 3
end
def m2
  return [1, 2, 3]
end
m1               # -> [1, 2, 3]
m2               # -> [1, 2, 3]

So, only one thing is returned, but that thing can be an arbitrarily complex object. In the case of arrays, you can use multiple assignment to get the effect of multiple return values. For example:

                

def foo
  return 20, 4, 17
end

a, b, c = foo
a                # -> 20
b                # -> 4
c                # -> 17

