---
layout: news_post
title: "Ruby 2.5.0 veröffentlicht"
author: "naruse"
translator: "Marvin Gülker"
date: 2017-12-25 00:00:00 +0000
lang: de
---

Wir freuen uns, die Veröffentlichung von Ruby 2.5.0 bekanntgeben zu
können.

Ruby 2.5.0 ist die erste stabile Veröffentlichung der 2.5er-Serie und
enthält viele neue Features sowie Performanzverbesserungen. Die
wichtigsten Änderungen sind:

## Neue Features

* `rescue`/`else`/`ensure` können direkt in `do`/`end`-Blöcken genutzt
  werden.
  [[Feature #12906]](https://bugs.ruby-lang.org/issues/12906)
* `yield_self` führt den übergebenen Block im umgebenden Kontext
  aus. Anders als `tap` gibt es aber das Ergebnis des Blocks zurück.
  [[Feature #6721]](https://bugs.ruby-lang.org/issues/6721)
* Unterstützung für Codeverzweigungs- und Methodenanalysen. Erstere
  geben an, welche logischen Zweige im Code ausgeführt werden und
  welche nicht. Letztere geben an, welche Methoden ausgeführt werden
  und welche nicht. Indem Sie eine Testsuite mit diesen neuen Features
  ausführen, können Sie feststellen, welche Codezweige und Methoden
  ausgeführt werden und können so die Testabdeckung Ihres Programms besser
  überblicken.
  [[Feature #13901]](https://bugs.ruby-lang.org/issues/13901)
* Hash#slice [[Feature #8499]](https://bugs.ruby-lang.org/issues/8499)
  und Hash#transform_keys [[Feature #13583]](https://bugs.ruby-lang.org/issues/13583)
  hinzugefügt.
* Struct.new kann nun Klassen erzeugen, die mit
  Schlüsselwortargumenten _(keyword arguments)_ umgehen können.
  [[Feature #11925]](https://bugs.ruby-lang.org/issues/11925)
* Enumerable#any?, all?, none? und one? können jetzt Musterabgleiche
  gegen ihr Argument vornehmen.
  [[Feature #11286]](https://bugs.ruby-lang.org/issues/11286)
* Die Auflösung von Konstanten über die oberste Ebene wurde entfernt.
  [[Feature #11547]](https://bugs.ruby-lang.org/issues/11547)
* Eine der beliebtesten Bibliotheken, pp.rb, wird nunmehr automatisch
  geladen. Sie müssen nicht länger `require "pp"` schreiben.
  [[Feature #14123]](https://bugs.ruby-lang.org/issues/14123)
* Backtrace und Fehlermeldung werden nunmehr in umgekehrter
  Reihenfolge (ältester Aufruf zuerst, neuester Aufruf zuletzt)
  ausgegeben. Wenn ein langes Backtrace auf einem Terminal (TTY)
  auftaucht, können Sie den Grund daher jetzt einfach am Ende des
  Backtraces finden. Beachten Sie, dass die Reihenfolge nur dann
  umgekehrt wird, wenn das Backtrace direkt auf einem Terminal
  ausgegeben wird.
  [[Feature #8661]](https://bugs.ruby-lang.org/issues/8661) [experimentell]

## Performanzverbesserungen

* Zwischen 5 und 10 % Performanzverbesserung durch die Entfernung
  sämtlicher `trace`-Befehle aus dem Bytecode
  _(instruction sequences)_.
  Der `trace`-Befehl wurde ursprünglich hinzugefügt, um die
  `TracePoint`-API zu unterstützen, welche jedoch praktisch kaum benutzt
  wurde. Es handelte sich somit um unnötigen Ballast. Stattdessen
  verwenden wir jetzt eine dynamische Technik.
  Siehe [[Feature #14104]](https://bugs.ruby-lang.org/issues/14104)
  für weitere Details.
* Die Übergabe von Blöcken mithilfe eines Blockparameters
  (z.B. `def foo(&b); bar(&b); end`) ist dank der neuen verzögerten
  Allozierung der Proc-Instanzen _(lazy proc allocation)_ etwa
  dreimal so schnell wie unter Ruby 2.4.
  [[Feature #14045]](https://bugs.ruby-lang.org/issues/14045)
* Mutex wurde neu geschrieben. Es ist jetzt kleiner und schneller.
  [[Feature #13517]](https://bugs.ruby-lang.org/issues/13517)
* ERB generiert Quelltext aus einer Vorlage jetzt doppelt so schnell
  wie unter Ruby 2.4.
* Die Performanz einiger eingebauter Methoden wie u.a. `Array#concat`,
  `Enumerable#sort_by`, `String#concat`, `String#index`, `Time#+` und
  einigen mehr wurde verbessert.
* IO.copy_stream benutzt jetzt copy_file_range(2).
  [[Feature #13867]](https://bugs.ruby-lang.org/issues/13867)

## Sonstige bemerkenswerte Änderungen seit 2.4

* SecureRandom bezieht Zufallsdaten jetzt bevorzugt vom Betriebssystem statt
  von OpenSSL.
  [[Bug #9569]](https://bugs.ruby-lang.org/issues/9569)
* cmath, csv, date, dbm, etc, fcntl, fiddle, fileutils, gdbm, ipaddr,
  scanf, sdbm, stringio, strscan, webrick, zlib wurden von der
  Standardbibliothek in Standard-Gems verschoben.
* [Onigmo](https://github.com/k-takata/Onigmo/) wurde auf 6.1.3 aktualisiert.
  * Dies fügt einen neuen [Abwesenheitsoperator](https://github.com/k-takata/Onigmo/issues/87) hinzu.
  * Beachten Sie, dass [Ruby 2.4.1](https://www.ruby-lang.org/de/news/2017/03/22/ruby-2-4-1-released/) diese Änderung ebenfalls enthält.
* Psych auf 3.0.2 aktualisiert.
* RubyGems auf 2.7.3 aktualisiert.
* RDoc auf 6.0.1 aktualisiert.
  * Der Lexer basiert nun [nicht mehr auf IRB, sondern auf Ripper](https://github.com/ruby/rdoc/pull/512),
    wodurch die Geschwindigkeit, mit der die Dokumentation generiert
    wird, erheblich zunimmt.
  * Zahlreiche Fehler, die seit über zehn Jahren bekannt waren, wurden
    behoben.
  * Unterstützung von neuer Ruby-Syntax der neuesten Versionen.
* Die unterstützte Unicode-Version ist jetzt 10.0.0.
* `Thread.report_on_exception` steht jetzt standardmäßig auf true. Das
  hilft beim Debugging von Programmem mit mehreren Threads.
  [[Feature #14143]](https://bugs.ruby-lang.org/issues/14143)
* IO#write akzeptiert jetzt mehrere Argumente.
  [[Feature #9323]](https://bugs.ruby-lang.org/issues/9323)

Siehe die [NEWS](https://github.com/ruby/ruby/blob/v2_5_0/NEWS)
oder die [Commit-Logs](https://github.com/ruby/ruby/compare/v2_4_0...v2_5_0)
für weitere Informationen.

Mit diesen Änderungen wurden
[6158 Dateien geändert, 348484 Einfügungen(+), 82747 Löschungen(-)](https://github.com/ruby/ruby/compare/v2_4_0...v2_5_0)
seit Ruby 2.4.0!

Frohe Weihnachten, schöne Feiertage und viel Spaß bei der
Programmierung mit Ruby 2.5!

## Download

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0.tar.gz>

      SIZE:   15834941 bytes
      SHA1:   58f77301c891c1c4a08f301861c26b1ea46509f6
      SHA256: 46e6f3630f1888eb653b15fa811d77b5b1df6fd7a3af436b343cfe4f4503f2ab
      SHA512: 0712fe68611f5d0cd6dd54b814f825478e64b6a62bdf67bce431f4dca2dc00b1a33f77bebfbcd0a151118a1152554ab457decde435b424aa1f004bc0aa40580d

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0.zip>

      SIZE:   19495617 bytes
      SHA1:   700b6f55d689a5c8051c8c292b9e77a1b50bf96e
      SHA256: 94559ea6e3c619423da604e503ce1dc1c465d6e0747a07fbdc5f294acaf14c24
      SHA512: e4324064cee8c65b80192e3eff287e915d2d40464d300744c36fb326ae4b1846911400a99d4332192d8a217009d3a5209b43eb5e8bc0b739035bef89cc493e84

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0.tar.bz2>

      SIZE:   13955820 bytes
      SHA1:   827b9a3bcffa86d1fc9ed96d403cb9dc37731688
      SHA256: d87eb3021f71d4f62e5a5329628ac9a6665902173296e551667edd94362325cc
      SHA512: 8f6fdf6708e7470f55bc009db2567cd8d4e633ad0678d83a015441ecf5b5d88bd7da8fb8533a42157ff83b74d00b6dc617d39bbb17fc2c6c12287a1d8eaa0f2c

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0.tar.xz>

      SIZE:   11292472 bytes
      SHA1:   9c7babcf9e299be3f197d9091024ae458f1a1273
      SHA256: 1da0afed833a0dab94075221a615c14487b05d0c407f991c8080d576d985b49b
      SHA512: 55714a33d7661fe8b432f73c34fd67b49699f8b79df1cbd680a74899124d31111ab0f444677672aac1ba725820182940d485efb2db0bf2bc96737c5d40c54578
