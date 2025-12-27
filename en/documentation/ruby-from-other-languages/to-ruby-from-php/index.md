---
layout: page
title: "To Ruby From PHP"
lang: en
---

PHP is in widespread use for web applications, but if you want to use
Ruby on Rails or just want a language that’s more tailored for general
use, Ruby is worth a look.

### Similarities

As in PHP, in Ruby…

* Ruby is dynamically typed, like in PHP, so you don’t need to worry
  about having to declare variables.
* There are classes, and you can control access to them like in PHP 5
  (`public`, `protected` and `private`).
* Some variables start with $, like in PHP (but not all).
* There’s `eval`, too.
* You can use string interpolation. Instead of doing `"$foo is a $bar"`,
  you can do `"#{foo} is a #{bar}"`—like in PHP, this doesn’t apply for
  single-quoted strings.
* There’s heredocs.
* Ruby has exceptions, like PHP 5.
* There’s a fairly large standard library.
* Arrays and hashes work like expected, if you exchange `array()` for
  `{` and `}`\: `array('a' => 'b')` becomes `{'a' => 'b'}`.
* `true` and `false` behave like in PHP, but `null` is called `nil`.

### Differences

Unlike in PHP, in Ruby…

* There’s strong typing. You’ll need to call `to_s`, `to_i` etc. to
  convert between strings, integers and so on, instead of relying on the
  language to do it.
* Strings, numbers, arrays, hashes, etc. are objects. Instead of calling
  `abs(-1)` it’s `-1.abs`.
* Parentheses are optional in method calls, except to clarify which
  parameters go to which method calls.
* The standard library and extensions are organized in modules and classes.
* Reflection is an inherent capability of objects, you don’t need to use
  `Reflection` classes like in PHP 5.
* Variables are references.
* There’s no `abstract` classes or `interface`s.
* Hashes and arrays are not interchangeable.
* Only `false` and `nil` are false: `0`, `array()` and `""` are all true
  in conditionals.
* Almost everything is a method call, even `raise` (`throw` in PHP).
