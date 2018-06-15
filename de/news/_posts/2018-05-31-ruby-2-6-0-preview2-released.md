---
layout: news_post
title: "Ruby 2.6.0-preview2 veröffentlicht"
author: "naruse"
translator: "Marvin Gülker"
date: 2018-05-31 00:00:00 +0000
lang: de
---

Wir freuen uns, die Veröffentlichung von Ruby 2.6.0-preview2
bekanntgeben zu können.

Ruby 2.6.0-preview2 ist die zweite Vorschau auf Ruby 2.6.0. Sie wird
früher als üblich veröffentlicht, weil sie mit dem JIT ein wichtiges
neues Feature enthält.

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

Zum jetzigen Zeitpunkt (2.6.0-preview2) bereiten wir lediglich die
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

## RubyVM::AST [Experimentell]

Ruby 2.6 führt das Modul `RubyVM::AST` ein.

Dieses Modul verfügt über die Methoden `parse`, die den als String
übergenen Ruby-Code verarbeitet und eine Liste von Knoten des ASTs
_(Abstract Syntax Tree)_ zurückgibt, und `parse_file`, die die
übergebene Ruby-Quelldatei auf ähnliche Weise verarbeitet und
ebenfalls AST-Knoten zurückgibt.

Weiterhin wird die ebenfalls experimentelle Klasse `RubyVM::AST::Node`
eingeführt. Mithilfe von `Node`-Objekten können die Positionsinformationen und
Angaben über Kindknoten ermittelt werden. Eine Kompatibilität der
Struktur von AST-Knoten kann derzeit nicht gewährleistet werden.

## Neue Featuers

