---
layout: news_post
title: "Ruby 2.4.0-rc1 veröffentlicht"
author: "naruse"
translator: "Marvin Gülker"
date: 2016-12-12 09:00:00 +0000
lang: de
---

Wir freuen uns, die Veröffentlichung von Ruby 2.4.0-rc1 bekannt geben
zu können.

Ruby 2.4.0-rc1 ist der erste Veröffentlichungskandidat von Ruby 2.4.0
und dient dazu, Rückmeldungen aus der Community zu
sammeln. Bitte [geben Sie uns Feedback](https://github.com/ruby/ruby/wiki/How-To-Report),
da noch immer die Möglichkeit besteht, Einfluss auf die Features zu
nehmen.

## [Verbesserung der Hash-Tabellen (von Wladimir Makarow)](https://bugs.ruby-lang.org/issues/12142)

Die interne Struktur von Hash-Tabellen (st_table) wird durch die
Einführung offener Adressierung _(open addressing)_ und eines die
Einfügungsreihenfolge beibehaltenden Arrays _(inclusion order array)_
verbessert.
Diese Verbesserung ist mit diversen Leuten diskutiert worden,
insbesondere mit Jura Sokolow.

## Binding#irb: Startet eine REPL-Sitzung wie `binding.pry`

Im Rahmen von Debugging ist es oft erforderlich, sich Variablenwerte
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
mit Fixnum und Bignum zwei sichtbare Subklassen von Integer. Mit Ruby
2.4 werden diese mit Integer vereinigt.
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
Thread mit einem anderen zusammengeführt _(joined)_ wird. Wenn
`report_on_exception = true` gesetzt ist, erhalten Sie einen Hinweis,
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

Versuchen Sie Ruby 2.4.0-rc1, haben Sie Spaß daran und [geben Sie Rückmeldung](https://github.com/ruby/ruby/wiki/How-To-Report)!

## Sonstige wesentliche Änderungen seit 2.3

* Unterstützung von OpenSSL 1.1.0 (Unterstützung von 0.9.7 und früher wird aufgegeben)
* ext/tk wurde aus der stdlib entfernt [Feature #8539](https://bugs.ruby-lang.org/issues/8539)
* XMLRPC wurde aus der stdlib entfernt [Feature #12160](https://bugs.ruby-lang.org/issues/12160)

Siehe die [NEWS](https://github.com/ruby/ruby/blob/v2_4_0_rc1/NEWS)
oder das Commitlog für weitere Informationen.

Mit diesen Änderungen wurden seit Ruby 2.3.0
[2519 Dateien geändert, 288606 Einfügungen(+), 83896 Löschungen(-)](https://github.com/ruby/ruby/compare/v2_3_0...v2_4_0_rc1)!

## Download

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-rc1.tar.bz2>

      SIZE:   12512729 bytes
      SHA1:   a0439652a97a2406b691e8a1e586e2cf08c258ba
      SHA256: 3b156b20f9df0dd62cbeeb8e57e66ea872d2a5b55fabdef1889650122bcc2ea7
      SHA512: b43902ac7794487197df55a45256819d2e7540b77f1ed4eb68def3e0473ee98860a400862075bafadbde74f242e1dfe36a18cd6fe05ac42aae1ea6dddc9978ce

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-rc1.tar.gz>

      SIZE:   14098505 bytes
      SHA1:   6b242f9ec7b908c9aa26e497440684ba06d86927
      SHA256: e41ada7650eed2a5800534d1201ba7c88f1627085659df994f47ab4c5e327745
      SHA512: 26d3c60483ce2d6eaabd7077085102fad6633f18cf5d772bacf6f563670030cb7bba22d54d8b7dfa5eac8b52990371c4a6ad1c095dff6f6b3a7bbe1a8ffb3754

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-rc1.tar.xz>

      SIZE:   9930088 bytes
      SHA1:   7c404e8bec9859f708927f7203d4f42187e678b7
      SHA256: 3f014b3186d10676da6c512d14c65db23ccc4bf200fed9d7c6f9a58fd1e3295b
      SHA512: 22e209e28da1f2394f50c0a7dd5d0d4d4c0c5a6b5b0b02260fad0267a0940b98f0e2b0f36a44f87d1612555cb3022f43cd136a5186c7f87650aa20264408d415

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-rc1.zip>

      SIZE:   15785968 bytes
      SHA1:   7d82386434ccbb1701f2995286bf29c8b9179e01
      SHA256: 14e6910e36618cddffeb22bad5f1052f907dc31ec93d4aa945bca0905d8a52c4
      SHA512: 5dd89320d429e5bd5faf3709be7e5b70f7355304d6324d7ac13a69187e5f1446ad5988c8186bc33f4fea8934288294f9d16fea173f39b2b39967746c4b03d1d4

## Veröffentlichungskommentar

Siehe auch den Veröffentlichungsplan und andere Informationen:

[ReleaseEngineering24](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering24)
