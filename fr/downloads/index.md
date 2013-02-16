---
layout: page
title: "Télécharger Ruby"
lang: fr
---

Vous pouvez obtenir sur cette page les dernières versions de Ruby. La
version stable actuelle est la {{ site.downloads.stable.version }}.
N’oubliez pas de consulter la [licence Ruby][1].

### Le code source

Installer Ruby à partir des sources (plutôt qu’au travers d’un paquet
pré-compilé) est une bonne solution pour ceux qui sont suffisamment à
l’aise avec leur plateforme de développement (Windows, GNU/Linux et
autres), et qui souhaitent obtenir une configuration spécifique pour
leur environnement. C’est également la solution à adopter par défaut
lorsqu’aucun paquetage « tout compris » n’existe pour votre plateforme.

* [Ruby {{ site.downloads.stable.version }}][2]
  (md5:&nbsp;{{ site.downloads.stable.md5 }}) Version stable (*recommandée*)
* [Stable Snapshot][3] Archive de la dernière version stable du SVN. A
  priori plus à jour que la dernière version stable publique.
* [Nightly Snapshot][4] Archive de la dernière version du SVN.
  Éventuellement instable.

Pour plus d’information sur le dépôt Subversion de Ruby, voyez la page
[Ruby Core](/fr/community/ruby-core/).

### Ruby sous Windows

Il existe plusieurs façons d’installer Ruby sur la plateforme Microsoft
Windows. La première consiste à installer les sources binaires
pré-compilées ; la seconde est d’utiliser l’installateur
« RubyInstaller. » Si vous ne savez pas quoi choisir, RubyInstaller est
vraisemblablement le moyen le plus simple (il fournit par ailleurs, en
plus de Ruby, plusieurs bibliothèques additionnelles très utiles).

* [Ruby 1.8.6-p398 RubyInstaller][5]
  (md5:&nbsp;233d6b3ddc4c61436b075b51254cd138) Version stable (*recommandée*)
* [Ruby 1.8.7-p334 RubyInstaller][6]
  (md5:&nbsp;64e30e63e16028282fcfe3ec57b561dc) Version stable (*recommandée*)
* [Ruby 1.9.1-p430 RubyInstaller][7]
  (md5:&nbsp;86ac589a955898c3163b161d81750a05) Version stable (*recommandée*)
* [Ruby 1.9.2-p180 RubyInstaller][8]
  (md5:&nbsp;2c94aef50987416d64c85a4ea0fa428b) Version stable (*recommandée*)
* [Ruby 1.8.7-p249 Binary][9] (md5:&nbsp;4fd37b0b4b21a042cae7f5f0a8daad16)
  Version stable
* [Ruby 1.9.1-p378 Binary][10] (md5:&nbsp;7d14a918cc8d243d3e2c409aff41f454)
  Version stable

Veuillez noter que certains des binaires ci-dessus requièrent le
téléchargement et l’installation manuelle de composants supplémentaires,
dont les détails sont décrits dans [cette page][11]. Soyez sûrs d’avoir
bien effectué ces étapes additionnelles avant de rapporter un bug.

La version One-Click Installer ne requière aucune installation manuelle
supplémentaire.

### Ruby sur GNU/Linux

Il existe plusieurs moyens d’installer Ruby sous GNU/Linux, en fonction
de la distribution que vous utilisez. Vous pouvez bien sûr télécharger
le code source et compiler manuellement Ruby. Toutefois, un grand nombre
de distributions intègrent un système de paquetages précompilés (paquets
.deb, .rpm, etc.) qui permet d’installer Ruby sans compilation manuelle.
Enfin, il existe le projet `rvm`, [Ruby Version Manager][12], qui est un
système spécialement dédié à l’installation de Ruby. Il vous permettra
d’installer plusieurs versions de ruby et de gérer vos gems de façon
très simple. Cette dernière solution tend à devenir standard dans
l’écosystème Ruby. Si toutefois vous préférez une des deux solutions
précédentes, lisez la suite.

Sous Debian ou Ubuntu, le programme `aptitude` rend les choses très
faciles :

    % sudo aptitude install ruby1.9.1-full
{: .code .sh-code}

Cette commande installe la dernière version stable de la branche 1.9.1.
Pour installer plutôt la branche 1.8.\*, faites :

    % sudo aptitude install ruby-full
{: .code .sh-code}

(pour installer également les dépendances `irb` et `rdoc`, les dépôts
`Universe` doivent être actifs).

Voyez selon votre propre système de paquetage et votre distribution.

### Ruby sur Mac OS X

Ruby 1.8.6 est intégré dans Mac OS X Leopard, ainsi que Ruby on Rails,
Mongrel, Capistrano et d’autres gems populaires. [En savoir plus][13].

