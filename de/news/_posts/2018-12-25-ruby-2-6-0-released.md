---
layout: news_post
title: "Ruby 2.6.0 veröffentlicht"
author: "naruse"
translator: "Marvin Gülker"
date: 2018-12-25 00:00:00 +0000
lang: de
---

Wir freuen uns, die Veröffentlichung von Ruby 2.6.0 bekanntgeben zu können.

Diese Version enthält eine Reihe neuer Features und
Performanzverbesserungen, darunter insbesondere:

* Ein neuer JIT-Compiler.
* Das Modul `RubyVM::AbstractSyntaxTree`.

## JIT [Experimentell]

Ruby 2.6 führt erstmals einen JIT-Compiler _(Just in Time Compiler)_ ein.

Der JIT-Compiler soll die allgemeine Performanz aller Ruby-Programme
verbessern. Rubys JIT-Compiler arbeitet anders als herkömmliche
JIT-Compiler für andere Programmiersprachen, denn er schreibt C-Code
auf die Festplatte und startet dann einen gewöhnlichen
C-Compiler-Prozess, um Maschinencode zu erzeugen. Siehe dazu auch:
[Die Funktionsweise von MJIT (von Wladimir Makarow)](https://github.com/vnmakarov/ruby/tree/rtl_mjit_branch#mjit-organization).

Um den JIT-Compiler zu benutzen, geben Sie `--jit` als Kommandozeilenoption
oder in der Umgebungsvariablen `$RUBYOPT` an. Bei Angabe von
`--jit-verbose=1` werden Informationen über die laufende
JIT-Kompilation ausgegeben. Weitere Optionen können `ruby --help` oder
der [Dokumentation](https://bugs.ruby-lang.org/projects/ruby/wiki/MJIT#Basic-usage)
entnommen werden.

Für den Einsatz des JIT-Compilers ist es erforderlich, dass Ruby
mithilfe von GCC, Clang oder Microsoft VC++ kompiliert worden
ist. Darüber hinaus muss der verwendete Compiler zur Laufzeit auf dem
System zur Verfügung stehen.

Mit Stand Ruby 2.6.0 haben wir eine 1,7-fache Verbesserung
der Performanz gegenüber Ruby 2.5 bei einem CPU-intensiven,
nicht-trivialen Belastungstest namens [Optcarrot](https://gist.github.com/k0kubun/d7f54d96f8e501bbbc78b927640f4208)
festgestellt. Allerdings ist der JIT-Compiler noch experimentell und
speicherhungrige Anwendungen wie solche auf Rails-Basis können
möglicherweise noch nicht von ihm profitieren. Weitere Informationen
finden Sie im Artikel [Ruby 2.6 JIT - Fortschritt und Zukunft](https://medium.com/@k0kubun/ruby-2-6-jit-progress-and-future-84e0a830ecbf).

Machen Sie sich bereit für eine neue Ära von Rubys Performanz.

## `RubyVM::AbstractSyntaxTree` [Experimentell]

Ruby 2.6 führt das Modul `RubyVM::AbstractSyntaxTree` ein. **Die
Kompatibilität dieses Moduls mit zukünftigen Versionen kann nicht
garantiert werden.**

Dieses Modul verfügt über die Methoden `parse`, die den als String
übergebenen Ruby-Code verarbeitet und eine Liste von Knoten des ASTs
_(Abstract Syntax Tree)_ zurückgibt, und `parse_file`, die die
übergebene Ruby-Quelldatei auf ähnliche Weise verarbeitet und
ebenfalls AST-Knoten zurückgibt.

Weiterhin wird die ebenfalls experimentelle Klasse `RubyVM::AbstractSyntaxTree::Node`
eingeführt. Mithilfe von `Node`-Objekten können die Positionsinformationen und
Angaben über Kindknoten ermittelt werden.

## Weitere nennenswerte neue Features

* Neuer alias `#then` für `Kernel#yield_self`. [[Feature #14594]](https://bugs.ruby-lang.org/issues/14594)

* Konstantennamen können auch mit Großbuchstaben außerhalb des
  ASCII-Zeichensatzes beginnen. [[Feature #13770]](https://bugs.ruby-lang.org/issues/13770)

* Endlos-Range eingeführt. [[Feature #12912]](https://bugs.ruby-lang.org/issues/12912)

  Es wird ein Endlos-Range `(1..)` eingeführt, der über kein Ende
  verfügt. Typische Anwendungsfälle sehen wie folgt aus:

      ary[1..]                          # identisch zu ary[1..-1] ohne magische -1
      (1..).each {|index| ... }         # Endlosschleife ab Index 1
      ary.zip(1..) {|elem, index| ... } # ary.each.with_index(1) { ... }

* `Enumerable#chain` und `Enumerator#+` hinzugefügt. [[Feature #15144]](https://bugs.ruby-lang.org/issues/15144)

* Operatoren `<<` und `>>` für die Kombination von Funktionen zu
  `Proc` und `Method` hinzugefügt. [[Feature #6284]](https://bugs.ruby-lang.org/issues/6284)

      f = proc{|x| x + 2}
      g = proc{|x| x * 3}
      (f << g).call(3) # -> 11; identical to f(g(3))
      (f >> g).call(3) # -> 15; identical to g(f(3))

* `Binding#source_location` hinzugefügt.  [[Feature #14230]](https://bugs.ruby-lang.org/issues/14230)

  Diese Methode gibt ein 2-Element-Array mit den Bestandteilen
  `__FILE__` und `__LINE__` zurück, die beschreiben, an welcher Stelle
  im Quelltext ein Binding definiert wurde. Dieselbe Information
  konnte bisher über `eval("[__FILE__, __LINE__]", binding)` ermittelt
  werden, allerdings planen wir, dieses Verhalten so zu ändern, dass
  `Kernel#eval` den Definitionsort eines `binding` ignoriert
  [[Bug #4352]](https://bugs.ruby-lang.org/issues/4352). Nutzern wird
  deshalb empfohlen, auf diese neu eingeführte Methode umzusteigen.

* Option `:exception` zu `Kernel.#system` hinzugefügt. Diese Option
  führt dazu, dass #system statt `false` zurückzugeben einen Fehler
  verursacht. [[Feature #14386]](https://bugs.ruby-lang.org/issues/14386)

* Einmal-Modus _(oneshot mode)_ zu `Coverage`
  hinzugefügt. [[Feature#15022]](https://bugs.ruby-lang.org/issues/15022)

  * Anstelle von „wie oft wurde eine bestimmte Zeile ausgeführt“,
    prüft dieser Modus, „ob jede Zeile wenigstens einmal oder gar
    nicht ausgeführt wurde“. Der entsprechende Hook wird für jede
    Zeile höchstens einmal ausgeführt. Nach seinem Abschluss wird die
    entsprechende Flagge entfernt, d.h. das Programm läuft danach
    ohne geschwindigkeitsrelevante Einschränkungen.
  * Schlüsselwortargument `:oneshot_lines` zu Coverage.start
    hinzugefügt.
  * Schlüsselwortargumente `:stop` und `:clear` zu Coverage.result
    hinzugefügt. Wenn `clear` wahr ist, setzt es den Zähler auf Null
    zurück. Wenn `:stop` wahr ist, wird die Abdeckungsmessung
    ausgeschaltet.
  * `Coverage.line_stub` hinzugefügt. Es handelt sich um eine einfache
    Hilfsfunktion, die eine kurze Zusammenfassung der Zeilenabdeckung
    des übergebenen Quellcodes erzeugt.

* `FileUtils#cp_lr` hinzugefügt. Diese Methode funktioniert wie
  `cp_r`, verlinkt aber statt zu kopieren. [[Feature #4189]](https://bugs.ruby-lang.org/issues/4189)

## Performanzverbesserungen

* `Proc#call` durch die Entfernung der temporären Allozierung von
  `$SAFE` beschleunigt. [[Feature #14318]](https://bugs.ruby-lang.org/issues/14318)

  Mithilfe des `lc_fizzbuzz`-Belastungstests, der sehr häufig `Proc#call`
  benutzt, haben wir eine 1,4-fache Beschleunigung gemessen. [[Bug #10212]](https://bugs.ruby-lang.org/issues/10212)

* `block.call` beschleunigt, wenn `block` als Block-Parameter
  übergeben wird. [[Feature
  #14330]](https://bugs.ruby-lang.org/issues/14330)

  Zusammen mit den bereits in Ruby 2.5 diesbezüglich vorgenommenen
  Verbesserungen ist die Evaluation von Blöcken in Ruby 2.6 nun
  ausweislich eines Micro-Benchmarks 2,6-mal schneller.

* Es wird ein flüchtiger Heap _(transient heap, theap)_
  eingeführt [[Bug #14858]](https://bugs.ruby-lang.org/issues/14858) [[Feature #14989]](https://bugs.ruby-lang.org/issues/14989).

  Dabei handelt es sich um einen automatisch verwalteten Freispeicher
  für kurzlebige Objekte im Speicher, auf welche von bestimmten
  Klassen (Array, Hash, Object und Struct) verwiesen wird. Dies führt
  beispielsweise dazu, dass die Erstellung kleiner und kurzlebiger
  Hash-Objekte doppelt so schnell ist. Im RDoc-Belastungstest haben
  wir eine 6- bis 7-prozentige Performanzverbesserung festgestellt.

* Diverse native Implementierungen (`arm32`, `arm64`, `ppc64le`, `win32`,
  `win64`, `x86`, `amd64`) von Coroutinen verbessern die Performanz
  des Kontextwechsels bei `Fiber` signifikant.

  `Fiber.yield` und `Fiber#resume` sind auf einem 64-bit Linux-System
  etwa 5 mal so schnell wie bisher. Programme, die intensiven
  Gebrauch von Fibers machen, können insgesamt eine bis zu
  fünfprozentige Performanzverbesserung erwarten.

## Sonstige bemerkenswerte Änderungen seit 2.5

* `$SAFE` ist ein prozess-globaler Zustand und kann wieder auf `0` gesetzt
  werden. [[Feature #14250]](https://bugs.ruby-lang.org/issues/14250)

* Die Übergabe von `safe_level` an `ERB.new` ist als veraltet
  markiert worden. Die Parameter `trim_mode` und `eoutvar` wurden in
  Schlüsselwortargumente geändert. [[Feature #14256]](https://bugs.ruby-lang.org/issues/14256)

* Ruby unterstützt jetzt Unicode in Version 11. Es ist geplant, die
  Versionen 12 und 12.1 in zukünftigen TEENY-Veröffentlichungen von
  Ruby 2.6 zu unterstützen und damit Unterstützung für die [neue
  japanische Ära](http://blog.unicode.org/2018/09/new-japanese-era.html) einzuführen.

* RubyGems 3.0.1 aufgenommen. Die Optionen `--ri` und `--rdoc`
  wurden entfernt. Benutzen Sie stattdessen `--document` und
  `--no-document`.

* [Bundler](https://github.com/bundler/bundler) wird standardmäßig
  mitgeliefert.

* `else` ohne `rescue` in Fehlerbehandlungsblöcken verursacht einen
  Syntaxfehler. [EXPERIMENTELL][[Feature #14606]](https://bugs.ruby-lang.org/issues/14606)

Siehe die [NEWS](https://github.com/ruby/ruby/blob/v2_6_0/NEWS) oder
die [Commit-Logs](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0)
für weitere Details.

Mit diesen Änderungen wurden [6437 Dateien geändert, 231471 Einfügungen(+), 98498
Löschungen(-)](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0)
seit Ruby 2.5.0!

Frohe Weihnachten, schöne Ferien und viel Spaß bei der Programmierung
mit Ruby 2.6!

## Download

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0.tar.gz>

      SIZE:   16687800 bytes
      SHA1:   c95f4e86e21390270dad3ebb94491fd42ee2ce69
      SHA256: f3c35b924a11c88ff111f0956ded3cdc12c90c04b72b266ac61076d3697fc072
      SHA512: 01f886b0c0782a06315c4a46414e9f2b66ee634ba4349c8e0697f511793ae3c56d2ad3cad6563f2b0fdcedf0ff3eba51b9afab907e7e1ac243475772f8688382

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0.zip>

      SIZE:   20582054 bytes
      SHA1:   a804e63d18da12107e1d101918a3d8f4c5462a27
      SHA256: 8a4fb6ca58202495c9682cb88effd804398bd0ef023e3e36f001ca88d8b5855a
      SHA512: 16d66ec4a2c6a2e928d5b50e094a5efa481ac6e4d5ed77459d351ef19fe692aa59b68307e3e25229eec5f30ae2f9adae2663bafe9c9d44bfb45d3833d77839d4

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0.tar.bz2>

      SIZE:   14585856 bytes
      SHA1:   b8638eb806efbf7b6af87b24ccc6ad915f262318
      SHA256: c89ca663ad9a6238f4b1ec4d04c7dff630560c6e6eca6d30857c4d394f01a599
      SHA512: ca3daf9acf11d3db2900af21b66231bd1f025427a9d2212b35f6137ca03f77f57171ddfdb99022c8c8bcd730ff92a7a4af54e8a2a770a67d8e16c5807aa391f1

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0.tar.xz>

      SIZE:   11918536 bytes
      SHA1:   9ddaeba3505d2855460c8c653159fc0ac8928c0f
      SHA256: acb00f04374899ba8ee74bbbcb9b35c5c6b1fd229f1876554ee76f0f1710ff5f
      SHA512: c56eaf85ef7b79deb34ee4590b143c07f4fc83eb79775290761aee5a7c63374659613538a41f25706ed6e19e49d5c67a1014c24d17f29948294c7abd0b0fcea8