* Neuer alias `then` für `Kernel#yield_self`. [[Feature #14594]](https://bugs.ruby-lang.org/issues/14594)

* `else` ohne `rescue` verursacht einen Syntaxfehler. [EXPERIMENTELL]

* Konstantennamen können auch mit Großbuchstaben außerhalb des
  ASCII-Zeichensatzes beginnen. [[Feature #13770]](https://bugs.ruby-lang.org/issues/13770)

* Endlos-Range [[Feature #12912]](https://bugs.ruby-lang.org/issues/12912)

  Es wird ein Endlos-Range `(1..)` eingeführt, der über kein Ende
  verfügt. Typische Anwendungsfälle sehen wie folgt aus:

      ary[1..]                          # identisch zu ary[1..-1] ohne magische -1
      (1..).each {|index| ... }         # Endlosschleife ab Index 1
      ary.zip(1..) {|elem, index| ... } # ary.each.with_index(1) { ... }

* `Binding#source_location` hinzugefügt.  [[Feature #14230]](https://bugs.ruby-lang.org/issues/14230)

  Diese Methode gibt ein 2-Element-Array mit den Bestandteilen
  `__FILE__` und `__LINE__` zurück, die beschreiben, an welcher Stelle
  im Quelltext ein Binding definiert wurde. Dieselbe Information
  konnte bisher über `eval("[__FILE__, __LINE__]", binding)` ermittelt
  werden, allerdings planen wir, dieses Verhalten so zu ändern, dass
  `Kernel#eval` den Definitionsort eines `binding` ignoriert [[Bug
  #4352]](https://bugs.ruby-lang.org/issues/4352). Nutzern wird
  deshalb empfohlen, auf diese neu eingeführte Methode umzusteigen.

* Option `:exception` zu `Kernel.#system` hinzugefügt. Diese Option
  führt dazu, dass #system statt `false` zurückzugeben einen Fehler
  verursacht. [[Feature #14386]](https://bugs.ruby-lang.org/issues/14386)

## Performanzverbesserungen

* `Proc#call` beschleunigt, weil wir uns nicht mehr um `$SAFE` kümmern
  müssen. [[Feature #14318]](https://bugs.ruby-lang.org/issues/14318)

  Mithilfe des `lc_fizzbuzz`-Benchmarks, das sehr häufig `Proc#call`
  benutzt, haben wir eine 1,4-fache Beschleunigung gemessen. [[Bug #10212]](https://bugs.ruby-lang.org/issues/10212)

* `block.call` beschleunigt, wenn `block` als Block-Parameter
  übergeben wird. [[Feature #14330]](https://bugs.ruby-lang.org/issues/14330)

  Bereits Ruby 2.5 verbessert die Performanz bei der Übergabe von
  Blöcken. [[Feature #14045]](https://bugs.ruby-lang.org/issues/14045)
  Mit Ruby 2.6 wird auch der Aufruf von übergebenen Blöcken
  beschleunigt, sodass wir im Mikro-Benchmark eine 2,6-fache
  Beschleunigung messen konnten.

## Sonstige bemerkenswerte Änderungen seit 2.5

* `$SAFE` ist ein prozess-globaler Zustand und kann wieder auf `0` gesetzt
  werden. [[Feature #14250]](https://bugs.ruby-lang.org/issues/14250)

* Die Übergabe von `safe_level` an `ERB.new` ist als veraltet
  markiert worden. Die Parameter `trim_mode` und `eoutvar` wurden in
  Schlüsselwortargumente geändert. [[Feature #14256]](https://bugs.ruby-lang.org/issues/14256)

* RubyGems 3.0.0.beta1 aufgenommen.

Siehe die [NEWS](https://github.com/ruby/ruby/blob/v2_6_0_preview2/NEWS)
oder die [Commit-Logs](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_preview2)
für weitere Details.

Mit diesen Änderungen wurden
[4699 Dateien geändert, 45744 Einfügungen(+), 30885 Löschungen(-)](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_preview2)
seit Ruby 2.5.0!

Viel Spaß mit der Programmierung mit Ruby 2.6.0-preview2!

## Download

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview2.tar.gz>

      SIZE:   16170732 bytes
      SHA1:   6867b00e81af0b70fcb6f1aa7fc22d89d48a7d12
      SHA256: ee15ab35f17c942b1f41bd792f2494f639affff6e03babf44708b72fdbb6de34
      SHA512: 95c5a277785dfeb3006503e1b9ccccefdf6ce29669d4576f0191ee6986ba0e3567fbbed18a8d2b1f147d637434e4a3a4fdf47d84995e10ad4a354950e9092690

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview2.zip>

      SIZE:   19850776 bytes
      SHA1:   eba80a09b552ce3142fd571ff5867a13736d170e
      SHA256: 97fc187b90570fce110d22803a319ab04e68700692b2b6b4e9961886f1a931e5
      SHA512: d5501819635bda64ac3dc717815652b692302b44a7cdf4c08edfa5cb9ec7f79a70fffc534879b316a4a9584825ed3c0948667beae2d7c313de58583931b981f4

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview2.tar.bz2>

      SIZE:   14209461 bytes
      SHA1:   a9b1b4f359601b94b3f5b77115fcbf3790ff69cd
      SHA256: d8ede03d5ad3abd9d2c81cf0ad17a41d22b747c003cc16fd59befb2aaf48f0b2
      SHA512: 3872227e9b1c97c206d19bf1e6ce15a38ee15a26c431b4436605dea67affcf16372358984df76b35e7abaa902c15c16f533ac7af47e3031dea9451bbe459b693

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview2.tar.xz>

      SIZE:   11525372 bytes
      SHA1:   e795abe1a4f828b3d851f7148b4bf6c9d9a7e7fd
      SHA256: 00ddfb5e33dee24469dd0b203597f7ecee66522ebb496f620f5815372ea2d3ec
      SHA512: bef3e90e97d6e58889cd500c591c579b728ca5833022b690182c0bf4d661e437b3a2ca33470dac35fcf693897819b9d7f500c0f71b707e2fcdcb0644028f2c03
