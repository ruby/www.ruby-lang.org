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

{% include faq-notice.html %}

## Syntax

### What does `:name` mean?

A colon followed by a name generates a Symbol object which corresponds
one to one with the identifier. During the duration of a program's
execution the same Symbol object will be created for a given name or string.
Symbols can also be created with `"name".intern` or `"name".to_sym`.

Symbol objects can represent identifiers for methods, variables, and so on.
Some methods, like `define_method`, `method_missing`, or `trace_var`,
require a symbol. Other methods, e.g. `attr_accessor`, `send`, or `autoload`,
also accept a string.

Due to the fact that they are created only once, Symbols are often used as
hash keys. String hash keys would create a new object for every single use,
thereby causing some memory overhead.
There is even a special syntax for symbol hash keys:

~~~
person_1 = { :name => "John", :age => 42 }
person_2 = { name: "Jane", age: 24 }        # alternate syntax
~~~

Symbols can also be used as enumeration values
or to assign unique values to constants:

~~~
status = :open  # :closed, ...

NORTH = :NORTH
SOUTH = :SOUTH
~~~

### How can I access the value of a symbol?

To get the value of the variable corresponding to a symbol, you can use
`symbol.to_s` or `"#{symbol}"` to get the name of the variable, and then
eval that in the scope of the symbol to get the variable's contents:

~~~
a = "This is the content of `a'"
b = eval("#{:a}")
a.object_id == b.object_id  # => true
~~~

You can also use

~~~
b = binding.local_variable_get(:a)
~~~

If your symbol corresponds to the name of a method, you can use `send`:

~~~
class Demo
  def hello
    "Hello, world"
  end
end

demo = Demo.new
demo.send(:hello)
~~~

Or you can use `Object#method` to return a corresponding `Method` object,
which you may then call:

~~~
m = demo.method(:hello)  # => #<Method: Demo#hello>
m.call                   # => "Hello, world"
~~~

### Is `loop` a control structure?

Although `loop` looks like a control structure, it is actually a method
defined in `Kernel`. The block which follows introduces a new scope for
local variables.

### Ruby doesn't have a post-test loop

Q: Ruby does not have a `do { ... } while` construct, so how can I implement
loops that test the condition at the end?

Clemens Hintze says: You can use a combination of Ruby's `begin ... end`
and the `while` or `until` statement modifiers to achieve the same effect:

~~~
i = 0
begin
  puts "i = #{i}"
  i += 1
end until i > 4
~~~

Produces:

~~~
i = 0
i = 1
i = 2
i = 3
i = 4
~~~

### Why can't I pass a hash literal to a method: `p {}`?

The `{}` is parsed as a block, not a `Hash` constructor. You can force the
`{}` to be treated as an expression by making the fact that it's a parameter
explicit: `p({})`.

### I can't get `def pos=(val)` to work!

I have the following code, but I cannot use the method `pos = 1`.

~~~
def pos=(val)
  @pos = val
  puts @pos
end
~~~

Methods with `=` appended must be called with an explicit receiver
(without the receiver, you are just assigning to a local variable).
Invoke it as `self.pos = 1`.

### What is the difference between `'\1'` and `'\\1'`?

They have the same meaning. In a single quoted string, only `\'` and `\\`
are transformed and other combinations remain unchanged.

However, in a double quoted string, `"\1"` is the byte `\001`
(an octal bit pattern), while `"\\1"` is the two character string
containing a backslash and the character `"1"`.

### What is the difference between `or` and `||`?

Q: `p(nil || "Hello")` prints `"Hello"`, while `p(nil or "Hello")` gives a
parse error. Why?

A: `or` has a very low precedence, `p( (nil or "Hello") )` will work.

The precedence of `or` is for instance also lower than that of `=`,
whereas `||` has a higher precedence:

~~~
foo = nil || "Hello"  # parsed as: foo = (nil || "Hello")
foo  # => "Hello"

# but perhaps surprisingly:

foo = nil or "Hello"  # parsed as: (foo = nil) or "Hello"
foo  # => nil
~~~

`or` (and similarly `and`) is best used **not** for combining
boolean expressions, but for control flow, like in

~~~
do_something  or raise "some error!"
~~~

where `do_something` returns `false` or `nil` when an error occurs.
