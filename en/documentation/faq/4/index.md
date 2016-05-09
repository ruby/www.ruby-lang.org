---
layout: page
title: "Official Ruby FAQ"
lang: en

header: |
  <div class="multi-page">
    <a href="../" title="Part 1">1</a>
    <span class="separator"> | </span>
    <a href="../2/" title="Part 2">2</a>
    <span class="separator"> | </span>
    <a href="../3/" title="Part 3">3</a>
    <span class="separator"> | </span>
    <strong>4</strong>
    <span class="separator"> | </span>
    <a href="../5/" title="Part 5">5</a>
    <span class="separator"> | </span>
    <a href="../6/" title="Part 6">6</a>
    <span class="separator"> | </span>
    <a href="../7/" title="Part 7">7</a>
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

## Variables, constants, and arguments

### Does assignment generate a new copy of an object?

All variables and constants reference (point at) some object. (The exception
is uninitialized local variables, which reference nothing. These raise a
NameError exception if used). When you assign to a variable, or initialize a
constant, you set the object that the variable or constant references.

Assignment on its own therefore never creates a new copy of an object.

There's a slightly deeper explanation in certain special cases. Instances of
Fixnum, NilClass, TrueClass, and FalseClass are contained directly in
variables or constants--there is no reference involved. A variable holding the
number 42 or the constant true, actually holds the value, and not a reference
to it. Assignment therefore physically produces a copy of objects of these
types. We discuss this more in Immediate and Reference Objects.

### What is the scope of a local variable?

A new scope for a local variable is introduced in the (1) toplevel (main),
(2) a class (or module) definition, or (3) a method definition.

    i  =  1       # (1)
    class Demo
      i = 2       # (2)
      def meth
        i = 3     # (3)
        print "In method, i = ", i, "\n"
      end
      print "In class, i = ", i, "\n"
    end
    print "At top level, i = ", i, "\n"
    Demo.new.meth

Produces:

    In class, i = 2
    At top level, i = 1
    In method, i = 3

(Note that the class definition is executable code: the trace message it
contains is written as the class is defined).

A block (``{'' ... ``}'' or do ... end) almost introduces a new scope ;-)
Locals created within a block are not accessible outside the block. However,
if a local within the block has the same name as an existing local variable
in the caller's scope, then no new local is created, and you can subsequently
access that variable outside the block.

    a = 0
    1.upto(3) do |i|
      a += i
      b = i*i
    end
    a                # -> 6
    # b is not defined here

This becomes significant when you use threading--each thread receives its
own copy of the variables local to the thread's block:

    threads = []

    for name in ['one', 'two' ] do
      threads << Thread.new {
        localName = name
        a = 0
        3.times do |i|
          Thread.pass
          a += i
          print localName, ": ", a, "\n"
        end
      }
    end

    threads.each {|t| t.join }

Produces:

    onetwo: : 00

    onetwo: : 11

    onetwo: : 33

while, until, and for are control structures, not blocks, so local variables
within them will be accessible in the enclosing environment. loop, however,
is a method and the associated block introduces a new scope.

### When does a local variable become accessible?

Actually, the question may be better asked as: "at what point does Ruby work
out that something is a variable?" The problem arises because the simple
expression ``a'' could be either a variable or a call to a method with no
parameters. To decide which is the case, Ruby looks for assignment statements.
If at some point in the source prior to the use of ``a'' it sees it being
assigned to, it decides to parse ``a'' as a variable, otherwise it treats it
as a method. As a somewhat pathological case of this, consider this code
fragment, submitted by Clemens Hintze:

    def a
      print "Function 'a' called\n"
      99
    end

    for i in 1..2
      if i == 2
        print "a=", a, "\n"
      else
        a = 1
        print "a=", a, "\n"
      end
    end

Produces:

    a=1
    Function 'a' called
    a=99

During the parse, Ruby sees the use of ``a'' in the first print statement and,
as it hasn't yet seen any assignment to ``a'', assumes that it is a method
call. By the time it gets to the second print statement, though, it has seen
an assignment, and so treats ``a'' as a variable.

Note that the assignment does not have to be executed---Ruby just has to have
seen it. This program does not raise an error.

    a = 1 if false; a  # -> nil

This issue with variables is not normally a problem. If you do bump into it,
try putting an assignment such as a = nil before the first access to the
variable. This has the additional benefit of speeding up the access time to
local variables that subsequently appear in loops.

### What is the scope of a constant?

