---
layout: news_post
title: "Ruby 2.4.0-preview2 veröffentlicht"
author: "naruse"
translator: "Marvin Gülker"
date: 2016-09-08 09:00:00 +0000
lang: de
---

Wir freuen uns, die Veröffentlichung von Ruby 2.4.0-preview2
bekanntgeben zu können.

Ruby 2.4.0-preview2 ist die zweite Vorschau auf Ruby 2.4.0 und wird
in der Absicht veröffentlicht, Meinungen und Feedback durch die
Community einzuholen. Wir möchten Sie daher ermutigen, [uns Rückmeldung zu geben](https://github.com/ruby/ruby/wiki/How-To-Report),
wodurch Sie noch Einfluss auf die weitere Entwicklung nehmen können.

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

Versuchen Sie Ruby 2.4.0-preview1, haben Sie Spaß daran und [geben Sie Rückmeldung](https://github.com/ruby/ruby/wiki/How-To-Report)!

## Sonstige wesentliche Änderungen seit 2.3

* Unterstützung von OpenSSL 1.1.0
* ext/tk wurde aus der stdlib entfernt [Feature #8539](https://bugs.ruby-lang.org/issues/8539)

Siehe die [NEWS](https://github.com/ruby/ruby/blob/v2_4_0_preview2/NEWS)
und das [ChangeLog](https://github.com/ruby/ruby/blob/v2_4_0_preview2/ChangeLog)
für weitere Informationen.

Mit diesen Änderungen wurden seit Ruby 2.3.0
[2353 Dateien geändert, 289057 Einfügungen(+), 73847 Löschungen(-)](https://github.com/ruby/ruby/compare/v2_3_0...v2_4_0_preview2)!

## Download

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview2.tar.bz2>

  * SIZE:   12463225 bytes
  * SHA1:   95a501624f1cf4bb0785d3e17afd0ad099f66385
  * SHA256: 2224c55b2d87b5c0f08d23a4618e870027dbc1cffbfb4a05efd19eac4ff4cf1d
  * SHA512: 0c9a59a2f57a99c4ee8539a30f41da1de7547566203f89d856e1be9dbb44365754e6c470145dc9336eb324e0feb2f53d9fef18a1564968ac21f9ee528905949f

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview2.tar.gz>

  * SIZE:   15586514 bytes
  * SHA1:   492a13c4ddc1c0c218433acb00dcf7ddeef96fe0
  * SHA256: fec544836428aada2dc593a8cc42ce330798a805e49ecb807a0e21b386fd0b14
  * SHA512: 5a3de852a7611e79f38219ed7bb13772aaabb25538ca843d38743180a0cc939a4e34c008b61d578da785285196b6b8882270bddc17cbed481237db8afa4c54e4

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview2.tar.xz>

  * SIZE:   9886832 bytes
  * SHA1:   95d5fd7d54d86497194f69ec433755a517dcde8f
  * SHA256: 6c2d25bedc50c2f19b0e349f0ffd9b9a83000d9cb6a677bf5372fb493d33e16a
  * SHA512: b9bd898d17583103ee61b4764ac86eb62c9661fca1f41ff0d06a15965a0a1ba581491d4b8a342e527d63e102b6ddcb2acebdabe5b246409ce9711e13f9428d5b

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview2.zip>

  * SIZE:   17401564 bytes
  * SHA1:   5f3a5b2fd03f70d49e74ec36be3e0c110f6c17cc
  * SHA256: 4d0e466148283ad52208b1e1b70b018aefb7fa95b490fc862d5ea4ca284ecdd2
  * SHA512: 0ef2098d995238580245a4bcee843641199c1194189be13614611e2ffec329278072319a799d409eaf13b1cff45f05a0eae02d9ea8ccc69058fa49e03eca0130

## Veröffentlichungskomentar

Siehe den Veröffentlichungsplan und andere Informationen:

[ReleaseEngineering24](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering24)
