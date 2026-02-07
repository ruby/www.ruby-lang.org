---
layout: page
title: "Official Ruby FAQ"
lang: vi

header: |
  <div class="multi-page">
    <a href="../" title="Content">Content</a>
    <span class="separator"> | </span>
    <a href="../1/" title="Part 1">1</a>
    <span class="separator"> | </span>
    <strong>2</strong>
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

## How does Ruby stack up against...?

### How does Ruby compare with Python?

Python and Ruby are both object oriented languages that provide a smooth
transition from procedural to OO programming styles. Smalltalk, by contrast,
is object only---you can't do anything until you understand objects,
inheritance and the sizable Smalltalk class hierarchy. By providing procedural
training wheels, Python and Ruby “fix” one of the features that may have
kept Smalltalk out of the mainstream. The two languages differ by approaching
this solution from opposite directions.

Python is a hybrid language. It has functions for procedural programming and
objects for OO programming. Python bridges the two worlds by allowing
functions and methods to interconvert using the explicit `self` parameter
of every method def. When a function is inserted into an object, the first
argument automagically becomes a reference to the receiver.

Ruby is a pure OO language that can masquerade as a procedural one. It has no
functions, only method calls. In a Ruby method the receiver, also called
`self`, is a hidden argument like `this` in C++. A `def` statement outside of
a class definition, which defines a function in Python, actually defines a method
in Ruby. These ersatz functions become private methods of class Object, the
root of the Ruby class hierarchy. Procedural programming is neatly solved from
the other direction---everything is an object. If the user doesn't grok
objects yet, they can just pretend that `def` is a function definition and
still get useful work done.

Ruby's OO purity provides a number of features that Python lacks or is still
working toward: a unified type/class hierarchy, metaclasses, the ability to
subclass everything, and uniform method invocation (none of this `len()` is a
function but `items()` is a method rubbish). Ruby, like Smalltalk, only
supports single inheritance, but it does have a very powerful mixin concept:
a class definition may include a module, which inserts that module's methods,
constants, etc. into the class.

Ruby, again like Smalltalk, provides closures and code blocks and uses them
to the same good effect. The Ruby collection classes and iterators are
outstanding, much more powerful and elegant than the ad hoc solutions that
Python is sprouting (lambdas and list comprehensions).

Ruby's syntax and design philosophy are heavily influenced by Perl. It has a
lot of syntactic variability. Statement modifiers (`if`, `unless`, `while`,
`until`, etc.) may appear at the end of any statement. Some key words are
optional (the `then` in an `if` statement for example). Parentheses may
sometimes be elided in method calls. The receiver of a method may usually be
elided.
Many, many things are lifted directly from Perl.
Built in regular expressions, `$_` and friends, here documents, the
single-quoted / double-quoted string distinction, `$` and `@` prefixes to
distinguish different kinds of names and so forth.

If you like Perl, you will like Ruby and be right at home with its syntax.
If you like Smalltalk, you will like Ruby and be right at home with its
semantics. If you like Python, you may or may not be put off by the huge
difference in design philosophy between Python and Ruby/Perl.

Ruby is much more complex than Python but its features, for the most part,
hang together well. Ruby is well designed and full of neat ideas that might be
mined for P3K. I'm not sure how many Python programmers will be attracted to
it though---it hasn't won me over (yet). But it is worthy of serious study and
could be a real threat to Perl.

Posted by [John Dell'Aquila](mailto:jbd@alum.mit.edu) in comp.lang.python,
11/17/2000. Reproduced with permission.
