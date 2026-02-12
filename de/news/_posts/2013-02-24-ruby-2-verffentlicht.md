---
layout: news_post
title: "Ruby 2 veröffentlicht"
author: "Quintus"
date: 2013-02-24 10:33:03 +0000
lang: de
---

Wir sind höchst erfreut, heute, am 20. Geburtstag von Ruby, die
Veröffentlichung von Ruby 2.0.0-p0 ankündigen zu können. Ruby 2.0.0 ist
das erste stabile Release der 2.0er Serie, mit zahlreichen neuen
Features und Verbesserungen als Antwort auf die steigenden und
expandierenden Ansprüche an die Programmiersprache Ruby.

Haben Sie viel Freude an der Programmierung mit Ruby 2.0.0!

### Was ist Ruby 2

#### Neue Features

Ein paar der Höhepunkte:

* *Sprachkern*\:
  * Benannte Parameter, die API-Design Flexibilität geben
  * Module#prepend ermöglicht neue Wege, Klassen zu erweitern
  * Ein neues Literal `%i`, das ein Array von Symbolen erzeugt
  * `__dir__` gibt den Verzeichnispfad der aktuell ausgeführten Datei
    zurück
  * UTF-8 ist nun die Standardkodierung, wodurch der magische Kommentar
    nun weggelassen werden kann

* *Eingebaute Bibliotheken*\:
  * Enumerable#lazy und `Enumerator::Lazy`, für (durchaus unendliche)
    *lazy* Streams
  * Enumerator#size und Range#size, für *lazy* Größenfeststellung
  * \#to\_h, die neue Konvention zur Konvertierung in einen Hash
  * *Onigmo*, die neue Engine für Reguläre Ausdrücke (ein Fork von
    Oniguruma)
  * Asynchrones API zum Behandeln von Exceptions

* *Debugging-Unterstützung*
  * Unterstützung von *DTrace*, sodass Runtime-Diagnosen in Produktion
    möglich werden
  * *TracePoint*, ein verbessertes Tracing-API

* *Performanzverbesserungen*\:
  * GC-Optimierung durch *Bitmap Marking*
  * Optimierungen an Kernel#require, wodurch sich die Startzeit von
    Rails drastisch verringert
  * Optimierungen an der VM, etwa am Methoden-Dispatch
  * Optimierungen bei der Gleitkommazahlberechnung

Darüberhinaus enthält 2.0.0 Refinements zur Erweiterung von Rubys
Modularität, allerdings als **experimentelles Feature**. Für noch mehr,
siehe die [NEWS][1].

#### Kompatibilität

Wir haben auch darauf geachtet, 2.0.0 kompatibel zu 1.9 zu designen,
daher sollte es einfacher sein, von 1.9 auf 2.0 zu migrieren, als damals
von 1.8 auf 1.9 (die auffälligen Inkompatibilitäten werden weiter unten
beschrieben).

Tatsächlich sind, dank der bemerkenswerten Arbeit Dritter, einige
populäre Anwendungen wie Rails und tDiary bereits erfolgreich auf die
Release-Candidates von 2.0.0 portiert worden.

#### Dokumentation

Es gibt zahlreiche Verbesserungen an der Dokumentation, was viele
Rubyisten gefordert haben. Wir haben riesige Berge von RDoc für Module
und Methoden geschrieben; insgesamt ist 2.0.0 zu rund 75% dokumentiert,
wohingegen 1.9.3 nur zu etwa 60% abgedeckt war. Daneben gibt es nun eine
Beschreibung von Rubys Syntax, einsehbar mit:

{% highlight sh %}
ri ruby:syntax
{% endhighlight %}

#### Stabilität

Beachten Sie, dass, anders als 1.9.0, 2.0.0 ein **stabiles Release**
ist, **obwohl** die *teeny*-Nummer 0 ist. Es wird allen Autoren von
Programmbibliotheken stärkstens empfohlen, 2.0.0 zu unterstützen — wie
bereits gesagt, sollte die Migration von 1.9 auf 2.0 nicht sonderlich
schwerfallen.

Ruby 2.0.0 ist produktionsreif und wir Ihr Leben als Rubyist
verschönern.

### Notizen

#### Einführende Artikel

Hier sind einige Einführungen in Ruby 2 von Dritten:

