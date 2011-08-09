---
layout: page
title: "Von PHP zu Ruby"
lang: de
---

PHP ist bei Webapplikationen weit verbreitet, aber wenn du Ruby on Rails
verwenden willst oder eine Programmiersprache suchst, die für
allgemeinere Fälle ausgelegt ist, ist Ruby sicher einen Blick wert.

### Gemeinsamkeiten

 Genauso wie in PHP ist Ruby… * Ruby is dynamically typed, like in PHP, so you don’t need to worry
  about having to declare variables.
* there are classes, and you can control access to them like in PHP 5
  (`public`, `protected` and `private`)
* Einige Variablen beginnen mit $, genau wie in PHP (aber nicht alle).
* there’s `eval`, too.
* you can use string interpolating. Instead of doing ”$foo is a $bar”,
  you can do ”#\{foo} is a #\{bar}”—like in PHP, this doesn’t apply for
  single-quoted strings.
* there’s heredocs
* Ruby has exceptions, like PHP 5
* there’s a fairly large standard library
* arrays and hashes work like expected, if you exchange `array()` for
  `{` and `}`\: `array('a' => 'b')` becomes `{'a' => 'b'}`.
* `true` und `false` verhalten sich wie in PHP, aber `null` wird mit
  `nil` bezeichnet

### Unterschiede

 Im Gegensatz zu PHP hat Ruby… * there’s strong typing. You’ll need to call `to_s`, `to_i` etc. to
  convert between strings, integers and so on, instead of relying on the
  language to do it
* strings, numbers, arrays, hashes, etc. are objects. Instead of calling
  abs(-1) it’s -1.abs
* paranthesis are optional in method calls, except to clarify which
  parametres go to which method calls
* instead of naming conditions, like underscores, the standard library
  and extensions are organized in modules and classes
* reflection is an inherent capatibility of objects, you don’t need to
  use `Reflection` classes like in PHP 5
* variables are references.
* there’s no `abstract` classes or `interface`s
* hashes and arrays are not interchangable
* nur `false` und `nil` liefern false: `0`, `array()` und `""` ergeben
  in Bedingungen true.
* fast alles ist Methodenaufruf, sogar `raise` (`throw` in PHP).

