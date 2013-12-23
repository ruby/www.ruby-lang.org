---
layout: page
title: "Ruby herunterladen"
lang: de
---

Hier kannst Du die aktuellen Ruby-Distributionen herunterladen.
Die stabile Version ist derzeit {{ site.downloads.stable.version }}.
Bitte nimm auch [Rubys Lizenz]({{ site.license.url }}) zur Kenntnis.
{: .summary}

### Drei Möglichkeiten, Ruby zu installieren

Man kann Ruby auf vielen verschiedenen Wegen erhalten und jeder Nutzer
zieht eine Methode einer anderen aus bestimmten Gründen vor. Jede wird
im Folgenden kurz vorgestellt, aber hier ist eine Übersicht:

* **Kompilierung aus dem Quellcode** ist der Standard, nach dem Software
  seit vielen, vielen Jahren verteilt wird. Die meisten
  Softwareentwickler werden sich damit auskennen.
* Es gibt ein paar **Drittanbieter-Werkzeuge**, um Ruby zu installieren.
  Oft sind diese einfacher zu benutzen, sowohl für Neueinsteiger als auch
  für weit fortgeschrittene Nutzer.
* Schließlich unterstützen auch einige **Paketmanagement-Systeme** Ruby.
  Diese Methode wird denen am meisten gefallen, die ein einziges
  Betriebssystem für alles nutzen und dessen jeweiligen Richtlinien
  folgen möchten.

Möchte man mehrere verschiedene Ruby-Versionen auf demselben Computer
betreiben, sollte man sich unten über die Drittanbieter-Werkzeuge
informieren und RVM benutzen. Dies ist die beste Möglichkeit,
solange man nicht ganz genau weiß, was man tut.

### Ruby-Quellcode

Ruby aus dem Quellcode zu installieren ist eine geeignete Lösung, wenn
Du Dich gut mit Deinem System auskennst und eventuell spezielle
Einstellungen für Deine Umgebung benötigst. Es ist außerdem eine gute
Lösung, falls es keine vorgefertigten Pakete für Dein System gibt.

Falls es Schwierigkeiten beim Kompilieren geben sollte, solltest Du
vielleicht zu einem Drittanbieter-Werkzeug greifen, siehe nächster Abschnitt.

* [Ruby {{ site.downloads.stable.version }}][1]
  (md5:&nbsp;{{ site.downloads.stable.md5.gz }}) stabile Version
* [Ruby {{ site.downloads.previous.version }}][2]
  (md5:&nbsp;{{ site.downloads.previous.md5.gz }}) stabile Vorgängerversion
* [Stable Snapshot][3] Hierbei handelt es sich um den neuesten Snapshot
  des stabilen Zweiges (ruby\_2\_0\_0).
* [Nightly Snapshot][4] Hierbei handelt es sich um eine Kopie der SVN-Version
  von letzter Nacht. Es besteht durchaus die Gefahr, dass in dieser Version
  noch nicht korrigierte Fehler enthalten sind.

Weitergehende Informationen zum Subversion- und Git-Repository von Ruby
sind unter [Ruby Core](/en/community/ruby-core/) zu finden.

### Drittanbieter-Werkzeuge

Viele Rubyisten benutzen Drittanbieter-Werkzeuge, um Ruby zu installieren.
Sie bieten verschiedene Vorteile, werden aber nicht offiziell unterstützt.
Nichtsdestotrotz sind ihre jeweiligen Communities sehr hilfsbereit.

#### RVM

Das bekannteste Ruby-Installationswerkzeug ist **RVM** („Ruby Version
Manager“). Es erlaubt nicht nur, Ruby sehr einfach zu installieren,
sondern unterstützt auch die Installation und Verwaltung verschiedener
Versionen und Implementierungen von Ruby auf einem System.

RVM steht nur für Linux, Max OS X und andere UNIX-ähnliche
Betriebssysteme zur Verfügung. Windows-Nutzer sollten sich [pik][5]
für ein ähnliches Projekt anschauen oder den unten beschriebenen
RubyInstaller verwenden.

Zum Zeitpunkt des Verfassens dieses Textes kann RVM wie folgt
installiert werden:

{% highlight sh %}
$ \curl -L https://get.rvm.io | bash -s stable --ruby
{% endhighlight %}

