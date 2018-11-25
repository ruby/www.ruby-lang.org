---
layout: news_post
title: "Ruby 2.6.0-preview1 veröffentlicht"
author: "naruse"
translator: "Marvin Gülker"
date: 2018-02-24 00:00:00 +0000
lang: de
---

Wir freuen uns, die Veröffentlichung von Ruby 2.6.0-preview1
bekanntgeben zu können.

Ruby 2.6.0-preview1 ist die erste Vorschau auf Ruby 2.6.0. Sie wird
dieses Mal besonders früh veröffentlicht, weil sie ein besonders
wichtiges neues Feature enthält: den JIT.

## JIT

Ruby 2.6 führt erstmals einen JIT-Compiler _(Just in Time Compiler)_ ein.

Der JIT-Compiler soll die allgemeine Performanz aller Ruby-Programme
verbessern. Rubys JIT-Compiler arbeitet anders als herkömmliche
JIT-Compiler für andere Programmiersprachen, denn er schreibt C-Code
auf die Festplatte und startet dann einen gewöhnlichen
C-Compiler-Prozess, um Maschinencode zu erzeugen. Siehe dazu auch:
[Die Funktionsweise von MJIT von Wladimir Makarow](https://github.com/vnmakarov/ruby/tree/rtl_mjit_branch#mjit-organization).

Um den JIT zu benutzen, geben Sie `--jit` als Kommandozeilenoption
oder in der Umgebungsvariablen `$RUBYOPT` an. Bei Angabe von
`--jit-verbose=1` werden Informationen über die laufende
JIT-Kompilation ausgegeben. Siehe auch `ruby --help` für weitere
Optionen.

Diese Veröffentlichung soll Ihnen Gelegenheit geben, zu überprüfen, ob
der JIT auf Ihrer Plattform funktioniert. Außerdem soll eine Prüfung
auf Sicherheitsprobleme noch vor der Freigabe von 2.6 ermöglicht
werden. Der JIT-Compiler wird derzeit nur unterstützt, wenn Ruby mit
GCC oder Clang gebaut wird und der Compiler auch während des
Programmablaufs verfügbar ist. Ansonsten können Sie ihn momentan leider
nicht verwenden.

Zum jetzigen Zeitpunkt (2.6.0-preview1) bereiten wir lediglich die
Infrastruktur für den JIT vor und es wurden nur wenige Optimierungen
eingebaut. Zwar kann man in Mikro-Benchmarks einige potenzielle
Verbesserungen feststellen, jedoch ist diese Veröffentlichung absolut
ungeeignet, um die finale Performanz von Rubys JIT-Compiler zu
bestimmen. Dies gilt insbesondere für umfangreiche Programme wie
Rails-Anwendungen.

Wir erwarten, dass durch die geplante Aufnahme von Methoden-Inlining
in den JIT-Compiler Rubys Performanz erheblich verbessert wird.

Im Übrigen planen wir, mehr Plattformen zu unterstützen. Nächstes Ziel
in dieser Hinsicht ist die Unterstützung von Visual Studio.

Machen Sie sich bereit für eine neue Ära von Rubys Performanz.

## Neue Features

* `Random.bytes` hinzugefügt [Feature #4938]
* `Binding#source_location` hinzugefügt  [Feature #14230]

  Diese Methode gibt ein 2-Element-Array mit den Bestandteilen
  `__FILE__` und `__LINE__` zurück, die beschreiben, an welcher Stelle
  im Quelltext ein Binding definiert wurde. Dieselbe Information
  konnte bisher über `eval("[__FILE__, __LINE__]", binding)`
  ermittelt werden, allerdings planen wir, dieses Verhalten so zu
  ändern, dass `Kernel#eval` den Definitionsort eines `binding`
  ignoriert [Bug #4352]. Nutzern wird deshalb empfohlen, auf diese neu
  eingeführte Methode umzusteigen.

* Option `:exception` zu `Kernel.#system` hinzugefügt. Diese Option
  führt dazu, dass #system statt `false` zurückzugeben einen Fehler
  verursacht [Feature #14386].

## Performanzverbesserungen

* `Proc#call` beschleunigt, weil wir uns nicht mehr um `$SAFE` kümmern
  müssen. [Feature #14318]

  Mithilfe des `lc_fizzbuzz`-Benchmarks, das sehr häufig `Proc#call`
  benutzt, haben wir eine 1,4-fache Beschleunigung gemessen. [Bug #10212]

* `block.call` beschleunigt, wenn `block` als Block-Parameter
  übergeben wird. [Feature #14330]

  Bereits Ruby 2.5 verbessert die Performanz bei der Übergabe von
  Blöcken. [Feature #14045]
  Mit Ruby 2.6 wird auch der Aufruf von übergebenen Blöcken
  beschleunigt, sodass wir im Mikro-Benchmark eine 2,6-fache
  Beschleunigung messen konnten.

## Sonstige bemerkenswerte Änderungen seit 2.5

* `$SAFE` ist ein prozess-globaler Zustand und kann wieder auf `0` gesetzt
  werden. [Feature #14250]

* Die Übergabe von `safe_level` an `ERB.new` ist als veraltet
  markiert worden. Die Parameter `trim_mode` und `eoutvar` wurden in
  Schlüsselwortargumente umgesetzt. [Feature #14256]

* RubyGems 2.7.6 aufgenommen.

Siehe die [NEWS](https://github.com/ruby/ruby/blob/v2_6_0_preview1/NEWS)
oder die [Commit-Logs](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_preview1)
für weitere Details.

Mit diesen Änderungen wurden
[1115 Dateien geändert, 23023 Einfügungen(+), 14748 Löschungen(-)](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_preview1)
seit Ruby 2.5.0!

Am heutigen 24. Februar ist Rubys 25. Geburtstag.
Herzlichen Glückwunsch Ruby, und viel Spaß mit der Programmierung mit
Ruby 2.6.0-preview1!

## Download

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview1.tar.gz>

      SIZE:   16082501 bytes
      SHA1:   94b4a2f5f992dc9855364284e9c64316bf129c90
      SHA256: 2023c42676d9237481e1a97157d5e2ecc10db5e320d5b9cf872ec1d293265d61
      SHA512: 004696c4f087333ba7cb2285418dcce70f399966ae8fed817aab9759fd2d75beb088c4aeb294fcd4260112e8422f490cd4dbdfce402d73f96bb679b8bb3e1607

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview1.zip>

      SIZE:   19807007 bytes
      SHA1:   24d76f67bf913348eca783a2ecf6f3faf37299ae
      SHA256: 6c883927e80430cf07f2d90728d6c2c71164223f378a48ebf964d3b66319f623
      SHA512: 1e7f318cec1b7875fd9891df671078de7585b556695a2a85708483ddcacfd6e0b63b70ec2535e92ff981b4f72063721ed552df49688e066666fcd7ae520ae667

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview1.tar.bz2>

      SIZE:   14104578 bytes
      SHA1:   9f0fb79643a4673a839b0c8496eccc6e1dbd022d
      SHA256: 8bd6c373df6ee009441270a8b4f86413d101b8f88e8051c55ef62abffadce462
      SHA512: d9cb270529a97670d54f43a0236fab072714e715c39277dab70b7a1843ec818e6700e47e1384c7256f9e0ae41ab2c0b768a0de38a5ecf4f4fff5da6ef5ad4944

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview1.tar.xz>

      SIZE:   11423984 bytes
      SHA1:   bbbc89d760cdaadbca3cbff587295864edeff0af
      SHA256: 1d99139116e4e245ce543edb137b2a8873c26e9f0bde88d8cee6789617cc8d0e
      SHA512: d12ff29778d8d940344619881b4d8247c2fb6b44ac2b2dbddb7078828e893cfac9a5a95b5588f0afdbed52bdb6dea95cff1b9ce3ad47dfa62209e97dab8810b6
