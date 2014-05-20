---
layout: page
title: "Von Perl zu Ruby"
lang: de
---

Perl ist toll. Perls Dokumentation ist toll. Die Perl-Community ist …
toll. Allerdings ist die Sprache ziemlich umfangreich und unbestritten
komplex. Für Perl-Programmierer, die sich eine einfachere und
eindeutigere Sprache mit von Grund auf integrierter Objektorientierung
wünschen, könnte Ruby genau das Richtige sein.

### Gemeinsamkeiten

Genau wie Perl hat Ruby…

* Ein Paketverwaltungssystem, ähnlich wie CPAN
  (allerdings heißt es [RubyGems][1]).
* Reguläre Ausdrücke (Regexes) sind in die Sprache integriert. Bon appétit!
* Die enthaltene Standardbibliothek stellt bereits viele der häufig
  benötigten Funktionen zur Verfügung.
* Klammern sind oft optional.
* Zeichenketten (Strings) funktionieren im Prinzip genau gleich.
* Es gibt eine verallgemeinerte Syntax für Begrenzer von Zeichenketten
  und regulären Ausdrücken, ähnlich wie bei Perl.
  Das sieht `%q{so}` (einfache Anführungszeichen)
  oder `%Q{so}` (doppelte Anführungszeichen) aus,
  und `%w{so für eine Liste von Wörtern}` (einfache Anführungszeichen).
  Man `%Q|kann|` `%Q(auch)` `%Q^andere^` Begrenzer verwenden.
* Es gibt Interpolation in Zeichenketten mit doppelten Anführungszeichen,
  das `"sieht #{so} aus"` (dabei kann innerhalb von `#{}` beliebiger
  Ruby-Code stehen).
* Für Shell-Kommandosubstitution werden `` `Backticks` `` verwendet.
* Es gibt eingebaute Dokumentationswerkzeuge (in Ruby "rdoc" genannt).

### Unterschiede

Anders als in Perl…

* Gibt es keine kontextabhängigen Syntaxregeln wie in Perl.
* Variablen sind nicht dasselbe wie die durch sie referenzierten Objekte.
  Stattdessen sind sie immer nur Referenzen auf ein Objekt.
* Variablennamen beginnen zwar manchmal mit `$` oder `@`, dadurch wird
  aber nicht der Typ gekennzeichnet, sondern ihr Sichtbarkeitsbereich
  (`$` für globale Variablen, `@` für Instanzvariablen und
  `@@` für Klassenvariablen).
* Array-Literale verwenden eckige Klammern, nicht runde.
* Listen, die aus anderen Listen zusammengesetzt werden, ergeben keine
  große Liste aller Elemente.
  Stattdessen erhält man eine mehrdimensionale Liste.
* Es wird `def` anstelle von `sub` geschrieben.
* Semikolons am Zeilenende sind überflüssig.
  Methodendefinitionen, Klassendefinitionen, Case-Anweisungen
  und ähnliches werden mit dem Schlüsselwort `end` abgeschlossen.
* Objekte sind stark typisiert. Typumwandlungen müssen von Hand
  vorgenommen werden, zum Beispiel mit `foo.to_i`, `foo.to_s`, usw.
* Es gibt kein `eq`, `ne`, `lt`, `gt`, `ge` oder `le`.
* Es gibt keinen Diamantoperator (`<>`),
  üblicherweise wird stattdessen `IO.some_method` geschrieben.
* `=>` wird nur für Hash-Literale verwendet.
* Es gibt kein `undef`. In Ruby gibt es `nil`.
  `nil` ist ein Objekt (wie alles andere in Ruby auch) und
  ist nicht dasselbe wie eine nicht definierte Variable.
  In booleschen Ausdrücken wird es als `false` interpretiert.
* In booleschen Ausdrücken werden nur `false` und `nil` als falsch
  interpretiert. Alles andere ist wahr (einschließlich `0`, `0.0` und `"0"`).
* Es gibt kein [PerlMonks][2].
  Hilfe kann man dafür aber in der Ruby-Talk-Mailingliste finden.



[1]: http://guides.rubygems.org
[2]: http://www.perlmonks.org/
