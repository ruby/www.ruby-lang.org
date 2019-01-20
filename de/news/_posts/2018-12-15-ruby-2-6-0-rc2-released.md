---
layout: news_post
title: "Ruby 2.6.0-rc2 veröffentlicht"
author: "naruse"
translator: "Marvin Gülker"
date: 2018-12-15 00:00:00 +0000
lang: de
---

Wir freuen uns, die Freigabe von Ruby 2.6.0-rc2 ankündigen zu können.

Ruby 2.6.0-rc2 ist die zweite Vorschau auf Ruby 2.6.0. Der RC2 wird
veröffentlicht, um die Paketierung von Bundler 1.17 anstelle von 2.0
zu testen. Daneben enthält die Vorschau einige neue Features sowie
Performanzverbesserungen, beispielsweise:

## JIT

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
JIT-Kompilation ausgegeben. Siehe auch `ruby --help` für weitere
Optionen.

Diese Veröffentlichung soll Ihnen Gelegenheit geben, zu überprüfen, ob
der JIT-Compiler auf Ihrer Plattform funktioniert. Außerdem soll eine Prüfung
auf Sicherheitsprobleme noch vor der Freigabe von 2.6 ermöglicht
werden. Der JIT-Compiler wird derzeit nur unterstützt, wenn Ruby mit
GCC, Clang oder Microsoft VC++ gebaut wird und der Compiler auch
während des Programmablaufs verfügbar ist. Ansonsten können Sie ihn
momentan leider nicht verwenden.

Mit Stand Ruby 2.6.0-rc2 haben wir eine 1,7-fache Verbesserung
der Performanz gegenüber Ruby 2.5 bei einem CPU-intensiven,
nicht-trivialen Belastungstest namens Optcarrot <https://gist.github.com/k0kubun/d7f54d96f8e501bbbc78b927640f4208>
festgestellt. Wir werden darüber hinaus auch die Performanz von
speicherhungrigen Anwendungen wie solchen auf Rails-Basis verbessern.

Machen Sie sich bereit für eine neue Ära von Rubys Performanz.

## RubyVM::AbstractSyntaxTree [Experimentell]

Ruby 2.6 führt das Modul `RubyVM::AbstractSyntaxTree` ein.

Dieses Modul verfügt über die Methoden `parse`, die den als String
übergebenen Ruby-Code verarbeitet und eine Liste von Knoten des ASTs
_(Abstract Syntax Tree)_ zurückgibt, und `parse_file`, die die
übergebene Ruby-Quelldatei auf ähnliche Weise verarbeitet und
ebenfalls AST-Knoten zurückgibt.

Weiterhin wird die ebenfalls experimentelle Klasse `RubyVM::AbstractSyntaxTree::Node`
eingeführt. Mithilfe von `Node`-Objekten können die Positionsinformationen und
Angaben über Kindknoten ermittelt werden. Eine Kompatibilität der
Struktur von AST-Knoten kann derzeit nicht gewährleistet werden.

## Neue Features

* Neuer alias `then` für `Kernel#yield_self`. [[Feature #14594]](https://bugs.ruby-lang.org/issues/14594)

* `else` ohne `rescue` verursacht einen Syntaxfehler. [EXPERIMENTELL][[Feature #14606]](https://bugs.ruby-lang.org/issues/14606)

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
  eingeführt [[Bug #14858]](https://bugs.ruby-lang.org/issues/14858) [[Feature #14989]](https://bugs.ruby-lang.org/issues/14989).

  Dabei handelt es sich um
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

Siehe die [NEWS](https://github.com/ruby/ruby/blob/v2_6_0_rc2/NEWS)
oder die [Commit-Logs](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_rc2)
für weitere Details.

Mit diesen Änderungen wurden
[6411 Dateien geändert, 228864 Einfügungen(+), 97600 Löschungen(-)](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_rc2)
seit Ruby 2.5.0!

Viel Spaß beim Programmieren mit Ruby 2.6.0-rc2!

## Download

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-rc2.tar.gz>

      SIZE:   16723556 bytes
      SHA1:   a4d7f8c8c3584a60fe1a57d03d80162361fe3c78
      SHA256: 9c0245e96379246040f1fd0978f8e447e7f47cdccbdaffdb83302a995276b62b
      SHA512: 789f608f93db6e12835911f3105d9abe2fabb67cd22dc3bafdff38716ac56974925738e7f7788ebef5bdf67b6fd91f84a4ee78a3e5d072cfc8ee0972de737b08

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-rc2.zip>

      SIZE:   20643747 bytes
      SHA1:   c1a2898949d929dd952880f1c1c2bac2ef2609b4
      SHA256: e8a446cf1f2ffc14483604de0a5e12c2578dd2f672ae87798ca2bbb9b7b73899
      SHA512: 2d06feae13f485f5da59574672b14d03881ed532d652648f94e2435f5d81df623b5ef532b8ba8e0b9bc4ee6baf7c0328a5610eab753a9020a0fea2673254c76c

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-rc2.tar.bz2>

      SIZE:   14581998 bytes
      SHA1:   94bbee97de4955e67effb7f512c58300617a3a09
      SHA256: b3d03e471e3136f43bb948013d4f4974abb63d478e8ff7ec2741b22750a3ec50
      SHA512: 9bfbe83fd3699b71bae2350801d8c967eb128e79b62a9d36fc0f011b83c53cab28a280939f4cc9f0a28f9bf02dce8eea30866ca4d06480dc44289400abf580ba

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-rc2.tar.xz>

      SIZE:   11908088 bytes
      SHA1:   13a7f06d832dc28989e3e4321490a6ba528ed023
      SHA256: d620b3d87b3190867304067f3ce77f5305f7ec1b2e73b09c17710c97c028986d
      SHA512: a3dc43c0bc70dfdb9ff0d18b5b9797bbf332524f5d3bbb7940cf4e32286ca715808acfd11ebf3cdbe358a2466b7c6b5be3a7a784af7eb95c071fe1f8b4ab1261
