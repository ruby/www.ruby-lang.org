---
layout: page
title: "Bibliotheken"
lang: de
---

Wie bei vielen anderen Programmiersprachen gibt es auch für Ruby
unzählige faszinierende und nützliche Bibliotheken.
{: .summary}

Die meisten stehen im praktischen **gem**-Format zur Verfügung.
[**RubyGems**][1] ist ein Paketsystem für Ruby, das die Erstellung,
Verbreitung und Installation von Bibliotheken ermöglicht.
(Es handelt sich um eine Art von Paketverwaltungssystem ähnlich
wie zum Beispiel `apt-get`, aber speziell für Ruby.)
Seit Ruby 1.9 ist RubyGems standardmäßig enthalten, bei früheren
Versionen von Ruby muss RubyGems [von Hand nachinstalliert][2] werden.

Andere Bibliotheken werden als gewöhnliches **Quelltext**-Archiv
angeboten (.zip oder .tar.gz). Hier kann der Installationsprozess
variieren, typischerweise gibt es eine `README`- oder `INSTALL`-Datei
mit Hinweisen.

Nun musst Du nur noch wissen, wie Du diese Bibliotheken finden
und installieren kannst.

### Bibliotheken finden

Die meisten Bibliotheken werden als Gems auf [**RubyGems.org**][1]
gehostet. Nach Bibliotheken kann direkt auf der Webseite oder mithilfe
des `gem`-Kommandos gesucht werden.

Mit `gem search -r` kann das RubyGems-Repository durchsucht werden.
Zum Beispiel liefert `gem search -r rails` eine Liste aller Gems, die
mit Rails zu tun haben. Mit der `--local`-Option (`-l`) würden die lokal
installierten Gems durchsucht werden. Ein Gem kann mit `gem install [gem]`
installiert werden. Die lokal installierten Gems können mit `gem list`
angezeigt werden. Mehr Informationen über den `gem`-Befehl finden sich
unten oder in der [RubyGems-Dokumentation][3].

Es gibt jedoch auch andere Quellen für Bibliotheken. [RubyForge][4]
war eine beliebte Anlaufstelle für Ruby-Bibliotheken, aber in den letzten
Jahren hat sich vor allem [**GitHub**][5] zu einem der wichtigsten
Repositories für Ruby-Projekte entwickelt. Sehr häufig findet auf GitHub
die Entwicklung einer Bibliothek statt, während die Veröffentlichung
als Gem auf RubyGems.org erfolgt.

[**The Ruby Toolbox**][6] (“Die Ruby-Werkzeugkiste”) ist ein Verzeichnis,
das die Suche nach freien Ruby-Projekten erleichtert.
Es verfügt über Kategorien für häufige Entwicklungsaufgaben und
sammelt zahlreiche Informationen über die Projekte, wie Release- und
Commit-Häufigkeit oder Abhängigkeiten. Die Projekte werden nach ihrer
Beliebtheit bei RubyGems.org und GitHub bewertet.
Die Suchfunktion erleichtert das Auffinden von geeigneten Projekten.

### Eine kleine Einführung in RubyGems

Hier folgt ein kurzer Überblick über den `gem`-Befehl für den täglichen
Gebrauch. Eine genaue Beschreibung aller Funktionen dieses Paketsystems
findet sich in RubyGems' [ausführlicher Dokumentation][7].

#### Gems suchen

Der Befehl **search** sucht nach Gems eines bestimmten Namens.
Um ein Gem zu finden, dessen Name mit “html” beginnt, gibst Du
beispielsweise Folgendes ein:

{% highlight sh %}
$ gem search -r html

*** REMOTE GEMS ***

html-sample (1.0, 1.1)
{% endhighlight %}

Der Parameter `--remote` / `-r` bewirkt, dass das offizielle Repository
bei RubyGems.org durchsucht wird (Standardverhalten).
Mit dem Parameter `--local` / `-l` wird eine Suche unter den lokal installierten
Gems durchgeführt.

#### Ein Gem installieren

Sobald Du weißt, welches Gem Du **installieren** willst (zum Beispiel
das beliebte Rails), gib Folgendes ein:

{% highlight sh %}
$ gem install rails
{% endhighlight %}

Du kannst sogar nur eine spezielle Version der Bibliothek installieren,
indem Du den Parameter `--version` / `-v` übergibst:

{% highlight sh %}
$ gem install rails --version 5.0
{% endhighlight %}

#### Alle Gems auflisten

Um eine **Liste** aller lokal installierten Gems zu erhalten,
verwende diesen Befehl:

{% highlight sh %}
$ gem list
{% endhighlight %}

Um eine komplette (und sehr lange) Liste aller Gems auf RubyGems.org
zu erhalten, verwende diesen Befehl:

{% highlight sh %}
$ gem list -r
{% endhighlight %}

#### Hilfe!

Hilfe ist verfügbar in Deinem Terminal:

{% highlight sh %}
$ gem help
{% endhighlight %}

Beispielsweise ist `gem help commands` sehr nützlich, das eine Liste
aller Kommandos des `gem`-Befehls ausgibt.

#### Eigene Gems erstellen

Auf RubyGems.org gibt es [verschiedene Anleitungen][3] für das Erstellen
eigener Gems.
Möglicherweise solltest Du Dir auch [Bundler][9] etwas genauer anschauen,
ein Werkzeug zur Verwaltung der Gem-Abhängigkeiten einer Ruby-Anwendung.



[1]: https://rubygems.org/
[2]: https://rubygems.org/pages/download/
[3]: http://guides.rubygems.org/
[4]: http://rubyforge.org/
[5]: https://github.com/
[6]: https://www.ruby-toolbox.com/
[7]: http://guides.rubygems.org/command-reference/
[9]: http://bundler.io/
