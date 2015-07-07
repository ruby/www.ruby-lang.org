---
layout: news_post
title: "Ruby 2.2.0 veröffentlicht"
author: "naruse"
translator: "Marcus Stollsteimer"
date: 2014-12-25 09:00:00 +0000
lang: de
---

Wir freuen uns, die Veröffentlichung von Ruby 2.2.0 bekannt geben zu können.

Ruby 2.2 enthält viele neue Features und Verbesserungen, um den wachsenden
und zunehmend unterschiedlichen Anforderungen an Ruby gerecht werden
zu können.

Zum Beispiel kann Rubys Garbage Collector nun auch Objekte der Klasse Symbol
entfernen, wodurch der Speicherbedarf im Vergleich zu Versionen vor 2.2
reduziert wird.
Rails 5.0 wird die Speicherbereinigung von Symbol-Objekten voraussetzen,
weshalb es nur Ruby 2.2 oder später unterstützen wird.
(Siehe den [Artikel zur Veröffentlichung von Rails 4.2](http://weblog.rubyonrails.org/2014/12/19/Rails-4-2-final/) für Details.)

Darüber hinaus werden durch die neu eingeführte inkrementelle
Speicherbereinigung (Incremental GC) die Unterbrechungszeiten verringert,
was sich ebenfalls vorteilhaft auf Rails-Anwendungen auswirken wird.
Neuere Entwicklungen, die im
[Rails-Blog](http://weblog.rubyonrails.org/)
erwähnt worden sind, deuten an, dass Rails 5.0 neben der Speicherbereinigung
von Symbolen auch die inkrementelle Speicherbereinigung nutzen wird.

Ein weiteres Feature mit Bezug zur Speicherverwaltung ist eine zusätzliche
Option für `configure.in` um jemalloc zu aktivieren
[Feature #9113](https://bugs.ruby-lang.org/issues/9113).
Dieses Feature ist noch experimentell und derzeit standardmäßig nicht
aktiviert, solange wir noch nicht genügend Daten zu Performance und
möglichen Anwendungsfällen haben. Sobald wir vom Nutzen dieses Features
überzeugt sind, werden wir es standardmäßig aktivieren.

Des Weiteren wurde experimentelle Unterstützung der Nutzung von vfork(2)
mit system() und spawn() hinzugefügt. Näheres kann in
[tanaka-san's Blog (Japanisch)](http://www.a-k-r.org/d/2014-09.html#a2014_09_06)
nachgelesen werden.
Dies könnte möglicherweise große Geschwindigkeitssteigerungen bewirken,
wenn ein großer Prozess vielfach externe Befehle ausführt.
Jedoch ist vfork(2) noch nicht gut verstanden und ein potenziell gefährlicher
Systemaufruf. Wir möchten gerne ausloten, welchen Nutzen dieses Feature
bringen kann, indem wir Performance-Daten und Anwendungsfälle sammeln.

Wir wünschen viel Freude beim Programmieren mit Ruby 2.2.0;
probiert es aus und berichtet uns von Euren Erfahrungen!

## Wesentliche Änderungen seit Ruby 2.1

* [Incremental GC](https://bugs.ruby-lang.org/issues/10137)
  ([Präsentation bei der RubyConf 2014: "Incremental GC for Ruby interpreter"](http://www.atdot.net/~ko1/activities/2014_rubyconf_pub.pdf))
* [Symbol GC](https://bugs.ruby-lang.org/issues/9634)
  ([Präsentation bei der RubyKaigi 2014](http://www.slideshare.net/authorNari/symbol-gc))
* configure --with-jemalloc
  [Feature #9113](https://bugs.ruby-lang.org/issues/9113)
* Kernbibliotheken:
  * Unterstützung von Unicode 7.0 [#9092](https://bugs.ruby-lang.org/issues/9092)
  * Neue Methoden:
    * Enumerable#slice_after [#9071](https://bugs.ruby-lang.org/issues/9071),
      Enumerable#slice_when [#9826](https://bugs.ruby-lang.org/issues/9826)
    * Float#next_float, Float#prev_float
      [#9834](https://bugs.ruby-lang.org/issues/9834)
    * File.birthtime, File#birthtime
      [#9647](https://bugs.ruby-lang.org/issues/9647)
    * String#unicode_normalize [#10084](https://bugs.ruby-lang.org/issues/10084)
* Mitgelieferte Bibliotheken:
  * Aktualisiert: Psych 2.0.8
  * Aktualisiert: Rake 10.4.2
  * Aktualisiert: RDoc 4.2.0
  * Aktualisiert: RubyGems 2.4.5
  * Aktualisiert: test-unit 3.0.8 (aus dem Repository entfernt, aber im Tarball enthalten)
  * Aktualisiert: minitest 5.4.3 (aus dem Repository entfernt, aber im Tarball enthalten)
  * Als veraltet markiert: mathn
* C-API
  * Veraltete APIs entfernt

Siehe die [NEWS im Ruby-Repository](https://github.com/ruby/ruby/blob/v2_2_0/NEWS)
für Details.

Damit folgen seit Version 2.1.0: 1557 geänderte Dateien, 125039 Einfügungen(+), 74376 Löschungen(-)!

## Download

* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0.tar.bz2>
  * SIZE:   13304042 bytes
  * MD5:    d03cd4690fec1fff81d096d1c1255fde
  * SHA256: 1c031137999f832f86be366a71155113675b72420830ce432b777a0ff4942955
  * SHA512: 04edc53e8cd1732c3ca61ebeb1d6133614beb10f77f9abb80d8d36352fe8aa205112068e460bf600b2c7e81e0ddcc3b311e7e027c320366f1bd992b3e378a6ad
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0.tar.gz>
  * SIZE:   16494584 bytes
  * MD5:    cd03b28fd0b555970f5c4fd481700852
  * SHA256: 7671e394abfb5d262fbcd3b27a71bf78737c7e9347fa21c39e58b0bb9c4840fc
  * SHA512: 1ba0c68e1c8d2b60bbd1e218cf36463edbe34cf9418d7593702b631e68d02297465f752e71395f6cfa4104f4cd70a1eb44381ffb74bc7801758b830931fdcfc6
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0.tar.xz>
  * SIZE:   10304244 bytes
  * MD5:    54b43c6c6c9dd4c4b08ceb03ad0ded7a
  * SHA256: 848714e280fc5fb44dbac3b060b206e56c1947006324ee68a174d68b483ef8ca
  * SHA512: cd7e52faa464df8aca7ccfa23a5f06248e1ad82bc8c9f1829aa1b51ff37b15973b8caaa68e914d837325b8d59427fda4f3cad82c50925e1c84e688324a2a155d
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0.zip>
  * SIZE:   18441027 bytes
  * MD5:    f8e1d0cee4f2d9535a9529ed23ae3700
  * SHA256: e06c1e2b1248cf881749833084b2bec93f7612676009190ff9bc89b8fd07c29f
  * SHA512: 364dd927b496520d95a1b06c68e1a265015f4cab08bdf3efaa323d385e7bf075eae47f2e1db78a629db0f3c0c1ed24e086603ba21e2da02ac06dd3c8b716766e