Die aktuellsten Installationsanweisungen für RVM können auf der
[Installationsseite von RVM][7] nachgelesen werden. Der obige Befehl
installiert sowohl RVM als auch die neueste Version von Ruby.
Mit RVM können außerdem die meisten der weiter unten aufgelisteten
Ruby-Implementierungen installiert werden. Die unterstützten Versionen
können mit `rvm list known` angezeigt werden.

#### RubyInstaller

Für Windows-Nutzer hat sich die Installation mithilfe des
[RubyInstallers][8] etabliert, der alle notwendigen Tools für die
Rubyentwicklung unter Windows mitbringt.

Um RubyInstaller zu nutzen, muss man ihn nur von der
[RubyInstaller-Downloadseite][9] herunterladen und starten. Fertig!

Speziell für die Nutzung von Rails unter Windows gibt es den
[RailsInstaller][10]. Dieser baut auf dem RubyInstaller auf, enthält
aber noch einige weitere Werkzeuge, die die Entwicklung mit Rails
vereinfachen.

### Paketverwaltungssysteme

Wenn Du Ruby nicht kompilieren kannst und auch kein Drittanbieter-Werkzeug
verwenden möchtest, so kann Ruby auch mit dem Paketverwaltungssystem
Deines Betriebssystems installiert werden.

Einige Mitglieder der Ruby-Community vertreten vehement die Ansicht, dass
man Ruby nie mithilfe eines Paketverwaltungssystems installieren sollte,
sondern lieber RVM nutzen sollte. Eine vollständige Diskussion der Vor-
und Nachteile würde den Rahmen dieses Überblicks sprengen, der wichtigste
Grund ist, dass die meisten Paketverwaltungen ältere Ruby-Versionen
in ihren Paketquellen haben. Um die neueste Version zu erhalten sollte
man auf den korrekten Paketnamen achten, oder stattdessen RVM nutzen.

#### Ruby unter Linux

Unter Debian oder Ubuntu wird `apt` als Paketverwaltung genutzt,
Ruby lässt sich damit folgendermaßen installieren:

{% highlight sh %}
$ sudo apt-get install ruby1.9.1
{% endhighlight %}

Es handelt sich hierbei tatsächlich um Ruby 1.9.2 oder neuer,
die "1.9.1" steht für die sogenannte "library compatibility version".

Mit dem „ruby“-Paket wird abhängig von der Linux-Distribution
unter Umständen Ruby 1.8 installiert.

Unter Arch Linux lässt sich Ruby mithilfe von pacman so installieren:

{% highlight sh %}
$ sudo pacman -S ruby
{% endhighlight %}

Auf anderen Distributionen sollte eine Suche in den Paketquellen des
jeweiligen Paketverwaltungssystems helfen, alternativ könnte RVM
das Mittel der Wahl sein.

#### Ruby unter OS X

Ruby 1.8.7 wird von Macintosh OS X Lion genauso vollständig unterstützt
wie viele bekannte RubyGems (Pakete). Genauere Informationen gibt es im
[RubyWiki bei Mac OS Forge][11].

Max OS X Tiger kommt mit der Ruby-Version 1.8.2 und Leopard mit 1.8.6,
aber für die, die noch nicht auf Leopard aktualisiert haben, gibt es
mehrere Möglichkeiten, die neueste Ruby-Version zu installieren.

Viele Anwender benutzen unter Mac OS X [Homebrew][12] als Paketmanager:

{% highlight sh %}
$ brew install ruby
{% endhighlight %}

Da OS X auf UNIX basiert, ist aber auch die Installation aus dem
Quellcode genauso einfach und effektiv wie die anderen Möglichkeiten;
selbstverständlich ist es auch möglich, RVM zu benutzen. Der Befehl
`rvm notes` gibt systemspezifische Informationen aus.

Eine genaue Beschreibung der Installation von Ruby (und Rails) findet
sich in Dan Benjamins Artikeln zu [Tiger][13], [Leopard][14] und [Snow
Leopard][15]. Für Lion mag [dieser Artikel][16] hilfreich sein.

#### Ruby unter Solaris und OpenIndiana

Ruby 1.8.7 ist für Solaris 8 bis Solaris 10 unter [Sunfreeware][17]
verfügbar und Ruby 1.8.7 ist bei [Blastwave][18] erhältlich.
Ruby 1.9.2-p0 kann ebenfalls bei [Sunfreeware][17] gefunden werden,
jedoch ist diese Version veraltet.
Die neueste Version kann mit RVM installiert werden.