Mac OS X Tiger contient la version 1.8.2 de Ruby, mais pour ceux qui ne
seraient pas passée à Leopard, il existe plusieurs méthodes pour obtenir
la dernière version. [Locomotive][14] est tout indiqué si vous comptez
utuliser Rails. Vous pouvez également passer par [MacPorts][15] ou
[Fink][16] pour réaliser une installation plus fine.

Avec MacPorts, vous pouvez installer Ruby avec la commande :

    % port install ruby
{: .code .sh-code}

Fink est distribué avec une interface graphique (« Fink Commander ») que
vous pouvez utiliser pour installer Ruby.

Il est interessant de noter que le systeme Mac OS X est basé sur UNIX,
et que par conséquent télécharger et installer à partir des sources est
aussi facile et efficace que les autres solutions.

Pour un meilleur aperçu sur l’installation de Ruby (et Rails), les
excellents articles (en anglais) de Dan Benjamin [pour Tiger][17], [pour
Leopard][18] et [pour Snow Leopard][19] peuvent vous être utiles.

### Ruby sous Solaris et OpenSolaris

Ruby 1.8.7 est disponible sous Solaris, versions 8 à 10, sur
[Sunfreeware][20]. Ruby 1.8.7 est disponible sur [Blastwave][21]. Une
version optimisée de Ruby on Rails pour Solaris 10 est mise à
disposition en tant que [Coolstack][22] par le projet Cooltools de Sun.

Pour installer Ruby sous [OpenSolaris][23], veuillez utiliser le client
[IPS][24]. Cela vous permettra d’obtenir la dernière version des
binaires de Ruby et Rubygems directement depuis le dépôt OpenSolaris. La
mise en œuvre est très simple :

    % pfexec pkg install SUNWruby18
{: .code .sh-code}

Ceci provoquera l’installation de Ruby, Rubygems, des extensions
usuelles et des librairies nécessaires. Ce paquet contient également un
support pour DTrace et des optimisations de performance. L’emplacement
de plusieurs artefacts est décrite dans le document [Ruby OpenSolaris
ARC Case][25].

L’autre distribution OpenSolaris, à savoir [Solaris Express Community
Edition or SXCE][26], est fournie avec Ruby préinstallé. Les versions et
emplacements sont identiques à ceux d’OpenSolaris Vanilla, et sont
également documentés par le [Ruby OpenSolaris ARC Case][25].

Pour installer tous les paquets SVR4 simultanément, reportez-vous au
site [RubyOpenSolaris project @ Rubyforge][27].



[1]: http://www.ruby-lang.org/en/about/license.txt 
[2]: {{ site.downloads.stable.url }}
[3]: {{ site.downloads.stable_snapshot.url }}
[4]: {{ site.downloads.nightly_snapshot.url }}
[5]: http://rubyforge.org/frs/download.php/71066/rubyinstaller-1.8.6-p398.exe 
[6]: http://rubyforge.org/frs/download.php/73719/rubyinstaller-1.8.7-p334.exe 
[7]: http://rubyforge.org/frs/download.php/72075/rubyinstaller-1.9.1-p430.exe 
[8]: http://rubyforge.org/frs/download.php/73722/rubyinstaller-1.9.2-p180.exe 
[9]: http://ftp.ruby-lang.org/pub/ruby/binaries/mswin32/ruby-1.8.7-p249-i386-mswin32.zip 
[10]: http://ftp.ruby-lang.org/pub/ruby/binaries/mswin32/ruby-1.9.1-p378-i386-mswin32.zip 
[11]: http://www.garbagecollect.jp/ruby/mswin32/en/documents/install.html 
[12]: http://rvm.beginrescueend.com 
[13]: http://trac.macosforge.org/projects/ruby/wiki 
[14]: http://locomotive.raaum.org/ 
[15]: http://www.macports.org/ 
[16]: http://fink.sourceforge.net/ 
[17]: http://danbenjamin.com/articles/2007/02/ruby-rails-mongrel-mysql-osx 
[18]: http://danbenjamin.com/articles/2008/02/ruby-rails-leopard 
[19]: http://hivelogic.com/articles/compiling-ruby-rubygems-and-rails-on-snow-leopard/ 
[20]: http://www.sunfreeware.com 
[21]: http://www.blastwave.org 
[22]: http://cooltools.sunsource.net/coolstack 
[23]: http://www.opensolaris.org 
[24]: http://opensolaris.org/os/project/pkg/ "Image Packaging System"
[25]: http://jp.opensolaris.org/os/community/arc/caselog/2007/600/ 
[26]: http://opensolaris.org/os/downloads 
[27]: http://rubyforge.org/projects/rubyopensolaris 
