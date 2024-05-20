---
layout: page
title: "Ruby installieren"
lang: de
---

Man kann Ruby auf verschiedene Arten installieren.
Diese Seite beschreibt die Verwendung der wichtigsten Paketverwaltungssysteme
und Drittanbieter-Werkzeuge zur Installation und Verwaltung
von Ruby sowie die Kompilierung aus dem Quelltext.
{: .summary}


## Installationsmethoden

Die folgende Übersicht zeigt die verfügbaren Installationsmethoden
für die gebräuchlichsten Plattformen.

* macOS

  * [rbenv](#rbenv)
  * [RVM](#rvm)
  * [Homebrew](#homebrew)
  * [Kompilierung aus dem Quellcode](#building-from-source)

* Linux/UNIX

  * [rbenv](#rbenv)
  * [RVM](#rvm)
  * [Paketverwaltungssysteme](#package-management-systems)
  * [Kompilierung aus dem Quellcode](#building-from-source)

* Windows

  * [RubyInstaller](#rubyinstaller)
  * [RVM 4 Windows](#rvm-windows)


## Drittanbieter-Werkzeuge

Viele Rubyisten benutzen Drittanbieter-Werkzeuge, um Ruby zu installieren.
Sie bieten verschiedene Vorteile, werden aber nicht offiziell unterstützt.
Nichtsdestotrotz sind ihre jeweiligen Communities sehr hilfsbereit.


### rbenv
{: #rbenv}

rbenv erlaubt die Verwaltung mehrerer Ruby-Installationen.
Es unterstützt zwar selbst nicht die Installation von Ruby,
es gibt dafür aber ein beliebtes Plugin namens ruby-build.
Beide Werkzeuge sind verfügbar für macOS, Linux oder
andere UNIX-ähnliche Betriebssysteme.

Siehe die [rbenv-Website][rbenv] für die aktuellsten Informationen
zur Installation von rbenv.

Ein ähnliches Werkzeug ist RVM, siehe den nächsten Abschnitt.


### RVM ("Ruby Version Manager")
{: #rvm}

RVM erlaubt die Installation und Verwaltung mehrerer Ruby-Installationen auf
einem System.
Es ist verfügbar für macOS, Linux oder andere UNIX-ähnliche Betriebssysteme.

Die aktuellsten Installationsanweisungen für RVM können auf der
[Installationsseite von RVM][rvm] nachgelesen werden.


### RVM 4 Windows
{: #rvm-windows}

[RVM 4 Windows][rvm-windows] ermöglicht es Ihnen, mehrere Installationen von Ruby 
unter Windows zu installieren und zu verwalten. Es ist ein Klon des ursprünglichen 
RVM und unterstützt sowohl die klassische Kommandozeile als auch Powershell, 
indem es die gleiche Kommandozeilenschnittstelle wie das ursprüngliche RVM bietet.


### RubyInstaller
{: #rubyinstaller}

Für Windows-Nutzer hat sich die Installation mithilfe des
RubyInstallers etabliert, der alle notwendigen Tools für die
Rubyentwicklung unter Windows mitbringt.

Um RubyInstaller zu nutzen, muss man ihn nur von der
[RubyInstaller-Downloadseite][rubyinstaller] herunterladen und starten. Fertig!


### RailsInstaller und Ruby Stack

Für die Nutzung von Ruby on Rails gibt es spezielle Installer:

* [RailsInstaller][railsinstaller]
  baut auf dem RubyInstaller auf, enthält aber noch einige weitere Werkzeuge,
  die die Entwicklung mit Rails vereinfachen.
  Unterstützt werden OS X und Windows.
* [Bitnami Ruby Stack][rubystack]
  stellt eine vollständige Entwicklungsumgebung für Rails zur Verfügung.
  Unterstützt werden macOS, Linux, Windows, virtuelle Maschinen und Cloud Images.


## Paketverwaltungssysteme
{: #package-management-systems}

Wenn Du Ruby nicht kompilieren kannst und auch kein Drittanbieter-Werkzeug
verwenden möchtest, so kann Ruby auch mit dem Paketverwaltungssystem
Deines Betriebssystems installiert werden.

Einige Mitglieder der Ruby-Community vertreten vehement die Ansicht, dass
man Ruby nie mithilfe eines Paketverwaltungssystems installieren sollte,
sondern lieber Drittanbieter-Werkzeuge nutzen sollte.
Eine vollständige Diskussion der Vor- und Nachteile würde den Rahmen dieses
Überblicks sprengen, der wichtigste Grund ist, dass die meisten
Paketverwaltungen ältere Ruby-Versionen in ihren Paketquellen haben.
Um die neueste Version zu erhalten, sollte man auf den korrekten Paketnamen
achten, oder stattdessen eines der oben genannten Werkzeuge nutzen.

Die folgenden Paketverwaltungssysteme werden unten genauer beschrieben:

* [apt (Debian oder Ubuntu)](#apt)
* [yum (CentOS, Fedora, oder RHEL)](#yum)
* [portage (Gentoo)](#gentoo)
* [pacman (Arch Linux)](#pacman)
* [Homebrew (macOS)](#homebrew)
* [Solaris, OpenIndiana](#solaris)


### apt (Debian oder Ubuntu)
{: #apt}

Unter Debian oder Ubuntu wird apt als Paketverwaltung genutzt,
Ruby lässt sich damit folgendermaßen installieren:

{% highlight sh %}
$ sudo apt-get install ruby
{% endhighlight %}

Dadurch wird auf Ubuntu oder Debian (zum Stand der Entstehung dieses Artikels)
Ruby 2.3.1 installiert, eine ältere stabile Version.


### yum (CentOS, Fedora, or RHEL)
{: #yum}

CentOS, Fedora und RHEL nutzen yum als Paketverwaltung.
Ruby wird folgendermaßen installiert:

{% highlight sh %}
$ sudo yum install ruby
{% endhighlight %}

Die installierte Version ist typischerweise die aktuellste Ruby-Version,
die zum Erscheinungszeitpunkt der jeweiligen Distribution verfügbar war.


### portage (Gentoo)
{: #portage}

Gentoo verwendet portage als Paketverwaltung.

{% highlight sh %}
$ sudo emerge dev-lang/ruby
{% endhighlight %}

Standardmäßig werden damit alle verfügbaren Versionen installiert
(1.8, 1.9, und 2.0). Setze `RUBY_TARGETS` in Deiner `make.conf`-Datei,
um eine bestimmte Version zu installieren.
Siehe die [Gentoo Ruby Project Website][gentoo-ruby] für Details.


### pacman (Arch Linux)
{: #pacman}

Unter Arch Linux lässt sich Ruby mithilfe von pacman so installieren:

{% highlight sh %}
$ sudo pacman -S ruby
{% endhighlight %}


### Homebrew (macOS)
{: #homebrew}

Bei OS X Mavericks ist Ruby 2.0 vorinstalliert.
OS X Mountain Lion, Lion und Snow Leopard werden mit Ruby 1.8.7 ausgeliefert.

Es gibt verschiedene Optionen um die neueste Ruby-Version zu installieren.
Die meisten OS-X-Anwender in der Ruby-Community benutzen
Drittanbieter-Werkzeuge zur Installation, es gibt aber auch einige
Paketverwaltungssysteme, die Ruby unterstützen.

Viele Anwender verwenden unter macOS [Homebrew][homebrew] als Paketverwaltung.
Ruby wird damit folgendermaßen installiert:

{% highlight sh %}
$ brew install ruby
{% endhighlight %}

Da macOS auf UNIX basiert, ist aber auch die Installation aus dem
Quellcode genauso einfach und effektiv wie die anderen Möglichkeiten.
Die Verwendung von Drittanbieter-Werkzeugen hilft bei der Installation
neuer Ruby-Versionen.


### Ruby unter Solaris und OpenIndiana
{: #solaris}

Ruby 1.8.7 ist für Solaris 8 bis Solaris 10 unter [Sunfreeware][sunfreeware]
verfügbar und Ruby 1.8.7 ist bei Blastwave erhältlich.
Ruby 1.9.2-p0 kann ebenfalls bei [Sunfreeware][sunfreeware] gefunden werden,
jedoch ist diese Version veraltet.
Die neueste Version kann mit Drittanbieter-Werkzeugen installiert werden.

Um Ruby unter [OpenIndiana][openindiana] zu installieren, sollte man das
[Image Packaging System (IPS)][opensolaris-pkg] verwenden. Damit werden die
neuesten Ruby-Binaries (1.9) und RubyGems direkt aus dem OpenSolaris-Repository
installiert:

{% highlight sh %}
$ pkg install runtime/ruby-18
{% endhighlight %}

Selbstverständlich kann man auch hier Drittanbieter-Werkzeuge verwenden.


### Andere Distributionen

Auf anderen Distributionen sollte eine Suche in den Paketquellen des
jeweiligen Paketverwaltungssystems helfen, alternativ könnten
Drittanbieter-Werkzeuge das Mittel der Wahl sein.


## Kompilierung aus dem Quellcode
{: #building-from-source}

Natürlich kann Ruby auch aus dem Quellcode kompiliert werden.
Tarballs findest Du auf der [Download-Seite](/de/downloads/).
Nach dem Entpacken kann Ruby folgendermaßen kompiliert werden:

{% highlight sh %}
$ ./configure
$ make
$ sudo make install
{% endhighlight %}

Standardmäßig wird Ruby nach `/usr/local` installiert.
Dies kann mit der Option `--prefix=DIR` für das
`./configure`-Skript geändert werden.

Drittanbieter-Werkzeuge oder Paketverwaltungssysteme könnten jedoch eine
bessere Wahl sein, da die so installierte Ruby-Version nicht durch ein Tool
verwaltet wird.


[rvm]: http://rvm.io/
[rvm-windows]: https://github.com/magynhard/rvm-windows#readme
[rbenv]: https://github.com/rbenv/rbenv
[rubyinstaller]: https://rubyinstaller.org/
[railsinstaller]: http://railsinstaller.org/
[rubystack]: http://bitnami.com/stack/ruby/installer
[sunfreeware]: http://www.sunfreeware.com
[openindiana]: http://openindiana.org/
[opensolaris-pkg]: http://opensolaris.org/os/project/pkg/
[gentoo-ruby]: http://www.gentoo.org/proj/en/prog_lang/ruby/
[homebrew]: http://brew.sh/
