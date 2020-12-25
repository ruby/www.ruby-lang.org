---
layout: news_post
title: "Ruby 3.0.0 Preview 1 veröffentlicht"
author: "naruse"
translator: "Marvin Gülker"
date: 2020-09-25 00:00:00 +0000
lang: de
---

Wir freuen uns, die Veröffentlichung von Ruby 3.0.0-preview1
ankündigen zu können.

Sie führt eine Reihe neuer Features und Performanzverbesserungen ein.

## RBS

Mithilfe von RBS lassen sich die Typen eines Ruby-Programms
beschreiben.
Typprüfungsprogramme wie type-profiler und andere Werkzeuge mit
RBS-Unterstützung werden mithilfe von RBS-Definitionen viel besser in
der Lage sein, Ruby-Programme zu verstehen.

Mit RBS ist es nun möglich, die Definitionen von Klassen und Modulen
zu beschrieben: Methoden der Klasse, Instanzvariablen und ihre Typen,
Vererbungs- und Mix-In-Beziehungen.

RBS soll übliche Ruby-Idiome unterstützen und erlauben, komplexe Typen
wie Union Types, überladene Methoden und Generics zu schreiben. RBS
unterstützt mithilfe von Schnittstellen-Typen (_Interface Types_) auch
Duck Typing.

Ruby 3.0 enthält das Gem `rbs`, das das Parsing und die Verarbeitung
von in RBS geschriebenen Typendefinitionen ermöglicht.

Nachfolgend ein kleines Beispiel von RBS.

``` rbs
module ChatApp
  VERSION: String

  class Channel
    attr_reader name: String
    attr_reader messages: Array[Message]
    attr_reader users: Array[User | Bot]              # `|` bedeutet Union Types, `User` oder `Bot`.

    def initialize: (String) -> void

    def post: (String, from: User | Bot) -> Message   # Methodenüberladung wird unterstützt.
            | (File, from: User | Bot) -> Message
  end
end
```

