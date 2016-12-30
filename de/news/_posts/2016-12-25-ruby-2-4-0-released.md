---
layout: news_post
title: "Ruby 2.4.0 veröffentlicht"
author: "naruse"
translator: "Marvin Gülker"
date: 2016-12-25 00:00:00 +0000
lang: de
---

Wir freuen uns, die Veröffentlichung von Ruby 2.4.0 bekannt geben zu
können.

Bei Ruby 2.4.0 handelt es sich um die erste stabile Veröffentlichung
von Rubys 2.4er-Serie und führt zahlreiche neue Features ein,
beispielsweise:

## [Verbesserung der Hash-Tabellen (von Wladimir Makarow)](https://bugs.ruby-lang.org/issues/12142)

Die interne Struktur von Hash-Tabellen (st_table) wird durch die
Einführung offener Adressierung _(open addressing)_ und eines die
Einfügungsreihenfolge beibehaltenden Arrays _(inclusion order array)_
verbessert.
Diese Verbesserung ist mit diversen Leuten diskutiert worden,
insbesondere mit Jura Sokolow.

## Binding#irb: Startet eine REPL-Sitzung wie `binding.pry`

Im Rahmen von Debugging ist es oft hilfreich, sich Variablenwerte
mithilfe von `p` anzeigen zu lassen. Mit
[pry](https://github.com/pry/pry) war es möglich, durch Einfügen der
Anweisung `binding.pry` in die Anwendung an der betroffenen Stelle
eine REPL zu starten und beliebigen Ruby-Code auszuführen. Mit
[r56624](https://github.com/ruby/ruby/commit/493e48897421d176a8faf0f0820323d79ecdf94a)
wird `binding.irb` eingeführt, das sich ganz ähnlich verhält, aber
eine reguläre IRB startet.

## [Zusammenführung von Fixnum und Bignum in Integer](https://bugs.ruby-lang.org/issues/12005)

Obwohl [ISO/IEC 30170:2012](http://www.iso.org/iso/iso_catalogue/catalogue_tc/catalogue_detail.htm?csnumber=59579)
keine näheren Bestimmungen über die Integer-Klasse trifft, führt Ruby
mit Fixnum und Bignum zwei sichtbare Subklassen von Integer.
Mit Ruby 2.4 werden diese in Integer vereinigt.
Daraus folgt, dass alle C-Extensions, die die Klassen Fixnum oder
Bignum benutzen, überarbeitet werden müssen.

Siehe dazu auch [das dazugehörige Ticket](https://bugs.ruby-lang.org/issues/12005) und [die Folien von akr](http://www.a-k-r.org/pub/2016-09-08-rubykaigi-unified-integer.pdf).

## [String unterstützt Groß- und Kleinschreibung mit Unicode](https://bugs.ruby-lang.org/issues/10085)

Die Methoden `String/Symbol#upcase/downcase/swapcase/capitalize(!)`
wenden bei der Konvertierung in Groß- oder Kleinschreibung nunmehr
Unicode-Regeln anstelle der bisherigen ASCII-Regeln an.

## Performanzverbesserungen

Ruby 2.4 enthält im Übrigen die folgenden Performanzverbesserungen,
die Änderungen am Sprachverhalten mit sich bringen:

### [Array#max, Array#min](https://bugs.ruby-lang.org/issues/12172)

`[x, y].max` and `[x, y].min` wurden so optimiert, dass sie unter
bestimmten Bedingungen kein zusätzliches temporäres Array erzeugen.

### [Regexp#match?](https://bugs.ruby-lang.org/issues/8110)

Eine Methode `Regexp#match?` wurde hinzugefügt, die einen Regulären
Ausdruck anwendet, ohne eine Backreference zu erstellen oder `$~` zu
verändern, wodurch Objektallozierungen eingespart werden können.

### Sonstige Performanzverbesserungen

* [Zugriff auf Instanzvariablen beschleunigt](https://bugs.ruby-lang.org/issues/12274)

## Debugging

### [Thread#report_on_exception und Thread.report_on_exception](https://bugs.ruby-lang.org/issues/6647)

Exceptions in Threads werden von Ruby ignoriert, bis der betreffende
Thread mit einem anderen zusammengeführt wird _(join)_. Wenn
`report_on_exception = true` gesetzt ist, erhalten Sie eine Warnung,
wenn ein Thread wegen einer nicht behandelten Exception abgestürzt
ist.

Geben Sie uns Rückmeldung über das gewünschte Standardverhalten von
`report_on_exception` und über report-on-GC, welches eine Nachricht
anzeigt, wenn ein Thread vom GC vernichtet wird, ohne zuvor mit
einem anderen Thread zusammengeführt worden zu sein.

### [Deadlock-Erkennung für Threads zeigt Threads nun mit Backtrace und Abhängkeiten](https://bugs.ruby-lang.org/issues/8214)

Zwar besitzt Ruby eine Deadlock-Erkennung bezüglich wartender Threads,
aber ihre Meldungen enthalten nicht ausreichend Informationen für
sinnvolles Debugging.
Die Deadlock-Erkennung von Ruby 2.4 listet Threads nun mit ihrem
Backtrace und abhängigen Threads.

## Sonstige wesentliche Änderungen seit 2.3

* Unterstützung von OpenSSL 1.1.0 (Unterstützung von 0.9.7 und früher wird aufgegeben)
* ext/tk wurde aus der stdlib entfernt [Feature #8539](https://bugs.ruby-lang.org/issues/8539)
* XMLRPC wurde aus der stdlib entfernt [Feature #12160](https://bugs.ruby-lang.org/issues/12160)

Siehe die [NEWS](https://github.com/ruby/ruby/blob/v2_4_0/NEWS)
oder das Commitlog für weitere Informationen.

Mit diesen Änderungen wurden seit Ruby 2.3.0
[2523 Dateien geändert, 289129 Einfügungen(+), 84670 Löschungen(-)](https://github.com/ruby/ruby/compare/v2_3_0...v2_4_0)!

Frohe Weihnachten, schöne Ferien und haben Sie Spaß an der
Programmierung mit Ruby 2.4!

## Download

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0.tar.bz2>

      SIZE:   12572424 bytes
      SHA1:   944d2588308391b20a89642472454d1dfe7b2360
      SHA256: 440bbbdc49d08d3650f340dccb35986d9399177ad69a204def56e5d3954600cf
      SHA512: bef7bb53f63fb74073d071cc125fb67b273ed0779ef43c2d2969089b9ca21fff1bd012281c5b748f7a3c24dd26e71730d7248c05a01cb23ab2089eb4d02115fe

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0.tar.gz>

      SIZE:   14104044 bytes
      SHA1:   d44a3c50a0e742341ed3033d5db79d865151a4f4
      SHA256: 152fd0bd15a90b4a18213448f485d4b53e9f7662e1508190aa5b702446b29e3d
      SHA512: 21c9f596b42dd9cba7a53963a59fed0c2e0c1eb960a4ac7087ea3eaa991ce9252d32639e1edcb75b1d709bc07c4820a6dc336ab427d0643c6e6498e0eacdbc8b

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0.tar.xz>

      SIZE:   9906880 bytes
      SHA1:   038804bbd0e77508dd2510b729a9f3b325489b2e
      SHA256: 3a87fef45cba48b9322236be60c455c13fd4220184ce7287600361319bb63690
      SHA512: 975a5388592adc038461e0acebb6c0efee242891b2ea8621476401458efe2bc0fdd317d3bf99beb745b0b3808410efdff33862da29c95c027f457943721e3ab6

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0.zip>

      SIZE:   15758757 bytes
      SHA1:   29e1bab11551011718c35a51827edcb55bd656fc
      SHA256: 5c2bbfa26fd6a15a2d70961874b0f3a386206fcc5f698e240dd8b0c9f0f18c5e
      SHA512: 31d932372ce490eeac0a70bc8dcf842909a90435422398d069c05cf01d994936064b8f4e60879e28a8655c1296eb8e180e348cb95e001ed6ca73cda0ff77de23
