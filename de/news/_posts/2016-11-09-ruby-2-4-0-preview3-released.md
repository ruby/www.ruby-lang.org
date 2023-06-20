---
layout: news_post
title: "Ruby 2.4.0-preview3 veröffentlicht"
author: "naruse"
translator: "Marvin Gülker"
date: 2016-11-09 09:00:00 +0000
lang: de
---

Wir freuen uns, die Veröffentlichung von Ruby 2.4.0-preview3
ankündigen zu können.

Ruby 2.4.0-preview3 ist die dritte Vorschau auf Ruby 2.4.0 und wird in
der Absicht veröffentlicht, Feedback von der Gemeinschaft zu
erhalten. Bitte
[geben Sie uns Rückmeldung](https://github.com/ruby/ruby/wiki/How-To-Report),
da Sie immer noch Einfluss auf die Features nehmen können.

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

Versuchen Sie Ruby 2.4.0-preview3, haben Sie Spaß daran und [geben Sie Rückmeldung](https://github.com/ruby/ruby/wiki/How-To-Report)!

## Sonstige wesentliche Änderungen seit 2.3

* Unterstützung von OpenSSL 1.1.0
* ext/tk wurde aus der stdlib entfernt [Feature #8539](https://bugs.ruby-lang.org/issues/8539)
* XMLRPC wurde aus der stdlib entfernt [Feature #12160](https://bugs.ruby-lang.org/issues/12160)

Siehe die [NEWS](https://github.com/ruby/ruby/blob/v2_4_0_preview3/NEWS)
und das [ChangeLog](https://github.com/ruby/ruby/blob/v2_4_0_preview3/ChangeLog)
für weitere Informationen.

Mit diesen Änderungen wurden seit Ruby 2.3.0
[2470 Dateien geändert, 283051 Einfügungen(+), 64902 Löschungen(-)](https://github.com/ruby/ruby/compare/v2_3_0...v2_4_0_preview3)!

## Download

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview3.tar.bz2>

      SIZE:   12615328 bytes
      SHA1:   fefe49f6a7d5b642936c324f3b05aaac827355db
      SHA256: 305a2b2c627990e54965393f6eb1c442eeddfa149128ccdd9f4334e2e00a2a52
      SHA512: 6602c65a7b1e3bc680acc48217108f4335e84fdd74a9cf06f2e2f9ad00a2fccacf9fa035a912bc9d5cc3f0c7a5e21475971dfac37b0364311ef3645f25c7ddf9

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview3.tar.gz>

      SIZE:   15758023 bytes
      SHA1:   f6a6ec9f7fedad0bf4efee2e42801cc963f60dca
      SHA256: c35fe752ccfabf69bf48e6aab5111c25a05938b428936f780638e2111934c9dd
      SHA512: 68556d5252b6813b4c8eeba32733e940207f80694b5c5d20e69bf01eb52929ed2466496b05a895a5ad4831d430695e17624eb35b728b2d4d7cf02df756ac48b4

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview3.tar.xz>

      SIZE:   9957596 bytes
      SHA1:   66592b1a52f985638d639e7c3dd6bdda4e0569d0
      SHA256: b14be2b5c80bff0d6894ae2b37afdb17a968413e70236ec860f3e2d670b4c317
      SHA512: 5be20f0b2609745790c2b22f2228e69a840f63c34a117a1f95fd5436af211f0a6db2758d513d3e095a2d97c53c80793579cb2a1e00e70cf72c487a88c4a40d33

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview3.zip>

      SIZE:   17579012 bytes
      SHA1:   15d08cff952da3844ae54887b7f74b12d47c9ee2
      SHA256: b95a8f67fb7d6e852db77c5660c8878c14d68eb72c5501dac164a7e640ecb06e
      SHA512: fa15e1b7ab0cab56c9a580e1b1e2fee250ee0b9c59546079675a1931a36e37131bd37d64033c75e05d8e9d9fcc33ce7850254d3acaca2136cf3bd08b070244f0

## Veröffentlichungskommentar

Siehe auch den Veröffentlichungsplan und andere Informationen:

[ReleaseEngineering24](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering24)
