---
layout: page
title: "Bibliotheken"
lang: de
---

Wie bei vielen anderen Programmiersprachen gibt es auch für Ruby
unzählige faszinierende und nützliche Bibliotheken.

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

## Bibliotheken finden

Die meisten Bibliotheken werden als Gems auf [**RubyGems.org**][3]
gehostet. Nach Bibliotheken kann direkt auf der Webseite oder mithilfe
des `gem`-Kommandos gesucht werden.

Mit `gem search -r` kann das RubyGems-Repository durchsucht werden.
Zum Beispiel liefert `gem search -r rails` eine Liste aller Gems, die
mit Rails zu tun haben. Mit der `--local`-Option (`-l`) würden die lokal
installierten Gems durchsucht werden. Ein Gem kann mit `gem install [gem]`
installiert werden. Die lokal installierten Gems können mit `gem list`
angezeigt werden. Mehr Informationen über den `gem`-Befehl finden sich
unten oder in der [RubyGems-Dokumentation][1].

Es gibt jedoch auch andere Quellen für Bibliotheken. [RubyForge][4]
war eine beliebte Anlaufstelle für Ruby-Bibliotheken, aber in den letzten
Jahren hat sich vor allem [**GitHub**][5] zu einem der wichtigsten
Repositories für Ruby-Projekte entwickelt. Sehr häufig findet auf GitHub
die Entwicklung einer Bibliothek statt, während die Veröffentlichung
als Gem auf RubyGems.org erfolgt.

Das [Ruby Application Archive][6] (kurz: RAA) ist ein Verzeichnis
von Ruby-Software aller Art, kategorisiert nach jeweiliger Funktion.
Es wird jedoch nicht mehr so stark genutzt.

## Eine kleine Einführung in RubyGems

Hier folgt ein kurzer Überblick über den `gem`-Befehl für den täglichen
Gebrauch. Eine genaue Beschreibung aller Funktionen dieses Paketsystems
findet sich in RubyGems' [ausführlicher Dokumentation][7].

### Gems suchen

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

### Ein Gem installieren

Sobald Du weißt, welches Gem Du **installieren** willst (zum Beispiel
das beliebte Rails), gib Folgendes ein:

{% highlight sh %}
$ gem install rails
{% endhighlight %}

Du kannst sogar nur eine spezielle Version der Bibliothek installieren,
indem Du den Parameter `--version` / `-v` übergibst:

{% highlight sh %}
$ gem install rails --version 3.0
{% endhighlight %}

### Alle Gems auflisten

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

### Hilfe!

Hilfe ist verfügbar in Deinem Terminal:

{% highlight sh %}
$ gem help
{% endhighlight %}

Beispielsweise ist `gem help commands` sehr nützlich, das eine Liste
aller Kommandos des `gem`-Befehls ausgibt.

### Eigene Gems erstellen

Auf RubyGems.org gibt es [verschiedene Anleitungen][8] für das Erstellen
eigener Gems.
Möglicherweise solltest Du Dir auch [Bundler][9] etwas genauer anschauen,
ein Werkzeug zur Verwaltung der Gem-Abhängigkeiten einer Ruby-Anwendung.



[1]: http://docs.rubygems.org
[2]: http://rubygems.org/pages/download
[3]: http://rubygems.org
[4]: http://rubyforge.org/
[5]: http://github.com
[6]: http://raa.ruby-lang.org/
[7]: http://docs.rubygems.org/
[8]: http://guides.rubygems.org
[9]: http://gembundler.com
