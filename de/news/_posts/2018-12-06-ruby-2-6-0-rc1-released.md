---
layout: news_post
title: "Ruby 2.6.0-rc1 veröffentlicht"
author: "naruse"
translator: "Marvin Gülker"
date: 2018-12-06 00:00:00 +0000
lang: de
---

Wir freuen uns, die Freigabe von Ruby 2.6.0-rc1 ankündigen zu können.

Ruby 2.6.0-rc1 ist die erste Vorschau auf Ruby 2.6.0. Sie enthält
einige neue Features sowie Performanzverbesserungen, beispielsweise:

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

Mit Stand Ruby 2.6.0-rc1 haben wir eine 1,7-fache Verbesserung
der Performanz gegenüber Ruby 2.5 bei einem CPU-intensiven,
nicht-trivialen Belastungstest namens Optcarrot <https://gist.github.com/k0kubun/d7f54d96f8e501bbbc78b927640f4208>
festgestellt. Wir werden darüber hinaus auch die Performanz von
speicherhungrigen Anwendungen wie solchen auf Rails-Basis verbessern.

Machen Sie sich bereit für eine neue Ära von Rubys Performanz.

## RubyVM::AbstractSyntaxTree [Experimentell]

Ruby 2.6 führt das Modul `RubyVM::AbstractSyntaxTree` ein.

Dieses Modul verfügt über die Methoden `parse`, die den als String
übergenen Ruby-Code verarbeitet und eine Liste von Knoten des ASTs
_(Abstract Syntax Tree)_ zurückgibt, und `parse_file`, die die
übergebene Ruby-Quelldatei auf ähnliche Weise verarbeitet und
ebenfalls AST-Knoten zurückgibt.

Weiterhin wird die ebenfalls experimentelle Klasse `RubyVM::AbstractSyntaxTree::Node`
eingeführt. Mithilfe von `Node`-Objekten können die Positionsinformationen und
Angaben über Kindknoten ermittelt werden. Eine Kompatibilität der
Struktur von AST-Knoten kann derzeit nicht gewährleistet werden.

## Neue Features

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

* Einmal-Modus _(oneshot mode)_
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
* `FileUtils#cp_lr` hinzugefügt. [[Feature #4189]](https://bugs.ruby-lang.org/issues/4189)

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
  eingeführt [[Bug #14858]](https://bugs.ruby-lang.org/issues/14858) [[Feature #14989]](https://bugs.ruby-lang.org/issues/14989). Dabei handelt es sich um
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

* Ruby unterstützt jetzt Unicode in Version 11. Es ist geplant, die
  Versionen 12 und 12.1 in zukünftigen TEENY-Veröffentlichungen von
  Ruby 2.6 zu unterstützen.

* RubyGems 3.0.0.beta3 aufgenommen. Die Optionen `--ri` und `--rdoc`
  wurden entfernt. Benutzen Sie stattdessen `--document` und
  `--no-document`.

* [Bundler](https://github.com/bundler/bundler) wird standardmäßig
  mitgeliefert.

Siehe die [NEWS](https://github.com/ruby/ruby/blob/v2_6_0_rc1/NEWS)
oder die [Commit-Logs](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_rc1)
für weitere Details.

Mit diesen Änderungen wurden
[6376 Dateien geändert, 227364 Einfügungen(+), 51599 Löschungen(-)](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_rc1)
seit Ruby 2.5.0!

Viel Spaß mit der Programmierung mit Ruby 2.6.0-rc1!

## Download

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-rc1.tar.gz>

      SIZE:   16823448 bytes
      SHA1:   889db7731fd43f6dbf7f31ffdb0a29bba1a8d356
      SHA256: 6d6183639ed9c02320d7132e97c65489a39e24d8b55fc4ed35ac53d1189cb61d
      SHA512: ad101adee5c43f3645561e73970f15d4e9141f707da69a92e224575c665949e18ca53389e5315fca2ea3934d77967a59e304353cde4a915537e7c4e4ee20be73

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-rc1.zip>

      SIZE:   20737499 bytes
      SHA1:   457e39aee1978da5e42af42a6ad230421544aa07
      SHA256: 2bcdf468de499e4d6983d60d63dcc883f4c54fdc05a08a54eb93d315477bc4cc
      SHA512: 0842fae8a199f6c1e76f5d775edbf468e18a54f0419324eb73595e0268c728c71733371d71dc2fa342105dbc487987ca5556948a9ef067276a7b5f552462802a

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-rc1.tar.bz2>

      SIZE:   14607078 bytes
      SHA1:   269fe9d414d7731e4a63959fadffe5c50c08ce0e
      SHA256: b4e9c0e8801946e9f0baba30948955f4341e9e04f363c206b7bd774208053eb5
      SHA512: cbd6281b2aab6fbce3f699c1ab57e5423304dca7a547a0b3cd4e8e980326dc7b85b2ca2bfaf3f3a648d40f4222fdf1740d81d422790ee7ae1ba1ed33eb11e3e8

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-rc1.tar.xz>

      SIZE:   11851908 bytes
      SHA1:   3b93fdf1c5bd969ab4fe0a8176a6cf64e4597e6e
      SHA256: 21d9d54c20e45ccacecf8bea4dfccd05edc52479c776381ae98ef6a7b4afa739
      SHA512: 3d93d8d80e4900e8b3a27f904ed60581cebc6c55f4ab7acafc81e95001f92f3ea4ddec2da6169b1ed5e0146f7b7c35c1c13b3243955d5825c72170834fe933f3
