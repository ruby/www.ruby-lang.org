---
layout: news_post
title: "Durch ungültiges NUL-Zeichen werden unabsichtlich Dateien erzeugt (CVE-2012-4522)"
author: "Quintus"
lang: de
---

Es wurde eine Sicherheitslücke in den Dateierstellungsroutinen gefunden,
die es erlaubt, unbeabsichtigt Dateien zu erstellen, indem man
`NUL`-Zeichen in den Dateipfad einfügt.
Dieser Sicherheitslücke wurde die CVE-Nummer CVE-2012-4522 zugewiesen.

## Details

Ruby kann beliebige Binärsequenzen als Strings behandeln, eingeschlossen
`NUL`-Zeichen. Betriebssysteme und andere Programmbibliotheken können
das allerdings nicht immer und behandeln ein `NUL`-Zeichen als
Kennzeichen für das Ende eines Strings, weswegen bei der Interaktion mit
solchen Bibliotheken in Ruby `NUL`-Zeichen nach Möglichkeit vermieden
werden sollten.

Einige Methoden wie etwa [IO#open][1] überprüften den ihnen übergebenen
Dateinamen bisher allerdings nicht auf solche Zeichen, sondern gaben ihn
direkt an die unterliegenden Lowlevel-Routinen weiter, was zur
unbeabsichtigten Erstellung von Dateien etwa wie folgt führen kann:

{% highlight ruby %}
p File.exists?("foo")      #=> false
open("foo\0bar", "w") { |f| f.puts "hai" }
p File.exists?("foo")      #=> true
p File.exists?("foo\0bar") #=> wirft ArgumentError
{% endhighlight %}

## Betroffene Versionen

* Alle 1.9.3-Releases vor Patchlevel 286
* Alle Entwicklungszweige von Ruby 2 vor Revision r37163

## Lösung

Auf die neuste Version aktualisieren.

## Dank

Der Vorfall wurde von Peter Bex gemeldet.

## Updates

* CVE-Nummer ergänzt am 2012-10-16 08:58:51 JST.
* Erstveröffentlichung des [Orignalbeitrags][2]\: 2012-10-12 19:19:55
  JST.



[1]: http://www.ruby-doc.org/core-1.9.3/IO.html#method-c-popen
[2]: {{ site.url }}/en/news/2012/10/12/poisoned-NUL-byte-vulnerability/
