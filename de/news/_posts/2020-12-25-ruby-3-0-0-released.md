---
layout: news_post
title: "Ruby 3.0.0 veröffentlicht"
author: "naruse"
translator: "Marvin Gülker"
date: 2020-12-25 00:00:00 +0000
lang: de
---

Wir freuen uns, die Veröffentlichung von Ruby 3.0.0
bekannt geben zu können. Seit 2015 haben wir an Ruby 3 gearbeitet,
dessen Ziele sich so beschreiben lassen: Performanz, Nebenläufigkeit
und Typisierung. Mit besonderem Blick auf die Performanz hatte Matz
angekündigt: „Ruby 3 wird 3-mal so schnell sein wie Ruby 2“, ein Satz,
der auch bekannt ist als [Ruby 3x3](https://blog.heroku.com/ruby-3-by-3).

{% assign release = site.data.releases | where: "version", "3.0.0" | first %}

<img src='https://cache.ruby-lang.org/pub/media/ruby3x3.png' alt='Optcarrot 3000 frames' width='100%' />

Im [Optcarrot-Benchmark](https://github.com/mame/optcarrot), der die Performanz eines einzelnen
Threads anhand der Emulation eines NES-Spiels misst, erreichte Ruby 3
die dreifache Performanz von Ruby 2.0! <details>Dies wurde mit der
unter [github.com/ruby/ruby/tree/master/benchmark](https://github.com/ruby/ruby/tree/master/benchmark)
beschriebenen Umgebung mit
[Commit 8c510e4095](https://github.com/ruby/ruby/commit/8c510e4095) als Ruby 3.0 gemessen.
Möglicherweise ist es in Ihrer Umgebung oder Ihrem Benchmark nicht drei mal so schnell.</details>

Ruby 3.0.0 erreicht diese Ziele durch die folgenden Maßnahmen:

* Performanz
  * MJIT
* Nebenläufigkeit
  * Ractor
  * Fiber Scheduler
* Typisierung (statische Analyse)
  * RBS
  * TypeProf

Zusätzlich zu den genannten Performanzverbesserungen führt Ruby 3.0
eine Reihe neuer Features ein, die nachfolgend beschrieben werden.

## Performanz

> Als ich erstmals „Ruby 3x3“ in der Keynote einer Konferenz erwähnte,
> sagten viele, auch Mitglieder des Konferenzteams, „Matz ist ein
> Aufschneider“. Tatsächlich fühlte ich mich so. Aber wir taten es.
> Ich bin gerührt zu sehen, dass es dem Core-Team gelungen ist, Ruby
> 3.0 drei mal so schnell zu machen wie Ruby 2.0 (zumindest in manchen
> Benchmarks). --- Matz

### MJIT

Der MJIT hat viele Verbesserungen gesehen. Siehe die NEWS für Details.

Mit Ruby 3.0 ist es Aufgabe des JIT, in bestimmten, abgrenzbaren Umgebungen wie in
Spielen ([Optcarrot](https://github.com/mame/optcarrot)), KI ([Rubykon](https://github.com/benchmark-driver)) oder sonstigen
Anwendungen, die den Großteil ihrer Zeit mit dem oft wiederholten Aufruf
einiger weniger Methoden verbringen, Performanzverbesserungen
herbeizuführen.

Obwohl Ruby 3.0 [die Größe des ge-JIT-eten Codes signifikant
reduziert hat](https://twitter.com/k0kubun/status/1256142302608650244) ist der JIT immer noch nicht geeignet, komplexe
Umgebungen wie Rails zu optimieren, die sehr viel Zeit in vielen
verschiedenen Methoden verbringen und die daher unter Nichttreffern im
vom JIT verwendeten i-Cache leiden. Freuen Sie sich auf Ruby 3.1 für
weitere Verbesserungen in dieser Hinsicht.

## Nebenläufigkeit / Parallelismus

> Wir leben in der Zeit von Mehrkernsystemen. Nebenläufigkeit ist sehr
> wichtig. Mit Ractor, zusammen mit asynchronen Fibers, wird Ruby eine
> wirklich nebenläufige Sprache. --- Matz

### Ractor (experimentell)

Ractor ist eine dem Aktorenmodell ähnliche Abstraktion für
Nebenläufigkeit, um die parallele Ausführung von Code bei
gleichzeitiger Beachtung von Thread-Sicherheit zu ermöglichen.

Sie können mehrere Ractors anlegen und sie parallel ausführen. Ractor
ermöglicht es, thread-sichere parallele Programme zu schreiben, weil
sich Ractors normale Objekte nicht teilen können. Die Kommunikation
zwischen Ractors wird stattdessen über Nachrichten abgewickelt.

Um das Teilen von Objekten zu begrenzen, führt Ractor einige
Beschränkungen für Rubys Syntax ein (die allerdings nicht greifen,
wenn nicht mehrere Ractors verwendet werden).

Die Spezifikation und Implementation sind noch nicht abgeschlossen und
können sich in Zukunft noch ändern, weshalb dieses Feature als
experimentell markiert ist und bei Erstellung eines Ractors mit
`Ractor.new` eine entsprechende Warnung über „experimentelle Features“
ausgegeben wird.

Das nachfolgende kleine Programm misst die Ausführungszeit der
bekannten Tak-Funktion für Benchmarks
([Tak (Funktion) - Wikipedia](https://de.wikipedia.org/wiki/Tak_(Funktion))),
indem sie 4-mal sequentiell oder 4-mal parallel mit
Ractors ausgeführt wird.

``` ruby
def tarai(x, y, z) =
  x <= y ? y : tarai(tarai(x-1, y, z),
                     tarai(y-1, z, x),
                     tarai(z-1, x, y))
require 'benchmark'
Benchmark.bm do |x|
  # sequential version
  x.report('seq'){ 4.times{ tarai(14, 7, 0) } }

  # parallel version
  x.report('par'){
    4.times.map do
      Ractor.new { tarai(14, 7, 0) }
    end.each(&:take)
  }
end
```

```
Benchmark result:
          user     system      total        real
seq  64.560736   0.001101  64.561837 ( 64.562194)
par  66.422010   0.015999  66.438009 ( 16.685797)
```

Dieses Ergebnis wurde gemessen auf Ubuntu 20.04, Intel(R) Core(TM)
i7-6700 (4 Kerne, 8 Hardware-Threads). Es zeigt, dass die parallele
Version 3,87-mal so schnell ist wie die sequentielle Version.

Siehe [doc/ractor.md](https://docs.ruby-lang.org/en/3.0/ractor_md.html) für weitere Details.

### Fiber Scheduler

Zur Unterbrechung blockender Operationen wird `Fiber#scheduler`
eingeführt. Das ermöglicht leichtgewichtige Nebenläufigkeit ohne
Änderungen bestehenden Codes. Schauen Sie sich für einen Überblick
über die Funktionsweise [„Warte nicht auf mich: Skalierbare
Nebenläufigkeit für Ruby 3“](https://www.youtube.com/watch?v=Y29SSOS4UOc) an.

Momentan unterstützte Klassen/Methoden:

- `Mutex#lock`, `Mutex#unlock`, `Mutex#sleep`
- `ConditionVariable#wait`
- `Queue#pop`, `SizedQueue#push`
- `Thread#join`
- `Kernel#sleep`
- `Process.wait`
- `IO#wait`, `IO#read`, `IO#write` und verwandte Methoden (z. B. `#wait_readable`, `#gets`, `#puts` usw.).
- `IO#select` wird *nicht unterstützt*.

Das folgende Beispielprogramm führt mehrere HTTP-Anfragen nebenläufig
aus:

``` ruby
require 'async'
require 'net/http'
require 'uri'

Async do
  ["ruby", "rails", "async"].each do |topic|
    Async do
      Net::HTTP.get(URI "https://www.google.com/search?q=#{topic}")
    end
  end
end
```

Es nutzt [async](https://github.com/socketry/async), das den Event-Loop bereitstellt. Dieser
Event-Loop benutzt die Hooks von `Fiber#scheduler`, um `Net::HTTP`
nicht-blockierend auszuführen. Andere Gems können diese Schnittstelle
benutzen, um nicht-blockierende Ausführung für Ruby anzubieten und
diese Gems können sogar mit anderen Implementierungen von Ruby (z. B.
JRuby, TruffleRuby) interoperabel sein, da diese in der Lage sein
sollten, dieselben nicht-blockierenden Hooks zu unterstützen.

## Statische Analyse

> Die 2010er Jahre waren eine Zeit statisch typisierter
> Programmiersprachen. Ruby verfolgt eine Zukunft mit statischer
> Typenüberprüfung, aber ohne Typendeklarationen, und zwar durch
> abstrakte Interpretation. RBS und TypeProf sind der erste Schritt in
> diese Zukunft. Weitere werden folgen. --- Matz

### RBS

RBS ist eine Sprache zur Beschreibung der Typen von Ruby-Programmen.

Typprüfungsprogramme wie TypeProf und andere Werkzeuge mit
RBS-Unterstützung werden mithilfe von RBS-Definitionen viel besser in
der Lage sein, Ruby-Programme zu verstehen.

Mit RBS ist es nun möglich, die Definitionen von Klassen und Modulen
zu beschreiben: Methoden der Klasse, Instanzvariablen und ihre Typen,
Vererbungs- und Mix-In-Beziehungen.

RBS soll übliche Ruby-Idiome unterstützen und erlauben, komplexe Typen
wie Union Types, überladene Methoden und Generics zu schreiben. RBS
unterstützt mithilfe von Schnittstellen-Typen (_Interface Types_) auch
Duck Typing.

Ruby 3.0 enthält das Gem `rbs`, das das Parsing und die Verarbeitung
von in RBS geschriebenen Typendefinitionen ermöglicht.

Nachfolgend ein kleines Beispiel von RBS mit Klassen-, Modul- und
Konstantendefinitionen.

``` rbs
module ChatApp
  VERSION: String
  class Channel
    attr_reader name: String
    attr_reader messages: Array[Message]
    attr_reader users: Array[User | Bot]              # `|` bedeutet Union Types, `User` or `Bot`.
    def initialize: (String) -> void
    def post: (String, from: User | Bot) -> Message   # Methodenüberladung wird unterstützt.
            | (File, from: User | Bot) -> Message
  end
end
```

Siehe die [README des rbs-Gems](https://github.com/ruby/rbs) für mehr Details.

### TypeProf

TypeProf ist ein Typanalysewerkzeug, das mit Ruby ausgeliefert wird.

Momentan fungiert TypeProf als eine Art automatisierte Typerkennung.

Es liest einfachen (nicht typenannotierten) Ruby-Code, analysiert,
welche Methoden darin definiert werden und wie sie genutzt werden,
und generiert den Prototyp einer Typensignatur im RBS-Format.

Nachfolgend eine einfache Demonstration von TypeProf.

Beispielhafte Eingabe:

``` ruby
# test.rb
class User
  def initialize(name:, age:)
    @name, @age = name, age
  end
  attr_reader :name, :age
end
User.new(name: "John", age: 20)
```

Beispielhafte Ausgabe:

```
$ typeprof test.rb
# Classes
class User
  attr_reader name : String
  attr_reader age : Integer
  def initialize : (name: String, age: Integer) -> [String, Integer]
end
```

Sie können TypeProf ausführen, indem Sie die Eingabe in der Datei
„test.rb“ speichern und das Kommando „typeprof test.rb“ ausführen.

Sie können [TypeProf online ausprobieren](https://mame.github.io/typeprof-playground/#rb=%23+test.rb%0Aclass+User%0A++def+initialize%28name%3A%2C+age%3A%29%0A++++%40name%2C+%40age+%3D+name%2C+age%0A++end%0A++%0A++attr_reader+%3Aname%2C+%3Aage%0Aend%0A%0AUser.new%28name%3A+%22John%22%2C+age%3A+20%29&rbs=).  (Dies führt TypeProf
serverseitig aus, daher bitten wir um Entschuldigung, falls es ausfällt).

Siehe [die TypeProf-Dokumentation](https://github.com/ruby/typeprof/blob/master/doc/doc.md) und die [Demos](https://github.com/ruby/typeprof/blob/master/doc/demo.md) für Details.

TypeProf ist experimentell und noch nicht recht fertig; es wird nur
eine Untermenge der Programmiersprache Ruby unterstützt und die
Erkennung von Typfehlern ist noch beschränkt. Es wird aber umfassend
weiterentwickelt, um die Sprachabdeckung, die Analyseperformanz und
die Benutzbarkeit zu verbessern. Jegliche Rückmeldungen sind sehr
willkommen.

## Sonstige erwähnenswerte neue Features

* Einzeiliges Pattern Matching (Musterabgleich) wurde neu gestaltet (experimentell).

    * `=>` wurde hinzugefügt. Es funktioniert wie eine rechtsseitige Zuweisung.

      ```ruby
      0 => a
      p a #=> 0

      {b: 0, c: 1} => {b:}
      p b #=> 0
      ```

    * `in` wurde geändert, sodass es `true` oder `false` zurückgibt.

      ```ruby
      # version 3.0
      0 in 1 #=> false

      # version 2.7
      0 in 1 #=> raise NoMatchingPatternError
      ```

* Find-Idiom wird eingeführt. (experimentell)

  ``` ruby
  case ["a", 1, "b", "c", 2, "d", "e", "f", 3]
  in [*pre, String => x, String => y, *post]
    p pre  #=> ["a", 1]
    p x    #=> "b"
    p y    #=> "c"
    p post #=> [2, "d", "e", "f", 3]
  end
  ```

* End-lose Methodendefinition wird eingeführt.

  ``` ruby
  def square(x) = x * x
  ```

* `Hash#except` ist jetzt eingebaut.

  ``` ruby
  h = { a: 1, b: 2, c: 3 }
  p h.except(:a) #=> {:b=>2, :c=>3}
  ```

* Memory View wird als experimentelles Feature eingeführt.

    * Dabei handelt es sich um eine neue C-API, die den Austausch roher
      Speicherabschnitte, wie ein numerisches Array oder Bitmap-Bilder,
      zwischen Erweiterungsbibliotheken (_C extensions_) ermöglichen
      soll. Die Erweiterungsbibliotheken können auch die Metadaten des
      betroffenen Speicherabschnitts wie etwa Schnitt, Elementformat
      usw. teilen. Mit dieser Art von Metadaten können
      Erweiterungsbibliotheken sogar mehrdimensionale Arrays
      ordnungsgemäß teilen. Dieses Feature orientiert sich an Pythons
      Buffer Protocol.


## Performanzverbesserungen

* Das Einfügen langer Code-Abschnitte in IRB ist 53-mal schneller als
  es mit Ruby 2.7.0 der Fall war. Beispielsweise reduziert sich die
  Zeit um [diesen Beispiel-Code](https://gist.github.com/aycabta/30ab96334275bced5796f118c9220b0b)
  einzufügen von 11,7 auf 0,22 Sekunden.


<video autoplay="autoplay" controls="controls" muted="muted" width="764" height="510" poster="https://cache.ruby-lang.org/pub/media/ruby-3.0-irb-highspeed.png">
  <source src="https://cache.ruby-lang.org/pub/media/ruby-3.0-irb-highspeed.mp4" type="video/mp4">
</video>


* Zu IRB wurde das Kommando `measure` hinzugefügt. Dieses erlaubt es, die Zeit einfacher Ausführungen zu messen.

  ```
  irb(main):001:0> 3
  => 3
  irb(main):002:0> measure
  TIME is added.
  => nil
  irb(main):003:0> 3
  processing time: 0.000058s
  => 3
  irb(main):004:0> measure :off
  => nil
  irb(main):005:0> 3
  => 3
  ```

## Sonstige erwähnenswerte Änderungen seit 2.7

* Schlüsselwortargumente werden von anderen Argumenten abgetrennt.
  * Grundsätzlich wird Code, der unter Ruby 2.7 eine Warnung erzeugte,
    nicht mehr funktionieren. Siehe dieses
    [Dokument](https://www.ruby-lang.org/de/news/2019/12/12/separation-of-positional-and-keyword-arguments-in-ruby-3-0/)
    für weitere Details.
  * Übrigens unterstützt Argumentweiterleitung jetzt auch vorangehende
    Argumente.

    ``` ruby
    def method_missing(meth, ...)
      send(:"do_#{ meth }", ...)
    end
    ```

* Musterabgleiche (`case`/`in`) sind nicht länger experimentell.
  * Siehe die
    [Pattern-Matching-Dokumentation](https://docs.ruby-lang.org/en/3.0/syntax/pattern_matching_rdoc.html)
    für weitere Informationen.
* Die Besonderheiten von `$SAFE` wurden vollständig entfernt.
  Es handelt sich nun um eine normale globale Variable.
* In Ruby 2.5 war die Reihenfolge der Backtraces umgekehrt worden.
  Diese Änderung ist rückgängig gemacht worden, d. h. die
  Fehlermeldung und die Nummer der Zeile, in der der Fehler auftrat,
  werden zuerst und die Aufrufer danach ausgegeben.
* Einige Standardbibliotheken wurden aktualisiert.
  * RubyGems 3.2.3
  * Bundler 2.2.3
  * IRB 1.3.0
  * Reline 0.2.0
  * Psych 3.3.0
  * JSON 2.5.1
  * BigDecimal 3.0.0
  * CSV 3.1.9
  * Date 3.1.0
  * Digest 3.0.0
  * Fiddle 1.0.6
  * StringIO 3.0.0
  * StringScanner 3.0.0
  * etc.
* Die folgenden Bibliotheken werden nicht länger mitgeliefert.
  Installieren Sie die entsprechenden Gems, um diese Features zu
  nutzen.
  * sdbm
  * webrick
  * net-telnet
  * xmlrpc
* Die folgenden Standardgems sind jetzt mitgelieferte Gems.
  * rexml
  * rss
* Die folgenden zur stdlib gehörenden Dateien sind nun Standardgems
  und werden auf rubygems.org veröffentlicht:
  * English
  * abbrev
  * base64
  * drb
  * debug
  * erb
  * find
  * net-ftp
  * net-http
  * net-imap
  * net-protocol
  * open-uri
  * optparse
  * pp
  * prettyprint
  * resolv-replace
  * resolv
  * rinda
  * set
  * securerandom
  * shellwords
  * tempfile
  * tmpdir
  * time
  * tsort
  * un
  * weakref
  * digest
  * io-nonblock
  * io-wait
  * nkf
  * pathname
  * syslog
  * win32ole

Siehe die [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
oder die [Commit-Logs](https://github.com/ruby/ruby/compare/v2_7_0...{{ release.tag }})
für weitere Informationen.

Mit diesen Änderungen wurden [{{ release.stats.files_changed }} Dateien geändert, {{ release.stats.insertions }} Einfügungen(+), {{ release.stats.deletions }} Löschungen(-)](https://github.com/ruby/ruby/compare/v2_7_0...{{ release.tag }}#file_bucket)
seit Ruby 2.7.0!

> Ruby 3.0 ist ein Meilenstein. Die Sprache entwickelt sich weiter und bewahrt doch die Kompatibilität. Aber es ist nicht vorbei. Ruby wird weiter fortschreiten und wird noch besser werden. Behalten Sie uns im Auge! --- Matz

Frohe Weihnachten, schöne Ferien, und viel Spaß bei der Programmierung mit Ruby 3.0!

## Download

* <{{ release.url.gz }}>

      SIZE: {{ release.size.gz }}
      SHA1: {{ release.sha1.gz }}
      SHA256: {{ release.sha256.gz }}
      SHA512: {{ release.sha512.gz }}

* <{{ release.url.xz }}>

      SIZE: {{ release.size.xz }}
      SHA1: {{ release.sha1.xz }}
      SHA256: {{ release.sha256.xz }}
      SHA512: {{ release.sha512.xz }}

* <{{ release.url.zip }}>

      SIZE: {{ release.size.zip }}
      SHA1: {{ release.sha1.zip }}
      SHA256: {{ release.sha256.zip }}
      SHA512: {{ release.sha512.zip }}

## Was ist Ruby

Ruby wurde zunächst 1993 von Matz (Yukihiro Matsumoto) entwickelt und
ist heute quelloffene Software. Es läuft auf mehreren Plattformen und
wird weltweit genutzt, insbesondere für die Webentwicklung.
