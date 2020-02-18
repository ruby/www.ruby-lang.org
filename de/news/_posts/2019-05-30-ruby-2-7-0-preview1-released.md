---
layout: news_post
title: "Ruby 2.7.0-preview1 veröffentlicht"
author: "naruse"
translator: "Marvin Gülker"
date: 2019-05-30 00:00:00 +0000
lang: de
---

Wir freuen uns, die Veröffentlichung von Ruby 2.7.0-preview1
bekanntgeben zu können.

Diese Vorschau wird veröffentlicht, um bis zur geplanten finalen
Freigabe im Dezember Erfahrungsberichte sammeln zu können. Sie enthält
eine Anzahl neuer Funktionalitäten und Performanzverbesserungen,
namentlich:

* Defragmentierung für den GC _(Campaction GC)_
* Musterabgleiche
* Verbesserungen der interaktiven Kommandozeile _(REPL)_

## Defragmentierender GC

Die neue Version wird einen defragmentierenden GC _(Compaction GC)_
einführen, der fragmentierten Arbeitsspeicherplatz defragmentieren
kann.

Einige Ruby-Programme, die mit mehreren Threads arbeiten, leiden
derzeit unter Speicherfragmentierung. Dies verursacht einen hohen
Speicherverbrauch und eine reduzierte Ausführungsgeschwindigkeit.

