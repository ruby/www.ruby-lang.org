---
layout: page
title: "Von PHP zu Ruby"
lang: de
---

PHP ist bei Webapplikationen weit verbreitet, aber wenn du Ruby on Rails
verwenden willst oder eine Programmiersprache suchst, die für
allgemeinere Fälle ausgelegt ist, ist Ruby sicher einen Blick wert.

### Gemeinsamkeiten

Genauso wie in PHP ist Ruby…

* Ruby ist eine dynamisch typisierte Sprache, so dass man sich keine
  Gedanken um die Deklaration von Variablen machen muss.
* Ruby kennt Klassen und die gleichen Mechanismen für die
  Zugriffskontrolle wie PHP 5 (`public`, `protected` und `private`)
* Einige Variablen beginnen mit $, genau wie in PHP (aber nicht alle).
* Es gibt auch das Schlüsselwort `eval`
* Natürlich kennt auch Ruby string interpolation, wenn doppelte
  Anführungstriche verwendet werden – man kann also
  `"#{foo} und #{bar}"` schreiben. Und wie in PHP funktioniert das bei
  einfachen Anführungstrichen nicht.
* Es gibt auch heredocs.
* Wie in PHP 5 gibt es auch in Ruby Exceptions.
* Es gibt eine ziemlich umfangreiche Standard-Bibliothek.
* Standard-Arrays und Assoziative-Arrays (Hashes) funktionieren wie in
  PHP, man braucht nur weniger zu tippen: aus `array('a' => 'b')` wird
  einfach `{'a' => 'b'}`.
* `true` und `false` verhalten sich wie in PHP, aber `null` wird mit
  `nil` bezeichnet

### Unterschiede

Im Gegensatz zu PHP hat Ruby…

* Es gibt auch strenge Typisierung: man muss explizit Funktionen zur
  Typkonvertierung aufrufen. Z.B. `to_s` oder `to_i`
* strings, numbers, arrays, hashes, etc. sind Objekte. Also statt
  `abs(-1)` schreibt man in Ruby `-1.abs`
* Parameter bei Methodenaufrufen brauchen nicht in runde Klammern
  gesetzt werden – außer, falls notwendig, um Mehrdeutigkeit zu
  vermeiden.
* Die Ruby Standard Bibliothek ist in Modulen und Klassen organisiert.
* Objekte bringen Reflection-Eigenschaften bereits mit. Die Verwendung
  einer besondern `Reflection` Klasse, wie in PHP 5, ist nicht notwendig
* Variablen sind Referenzen
* Es gibt keine `abstract` Klassen und auch keine @interface@s
* Hashes und Arrays sind verschiedene Typen in Ruby.
* nur `false` und `nil` liefern false: `0`, `array()` und `""` ergeben
  in Bedingungen true.
* fast alles ist Methodenaufruf, sogar `raise`
  (`throw` in PHP).