A constant defined in a class/module definition can be accessed directly
within that class or module's definition.

You can directly access the constants in outer classes and modules from
within nested classes and constants.

You can also directly access constants in superclasses and included modules.

Apart from these cases, you can access class and module constants using
the :: operator--ModuleName::CONST1 or ClassName::CONST2.

### How are arguments passed?

The actual argument is assigned to the formal argument when the method is
invoked. (See assignment for more on the semantics of assignment.)

    def addOne(n)
      n += 1
    end
    a = 1
    addOne(a)      # -> 2
    a              # -> 1

As you are passing object references, it is possible that a method may modify
the contents of a mutable object passed in to it.

    def downer(string)
      string.downcase!
    end
    a = "HELLO"    # -> "HELLO"
    downer(a)      # -> "hello"
    a              # -> "hello"

There is no equivalent of other language's pass-by-reference semantics.

### Does assignment to a formal argument influence the actual argument?

A formal argument is a local variable. Within a method, assigning to a formal
argument simply changes the argument to reference another object.

### What happens when I invoke a method via a formal argument?

All Ruby variables (including method arguments) act as references to objects.
You can invoke methods in these objects to get or change the object's state
and to make the object do something. You can do this with objects passed to
methods. You need to be careful when doing this, as these kinds of side
effects can make programs hard to follow.

### What does ``*'' prepended to an argument mean?

When used as part of a formal parameter list, the asterisk allows arbitrary
numbers of arguments to be passed to a method by collecting them into an
array, and assigning that array to the starred parameter.

    def foo(prefix, *all)
      for e in all
        print prefix, e, " "
      end
    end

    foo("val=", 1, 2, 3)

Produces:

    val=1 val=2 val=3

When used in a method call, * expands an array, passing its individual
elements as arguments.

    a = [1, 2, 3]
    foo(*a)

You can prepend * to the last argument of

    Left hand side of a multiple assignment.
    Right hand side of a multiple assignment.
    Definition of method formal arguments.
    Actual arguments in a method call.
    In when clause of case structure.

For example:

    x, *y = [7, 8, 9]
    x                # -> 7
    y                # -> [8, 9]
    x,    = [7, 8, 9]
    x                # -> 7
    x     = [7, 8, 9]
    x                # -> [7, 8, 9]

### What does ``&'' prepended to an argument mean?

If the last formal argument of a method is preceeded with an ampersand,
a block following the method call will be converted into a Proc object
and assigned to the formal parameter.

If the last actual argument in a method invocation is a Proc object, you can
preceed its name with an ampersand to convert in into a block. The method may
then use yield to call it.

    square = proc { |i| i*i }

    def meth1(&b)
      print b.call(9), "\n"
    end

    meth1 { |i| i+i }

    def meth2
      print yield(8), "\n"
    end

    meth2 { |i| i+i }
    meth2 &square

Produces:

    18
    16
    64

### How can I specify a default value for a formal argument?

    def greet(p1='hello', p2='world')
      print "#{p1} #{p2}\n"
    end

    greet
    greet "hi"
    greet "morning", "mom"

Produces:

    hello world
    hi world
    morning mom

The default value (which can be an arbitrary expression) is evaluated when
the method is invoked. It is evaluated using the scope of the method.

### How do I pass arguments to a block?

The formal parameters of a block appear between vertical bars at the start
of the block:

      proc { |a, b| a <=> b }

These parameters are actually local variables. If an existing local of the
same name exists when the block executes, that variable will be modified by
the call to the block. This may or may not be a good thing.

Typically, arguments are passed to a block using yield (or an iterator that
calls yield), or by using the Proc.call method.

### Why did my object change unexpectedly?

    A = a = b = "abc"
    b.concat("d")    # -> "abcd"
    a                # -> "abcd"
    A                # -> "abcd"

Variables hold references to objects. The assignment A = a = b = "abc" put a
reference to the string ``abc'' into A, a, and b.

When you called b.concat("d"), you invoked the concat method on that object,
changing it from ``abc'' to ``abcd''. Because a and A also reference that
same object, their apparent value changes too.

This is less of a problem in practice than it might appear.

In addition, as of Ruby 1.5.2, all objects may be frozen, protecting them
from change.

### Does the value of a constant ever change?

A constant is a variable whose name starts with an upper case letter. In older
Ruby implementations, when a constant was assigned a new value, a warning was
issued. In newer Rubies, constants may not be reassigned from within instance
methods, but can otherwise be changed at will.