Siehe die [README des rbs-Gem](https://github.com/ruby/rbs) für weitere Informationen.

## Ractor (experimentell)

Ractor ist eine dem Aktorenmodell ähnliche Abstraktion für
Nebenläufigkeit, um die parallele Ausführung von Code bei
gleichzeitiger Beachtung von Thread-Sicherheit zu ermöglichen.

Sie können mehrere Ractors anlegen und sie parallel ausführen. Ractor
ermöglicht es, thread-sichere parallele Programme zu schreiben, weil
sich Ractors normale Objekte nicht teilen können. Die Kommunikation
zwischen Ractors wird stattdessen über Nachrichten abgewickelt.

Um das Teilen von Objekten zu begrenzen, führt Ractor einige
Beschränkungen für Rubys Syntax ein (die allerdings nicht eingreifen,
wenn nicht mehrere Ractors verwendet werden).

Die Spezifikation und Implementation sind noch nicht abgeschlossen und
können sich in Zukunft noch ändern, weshalb dieses Feature als
experimentell markiert ist und bei Erstellung eines Ractors eine
entsprechende Warnung ausgegeben wird.

Das folgende kleine Programm berechnet `prime?` parallel mit zwei
Ractors und ist, wenn zwei oder mehr Prozessorkerne vorhanden sind,
damit etwa 2-mal so schnell wie ein sequentielles Programm.

``` ruby
require 'prime'

# n.prime? wird mit den gesendeten Integern in r1, r2 parallel ausgeführt
r1, r2 = *(1..2).map do
  Ractor.new do
    n = Ractor.recv
    n.prime?
  end
end

# Parameter abschicken
r1.send 2**61 - 1
r2.send 2**61 + 15

# Warte auf die Ergebnisse von expr1, expr2
p r1.take #=> true
p r2.take #=> true
```

Siehe [doc/ractor.md](https://github.com/ruby/ruby/blob/master/doc/ractor.md) für weitere Informationen.

## Scheduler (Experimentell)

Zur Unterbrechung blockender Operationen wird `Thread#scheduler`
eingeführt. Das ermöglicht leichtgewichtige Nebenläufigkeit ohne
Änderungen bestehenden Codes.

Momentan unterstützte Klassen/Methoden:

- `Mutex#lock`, `Mutex#unlock`, `Mutex#sleep`
- `ConditionVariable#wait`
- `Queue#pop`, `SizedQueue#push`
- `Thread#join`
- `Kernel#sleep`
- `IO#wait`, `IO#read`, `IO#write` und verwandte Methoden (z.B. `#wait_readable`, `#gets`, `#puts` usw.).
- `IO#select` wird *nicht unterstützt*.

Der momentane Eintrittspunkt für Nebenläufigkeit ist
`Fiber.schedule{...}`. Das kann sich aber bis zur Veröffentlichung von
Ruby 3 noch ändern.

Mit [`Async::Scheduler`](https://github.com/socketry/async/pull/56) steht ein Test-Scheduler zur Verfügung.
Siehe [`doc/scheduler.md`](https://github.com/ruby/ruby/blob/master/doc/scheduler.md) für weitere Informationen. [Feature #16786]

**ACHTUNG**: Diese Feature ist sehr experimentell. Sowohl der Name als
auch das Feature selbst werden sich in der nächsten
Vorschau-Veröffentlichung ändern.

## Sonstige erwähnenswerte neue Features

* Rechtsbündige Zuweisungsanweisung wird eingeführt.

  ``` ruby
  fib(10) => x
  p x #=> 55
  ```

* End-lose Methodendefinition wird eingeführt.

  ``` ruby
  def square(x) = x * x
  ```

* Find-Idiom wird eingeführt.

  ``` ruby
  case ["a", 1, "b", "c", 2, "d", "e", "f", 3]
  in [*pre, String => x, String => y, *post]
    p pre  #=> ["a", 1]
    p x    #=> "b"
    p y    #=> "c"
    p post #=> [2, "d", "e", "f", 3]
  end
  ```

* `Hash#except` ist jetzt eingebaut.

  ``` ruby
  h = { a: 1, b: 2, c: 3 }
  p h.except(:a) #=> {:b=>2, :c=>3}
  ```

* Memory View wird als experimentelles Feature eingeführt.

    * Dabei handelt es sich um ein neues C-API, das den Austausch roher
      Speicherabschnitte, wie ein numerisches Array oder Bitmap-Bilder,
      zwischen Erweiterungsbibliotheken (_C extensions_) ermöglichen
      soll. Die Erweiterungsbibliotheken können auch die Metadaten des
      betroffenen Speicherabschnitts wie etwa Schnitt, Elementformat
      usw. teilen. Mit dieser Art von Metadaten können
      Erweiterungsbibliotheken sogar mehrdimensionale Arrays
      ordnungsgemäß teilen. Dieses Feature orientiert sich an Pythons
      Buffer Protocol.


## Performanzverbesserungen

* Es gab viele Verbesserungen im MJIT. Siehe die NEWS für Details.

## Sonstige erwähnenswerte Änderungen seit 2.7

* Schlüsselwortargumente werden von anderen Argumenten abgetrennt.

  * Grundsätzlich wird Code, der unter Ruby 2.7 eine Warnung erzeugte,
    nicht mehr funktionieren. Siehe dieses [Dokument](https://www.ruby-lang.org/de/news/2019/12/12/separation-of-positional-and-keyword-arguments-in-ruby-3-0/) für weitere
    Details.
  * Übrigens unterstützt Argumentweiterleitung jetzt auch vorangehende
    Argumente.

    ``` ruby
    def method_missing(meth, ...)
      send(:"do_#{ meth }", ...)
    end
    ```

* Die Besonderheiten von `$SAFE` wurde vollständig entfernt. Es
  handelt sich nun um eine normale globale Variable.

* In Ruby 2.5 war die Reihenfolge der Backtraces umgekehrt worden.
  Diese Änderung ist rückgängig gemacht worden, d.h. die
  Fehlermeldung und die Nummer der Zeile, in der der Fehler auftrat,
  werden zuerst und die Aufrufer danach ausgegeben.

* Einige Standardbibliotheken wurden aktualisiert.
  * RubyGems 3.2.0.rc.1
  * Bundler 2.2.0.rc.1
  * IRB 1.2.6
  * Reline 0.1.5

* Die folgenden Bibliotheken werden nicht länger mitgeliefert.
  Installieren Sie die entsprechenden Gems, um diese Features zu
  nutzen.
  * net-telnet
  * xmlrpc

* Die folgenden Standardbibliotheken werden zu mitgelieferten Gems
  aufgewertet.
  * rexml
  * rss

* Werte die stdlib zu mitgelieferten Gems auf. Die folgenden Gems
  wurden auf rubygems.org veröffentlicht:
  * abbrev
  * base64
  * English
  * erb
  * find
  * io-nonblock
  * io-wait
  * net-ftp
  * net-http
  * net-imap
  * net-protocol
  * nkf
  * open-uri
  * optparse
  * resolv
  * resolv-replace
  * rinda
  * securerandom
  * set
  * shellwords
  * tempfile
  * time
  * tmpdir
  * tsort
  * weakref

Siehe die [NEWS](https://github.com/ruby/ruby/blob/v3_0_0_preview1/NEWS.md) oder die [commit logs](https://github.com/ruby/ruby/compare/v2_7_0...v3_0_0_preview1) für weitere Details.

{% assign release = site.data.releases | where: "version", "3.0.0-preview1" | first %}

Mit diesen Änderungen wurden [{{ release.stats.files_changed }} Dateien geändert, {{ release.stats.insertions }} Einfügungen(+), {{ release.stats.deletions }} Löschungen(-)](https://github.com/ruby/ruby/compare/v2_7_0...v3_0_0_preview1)
seit Ruby 2.7.0!

Bitte probieren Sie Ruby 3.0.0-preview1 aus und geben Sie uns Rückmeldung!

## Download

* <{{ release.url.bz2 }}>

      SIZE: {{ release.size.bz2 }}
      SHA1: {{ release.sha1.bz2 }}
      SHA256: {{ release.sha256.bz2 }}
      SHA512: {{ release.sha512.bz2 }}

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

## 3.0.0-preview2 Vorankündigung

Wir planen, ["type-profiler"](https://github.com/mame/ruby-type-profiler), ein Feature zur statischen Typanalyse, mitzuliefern. Wir halten Sie auf dem Laufenden!

## Was ist Ruby

Ruby wurde zunächst 1993 von Matz (Yukihiro Matsumoto) entwickelt und
ist heute quelloffene Software. Es läuft auf mehreren Plattformen und
wird weltweit genutzt, insbesondere für die Webentwicklung.
