---
layout: news_post
title: "Ruby 1.9.1-p376 veröffentlicht"
author: "Quintus"
lang: de
---

Ruby 1.9.1-p376 ist veröffentlicht worden. Es handelt sich hierbei um
ein Patchlevel-Release der 1.9er Reihe und behebt eine [schwerwiegende
Sicherheitslücke in der String-Klasse][1] (die 1.8er-Reihe ist nicht
betroffen). Daher sei es jedem empfohlen, auf die neue Version zu
updaten.

#### Weitere Fixes

Insgesamt sind mehr als 100 Bugfixes gemacht worden.

* Einige irb-Extrabefehle wurden berichtigt.
* Ripper konnte einige Ruby-Klassen nicht parsen. Dies wurde berichtigt.
* Einige Build-Fehler von AIX wurden gefixt.
* Einige Bugs in Matrix wurden berichtigt.
* Gems, welche im Home-Verzeichnis eines Benutzers installiert wurden,
  werden jetzt korrekt geladen.
* Einige Methoden gaben einen falsch kodierten String zurück. Dies wurde
  berichtigt.

Alle Änderungen sind im [ChangeLog][2] aufgelistet.

#### Download

* * [ruby-1.9.1-p376.tar.bz2][3]
  * Größe: 7.293.106 Byte
  * MD5-Summe: e019ae9c643c5efe91be49e29781fb94
  * SHA256: 79164e647e23bb7c705195e0075ce6020c30dd5ec4f8c8a12a100fe0eb0d6783

* * [ruby-1.9.1-p376.tar.gz][4]
  * Größe: 9.073.007 Byte
  * MD5-Summe: ebb20550a11e7f1a2fbd6fdec2a3e0a3
  * SHA256: 58b8fc1645283fcf3d5be195dffcaf55b7c85cbc210074273b57b835409b21ca

* * [ruby-1.9.1-p376.zip][5]
  * Größe: 10.337.871 Byte
  * MD5-Summe: d4d5e62f65cb92a281f1569a7f25371b
  * SHA256: 486d3efdab269040ce7142964ba3a4e0d46f0a5b812136bcac7e5bafc726c14e



[1]: {{ site.url }}/de/news/2009/12/07/heap-overflow-in-string/
[2]: https://git.ruby-lang.org/ruby.git/plain/ChangeLog?id=refs/heads/ruby_1_9_1
[3]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p376.tar.bz2
[4]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p376.tar.gz
[5]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p376.zip
