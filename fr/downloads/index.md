---
layout: page
title: "Télécharger Ruby"
lang: fr
---

Vous pouvez obtenir sur cette page les dernières versions de Ruby. La
version stable actuelle est la {{ site.downloads.stable.version }}.
N’oubliez pas de consulter la [licence Ruby][license].
{: .summary}

### 3 façons d'installer Ruby

Vous pouvez installer Ruby de différentes manières. Selon leurs
préférences personnelles, certaines personnes choisiront une des
solutions plutôt qu'une autre. Un rapide résumé pour y voir clair :

* **Compiler Ruby à partir des sources** : sans doute la méthode la
  plus classique, et qui fonctionne toujours aussi bien pour avoir
  une installation optimisée pour votre machine.
* **Utiliser un installateur** : un certain nombre de logiciels
  prenant en charge la compilation de Ruby pour vous sont apparus au
  fil des années. Cette méthode convient aussi bien aux débutants
  qu'à des utilisateurs plus expérimentés, mais comporte quelques
  désavantages (voir ci-après).
* **Utiliser un gestionnaire de paquets** : si votre système
  d'exploitation le permet, vous pouvez récupérer Ruby sous la forme
  d'un paquet. Toutefois, la dernière version peut ne pas être
  disponible.

À noter que si vous souhaitez pouvoir installer et utiliser plusieurs
versions de Ruby sur la même machine, il vous faudra sans doute
utiliser un installateur, du type RVM… à moins que vous ne sachiez
*vraiment* ce que vous faites !

### Le code source

Installer Ruby à partir des sources (plutôt qu’au travers d’un paquet
pré-compilé) est une bonne solution pour ceux qui sont suffisamment à
l’aise avec leur plateforme de développement (Windows, GNU/Linux et
autres), et qui souhaitent obtenir une configuration spécifique pour
leur environnement. C’est également la solution à adopter par défaut
lorsqu’aucun paquetage « tout compris » n’existe pour votre plateforme.

* [Ruby {{ site.downloads.stable.version }}][stable-gz]
  (md5:&nbsp;{{ site.downloads.stable.md5.gz }}) Version stable (*recommandée*)
* [Ruby {{ site.downloads.previous.version }}][previous-gz]
  (md5:&nbsp;{{ site.downloads.previous.md5.gz }}) Version précédente
* [Stable Snapshot][stable-snapshot-gz] Archive de la dernière version stable du SVN
  (ruby\_2\_0\_0). A priori plus à jour que la dernière version stable
  publique.
* [Nightly Snapshot][nightly-gz] Archive de la dernière version du SVN.
  Comporte probablement des bugs !

Pour plus d’information sur le dépôt Subversion de Ruby, voyez la page
[Ruby Core](/fr/community/ruby-core/).

### Installateurs

Nombre de rubyistes utilisent un installateur pour gérer leur installation
de Ruby (une ou plusieurs versions sur la même machine). Ces installateurs
sont très pratiques, mais n'ont rien d'officiel. Les différentes communauté
d'utilisateurs sont en général très proactives.

#### RVM

L'installateur le plus populaire est sans doute RVM (*Ruby Version Manager*).
Il facilite énormément l'installation de Ruby, dans une ou plusieurs
versions, et ce, pour différentes implémentations (JRuby, Rubinius…).

Il est disponible sous Mac OS X, GNU/Linux et bien d'autres UNIX. Les
utilisateurs de Windows se dirigeront vers [pik][5] pour une alternative,
ou bien RubyInstaller, décrit ci-après.

Pour installer RVM :

{% highlight sh %}
$ \curl -L https://get.rvm.io | bash -s stable --ruby
{% endhighlight %}

En cas de problème, ou pour en savoir plus, consultez la [documentation
du projet][7]. La commande ci-dessus installera RVM ainsi que la dernière
version stable de Ruby. Pour installer Ruby sous une autre implémentation,
consultez la liste avec `rvm list known`.

#### RubyInstaller

Sous Windows, le plus simple est sans doute d'utiliser [RubyInstaller][8]
pour se créer un environnement de dévelopement complet.

* [Télécharger RubyInstaller][9]

Si vous souhaitez utiliser Ruby On Rails, le projet [RailsInstaller][10]
sera sans doute plus approprié. Il utiliser RubyInstaller pour installer
Ruby, ajouter Rails et toutes ses dépendances, et configure le tout.

### Gestionnaires de paquets

Si vous ne pouvez pas, ou ne voulez pas, compiler Ruby, et ne souhaitez
pas utiliser un installateur, vous pouvez vous rabattre sur votre
gestionnaire de paquets (GNU/Linux, UNIX et Mac OS X).

Attention : il est globalement admis qu'il s'agit d'une mauvaise façon
d'installer Ruby, et qu'il est préférable d'utiliser un installateur
du type RVM à la place. La liste des avantages et inconvénients associés
dépasse largement le cadre de cet article, mais on peut au moins citer
une raison des plus pragmatiques : la plupart des gestionnaires de paquets
ne proposent pas la dernière version de Ruby.

#### Ruby sur GNU/Linux

Sous Debian ou Ubuntu, le programme `apt` rend les choses très
faciles :

