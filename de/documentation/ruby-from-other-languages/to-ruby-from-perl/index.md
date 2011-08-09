---
layout: page
title: "Von Perl zu Ruby"
lang: de
---

Perl is awesome. Perl’s docs are awesome. The Perl community is …
awesome. However, the language is fairly large and arguably complex. For
those Perlers who long for a simpler time, a more orthogonal language,
and elegant OO features built-in from the beginning, Ruby may be for
you.

### Similarities

 As with Perl, in Ruby,... * you’ve got a package management system, somewhat like CPAN (though
  it’s called [RubyGems][1])
* regexes are built right in. Bon appétit!
* there’s a fairly large number of commonly-used built-ins.
* parentheses are often optional
* strings work basically the same.
* there’s a general delimited string and regex quoting syntax similar to
  Perl’s (looks like `%q{this (single-quoted)}`, or `%Q{this
  (double-quotish)}`, and `%w{this for a single-quoted list of words}`.
  You `%Q|can|` `%Q(use)` `%Q^other^` delimiters if you like).
* you’ve got double-quotish variable interpolation, though it `"looks
  #{like} this"` (and you can put any Ruby code you like inside that
  `#{}`).
* shell command expansion uses \`backticks\`.
* you’ve got embedded doc tools (Ruby’s is called rdoc).

### Differences

 Unlike Perl, in Ruby,... * you don’t have the context-dependent rules like with Perl.
* a variable isn’t the same as the object to which it refers. Instead,
  it’s always just a reference to an object.
* although `$` and <tt>@</tt> are used as the first character in
  variable names sometimes, rather than indicating type, they indicate
  scope (`$` for globals, <tt>@</tt> for object instance, and
  <tt>@@</tt> for class attributes).
* array literals go in brackets instead of parentheses.
* composing lists of other lists does not flatten them into one big
  list. Instead you get an array of arrays.
* it’s `def` instead of `sub`.
* there’s no semicolons needed at the end of each line. Incidentally,
  you end things like function definitions, class definitions, and case
  statements with the `end` keyword.
* objects are strongly typed. You’ll be manually calling `foo.to_i`,
  `foo.to_s`, etc., if you need to convert between types.
* there’s no `eq`, `ne`, `lt`, `gt`, `ge`, nor `le`.
* there’s no diamond operator. You usually use <tt>IO.*some\_func*</tt>
  instead.
* the fat comma is only used for hash literals.
* there’s no `undef`. In Ruby you have `nil`. `nil` is an object (like
  anything else in Ruby). It’s not the same as an undefined variable. It
  evaluates to `false` if you treat it like a boolean.
* when tested for truth, only `false` and `nil` evaluate to a false
  value. Everything else is true (including `0`, `0.0`, and `"0"`).
* there’s no [PerlMonks][2]. Though the ruby-talk mailing list is a very
  helpful place. And we’ve also got a [wiki][3] and a [faq][4].



[1]: http://docs.rubygems.org/ 
[2]: http://www.perlmonks.org/ 
[3]: http://wiki.rubygarden.org/Ruby 
[4]: http://www.rubygarden.org/faq/dispatch.cgi?controller=main&amp;action=index 
