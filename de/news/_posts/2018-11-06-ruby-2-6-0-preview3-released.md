---
layout: news_post
title: "Ruby 2.6.0-preview3 veröffentlicht"
author: "naruse"
translator: "Marvin Gülker"
date: 2018-11-06 00:00:00 +0000
lang: de
---

Wir freuen uns, die Veröffentlichung von Ruby 2.6.0-preview3
bekanntgeben zu können.

Ruby 2.6.0-preview3 ist die dritte Vorschau auf Ruby 2.6.0. Ihre
Veröffentlichung dient dazu, neue Features zu testen, bevor sie in den
anstehenden Veröffentlichungskanditaten aufgenommen werden.

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
GCC, Clang oder Microsoft VC++ gebaut wird und der Compiler auch
während des Programmablaufs verfügbar ist. Ansonsten können Sie ihn
momentan leider nicht verwenden.

Mit Stand Ruby 2.6.0-preview3 haben wir eine 1,7-fache Verbesserung
der Performanz gegenüber Ruby 2.5 bei einem CPU-intensiven,
nicht-trivialen Belastungstest namens Optcarrot <https://gist.github.com/k0kubun/d7f54d96f8e501bbbc78b927640f4208>
festgestellt. Wir werden darüber hinaus auch die Performanz von
speicherhungrigen Anwendungen wie solchen auf Rails-Basis verbessern.

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

* Es wird ein flüchtiger Heap _(transient heap, theap)_
  eingeführt [Bug #14858] [Feature #14989]. Dabei handelt es sich um
  einen automatisch verwalteten Freispeicher für kurzlebige Objekte im
  Speicher, auf welche von bestimmten Klassen (Array, Hash, Object und
  Struct) verwiesen wird. Dies führt beispielsweise dazu, dass die
  Erstellung kleiner und kurzlebiger Hash-Objekte doppelt so schnell
  ist. Im RDoc-Belastungstest haben wir eine 6- bis 7-prozentige
  Performanzverbesserung festgestellt.

## Sonstige bemerkenswerte Änderungen seit 2.5

* `$SAFE` ist ein prozess-globaler Zustand und kann wieder auf `0` gesetzt
  werden. [[Feature #14250]](https://bugs.ruby-lang.org/issues/14250)

* Die Übergabe von `safe_level` an `ERB.new` ist als veraltet
  markiert worden. Die Parameter `trim_mode` und `eoutvar` wurden in
  Schlüsselwortargumente geändert. [[Feature #14256]](https://bugs.ruby-lang.org/issues/14256)

* RubyGems 3.0.0.beta2 aufgenommen. Die Optionen `--ri` und `--rdoc`
  wurden entfernt. Benutzen Sie stattdessen `--document` und
  `--no-document`.

* [Bundler](https://github.com/bundler/bundler) wird standardmäßig
  mitgeliefert.

Siehe die [NEWS](https://github.com/ruby/ruby/blob/v2_6_0_preview3/NEWS)
oder die [Commit-Logs](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_preview3)
für weitere Details.

Mit diesen Änderungen wurden
[6474 Dateien geändert, 171888 Einfügungen(+), 46617 Löschungen(-)](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_preview3)
seit Ruby 2.5.0!

Viel Spaß mit der Programmierung mit Ruby 2.6.0-preview3!

## Download

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview3.tar.gz>

      SIZE:   17071670 bytes
      SHA1:   67836fda11fa91e0b988a6cc07989fbceda025b4
      SHA256: 60243e3bd9661e37675009ab66ba63beacf5dec748885b9b93916909f965f27a
      SHA512: 877278cd6e9b947f5bb6ed78136efb232dcc9c5c218b7236576171e7c3cd7f6b7d10d07d8402014a14aba1fcd1913a4370f0725c561ead41d8a3fe92029f7f76

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview3.zip>

      SIZE:   21537655 bytes
      SHA1:   45f3c90dfffe03b746f21f24152666e361cbb41a
      SHA256: 9152af9e700349dcfa2eec196dd91587d42d70a6837fa2c415ebba1167587be1
      SHA512: 335de36cf56706326f4acc4bbd35be01e0ac5fff30d0a69b2e1630ba4c78f0e711822d1623d0099a517c824b154917d2f60be192dfb143a422cf1d17b38e1183

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview3.tar.bz2>

      SIZE:   14973451 bytes
      SHA1:   5f2df5d8c5a3888ccb915d36a3532ba32cda8791
      SHA256: 1f09a2ac1ab26721923cbf4b9302a66d36bb302dc45e72112b41d6fccc5b5931
      SHA512: d1693625723796e8902f3e4c4fae444f2912af9173489f7cf18c99db2a217afc971b082fce7089e39f8edd54d762d2b4e72843c8306ed29b05ccb15ac03dbb5b

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview3.tar.xz>

      SIZE:   12291692 bytes
      SHA1:   7f8216247745215e9645568e7a02140f9a029b31
      SHA256: 9856d9e0e32df9e5cdf01928eec363d037f1a76dab2abbf828170647beaf64fe
      SHA512: b4d3b17ecf96272c43cd7518c0b54dee63fc1150ad143e1d9c9d708506fe78676c80eb96cc47b8d46d1128bd483a53f16c944963a03d1f99f00131b74714df7b
