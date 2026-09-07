---
layout: page
title: "To Ruby From JavaScript"
lang: en
---

JavaScript is a ubiquitous programming language, primarily known for web
development but also used for server-side development with Node.js. Going
from JavaScript to Ruby, you'll find Ruby has more structured syntax and
strong object-oriented principles, but you'll also discover Ruby's focus
on developer happiness and expressiveness.

### Similarities

As with JavaScript, in Ruby,...

* There's an interactive prompt (called `irb`).
* Objects are dynamically typed.
* Functions are first-class objects.
* There are no special line terminators (except the usual newline).
* You can define functions inside other functions.
* Arrays and objects (hashes in Ruby) are core data structures.
* There is excellent support for functional programming with blocks,
  iterators, and higher-order functions.
* Variables are dynamically typed—you don't declare their types.
* Both support closures and can capture variables from their
  surrounding scope.
* Regular expressions are built into the language.
* Both languages are interpreted, not compiled.


### Differences

Unlike JavaScript, in Ruby,...

* You don't need to worry about browser compatibility—Ruby runs
  consistently across platforms.
* Everything is an object, including numbers and basic types.
  `5.times { puts "Hello" }` is valid Ruby.
* There's no concept of `undefined`. Ruby uses `nil` instead of both
  `null` and `undefined`.
* Functions are called methods, and you typically call them on objects.
* There's `public`, `private`, and `protected` for method visibility,
  rather than relying on conventions or closures for privacy.
* Ruby has class-based inheritance with single inheritance plus mixins,
  rather than JavaScript's prototype-based inheritance.
* Variables have different scopes indicated by their prefix (`@instance`,
  `@@class`, `$global`) rather than using `var`, `let`, or `const`.
* String interpolation uses `#{}` syntax: `"Hello #{name}"` instead of
  template literals or concatenation.
* Ruby blocks with `do...end` or `{...}` are more powerful than
  JavaScript arrow functions and are used extensively for iteration.
* Minimal punctuation: semicolons are optional and rarely used.
* Blocks are delimited with `end` (or `do...end`) rather than `{}`.
* It's `elsif` instead of `else if`.
* Ruby has symbols (`:symbol`) which are immutable strings often used
  as identifiers.
* No type coercion surprises—Ruby is more predictable about type
  conversions.
* Ruby methods can end with `?` (for predicates) or `!` (for
  destructive operations).
* Parentheses for method calls are usually optional.
* You use `require` or `require_relative` in Ruby, whereas in JavaScript you use ES6 `import` (or Node.js's `require()`).
* Classes are defined with `class...end` blocks rather than constructor
  functions or class expressions.
* Ruby has built-in support for operator overloading.
* When tested for truth, only `false` and `nil` are falsy. Everything
  else is truthy (including `0`, `""`, and `[]`).
* Ruby has extensive metaprogramming capabilities—you can easily
  modify classes and objects at runtime.
