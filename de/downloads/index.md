---
layout: page
title: "Ruby herunterladen"
lang: de
---

Hier kannst du die aktuellen Ruby-Distributionen herunterladen. Die
stabile Version ist derzeit {{ site.downloads.stable.version }}.
Bitte nimm auch [Rubys Lizenz][1] zur Kenntnis.

### Drei Möglichkeiten, Ruby zu installieren

Man kann Ruby auf vielen verschiedenen Wegen erhalten und jeder einzelne
zieht eine Methode einer anderen aus bestimmten Gründen vor. Jede wird
im Folgenden kurz vorgestellt, aber hier ist eine Übersicht:

* Kompilierung aus dem Quellcode ist der Standard, nach dem Software
  seit vielen, vielen Jahren verteilt wird. Die meisten
  Softwareentwickler werden sich damit auskennen.
* Es gibt ein paar Drittanbieter-Werkzeuge, um Ruby zu installieren.
  Meistens sind diese für frühe Anfänger und weit fortgeschrittene
  Nutzer am einfachsten zu benutzen.
* Schließlich unterstützen auch einige Paketmanagement-Systeme Ruby.
  Diese Methode wird den Leuten am meisten gefallen, die ein einziges
  Betriebssystem für alles nutzen und dessen jeweiligen Richtlinien
  folgen möchten.

Möchte man mehrere verschiedene Ruby-Versionen auf demselben Computer
betreiben, sollte man sich über die Drittanbieter-Werkzeuge unten
einlesen und RVM oder Pik benutzen, solange man nicht ganz genau weiß,
was man tut.

### Ruby-Quellcode

Ruby aus dem Quellcode zu installieren ist eine geeignete Lösung, wenn
du dich gut mit deinem System auskennst und eventuell spezielle
Einstellungen für deine Umgebung benötigst. Es ist außerdem eine gute
Lösung, falls es keine vorgefertigten Pakete für dein System gibt.

* [Ruby {{ site.downloads.stable.version }}][2]
  (md5:&nbsp;{{ site.downloads.stable.md5 }}) stabile Version (*empfohlen*)
* [Stable Snapshot][3] Bei diesem Snapshot handelt es sich um die
  absolut letzte stabile SVN-Version. Sie sollte etwas stabiler sein als
  das letzte Release.
* [Nightly Snapshot][4] Bei diesem Snapshot handelt es sich um eine
  Kopie von letzter Nacht. Es besteht durchaus die Gefahr, dass in
  dieser noch nicht korrigierte Fehler enthalten sind.

Weitergehende Informationen zum Subversion- und Git-Repository von Ruby
sind unter [Ruby Core](/en/community/ruby-core/) zu finden.

### Drittanbieter-Werkzeuge

Viele Rubyisten benutzen Drittanbietersoftware, um ihr Ruby zu
installieren. Sie bieten verschieden Vorteile, werden aber dafür nicht
offiziell unterstützt. Nichtsdestotrotz sind ihre jeweiligen Communities
sehr hilfsbereit.

#### RubyInstaller

Für Windows-Nutzer hat sich die Installation mithilfe des
[RubyInstallers][5] etabliert, der alle notwendigen Tools für die
Rubyentwicklung unter Windows mitbringt. Momentan stehen folgende
Installer zur Verfügung (wenn du dir nicht sicher bist, welche
Architektur dein System hat, wähle die 32-Bit-Variante):

* [Ruby 2.0.0 RubyInstaller \[32 Bit\]][6]
  (md5:&nbsp;ccdf7de8b77c29aea4254c409a40fe98) Stabile Version (*empfohlen*)
* [Ruby 2.0.0 RubyInstaller \[64 Bit\]][7]
  (md5:&nbsp;5a6a605d3e38e2cb572dd418152a2fed) Stabile Version (*empfohlen*)

Speziell für die Entwicklung mit RubyOnRails unter Windows gibt es den
[RailsInstaller][8]. Dieser baut auf dem RubyInstaller auf, enthält aber
noch einige weitere Werkzeuge, die die Entwicklung mit Rails
vereinfachen.