Um Ruby unter [OpenIndiana][19] zu installieren, sollte man das [Image
Packaging System][20], IPS, verwenden. Damit werden die neuesten
Ruby-Binaries (1.9) und RubyGems direkt aus dem OpenSolaris-Repository
installiert:

{% highlight sh %}
$ pkg install runtime/ruby-18
{% endhighlight %}

Selbstverständlich kann man auch hier RVM verwenden.

### Alternative Ruby-Implementierungen

Ruby als Sprache hat einige verschiedene Implementierungen. Diese
Anleitung diskutiert die Referenzimplementierung **MRI** („Matz’
Ruby-Interpreter“) oder **CRuby**, es gibt aber noch einige weitere.
Oftmals sind diese in bestimmten Situationen nützlich, stellen spezielle
Sprach- oder Umgebungsintergration zur Verfügung oder haben einfach
spezielle Features, die MRI nicht hat.

Hier ist eine Liste:

* [JRuby][21] ist ein Ruby auf der JVM (Java Virtual Machine), das von
  den optimierenden JIT-Compilern der JVM, ihrem Garbage Collector,
  nebenläufigen Threads, diversen Tools und einer immensen Menge an
  Programmbibliotheken profitiert.
* [Rubinius][22] ist ein „Ruby geschrieben in Ruby“. Aufgebaut auf der
  LLVM stellt Rubinius eine gute virtuelle Maschine zur Verfügung, auf
  der sogar andere Sprachen aufbauen. Ebenso wie JRuby besitzt es echt
  nebenläufige Threads, ist jedoch im Gegensatz zu diesem kompatibel zur
  C-API des MRI.
* [MacRuby][23] ist stark integriert in Apples Cocoa-Framework für Mac
  OS X, was ein leichtes Erstellen von Desktopanwendungen für Mac OS X
  ermöglicht.
* [mruby][mruby] ist eine schlanke Ruby-Implementierung, die
  gelinkt und in Anwendungen eingebunden werden kann.
  Die Entwicklung von mruby wird von Yukihiro “Matz” Matsumoto geleitet,
  dem Schöpfer von Ruby.
* [IronRuby][26] integriert sich gut in die .NET-Plattform.
* [MagLev][27] definiert sich selbst als „eine schnelle, stabile
  Ruby-Implementierung mit integrierter Objektpersistenz und verteiltem
  Shared Cache“.
* [Cardinal][24] ist ein „Ruby-Compiler für die
  [Parrot Virtual Machine][25]“ (Perl 6).

Einige der genannten Implementierungen, MRI eingeschlossen, folgen den
Richtlinien von [RubySpec][28], einer „kompletten ausführbaren
Spezifikation für die Programmiersprache Ruby“.



[1]: {{ site.downloads.stable.url.gz }}
[2]: {{ site.downloads.previous.url.gz }}
[3]: {{ site.downloads.stable_snapshot.url.gz }}
[4]: {{ site.downloads.nightly_snapshot.url.gz }}
[5]: https://github.com/vertiginous/pik
[7]: https://rvm.io/rvm/install/
[8]: http://rubyinstaller.org/
[9]: http://rubyinstaller.org/downloads/
[10]: http://railsinstaller.org/
[11]: http://trac.macosforge.org/projects/ruby/wiki
[12]: http://brew.sh/
[13]: http://hivelogic.com/articles/ruby-rails-mongrel-mysql-osx
[14]: http://hivelogic.com/articles/ruby-rails-leopard
[15]: http://hivelogic.com/articles/compiling-ruby-rubygems-and-rails-on-snow-leopard/
[16]: http://intridea.com/2011/7/26/setting-up-ruby-dev-on-lion?blog=company
[17]: http://www.sunfreeware.com
[18]: http://www.blastwave.org
[21alt]: http://cooltools.sunsource.net/coolstack
[19]: http://openindiana.org
[20]: http://opensolaris.org/os/project/pkg
[21]: http://jruby.org
[22]: http://rubini.us
[23]: http://www.macruby.org
[mruby]: https://github.com/mruby/mruby
[24]: https://github.com/parrot/cardinal
[25]: http://parrot.org
[26]: http://www.ironruby.net
[27]: http://ruby.gemstone.com
[28]: http://rubyspec.org