* [http://blog.marc-andre.ca/2013/02/23/ruby-2-by-example][2]
  (ausführlich, empfohlen)
* [https://speakerdeck.com/shyouhei/whats-new-in-ruby-2-dot-0][3]
  (ausführlich, empfohlen)
* [http://el.jibun.atmarkit.co.jp/rails/2012/11/ruby-20-8256.html][4]
  (kurz, japanisch)
* [https://speakerdeck.com/nagachika/rubyist-enumeratorlazy][5] (nur
  `Enumerator::Lazy`, japanisch)

Die folgenden Artikel sind durchaus hilfreich, aber im Bezug auf
Refinements veraltet:

* [http://rubysource.com/a-look-at-ruby-2-0/][6]
* [https://speakerdeck.com/a\_matsuda/ruby-2-dot-0-on-rails][7]
* [http://globaldev.co.uk/2012/11/ruby-2-0-0-preview-features/][8]
* [http://www.infoq.com/news/2012/11/ruby-20-preview1][9]

In der aktuellen Ausgabe des *Rubyist Magazine* finden sich einige
Artikel, die von den Feature-Entwicklern selbst verfasst wurden:

[http://jp.rubyist.net/magazine/?0041-200Special][10]

Obwohl diese Artikel in Japanisch verfasst wurden, sind für die Zukunft
englische Übersetzungen geplant.

### Inkompatibilitäten

Es gibt fünf auffällige Inkompatibilitäten, von denen wir wissen:

* Die Standardkodierung für Ruby-Skripte ist nun UTF-8 \[#6679\]. Einige
  Leute sind der Meinung, dass dies existierende Programme betrifft,
  etwa werden scheinbar einige Benchmark-Programme sehr langsam
  \[ruby-dev:46547\].
* *Iconv* wurde entfernt. Es war ohnehin schon seit der Einführung von
  M17n in Ruby 1.9 *deprecated*; benutzen Sie stattdessen String#encode
  usw.
* Es gibt einen ABI-Bruch \[ruby-core:48984\]. Wir sind allerdings der
  Auffassung, dass normale Nutzer einfach ihre Extension-Libraries neu
  installieren können/sollten. KOPIEREN SIE KEINE `.so`- ODER
  `.bundle`-DATEIEN VON 1.9.
* \#lines, #chars, #codepoints und #bytes geben nun ein Array anstelle
  eines Enumerators zurück \[#6670\], wodurch das gewohnt gewordene
  Idiom `lines.to_a` entfällt. Nutzen Sie #each\_line usw. um einen
  Enumerator zu erhalten.
* Object#inspect gibt nun stets einen String à la `#<ClassName:0x...>`
  zurück statt an #to\_s zu delegieren \[#2152\].

Daneben gibt es einige vergleichsweise kleine Inkompatibilitäten
\[ruby-core:49119\].

### Status von Refinements

Wir haben ein neues Feature namens *Refinements* in die Sprache
eingeführt, das Rubys Modularität um ein weiteres Konzept erweitert.
Beachten Sie jedoch bitte, dass Refinements **noch immer experimentell**
sind: wir können ihre Spezifikation in Zukunft ändern. Abgesehen davon
möchten wir Sie jedoch dazu ermutigen, mit ihnen zu spielen und uns Ihre
Gedanken dazu mitzuteilen. Ihr Feedback wird dabei helfen, diese
interessante Feature festzuschmieden.

### Danksagung

Eine große Anzahl von Leuten haben an Ruby 2 mitgearbeitet, eine
komplette Danksagung selbst für wenige Teile der Mitarbeit wäre viel zu
groß, um sie hier einzufügen. Es tut mir Leid, aber lassen Sie mich
stattdessen einen Link auf eine *SpecialThanks*-Seite setzen:

[https://bugs.ruby-lang.org/projects/ruby/wiki/200SpecialThanks][11]

Vielen Dank euch allen!

### Download

[ruby-2.0.0-p0.tar.bz2][12]

: **MD5-Summe**

  895c1c581f8d28e8b3bb02472b2ccf6a

  **SHA256**

  c680d392ccc4901c32067576f5b474ee186def2fcd3fcbfa485739168093295f

  **Größe**

  10\.814.890 Byte

[ruby-2.0.0-p0.tar.gz][13]

: **MD5-Summe**

  50d307c4dc9297ae59952527be4e755d

  **SHA256**

  aff85ba5ceb70303cb7fb616f5db8b95ec47a8820116198d1c866cc4fff151ed

  **Größe**

  13\.608.925 Byte

[ruby-2.0.0-p0.zip][14]

: **MD5-Summe**

  db5af5d6034646ad194cbdf6e50f49ee

  **SHA256**

  0d0af6a9c8788537efd8d7d2358ce9468e6e2b7703dacba9ebd064d8b7da5f99

  **Größe**

  15\.037.340 Byte



[1]: https://git.ruby-lang.org/ruby.git
[2]: http://blog.marc-andre.ca/2013/02/23/ruby-2-by-example
[3]: https://speakerdeck.com/shyouhei/whats-new-in-ruby-2-dot-0
[4]: http://el.jibun.atmarkit.co.jp/rails/2012/11/ruby-20-8256.html
[5]: https://speakerdeck.com/nagachika/rubyist-enumeratorlazy
[6]: http://rubysource.com/a-look-at-ruby-2-0/
[7]: https://speakerdeck.com/a_matsuda/ruby-2-dot-0-on-rails
[8]: http://globaldev.co.uk/2012/11/ruby-2-0-0-preview-features/
[9]: http://www.infoq.com/news/2012/11/ruby-20-preview1
[10]: http://jp.rubyist.net/magazine/?0041-200Special
[11]: https://bugs.ruby-lang.org/projects/ruby/wiki/200SpecialThanks
[12]: https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.tar.bz2
[13]: https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.tar.gz
[14]: https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.zip