Wenn du auf Windows mehrere Ruby- und RubyGems-Installationen
gleichzeitig betreiben möchtest, solltest du dir [Pik][9] anschauen,
welches diese Aufgabe enorm vereinfacht.

#### RVM und Pik

Das bekannteste Ruby-Installationswerkzeug ist RVM („Ruby Version
Manager“). Es erlaubt nicht nur, Ruby sehr einfach zu installieren,
sondern unterstützt auch die Installation und Verwaltung verschiedener
Ruby-Versionen und -implementationen auf einem System.

RVM steht nur für Linux, Max OS X und andere UNIX-ähnliche
Betriebssysteme zur Verfügung. Windows-Nutzer sollten sich [Pik][10] für
ein ähnliches Projekt anschauen oder den oben beschriebenen
RubyInstaller verwenden.

Zum Zeitpunkt des Verfassens dieses Textes kann RVM, soweit [Git][11]
verfügbar ist, wie folgt installiert werden:

{% highlight sh %}
$ \curl -L https://get.rvm.io | bash -s stable --ruby
{% endhighlight %}

Die aktuellsten Installationsanweisungen für RVM können auf der
[Installationsseite von RVM][12] nachgelesen werden. Die neueste
Ruby-Version lässt sich durch `rvm install 1.9.3` installieren; alle
unterstützten Versionen und Implementationen können mit `rvm list known`
aufgelistet werden.

### Paketverwaltungssysteme

#### Ruby unter Linux

Je nach dem, welche Distribution du verwendest, gibt es mehrere
Möglichkeiten, Ruby zu installieren. Unter Debian oder Ubuntu
beispielsweise stellt `apt-get` eine einfache und elegante Lösung dar:

{% highlight sh %}
#Ruby 1.9 (es handelt sich hierbei tatsächlich um Ruby 1.9.2 oder neuer,
#die "1.9.1" steht für die sog. "library compatibility version").
% sudo apt-get install ruby1.9.1-full

#Ruby 1.8
% sudo apt-get install ruby-full
{% endhighlight %}

Für `irb` und `rdoc` muss das „Universe“-Repository aktiviert werden.

Unter Arch Linux findest du Ruby im „extra“-Repository.

{% highlight sh %}
% pacman -S ruby
{% endhighlight %}

#### Ruby unter OS X

Ruby 1.8.7 wird von Macintosh OS X Lion genauso vollständig unterstützt
wie viele bekannte RubyGems (Pakete). Genauere Informationen gibt es im
[RubyWiki bei MacOS Forge][13].

Max OS X Tiger kommt mit der Ruby-Versionen 1.8.2 und Leopard mit 1.8.6,
aber für die, die noch nicht auf Leopard aktualisiert haben, gibt es
eine gewisse Anzahl an Möglichkeiten, die neuste Ruby-Version zu
installieren.

Viele Leute benutzen unter Mac OS X [Homebrew][14] als Paketmanager:

{% highlight sh %}
$ brew install ruby
{% endhighlight %}

Da OS X aber auch auf UNIX basiert, ist die Installation aus dem
Quellcode ebenso einfach und effektiv wie die anderen Möglichkeiten;
selbstverständlich ist es auch möglich, RVM zu benutzen. `rvm notes`
gibt systemspezifische Informationen aus.

Eine genaue Beschreibung der Installation von Ruby (und Rails) findet
sich in Dan Benjamins Artikeln zu [Tiger][15], [Leopard][16] und [Snow
Leopard][17]. Für Lion mag [dieser Artikel][18] hilfreich sein.

#### Ruby unter Solaris und OpenIndiana

Ruby 1.8.7 ist für Solaris 8 bis Solaris 10 unter [Sunfreeware][19]
verfügbar und Ruby 1.8.7 ist bei [Blastwave][20] erhältlich, ein
optimierter Ruby On Rails Stack für Solaris 10 ist bei [Coolstack][21]
innerhalb von Sun’s Cooltools Projekt verfügbar. Ruby 1.9.2-p0 kann
ebenfalls bei [Sunfreeware][19] gefunden werden, jedoch ist diese
Version veraltet. Eine neuere kann etwa mit RVM installiert werden.