{% highlight sh %}
$ sudo apt-get install ruby1.9.1
{% endhighlight %}

Cette commande installe la dernière version stable de la branche 1.9.2,
mais pour des raisons historiques, la numérotation de sa bibliothèque
standard est 1.9.1, d'où le nom du paquet.

Pour installer plutôt la branche 1.8.\*, vous devrez sans doute faire :

{% highlight sh %}
$ sudo aptitude install ruby
{% endhighlight %}

Arch Linux utilise le gestionnaire de paquet `pacman` :

{% highlight sh %}
$ sudo pacman -S ruby
{% endhighlight %}

Pour les autres systèmes d'exploitation, adaptez selon votre propre système
de paquetage, ou bien utilisez RVM.

### Ruby sur Mac OS X

Ruby 1.8.7 est intégré dans Mac OS X Lion, ainsi que Ruby on Rails,
Mongrel, Capistrano et bien d’autres gems populaires. [En savoir plus][11].

Mac OS X Tiger contient la version 1.8.2 de Ruby, tandis que Leopard
propose la version 1.8.6.

Il existe dans tous les cas plusieurs méthodes pour obtenir la dernière
version.

Le plus simple est sans doute d'utiliser [Homebrew][12] :

{% highlight sh %}
$ brew install ruby
{% endhighlight %}

Il est interessant de noter que, le système Mac OS X étant basé sur UNIX,
installer à partir des sources est aussi facile et viable que les autres
solutions. Cela dit, encore une fois, l'utilisation d'un installateur du
type RVM simplifie considérablement les choses. La commande `rvm notes`
vous donnera des instructions supplémentaires pour votre plateforme.

Pour un meilleur aperçu sur l’installation de Ruby (et Rails), les
excellents articles (en anglais) de Dan Benjamin pour [Tiger][13],
[Leopard][14], [Snow Leopard][15] et [Lion][16] peuvent vous être utiles.

### Ruby sous Solaris et OpenIndiana

Ruby 1.8.7 est disponible sous Solaris, versions 8 à 10, sur
[Sunfreeware][17]. Ruby 1.8.7 est disponible sur [Blastwave][18]. Sous
[Sunfreeware][17], on peut également trouver la version 1.9.2p0, mais
ce n'est plus à jour pour cette branche de Ruby. Dans tous les cas, il
est recommandé d'utiliser RVM ou un équivalent.

Pour installer Ruby sous [OpenIndiana][19], veuillez utiliser le client
[IPS][20]. Cela vous permettra d’obtenir la dernière version des
binaires de Ruby et Rubygems directement depuis le dépôt OpenSolaris. La
mise en œuvre pour Ruby 1.9 est très simple :

{% highlight sh %}
$ pkg install runtime/ruby-18
{% endhighlight %}

### Autres implémentations de Ruby

Ruby, en tant que langage, connaît plusieurs implémentations. Pour le moment,
nous avons évoqué l'implémentation « de référence », dite MRI (pour *Matz's
Ruby Interpreter*) ou encore **CRuby** (car écrite majoritairement en C).

Il existe plusieurs implémentations alternatives. Elles peuvent apporter
de véritables avantages dans certaines situations, notamment à travers
l'accès à un *runtime* différent (comme Java, pour JRuby).

Voici une liste de ces implémentatitons :

* [JRuby][21] est Ruby sur la plateforme JVM (*Java Virtual Machine*). Elle
  utilise l'écosystème optimisé JIT, et propose de la concurrence réelle ainsi
  que l'accès à une très large collection de bibliothèques Java.
* [Rubinius][22] est « Ruby écrit en Ruby. » Bâti sur LLVM, Rubinius est basé
  sur une machine virtuelle originale qui permet de développer d'autres
  langages de programmation.
* [MacRuby][23] est une version de Ruby intégrant les librairies Cocoa d'Apple,
  sous Mac OS X. Il facilite l'écriture d'application native pour cette
  plateforme.
* [IronRuby][26] intègre la plateforme .NET.
* [MagLev][27] est une implémentation qui se veut « rapide, stable, avec
  de la persistence d'objet et un système de cache distribué et partagé. »
* [Cardinal][24] est un compilateur Ruby pour [Parrot][25] (Perl 6).

Certaines de ces implémentations, dont la MRI, se basent sur [RubySpec][28],
une spécification complète de Ruby en tant que langage de programmation.



[license]: {{ site.license.url }}
[stable-gz]:   {{ site.downloads.stable.url.gz }}
[previous-gz]: {{ site.downloads.previous.url.gz }}
[stable-snapshot-gz]: {{ site.downloads.stable_snapshot.url.gz }}
[nightly-gz]: {{ site.downloads.nightly_snapshot.url.gz }}
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
[19]: http://openindiana.org/
[20]: http://opensolaris.org/os/project/pkg/
[21]: http://jruby.org
[22]: http://rubini.us
[23]: http://www.macruby.org
[24]: https://github.com/parrot/cardinal
[25]: http://parrot.org
[26]: http://www.ironruby.net
[27]: http://ruby.gemstone.com
[28]: http://rubyspec.org
