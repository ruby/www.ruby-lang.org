---
layout: news_post
title: "Ruby 2.4.0-preview1 veröffentlicht"
author: "naruse"
translator: "Marvin Gülker"
date: 2016-06-20 09:00:00 +0000
lang: de
---

Wir freuen uns, die Veröffentlichung von Ruby 2.4.0-preview1 bekannt
geben zu können.

Ruby 2.4.0-preview1 ist die erste Vorschau auf Ruby 2.4.0 und sie
kommt früher als üblich, weil sie zahlreiche neue Features und
Verbesserungen enthält. Wenn Sie noch Einfluss auf die Zukunft nehmen
wollen, dann [geben Sie uns Rückmeldung](https://github.com/ruby/ruby/wiki/How-To-Report).

## [Zusammenführung von Fixnum und Bignum in Integer](https://bugs.ruby-lang.org/issues/12005)

Obwohl [ISO/IEC 30170:2012](http://www.iso.org/iso/iso_catalogue/catalogue_tc/catalogue_detail.htm?csnumber=59579)
keine näheren Bestimmungen über die Integer-Klasse trifft, führt CRuby
mit Fixnum und Bignum zwei sichtbare Subklassen von Integer. Mit Ruby
2.4 werden diese mit Integer vereinigt.

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
`report_on_exception` und über report-on-GC.

### [Deadlock-Erkennung für Threads zeigt Threads nun mit Backtrace und Abhängkeiten](https://bugs.ruby-lang.org/issues/8214)

Zwar besitzt Ruby eine Deadlock-Erkennung bezüglich wartender Threads,
aber ihre Meldungen enthalten nicht ausreichend Informationen für
sinnvolles Debugging.
Die Deadlock-Erkennung von Ruby 2.4 listet Threads nun mit ihrem
Backtrace und abhängigen Threads.

Versuchen Sie Ruby 2.4.0-preview1, haben Sie Spaß daran und [geben Sie
Rückmeldung](https://github.com/ruby/ruby/wiki/How-To-Report)!

## Wesentliche Änderungen seit 2.3

Siehe die [NEWS](https://github.com/ruby/ruby/blob/v2_4_0_preview1/NEWS)
und das [ChangeLog](https://github.com/ruby/ruby/blob/v2_4_0_preview1/ChangeLog)
für Details.

Mit diesen Änderungen wurden seit Ruby 2.3.0
[1140 Dateien geändert, 33126 Einfügungen(+), 50993 Löschungen(-)](https://github.com/ruby/ruby/compare/v2_3_0...v2_4_0_preview1)!

## Download

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview1.tar.bz2>

  * SIZE:   14108114 bytes
  * SHA1:   7dcc42548d0724d83b6589ab98f34282845d7bcd
  * SHA256: 17570f0b84215ca82252f10c167ee50bc075383c018420c6b2601ae1cade0649
  * SHA512: c9873e8686eb54dbde61d6e23cd5197beebccd6cb31fd12c82763ebe1fde17095d7514d9d93c2c82b238032c98691df5479dc2d666a8a590e0fc54450ec29cb5

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview1.tar.gz>

  * SIZE:   17605452 bytes
  * SHA1:   1003a1e57547d81f4bb979c0f40f242afc284cd5
  * SHA256: 80d02f49f40e7ce07b70bee7efda751b0595a349a017306e9fe8caad5da13e64
  * SHA512: 4b603ab4ff9ea7e8bb8053aa4b638839d534241466d7f0e4d5bca3f2ea416694c2ea391790f1ffdc07fa538918d27707621741eb0ddc7bd00eb9d7628622787a

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview1.tar.xz>

  * SIZE:   11155800 bytes
  * SHA1:   bc33085277266f5a09a143bf6817affcb77f8e7f
  * SHA256: 62942c7300727469fe3d2b43e5a5c772d4836cf624a1d644bdece2afaca472c8
  * SHA512: dfc2c6642d49fa95383817a6dc82c416b3218ddfdaf882d6d2e5a7da22d0a5ac142e516a57aa96214070f3c7551d275044233ac052c82d67189b01c39847aad4

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview1.zip>

  * SIZE:   19904781 bytes
  * SHA1:   25c16ee91bbcb0224f80e20d938f5c08832973f7
  * SHA256: fd588aea1558b1171f87a3dd342ee207b8995a2c0a8241d7aa15bcfa16036854
  * SHA512: f2fff35ff9157a4b31177b3d6b91bdaad04c22b3c626c3a5e5ec9a31b103f9607b31c909ef27880065cfdbcfa5d6901a6db89d22e0c645666d069c5b6dd1818b

## Veröffentlichungskommentar

Siehe den Veröffentlichungsplan und andere Informationen:

[ReleaseEngineering24](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering24)
