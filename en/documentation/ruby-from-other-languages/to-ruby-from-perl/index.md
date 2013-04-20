---
layout: page
title: "To Ruby From Perl"
lang: en
---

Perl is awesome. Perl’s docs are awesome. The Perl community is …
awesome. However, the language is fairly large and arguably complex. For
those Perlers who long for a simpler time, a more orthogonal language,
and elegant OO features built-in from the beginning, Ruby may be for
you.

### Similarities

As with Perl, in Ruby,...

* You’ve got a package management system, somewhat like CPAN (though
  it’s called [RubyGems][1])
* Regexes are built right in. Bon appétit!
* There’s a fairly large number of commonly-used built-ins.
* Parentheses are often optional
* Strings work basically the same.
* There’s a general delimited string and regex quoting syntax similar to
  Perl’s (looks like `%q{this (single-quoted)}`, or `%Q{this
  (double-quotish)}`, and `%w{this for a single-quoted list of words}`.
  You `%Q|can|` `%Q(use)` `%Q^other^` delimiters if you like).
* You’ve got double-quotish variable interpolation, though it `"looks
  #{like} this"` (and you can put any Ruby code you like inside that
  `#{}`).
* Shell command expansion uses \`backticks\`.
* You’ve got embedded doc tools (Ruby’s is called rdoc).

### Differences

Unlike Perl, in Ruby,...

* You don’t have the context-dependent rules like with Perl.
* A variable isn’t the same as the object to which it refers. Instead,
  it’s always just a reference to an object.
* Although `$` and <tt>@</tt> are used as the first character in
  variable names sometimes, rather than indicating type, they indicate
  scope (`$` for globals, <tt>@</tt> for object instance, and
  <tt>@@</tt> for class attributes).
* Array literals go in brackets instead of parentheses.
* Composing lists of other lists does not flatten them into one big
  list. Instead you get an array of arrays.
* It’s `def` instead of `sub`.
* There’s no semicolons needed at the end of each line. Incidentally,
  you end things like function definitions, class definitions, and case
  statements with the `end` keyword.
* Objects are strongly typed. You’ll be manually calling `foo.to_i`,
  `foo.to_s`, etc., if you need to convert between types.
* There’s no `eq`, `ne`, `lt`, `gt`, `ge`, nor `le`.
* There’s no diamond operator. You usually use <tt>IO.*some\_func*</tt>
  instead.
* The fat comma is only used for hash literals.
* There’s no `undef`. In Ruby you have `nil`. `nil` is an object (like
  anything else in Ruby). It’s not the same as an undefined variable. It
  evaluates to `false` if you treat it like a boolean.
* When tested for truth, only `false` and `nil` evaluate to a false
  value. Everything else is true (including `0`, `0.0`, and `"0"`).
* There’s no [PerlMonks][2]. Though the ruby-talk mailing list is a very
  helpful place.



[1]: http://docs.rubygems.org/
[2]: http://www.perlmonks.org/
