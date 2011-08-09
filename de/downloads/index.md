---
layout: page
title: "Ruby herunterladen"
lang: de
---

Hier kannst du die aktuellen Ruby-Distributionen herunterladen. Die
stabile Version ist derzeit 1.9.2. Bitte nimm auch [Rubys Lizenz][1] zur
Kenntnis.

### Ruby-Quellcode

Ruby aus dem Quellcode zu installieren ist eine geeignete Lösung, wenn
du dich gut mit deinem System auskennst und eventuell spezielle
Einstellungen für deine Umgebung benötigst. Es ist außerdem eine gute
Lösung, falls es keine vorgefertigten Pakete für dein System gibt.

* [Ruby 1.9.2-p290][2] (md5: 096758c3e853b839dc980b183227b182) stabile
  Version (*empfohlen*)
* [Stable Snapshot][3] Bei diesem Snapshot handelt es sich um die
  absolut letzte stabile SVN-Version. Sie sollte etwas stabiler sein als
  das letzte Release.
* [Nightly Snapshot][4] Bei diesem Snapshot handelt es sich um eine
  Kopie von letzter Nacht. Es besteht durchaus die Gefahr, dass in
  dieser noch nicht gelöste Fehler enthalten sind.

Weitergehende Informationen zum Subversion- und Git-Repository von Ruby
sind unter [Ruby Core](/en/community/ruby-core/) zu finden.

### Ruby unter Windows

Unter Windows gibt es verschiedene Möglichkeiten, Ruby zu installieren.
Die erste und in der Regel einfachere besteht darin, den
[RubyInstaller][5] zu verwenden. Die Zweite ist, ein vorkompiliertes
Binärpaket zu installieren. Wenn du dir nicht sicher bist, wie du Ruby
installieren sollst, ist die erste Möglichkeit wohl die beste Wahl für
dich (da der RubyInstaller das komplette Setup der Ruby-Installation
übernimmt, welches du bei den Binärpaketen von Hand machen musst).

* [Ruby 1.9.2-p290 RubyInstaller][6]
  (md5: 2ebae0cddbcc3176d145b59f3cc02c43) Stabile Version (*empfohlen*)
* [Ruby 1.8.7-p352 RubyInstaller][7]
  (md5: ac56ea30df53bf782c95754b13e296e0) Stabile Version (*empfohlen*)
* [Ruby 1.8.6-p398 RubyInstaller][8]
  (md5: 233d6b3ddc4c61436b075b51254cd138) Stabile Version
* [Ruby 1.9.2-p136 Binary][9] (md5: fb744af867b2386728ca034a8a773fe7)
  Stabile Version
* [Ruby 1.8.7-p330 Binary][10] (md5: 74a3114501c51520d97ed09f5bfe25c3)
  Stabile Version

Es sei darauf hingewiesen, dass es notwendig ist, für die oben
aufgelisteten Binaries zusätzliche Pakete [herunterzuladen und zu
installieren][11]. Bevor Fehler diesbezüglich gemeldet werden, sollten
diese Schritte befolgt werden.

Der [RubyInstaller][5] benötigt diese zusätzlichen Schritte nicht.

Wenn du auf Windows mehrere Ruby- und RubyGems-Installationen
gleichzeitig betreiben möchtest, solltest du dir [Pik][12] anschauen,
welches diese Aufgabe enorm vereinfacht.

### Ruby unter Linux

Je nach dem, welche Distribution du verwendest, gibt es mehrere
Möglichkeiten, Ruby zu installieren. Die erste besteht darin, den oben
genannten Quellcode herunterzuladen und von Hand zu kompilieren. Einige
Distributionen bieten jedoch Werkzeuge zur Paketverwaltung an, die die
Installation von Ruby extrem vereinfachen.

Unter Debian oder Ubuntu beispielsweise stellt `apt-get` eine einfache
und elegante Lösung dar:

    #Ruby 1.8
    % sudo apt-get install ruby-full
    #Ruby 1.9
    % sudo apt-get install ruby1.9.1-full
{: .code .sh-code}

Für irb und rdoc muss das “Universe Reposiory” aktiviert werden.

Unter Arch Linux findest du Ruby im “extra”-Repository.

    % pacman -S ruby
{: .code .sh-code}

### Ruby unter OS X

