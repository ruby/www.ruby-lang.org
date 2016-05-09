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
    <strong>6</strong>
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

## Syntax

### What does :var mean?

A colon followed by a name generates an integer(Fixnum) called a symbol
which corresponds one to one with the identifier. "var".intern gives the
same integer as :var, but the ``:'' form will create a local symbol if it
doesn't already exist.

The routines "catch", "throw", "autoload", and so on, require a string or a
symbol as an argument.

"method_missing", "method_added" and "singleton_method_added" (and others)
require a symbol.

The fact that a symbol springs into existence the first time it is referenced
is sometimes used to assign unique values to constants:

    NORTH = :NORTH
    SOUTH = :SOUTH
    EAST  = :EAST
    WEST  = :WEST

### How can I access the value of a symbol?

To get the value of the variable corresponding to a symbol, you can use
id2name to get the name of the variable, and then eval that to get that
variable's contents. In the scope of "symbol", do eval(:symbol.id2name).

    a = 'This is the content of "a"'
    b = eval(:a.id2name)
    a.id == b.id  # b now references the same object as a

If your symbol corresponds to the name of a method, you can use the
Method.method function to return a corresponding Method object, which you
may then call.

    class Demo
      def meth
        "Hello, world"
      end
    end

    d = Demo.new         # -> #<Demo:0x401b4400>
    m = d.method(:meth)  # -> #<Method: Demo(Demo)#meth>
    m.call               # -> "Hello, world"

### Is loop a control structure?

Although loop looks like a control structure, it is actually a method defined
in Kernel. The block which follows introduces a new scope for local variables.

### Ruby doesn't have a post-test loop

Q: Ruby does not have a `do { ... } while` construct, so how can I implement
loops that test the condition at the end.

Clemens Hintze says: You can use a combination of Ruby's `begin ... end`
and the while or until statement modifiers to achieve the same effect:

    i = 0
    begin
      puts "i = #{i}"
      i += 1
    end until i > 4

Produces:

    i = 0
    i = 1
    i = 2
    i = 3
    i = 4

### `a +b` gives an error!

Ruby works hard to distinguish method calls from operators, and variable
names from method names. Unfortunately, there's no way it can get it right
all the time. In this case, `a +b` is parsed as `a(+b)`. Remove the space
to the left of `+` or add a space to the right of `+,` and it will be parsed
as an addition.

### `s = "x"; puts s *10` gives an error.

Again, Ruby sees the asymmetrical space and parses it as `puts(s(*10))`
(which isn't too smart, really). Use `s*10` or `s * 10` to get the desired
result.

### Why can't I pass a hash literal to a method: `p {}`?

The {} is parsed as a block, not a Hash constructor. You can force the {}
to be treated as an expression by making the fact that it's a parameter
explicit: `p({})`.

### I can't get def pos=(val) to work.

I have the following code, but I cannot use the method pos = 1.

    def pos=(val)
      print @pos, "\n"
      @pos = val
    end

Methods with = appended must be called with a receiver (without the receiver,
you're just assigning to a local variable). Invoke it as `self.pos = 1`.

### What is the difference between `'\1'` and `'\\1'`?

They have the same meaning. In a single quote string, only \' and \\ are
transformed and other combinations remain unchanged.

However, in a doubled quoted string, "\1" is the byte \001, while "\\1"
is the two character string containing a backslash and the character "1".

### What's the difference between `or` and `||`?

Q: `p(nil || "Hello")` prints `"Hello"`, while `p(nil or "Hello")` gives a
parse error.

A: `||` combines terms within an expression. Because the first term in this
case is nil, the second term is evaluated.

or is used to combine expressions in conditionals. Ruby is not expecting a
conditional statement in an argument list.
