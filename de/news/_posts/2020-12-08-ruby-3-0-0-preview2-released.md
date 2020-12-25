---
layout: news_post
title: "Ruby 3.0.0 Preview 2 veröffentlicht"
author: "naruse"
translator: "Marvin Gülker"
date: 2020-12-08 00:00:00 +0000
lang: de
---

Wir freuen uns, die Veröffentlichung von Ruby 3.0.0-preview2
ankündigen zu können.

Sie führt eine Reihe neuer Features und Performanzverbesserungen ein.

## Statische Analyse

### RBS

RBS ist eine Sprache zur Beschreibung der Typen von Ruby-Programmen.

Typprüfungsprogramme wie TypeProf und andere Werkzeuge mit
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
    def post: (String, from: User | Bot) -> Message   # Methodenüberladung wird unterstützt
            | (File, from: User | Bot) -> Message
  end
end
```

Siehe die [README des rbs-Gem](https://github.com/ruby/rbs) für weitere Informationen.

### TypeProf

TypeProf ist ein Typanalysewerkzeug, das mit Ruby ausgeliefert wird.

Momentan fungiert TypeProf als eine Art Typenschnittstelle.

Es liest einfachen (nicht typenannotierten) Ruby-Code, analysiert
welche Methoden darin definiert werden und wie sie genutzt werden, und
generiert den Prototyp einer Typensignatur im RBS-Format.

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
„test.rb“ speichern und ein Kommando „typeprof test.rb“ ausführen.

Sie können [TypeProf online ausprobieren](https://mame.github.io/typeprof-playground/#rb=%23+test.rb%0Aclass+User%0A++def+initialize%28name%3A%2C+age%3A%29%0A++++%40name%2C+%40age+%3D+name%2C+age%0A++end%0A++%0A++attr_reader+%3Aname%2C+%3Aage%0Aend%0A%0AUser.new%28name%3A+%22John%22%2C+age%3A+20%29&rbs=). (Dies führt TypeProf
serverseitig aus, daher bitten wir um Entschuldigung, falls es ausfällt).

Siehe [die Dokumentation](https://github.com/ruby/typeprof/blob/master/doc/doc.md) und die [Demos](https://github.com/ruby/typeprof/blob/master/doc/demo.md) für Details.

TypeProf ist experimentell und noch nicht recht fertig; es wird nur
eine Untermenge der Programmiersprache Ruby unterstützt und die
Erkennung von Typfehlern ist noch beschränkt. Es wird aber umfassend
weiterentwickelt, um die Sprachabdeckung, die Analyseperformanz und
die Benutzerbarkeit zu verbessern. Jegliche Rückmeldung sind sehr
willkommen.

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
experimentell markiert ist und bei Erstellung eines Ractors mit
`Ractor.new` eine entsprechende Warnung ausgegeben wird.

Das folgende kleine Programm berechnet `n.prime?` (`n` ist ein relativ
großer Integer) parallel mit zwei Ractors. Sie werden feststellen,
dass die Programmausführung auf einem parallel arbeitenden Computer
etwa 2-mal so schnell ist wie das entsprechende sequentielle Programm.

``` ruby
require 'prime'
# n.prime? mit den zugesandten Integers in r1, r2 läuft parallel
r1, r2 = *(1..2).map do
  Ractor.new do
    n = Ractor.recv
    n.prime?
  end
end
# Verschicke Parameter
r1.send 2**61 - 1
r2.send 2**61 + 15
# Warte auf die Ergebnisse von expr1, expr2
p r1.take #=> true
p r2.take #=> true
```

Siehe [doc/ractor.md](https://github.com/ruby/ruby/blob/master/doc/ractor.md) für mehr Details.

## Fiber Scheduler

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
- `IO#wait`, `IO#read`, `IO#write` und verwandte Methoden (z.B. `#wait_readable`, `#gets`, `#puts` usw.).
- `IO#select` wird *nicht unterstützt*.

(Erkläre Async-Gem mit Links). Das folgende Beispielprogramm führt
mehrere HTTP-Anfragen nebenläufig aus:

(Erkläre das:)
1. async ist das äußere Gem
2. async nutzt das neue Feature

``` ruby
require 'async'
require 'net/http'
require 'uri'
Async do
  ["ruby", "python", "c"].each do |topic|
    Async do
      Net::HTTP.get(URI "https://www.google.com/search?q=#{topic}")
    end
  end
end
```

## Sonstige erwähnenswerte neue Features

* Einzeiliger Musterabgleich benutzt jetzt `=>` statt `in`.

    ``` ruby
    # version 3.0
    {a: 0, b: 1} => {a:}
    p a # => 0
    # version 2.7
    {a: 0, b: 1} in {a:}
    p a # => 0
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

* Das Einfügen langer Code-Abschnitte in IRB ist 53-mal schneller als
  es mit Ruby 2.7.0 der Fall war. Beispielsweise reduziert sich die
  Zeit, um [diesen Beispiel-Code](https://gist.github.com/aycabta/30ab96334275bced5796f118c9220b0b) einzufügen von 11,7 auf 0,22
  Sekunden.


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

* Die Besonderheiten von `$SAFE` wurde vollständig entfernt. Es
  handelt sich nun um eine normale globale Variable.```
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
* Die folgenden Standardgems sind jetzt mitgelieferte Gems.
  * rexml
  * rss
* Die folgenden zur stdlib gehörenden Dateien sind nun Standardgems
  und werden auf rubygems.org veröffentlicht:
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

Siehe die [NEWS](https://github.com/ruby/ruby/blob/v3_0_0_preview2/NEWS.md)
oder die [Commit-Logs](https://github.com/ruby/ruby/compare/v2_7_0...v3_0_0_preview2)
für mehr Details.

{% assign release = site.data.releases | where: "version", "3.0.0-preview2" | first %}

Mit diesen Änderungen wurden, [{{ release.stats.files_changed }} Dateien geändert, {{ release.stats.insertions }} Einfügungen(+), {{ release.stats.deletions }} Löschungen(-)](https://github.com/ruby/ruby/compare/v2_7_0...v3_0_0)
since Ruby 2.7.0!

Probieren Sie 3.0.0-preview2 und geben Sie uns Rückmeldung!

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
