---
layout: page
title: "Bibliotheken"
lang: de
---

Es gibt unzählige faszinierende und nützliche Bibliotheken für Ruby, von
denen viele im praktischen *gem*-Format zur Verfügung stehen. Andere
Bibliotheken werden als gewöhnliches Archiv angeboten (.zip oder
.tar.gz). Nun musst du nur noch wissen, wie du diese Bibliotheken finden
und installieren kannst.

### Bibliotheken finden
{: #finding-libraries}

[**RubyForge**][1] ist eine beliebte Anlaufstelle für Ruby-Bibliotheken.
Ein guter Einstiegspunkt ist die [software map][2], in der die
Bibliotheken nach Themengebiet aufgelistet sind. Solltest du irgendwann
einmal eine eigene Bibliothek veröffentlichen wollen, kannst du dein
[Projekt bei RubyForge registrieren][3], um einen kostenlosen
Subversionzugang, Webspace sowie Mailinglisten zu bekommen.

Das [**Ruby Application Archive**][4] (kurz: RAA) ist ein Verzeichnis
von Ruby-Software aller Art, kategorisiert nach jeweiliger Funktion.
Momentan enthält die Kategorie [Database][5] die meisten Einträge, dicht
gefolgt von [Net][6]. [HTML][7] und [XML][8] sind ebenfalls sehr
beliebt. Es gibt sogar 4 Einträge unter [Physics][9]!

### RubyGems
{: #using-rubygems}

Der Windows-Installer enthält RubyGems bereits. Für die meisten anderen
Betriebssysteme muss es nachinstalliert werden. Eine Anleitung dazu
[findest du weiter unten](#installing-rubygems).

#### Gems suchen

Der Befehl **search** sucht nach Gems eines bestimmten Namens. Um ein
Gem zu finden, dessen Name das Wort “html” enthält, gibst du
beispielsweise Folgendes ein:

{% highlight sh %}
$ gem search html --remote

*** REMOTE GEMS ***

html-sample (1.0, 1.1)
{% endhighlight %}

(*Der Parameter `--remote` / `-r` bewirkt, dass die offiziellen Rubyforge-Gems
durchsucht werden.*)

#### Ein Gem installieren

Sobald du weißt, welches Gem du installieren willst, gib Folgendes ein:

{% highlight sh %}
$ gem install html-sample
{% endhighlight %}

Du kannst sogar nur eine spezielle Version der Bibliothek installieren,
indem du den Parameter `--version` übergibst:

{% highlight sh %}
$ gem install html-sample --version 1.0
{% endhighlight %}

#### Alle Gems auflisten

Um eine komplette Liste aller Gems auf Ruyforge zu erhalten, verwende
diesen Befehl:

{% highlight sh %}
$ gem list --remote
{% endhighlight %}

Um lediglich die Gems aufzulisten, die installiert sind, lass den
Parameter weg:

{% highlight sh %}
$ gem list
{% endhighlight %}

Weiterführende Informationen zur Verwendung von RubyGems findest du im
[**offiziellen Handbuch**][10], welches auch Beispiele enthält, wie du
Gems in deinen Ruby-Skripten verwenden kannst.

### RubyGems installieren
{: #installing-rubygems}

Um RubyGems zu installieren musst du zunächst die [aktuelle Version von
RubyGems herunterladen](http://rubyforge.org/frs/?group_id=126). Entpacke
das Archiv und führe das enthaltene Skript `setup.rb` aus. Unter manchen
Betriebssystemen könnte es sein, dass du das mit Root-Privilegien tun
musst.

Unter Linux zum Beispiel folgendermaßen:

{% highlight sh %}
$ tar xzvf rubygems-0.9.0.tar.gz
$ cd rubygems-0.9.0
$ su -
$ ruby setup.rb
{% endhighlight %}

Wenn du weitere Hilfe benötigst, wirf einen Blick auf das [**Kapitel
über die Installation**][11] im RubyGems-Handbuch.



[1]: http://rubyforge.org/
[2]: http://rubyforge.org/softwaremap/trove_list.php
[3]: http://rubyforge.org/register/
[4]: http://raa.ruby-lang.org/
[5]: http://raa.ruby-lang.org/cat.rhtml?category_major=Library;category_minor=Database
[6]: http://raa.ruby-lang.org/cat.rhtml?category_major=Library;category_minor=Net
[7]: http://raa.ruby-lang.org/cat.rhtml?category_major=Library;category_minor=HTML
[8]: http://raa.ruby-lang.org/cat.rhtml?category_major=Library;category_minor=XML
[9]: http://raa.ruby-lang.org/cat.rhtml?category_major=Library;category_minor=Physics
[10]: http://rubygems.org/read/chapter/1
[11]: http://rubygems.org/read/chapter/3