Es gibt verschiedene Möglichkeiten, die neueste version von Ruby unter
Macintosh OS X zu installieren. [Locomotive][13] ist eine gute Wahl,
wenn du etwas suchst, das du schnell zum Laufen bekommst, um mit Rails
zu entwickeln. Weiterhin gibt es den [One-click Installer for Mac OS
X][14] welcher eine komplette Ruby Umgebung auf einem Mac installiert
und konfiguriert. [DarwinPorts][15] oder [Fink][16] dürften
ansprechendere Lösungen für technisch erfahrenere Benutzer sein.

Mittels DarwinPorts kannst du Ruby folgendermaßen installieren:

    % port install ruby
{: .code .sh-code}

Fink stellt eine graphische Oberfläche zur Verfügung (Fink Commander),
über die Ruby installiert werden kann.

Da OS X auf Unix basiert, ist es eine ebenso einfache und effektive
Lösung, Ruby aus dem Quellcode zu installieren.

Dan Benjamins exzellenter Artikel [*Building Ruby, Rails, LightTPD, and
MySQL on Tiger*][17] wird dir helfen, einen detaillierten Einblick zu
bekommen, wie man Ruby (und Rails) installiert. Unter [Mac OS X
Leopard][18] ist der Einstieg noch einfacherer, da diese Version direkt
Ruby und RubyOnRails mitbringt.

### Ruby On Ruby unter Solaris und OpenSolaris

Ruby 1.8.7 ist für Solaris 8 bis Solaris 10 unter [Sunfreeware][19]
verfügbar. Ruby 1.8.7 ist bei [Blastwave][20] erhältlich. Ein
optimierter Ruby On Rails Stack für Solaris 10 ist bei [Coolstack][21]
innerhalb von Sun’s Cooltools Projekt verfügbar.

Um Ruby unter [OpenSolaris][22] zu installieren, sollte der [Image
Packaging System oder der IPS][23] Client verwendet werden. Dies
installiert die aktuellsten Ruby und Rubygems Version direkt vom
OpenSolaris Network Repository. In etwa so:

    % pfexec pkg install SUNWruby18
{: .code .sh-code}

Hier wird Ruby, Rubygems und weitere Erweiterungen installiert. Dieses
Paket enthält auch DTrace Support und Performance Optimierungen. Weitere
Informationen sind im [Ruby OpenSolaris ARC Case][24] verfügbar.

Eine andere OpenSolaris Distribution [Solaris Express Community Edition
bzw. SXCE][25] wird direkt mit einer vorinstallierten Version von Ruby
ausgeliefert. Die Version entspricht der vanilla OpenSolaris
Distribution.

Für eine manuelle Installation der SVR4 Pakete ist das [RubyOpenSolaris
Projekt @ Rubyforge][26] hilfreich.



[1]: http://www.ruby-lang.org/de/about/license.txt 
[2]: http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p290.tar.bz2 
[3]: http://ftp.ruby-lang.org/pub/ruby/ruby-1.9-stable.tar.gz 
[4]: http://ftp.ruby-lang.org/pub/ruby/snapshot.tar.gz 
[5]: http://rubyinstaller.org 
[6]: http://rubyforge.org/frs/download.php/75127/rubyinstaller-1.9.2-p290.exe 
[7]: http://rubyforge.org/frs/download.php/75107/rubyinstaller-1.8.7-p352.exe 
[8]: http://rubyforge.org/frs/download.php/71066/rubyinstaller-1.8.6-p398.exe 
[9]: http://ftp.ruby-lang.org/pub/ruby/binaries/mswin32/ruby-1.9.2-p136-i386-mswin32.zip 
[10]: http://ftp.ruby-lang.org/pub/ruby/binaries/mswin32/ruby-1.8.7-p330-i386-mswin32.zip 
[11]: http://www.garbagecollect.jp/ruby/mswin32/en/documents/install.html 
[12]: http://rubyinstaller.org/add-ons/pik/ 
[13]: http://locomotive.raaum.org/ 
[14]: http://rubyosx.rubyforge.org/ 
[15]: http://darwinports.opendarwin.org/ 
[16]: http://fink.sourceforge.net/ 
[17]: http://hivelogic.com/articles/2005/12/01/ruby_rails_lighttpd_mysql_tiger 
[18]: http://danbenjamin.com/articles/2008/02/ruby-rails-leopard 
[19]: http://www.sunfreeware.com 
[20]: http://www.blastwave.org 
[21]: http://cooltools.sunsource.net/coolstack 
[22]: http://www.opensolaris.org 
[23]: http://opensolaris.org/os/project/pkg/ 
[24]: http://jp.opensolaris.org/os/community/arc/caselog/2007/600/ 
[25]: http://opensolaris.org/os/downloads 
[26]: http://rubyforge.org/projects/rubyopensolaris 
