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

* [Ruby 1.9.3-p392 RubyInstaller][5]
* [Autres versions du RubyInstaller][6]

### Ruby sur GNU/Linux

Il existe plusieurs moyens d’installer Ruby sous GNU/Linux, en fonction
de la distribution que vous utilisez. Vous pouvez bien sûr télécharger
le code source et compiler manuellement Ruby. Toutefois, un grand nombre
de distributions intègrent un système de paquetages précompilés (paquets
.deb, .rpm, etc.) qui permet d’installer Ruby sans compilation manuelle.
Enfin, il existe le projet `rvm`, [Ruby Version Manager][7], qui est un
système spécialement dédié à l’installation de Ruby. Il vous permettra
d’installer plusieurs versions de ruby et de gérer vos gems de façon
très simple. Cette dernière solution tend à devenir standard dans
l’écosystème Ruby. Si toutefois vous préférez une des deux solutions
précédentes, lisez la suite.

Sous Debian ou Ubuntu, le programme `aptitude` rend les choses très
faciles :

{% highlight sh %}
% sudo aptitude install ruby1.9.1-full
{% endhighlight %}

Cette commande installe la dernière version stable de la branche 1.9.1.
Pour installer plutôt la branche 1.8.\*, faites :

{% highlight sh %}
% sudo aptitude install ruby-full
{% endhighlight %}

(pour installer également les dépendances `irb` et `rdoc`, les dépôts
`Universe` doivent être actifs).

Voyez selon votre propre système de paquetage et votre distribution.

### Ruby sur Mac OS X

Ruby 1.8.6 est intégré dans Mac OS X Leopard, ainsi que Ruby on Rails,
Mongrel, Capistrano et d’autres gems populaires. [En savoir plus][8].

Mac OS X Tiger contient la version 1.8.2 de Ruby, mais pour ceux qui ne
seraient pas passée à Leopard, il existe plusieurs méthodes pour obtenir
la dernière version. [Locomotive][9] est tout indiqué si vous comptez
utuliser Rails. Vous pouvez également passer par [MacPorts][10] ou
[Fink][11] pour réaliser une installation plus fine.

Avec MacPorts, vous pouvez installer Ruby avec la commande :

{% highlight sh %}
% port install ruby
{% endhighlight %}

Fink est distribué avec une interface graphique (« Fink Commander ») que
vous pouvez utiliser pour installer Ruby.

Il est interessant de noter que le systeme Mac OS X est basé sur UNIX,
et que par conséquent télécharger et installer à partir des sources est
aussi facile et efficace que les autres solutions.

Pour un meilleur aperçu sur l’installation de Ruby (et Rails), les
excellents articles (en anglais) de Dan Benjamin [pour Tiger][12], [pour
Leopard][13] et [pour Snow Leopard][14] peuvent vous être utiles.

### Ruby sous Solaris et OpenSolaris

Ruby 1.8.7 est disponible sous Solaris, versions 8 à 10, sur
[Sunfreeware][15]. Ruby 1.8.7 est disponible sur [Blastwave][16]. Une
version optimisée de Ruby on Rails pour Solaris 10 est mise à
disposition en tant que [Coolstack][17] par le projet Cooltools de Sun.

Pour installer Ruby sous [OpenSolaris][18], veuillez utiliser le client
[IPS][19]. Cela vous permettra d’obtenir la dernière version des
binaires de Ruby et Rubygems directement depuis le dépôt OpenSolaris. La
mise en œuvre est très simple :

{% highlight sh %}
% pfexec pkg install SUNWruby18
{% endhighlight %}

Ceci provoquera l’installation de Ruby, Rubygems, des extensions
usuelles et des librairies nécessaires. Ce paquet contient également un
support pour DTrace et des optimisations de performance. L’emplacement
de plusieurs artefacts est décrite dans le document [Ruby OpenSolaris
ARC Case][20].

L’autre distribution OpenSolaris, à savoir [Solaris Express Community
Edition or SXCE][21], est fournie avec Ruby préinstallé. Les versions et
emplacements sont identiques à ceux d’OpenSolaris Vanilla, et sont
également documentés par le [Ruby OpenSolaris ARC Case][20].

Pour installer tous les paquets SVR4 simultanément, reportez-vous au
site [RubyOpenSolaris project @ Rubyforge][22].



[1]: http://www.ruby-lang.org/en/about/license.txt 
[2]: {{ site.downloads.stable.url }}
[3]: {{ site.downloads.stable_snapshot.url }}
[4]: {{ site.downloads.nightly_snapshot.url }}
[5]: http://rubyforge.org/frs/download.php/76706/rubyinstaller-1.9.3-p392.exe 
[6]: http://rubyinstaller.org/downloads/ 
[7]: https://rvm.io/ 
[8]: http://trac.macosforge.org/projects/ruby/wiki 
[9]: http://locomotive.raaum.org/ 
[10]: http://www.macports.org/ 
[11]: http://fink.sourceforge.net/ 
[12]: http://danbenjamin.com/articles/2007/02/ruby-rails-mongrel-mysql-osx 
[13]: http://danbenjamin.com/articles/2008/02/ruby-rails-leopard 
[14]: http://hivelogic.com/articles/compiling-ruby-rubygems-and-rails-on-snow-leopard/ 
[15]: http://www.sunfreeware.com 
[16]: http://www.blastwave.org 
[17]: http://cooltools.sunsource.net/coolstack 
[18]: http://www.opensolaris.org 
[19]: http://opensolaris.org/os/project/pkg/ "Image Packaging System"
[20]: http://jp.opensolaris.org/os/community/arc/caselog/2007/600/ 
[21]: http://opensolaris.org/os/downloads 
[22]: http://rubyforge.org/projects/rubyopensolaris 
