---
layout: news_post
title: "Ruby 2.5.0-preview1 veröffentlicht"
author: "naruse"
translator: "Marvin Gülker"
date: 2017-10-10 00:00:00 +0000
lang: de
---

Wir freuen uns, die Veröffentlichung von Ruby 2.5.0-preview1
ankündigen zu können.

Ruby 2.5.0-preview1 ist die erste Vorschau auf Ruby 2.5.0. Sie enthält
einige neue Features sowie Performanzverbesserungen, beispielsweise:

## Neue Features

* Das Backtrace und die Fehlermeldung werden in umgekehrter
  Reihenfolge ausgegeben, wenn STDERR nicht verändert wurde und auf
  einen TTY zeigt. [Feature #8661] [experimental]

* Die Auflösung von Konstanten über die oberste Ebene wurde entfernt [Feature #11547]

* rescue/else/ensure sind jetzt in do/end-Blöcken erlaubt [Feature #12906]

* yield\_self [Feature #6721]

## Sonstige bemerkenswerte Änderungen seit 2.4

* Onigmo wurde auf 6.1.1 aktualisiert. Dies fügt einen neuen
  [Abwesenheitsoperator](https://github.com/k-takata/Onigmo/issues/87)
  hinzu. Beachten Sie, dass Ruby 2.4.1 diese Änderung ebenfalls
  enthält.
* bundler wurde in die Standardbibliothek aufgenommen.
* RubyGems wurde auf 2.6.13 aktualisiert.
* RDoc wurde auf 6.0.0.beta2 aktualisiert. Der Lexer basiert nun nicht
  mehr auf IRB, sondern auf Ripper, wodurch die Geschwindigkeit, mit
  der die Dokumentation generiert wird, erheblich zunimmt.
  https://github.com/ruby/rdoc/pull/512
  Desweiteren enthalten sind:
  * Zahlreiche Korrekturen von Fehlern der letzten dutzend Jahre
  * Unterstützung von neuer Ruby-Syntax aus den letzten Jahren
* Unicode-Unterstützung auf Version 10.0.0 aktualisiert.

Siehe die
[NEWS](https://github.com/ruby/ruby/blob/v2_5_0_preview1/NEWS) oder
die Commit-Logs für weitere Informationen.

Mit diesen Änderungen wurden
[6162 Dateien geändert, 339744 Einfügungen(+), 28699 Löschungen(-)](https://github.com/ruby/ruby/compare/v2_4_0...v2_5_0_preview1)
seit Ruby 2.4.0!

Viel Spaß mit Ruby 2.5.0-preview1!

## Download

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0-preview1.tar.gz>

      SIZE:   16088348 bytes
      SHA1:   8d1bad4faea258ac7f97ae2b4c7d76335b044c37
      SHA256: 30994fe5efbf4759a2a616f288121857c69b45665926174680387e286bb83b05
      SHA512: bcca05333e0aa09c75492ec09e4a82bf7aebef1b96e1c40000b92fa654fd96ae1d70e4f92ecf619b199cba73d754be6c6d97fc488d1e47831bc671f64ce0ab6d

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0-preview1.zip>

      SIZE:   20036401 bytes
      SHA1:   e1ad073a17dc814fc8ddb3cbbed761a2278dcc12
      SHA256: 1a61196a845cb9d9b5a71fd66cb77fbc215f82cb6f90371e309ceddb25e7107b
      SHA512: 35033b5426142e271d95d438b8442e73cade9462b02014371866882a4a90911b98805b7199b15bedc9847fd2560e211f015fa09b0b1d9efc31a947e41e088b30

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0-preview1.tar.bz2>

      SIZE:   14110768 bytes
      SHA1:   0b664c41b75d54ff88c70b5437b20b90675e3348
      SHA256: 1158e0eac184a1d8189fae985f58c9be185d6e7074b022e66567aec798fa3446
      SHA512: 2d39ef64aaf7a52014905f4ad59b53e83b71433e50a9227f9f50cbb7a2c9a5db9cd69fa7dbe01234819f7edd2216b3d915f21676f07d12bb5f0f3276358bce7f

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0-preview1.tar.xz>

      SIZE:   11383812 bytes
      SHA1:   eef2901270c235a97d132ebcfb275f130ba368fd
      SHA256: c2f518eb04b38bdd562ba5611abd2521248a1608fc466368563dd794ddeddd09
      SHA512: 1153a1fc4eb1a9556af2d392743998eb9cffd2a07e4648bf124dea1044bb378c7f4534dd87c0d30563ec438d2995ba1832faaaf4261db5d0840ca32ae7ea65d9
