---
layout: news_post
title: "Ruby 2.5.0-rc1 veröffentlicht"
author: "naruse"
translator: "Marvin Gülker"
date: 2017-12-14 00:00:00 +0000
lang: de
---

Wir freuen uns, die Freigabe von Ruby 2.5.0-rc1 ankündigen zu können.

Ruby 2.5.0-rc1 ist die erste Vorschau auf Ruby 2.5.0. Sie enthält
einige neue Features sowie Performanzverbesserungen, beispielsweise:

## Neue Features

* Das Backtrace und die Fehlermeldung werden in umgekehrter
  Reihenfolge ausgegeben, wenn STDERR nicht verändert wurde und auf
  einen TTY zeigt. [Feature #8661] [experimentell]

* Die Auflösung von Konstanten über die oberste Ebene wurde entfernt.
  [Feature #11547]

* rescue/else/ensure sind jetzt in do/end-Blöcken erlaubt. [Feature #12906]

* yield\_self [Feature #6721]

## Performanzverbesserungen

* Die dynamische Verwaltung von TracePoint-Hooks anstelle der Benutzung
  von „trace“ spart Zeit. [Feature #14104]

* Die Performanz bei der Übergabe von Blockparametern wurde durch die
  Einführung von verzögerter Allozierung der Proc-Instanzen
  _(lazy Proc allocation)_ verbessert. [Feature #14045]

* Mutex wurde neu geschrieben. Es ist jetzt kleiner und schneller.
  [Feature #13517]

* SecureRandom bezieht Zufallsdaten jetzt bevorzugt vom Betriebssystem statt
  von OpenSSL. [Bug #9569]

## Sonstige bemerkenswerte Änderungen seit 2.4

* Onigmo wurde auf 6.1.3 aktualisiert. Dies fügt einen neuen
  [Abwesenheitsoperator](https://github.com/k-takata/Onigmo/issues/87)
  hinzu. Beachten Sie, dass Ruby 2.4.1 diese Änderung ebenfalls
  enthält.
* Bundler wurde in die Standardbibliothek aufgenommen.
* RubyGems wurde auf 2.7.0 aktualisiert.
* RDoc wurde auf 6.0.0 aktualisiert.
  * Der Lexer basiert nun nicht mehr auf IRB, sondern auf Ripper,
    wodurch die Geschwindigkeit, mit der die Dokumentation generiert wird,
    erheblich zunimmt.
    [https://github.com/ruby/rdoc/pull/512]
  * Zahlreiche Korrekturen von Fehlern der letzten dutzend Jahre.
  * Unterstützung von neuer Ruby-Syntax aus den letzten Jahren.
* Unicode-Unterstützung auf Version 10.0.0 aktualisiert.

Siehe die
[NEWS](https://github.com/ruby/ruby/blob/v2_5_0_rc1/NEWS) oder
die Commit-Logs für weitere Informationen.

Mit diesen Änderungen wurden
[6162 Dateien geändert, 339744 Einfügungen(+), 28699 Löschungen(-)](https://github.com/ruby/ruby/compare/v2_4_0...v2_5_0_rc1)
seit Ruby 2.4.0!

Viel Spaß mit 2.5.0-rc1!

## Download

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0-rc1.tar.gz>

      SIZE:   31049529 bytes
      SHA1:   15df7e8ff99f360a14f7747a07a3021447d65594
      SHA256: 46c11b347522de174566503d35d2b46e1529b979d292b1f7f7019cfedcd4b07f
      SHA512: 41cd298e99d7a25fe5f2ec42946ae5dbc4421bb18f39350ba8a1b02e999541ec1b21b5f6ce0489b3a159f47e37d409178ba7c21c00e177b0fdb410ca6e9d6142

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0-rc1.zip>

      SIZE:   35579788 bytes
      SHA1:   b7ae42eb733d4a0e3a2d135c9f8d4af043daa728
      SHA256: 9858e39fd2e7bf207cc9f8846197b11ada5f4424f433ff4df149fe3d48be8e36
      SHA512: 86c93791d312fd2175909020e448a44892740feb809a532ed706c6d850cb92722fb7ca02ecbdf7a1fbeb5b4f42f1338ce9a15b7c0a41055937bd1fdfb4be6f11

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0-rc1.tar.bz2>

      SIZE:   29238901 bytes
      SHA1:   6aad74ed3d30de63c6ff22048cd0fcbcbe123586
      SHA256: 862a8e9e52432ba383660a23d3e87af11dbc18c863a19ef6367eb8259fc47c09
      SHA512: bf0eb114097f9e505ff846f25e7556a2fb393573b4e8b773f94cf5b47998e221f3962a291db15a3cdbdf4ced5a523812937f80d95f4ee3f7b13c4e37f178d7a7

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0-rc1.tar.xz>

      SIZE:   26096412 bytes
      SHA1:   05cacd0341b7a23cc68239c2061640643a30da38
      SHA256: a479a1bce69b2cf656821f10104dcb8b426922b56d3d6cbdf48318842fae752c
      SHA512: 9f9040abf69337439a3f31b80d440d97736555b0df6533d9d34c141ce52226bc40c3f4f7e596e74b080c879e933649c17a073c893be1a304d9a883bab02e9494