Um Ruby unter [OpenIndiana][22] zu installieren, sollte man das [Image
Packaging System][23], IPS, verwenden. Damit werden die neuesten
Ruby-Binaries (1.9) und RubyGems direkt aus dem OpenSolaris-Repository
installiert:

{% highlight sh %}
% pkg install runtime/ruby-19
{% endhighlight %}

Selbstverständlich kann man auch hier RVM verwenden.

### Alternative Ruby-Implementationen

Ruby als Sprache hat einige verschiedene Implementierungen. Diese
Anleitung diskutiert die Referenzimplementation **MRI** („Matz’
Ruby-Interpreter“), es gibt aber noch einige weitere. Oftmals sind diese
in bestimmten Situationen nützlich, stellen spezielle Sprach- oder
Umgebungsintergration zur Verfügung oder haben einfach spezielle
Features, die der MRI nicht hat.

Hier ist eine Liste:

* [JRuby][24] ist ein Ruby auf der JVM (Java Virtual Machine), das von
  den optimierenden JIT-Compiliern der JVM, ihrem Garbage Collector,
  nebenläufigen Threads, diversen Tools und einer immensen Menge an
  Programmbibliotheken profitiert.
* [Rubinius][25] ist ein „Ruby geschrieben in Ruby“. Aufgebaut auf der
  LLVM stellt Rubinius eine gute virtuelle Maschine zur Verfügung, auf
  der sogar andere Sprachen aufbauen. Ebenso wie JRuby besitzt es echt
  nebenläufige Threads, ist jedoch im Gegensatz zu diesem kompatibel zur
  C-API des MRI.
* [MacRuby][26] ist stark integriert in Apples Cocoa-Libraries für Mac
  OS X, was ein leichtes Erstellen von Desktopanwendungen für Mac OS X
  ermöglicht.
* [Cardinal][27] ist ein „Ruby-Compiler für die [Parrot Virtual
  Machine][28]“ (Perl 6).
* [IronRuby][29] integriert sich gut in Microsofts .NET-Framework.
* [MagLev][30] definiert sich selbst als „eine schnelle, stabile
  Ruby-Implementation mit integrierter Objektpersistenz und verteiltem
  Shared Cache“.

Einige der genannten Implementationen, MRI eingeschlossen, folgen den
Richtlinien der [RubySpec][31], einer von den Rubinius-Entwicklern
initiierten „kompletten ausführbaren Spezifikation für die
Programmiersprache Ruby“.



[1]: http://www.ruby-lang.org/de/about/license.txt 
[2]: {{ site.downloads.stable.url }}
[3]: {{ site.downloads.stable_snapshot.url }}
[4]: {{ site.downloads.nightly_snapshot.url }}
[5]: http://rubyinstaller.org 
[6]: http://rubyforge.org/frs/download.php/76804/rubyinstaller-2.0.0-p0.exe 
[7]: http://rubyforge.org/frs/download.php/76806/rubyinstaller-2.0.0-p0-x64.exe 
[8]: http://railsinstaller.org 
[9]: http://rubyinstaller.org/add-ons/pik/ 
[10]: https://github.com/vertiginous/pik 
[11]: http://git-scm.com 
[12]: https://rvm.io/rvm/install/ 
[13]: http://trac.macosforge.org/projects/ruby/wiki 
[14]: http://mxcl.github.com/homebrew 
[15]: http://hivelogic.com/articles/ruby-rails-mongrel-mysql-osx 
[16]: http://hivelogic.com/articles/ruby-rails-leopard 
[17]: http://hivelogic.com/articles/compiling-ruby-rubygems-and-rails-on-snow-leopard/ 
[18]: http://intridea.com/2011/7/26/setting-up-ruby-dev-on-lion?blog=company 
[19]: http://www.sunfreeware.com 
[20]: http://www.blastwave.org 
[21]: http://cooltools.sunsource.net/coolstack 
[22]: http://openindiana.org 
[23]: http://opensolaris.org/os/project/pkg 
[24]: http://jruby.org 
[25]: http://rubini.us 
[26]: http://www.macruby.org 
[27]: https://github.com/parrot/cardinal 
[28]: http://parrot.org 
[29]: http://www.ironruby.net 
[30]: http://ruby.gemstone.com 
[31]: http://rubyspec.org 
