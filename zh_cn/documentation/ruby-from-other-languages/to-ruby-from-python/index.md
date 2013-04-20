---
layout: page
title: "从 Python 到 Ruby - Ruby 官方网站"
lang: zh_cn
---

Python is another very nice general purpose programming language. Going
from Python to Ruby, you’ll find that there’s a little bit more syntax
to learn than with Python.

### Similarities

As with Python, in Ruby,...

* There’s an interactive prompt (called `irb`).
* You can read docs on the command line (with the `ri` command instead
  of `pydoc`).
* There are no special line terminators (except the usual newline).
* String literals can span multiple lines like Python’s triple-quoted
  strings.
* Brackets are for lists, and braces are for dicts (which, in Ruby, are
  called “hashes”).
* Arrays work the same (adding them makes one long array, but composing
  them like this `a3 = [ a1, a2 ]` gives you an array of arrays).
* Objects are strongly and dynamically typed.
* Everything is an object, and variables are just references to objects.
* Although the keywords are a bit different, exceptions work about the
  same.
* You’ve got embedded doc tools (Ruby’s is called rdoc).

### Differences

Unlike Python, in Ruby,...

* Strings are mutable.
* You can make constants (variables whose value you don’t intend to
  change).
* There are some enforced case-conventions (ex. class names start with a
  capital letter, variables start with a lowercase letter).
* There’s only one kind of list container (an Array), and it’s mutable.
* Double-quoted strings allow escape sequences (like \\t) and a special
  “expression substitution” syntax (which allows you to insert the
  results of Ruby expressions directly into other strings without having
  to `"add " + "strings " + "together"`). Single-quoted strings are like
  Python’s `r"raw strings"`.
* There are no “new style” and “old style” classes. Just one kind.
* You never directly access attributes. With Ruby, it’s all method
  calls.
* Parentheses for method calls are usually optional.
* There’s `public`, `private`, and `protected` to enforce access,
  instead of Python’s `_voluntary_` underscore `__convention__`.
* “mixin’s” are used instead of multiple inheritance.
* You can re-open a class anytime and add more methods.
* You’ve got `true` and `false` instead of `True` and `False` (and `nil`
  instead of `None`).
* When tested for truth, only `false` and `nil` evaluate to a false
  value. Everything else is true (including `0`, `0.0`, `""`, and `[]`).
* It’s `elsif` instead of `elif`.
* It’s `require` instead of `import`. Otherwise though, usage is the
  same.
* The usual-style comments on the line(s) *above* things (instead of
  docstrings below them) are used for generating docs.
* There are a number of shortcuts that, although give you more to
  remember, you quickly learn. They tend to make Ruby fun and very
  productive.