Zur Behebung des Problems wird die neue Methode `GC.compact`
eingeführt. Sie defragmentiert den Freispeicher _(Heap)_, indem sie
noch aktive Objekte näher zusammenrückt, sodass weniger Speicherseiten
benötigt werden und der Freispeicher insgesamt besser für
Copy-on-Write geeignet ist. [#15626](https://bugs.ruby-lang.org/issues/15626)

## Musterabgleiche [Experimentell]

Musterabgleiche sind eine häufig genutzte Funktion funktionaler
Programmiersprachen. Mit 2.7.0 werden sie als experimentell in die
Programmiersprache Ruby eingeführt. [#14912](https://bugs.ruby-lang.org/issues/14912)
Ein Musterabgleich untersucht das übergebene Objekt und weist seinen
Wert dann zu, wenn er auf ein bestimmtes Muster passt.

```ruby
case JSON.parse('{...}', symbolize_names: true)
in {name: "Alice", children: [{name: "Bob", age: age}]}
  p age
  ...
end
```

Weitere Details können Sie der Präsentation [Musterabgleiche - Neue Funktion in Ruby 2.7](https://speakerdeck.com/k_tsj/pattern-matching-new-feature-in-ruby-2-dot-7)
entnehmen.

## Verbesserung der interaktiven Kommandozeile

Die mitgelieferte interaktive Kommandozeile `irb` _(REPL: Read-Eval-Print-Loop)_
wird mehrzeiliges Editieren unterstützen. Dies wird mithilfe von
`reline`, einer `readline`-kompatiblen reinen Ruby-Bibliothek,
umgesetzt. Darüber hinaus wird `irb` besser mit RDoc integriert: es
wird möglich, die Referenzdokumentation für eine bestimmte Klasse,
ein bestimmtes Modul oder auch eine bestimmte Methode nachzuschlagen.
[#14683](https://bugs.ruby-lang.org/issues/14683),
[#14787](https://bugs.ruby-lang.org/issues/14787),
[#14918](https://bugs.ruby-lang.org/issues/14918)
Schließlich werden von `binding.irb` angezeigte Quellcode-Zeilen und
Ergebnisse von `inspect` farblich hevorgehoben werden.

<video autoplay="autoplay" controls="controls" muted="muted" width="576" height="259">
  <source src="https://cache.ruby-lang.org/pub/media/irb_improved_with_key_take2.mp4" type="video/mp4">
</video>

## Sonstige bemerkenswerte neue Funktionen

* Ein Methoden-Referenz-Operator, <code>.:</code>, wird als
  experimentell eingeführt. [#12125](https://bugs.ruby-lang.org/issues/12125), [#13581](https://bugs.ruby-lang.org/issues/13581)

* Blockparameter werden für abgekürzten Zugriff automatisch nummeriert (experimentell).
  [#4475](https://bugs.ruby-lang.org/issues/4475)

* Ruby verfügt bereits über endlose Range-Objekte. Nunmehr werden auch
  anfangslose Range-Objekte eingeführt. Diese sind vielleicht nicht so
  nützlich wie endlose Range-Objekte, könnten aber für
  domänenspezifische Sprachen praktisch sein.
  [#14799](https://bugs.ruby-lang.org/issues/14799)

      ary[..3]  # identical to ary[0..3]
      rel.where(sales: ..100)

* `Enumerable#tally` wird hinzugefügt. Die Methode zählt das Vorkommen
  jedes Elements.

      ["a", "b", "c", "b"].tally
      #=> {"a"=>1, "b"=>2, "c"=>1}

## Performanzverbesserungen

* JIT [Experimentell]

  * JIT-kompilierter Code wird neu zu weniger optimiertem Code
    kompiliert, wenn eine Optimierungsannahme sich als falsch
    herausstellt.

  * Method-Inlining wird durchgeführt, wenn eine Methode als rein
    _(pure)_ gilt. Diese Optimierung ist noch experimentell und
    zahlreiche Methoden gelten noch nicht als rein.

  * Der Standardwert von `--jit-min-calls` wird von 5 auf 10.000
    geändert.

  * Der Standardwert von `--jit-max-cache` wird von 1.000 auf 100
    geändert.

## Sonstige bemerkenswerte Änderungen seit 2.6

* Die Nutzung von `Proc.new` und `proc` ohne Block in einer Methode,
  die einen Block erwartet, führt nun zu einer Warnung.

* Die Nutzung von `lambda` ohne block in einer Methode, die einen
  Block erwartet, erzeugt einen Fehler.

* Die Unicode- und Emoji-Version werden von 11.0.0 auf 12.0.0 angehoben.
  [[Feature #15321]](https://bugs.ruby-lang.org/issues/15321)

* Die Unicode-Version wird auf 12.1.0 angehoben, um Unterstützung für
  U+32FF SQUARE ERA NAME REIWA zu erhalten.  [[Feature #15195]](https://bugs.ruby-lang.org/issues/15195)

* `Date.jisx0301`, `Date#jisx0301` und `Date.parse` implementieren
  provisorische Unterstützung für die neue japanische Ära. Dies ist
  keine offiziell unterstützte Änderung, sondern provisorisch bis zur
  Freigabe von JIS X 0301.
  [[Feature #15742]](https://bugs.ruby-lang.org/issues/15742)

* Ruby nutzt jetzt C99, welches der Compiler unterstützen muss.
  [[Misc #15347]](https://bugs.ruby-lang.org/issues/15347)
  * Details zum genutzten Dialekt: <https://bugs.ruby-lang.org/projects/ruby-master/wiki/C99>


Siehe die
[NEWS](https://github.com/ruby/ruby/blob/v2_7_0_preview1/NEWS) oder
die
[Commit-Logs](https://github.com/ruby/ruby/compare/v2_6_0...v2_7_0_preview1)
für weitere Details.

Mit diesen Änderungen wurden [1727 Dateien geändert, 76022 Einfügungen(+), 60286 Löschungen(-)](https://github.com/ruby/ruby/compare/v2_6_0...v2_7_0_preview1) seit Ruby 2.6.0!

Viel Spaß bei der Programmierung mit Ruby 2.7!

## Download

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview1.tar.gz>

      SIZE:   16021286 bytes
      SHA1:   2fbecf42b03a9d4391b81de42caec7fa497747cf
      SHA256: c44500af4a4a0c78a0b4d891272523f28e21176cf9bc1cc108977c5f270eaec2
      SHA512: f731bc9002edd3a61a4955e4cc46a75b5ab687a19c7964f02d3b5b07423d2360d25d7be5df340e884ca9945e3954e68e5eb11b209b65b3a687c71a1abc24b91f

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview1.zip>

      SIZE:   20283343 bytes
      SHA1:   7488346fa8e58203a38158752d03c8be6b1da65b
      SHA256: fdf25573e72e1769b51b8d541d0e1a894a5394dbfdf1b08215aa093079cca64c
      SHA512: b3b1f59dce94c242ef88a4e68381a4c3a6f90ba0af699083e5a1a00b0fb1dce580f057dad25571fe789ac9aa95aa6e9c071ebb330328dc822217ac9ea9fbeb3f

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview1.tar.bz2>

      SIZE:   14038296 bytes
      SHA1:   f7e70cbc2604c53a9e818a2fc59cd0e2d6c859fa
      SHA256: d45b4a1712ec5c03a35e85e33bcb57c7426b856d35e4f04f7975ae3944d09952
      SHA512: a36b241fc1eccba121bb7c2cc5675b11609e0153e25a3a8961b67270c05414b1aa669ce5d4a5ebe4c6b2328ea2b8f8635fbba046b70de103320b3fdcb3d51248

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview1.tar.xz>

      SIZE:   11442988 bytes
      SHA1:   45e467debc194847a9e3afefb20b11e6dc28ea31
      SHA256: 8c546df3345398b3edc9d0ab097846f033783d33762889fd0f3dc8bb465c3354
      SHA512: d416e90bfa3e49cc0675c4c13243c8ec319b7a0836add1bd16bd7662d09eaf46656d26e772ef3b097e10779896e643edd8a6e4f885147e3235257736adfdf3b5

## Was ist Ruby

Die Programmiersprache Ruby wurde 1993 von Yukihiro „Matz“ Matsumoto
erfunden und wird heute als quelloffene Software entwickelt. Sie läuft
auf verschiedenen Plattformen und wird überall auf der Welt namentlich
für die Webentwicklung genutzt.
