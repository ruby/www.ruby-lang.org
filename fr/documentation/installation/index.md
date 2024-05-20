---
layout: page
title: "Installer Ruby"
lang: fr
---

Vous pouvez utiliser différents outils pour installer Ruby.
Cette page décrit comment utiliser les principaux gestionnaires de paquets et
outils tiers pour gérer et installer Ruby, et comment compiler Ruby à partir
des sources.
{: .summary}


## Choisissez Votre Méthode d'Installation

Il existe plusieurs manières d'installer Ruby :

* Si vous êtes sur un système d'exploitation de type UNIX, utiliser le
  **gestionnaire de paquets** de votre système est la façon la plus simple de
  procéder.
  Toutefois, la dernière version de Ruby pourrait ne pas être disponible.
* Un **Installateur** peut être utilisé pour installer une ou plusieurs versions
  de Ruby. Il existe aussi un installateur pour Windows.
* Des **Managers** aident à basculer d'une version de Ruby à une autre sur
  votre système.
* Et finalement, vous pouvez aussi **compiler Ruby à partir des sources**.

La synthèse suivante liste les méthodes d'installation disponibles pour
différents besoins et plateformes.

* [Gestionnaires de paquets](#package-management-systems)
  * [Debian, Ubuntu](#apt)
  * [CentOS, Fedora, RHEL](#yum)
  * [Gentoo](#portage)
  * [Arch Linux](#pacman)
  * [macOS](#homebrew)
  * [Solaris, OpenIndiana](#solaris)
  * [Autres Distributions](#other-systems)
* [Installateurs](#installers)
  * [ruby-build](#ruby-build)
  * [ruby-install](#ruby-install)
  * [RubyInstaller](#rubyinstaller) (Windows)
  * [RailsInstaller et Ruby Stack](#railsinstaller)
* [Managers](#managers)
  * [chruby](#chruby)
  * [rbenv](#rbenv)
  * [RVM](#rvm)
  * [uru](#uru)
* [Compiler les sources](#building-from-source)


## Gestionnaires de paquets
{: #package-management-systems}

Si vous ne pouvez pas compiler Ruby, et que vous ne souhaitez pas utiliser
d'outil tiers (installateur et/ou manager), vous pouvez utiliser le gestionnaire
de paquets de votre système pour installer Ruby.

Certains membres de la communaute Ruby recommandent de ne pas utiliser de
gestionnaires de paquet pour installer Ruby, et d'employer un des nombreux
outils tiers à la place. La liste complète des avantages et inconvénients
associés à cette pratique dépasse le cadre de cet article, mais on peut au moins
citer une raison des plus pragmatiques : la plupart des gestionnaires de paquets
ne proposent pas la dernière version de Ruby. Si vous souhaiter utiliser la
dernière version de Ruby, assurez-vous d'installer le bon paquet, ou d'utiliser
à la place un outil tiers tel que décrit plus bas.


### apt (Debian ou Ubuntu)
{: #apt}

Debian GNU/Linux et Ubuntu utilisent le gestionnaire de paquets apt.
Vous pouvez l'utiliser de la façon suivante :

{% highlight sh %}
$ sudo apt-get install ruby-full
{% endhighlight %}

Au moment d'écrire ces lignes, le paquet `ruby-full` fourni Ruby 2.3.1, qui
est une ancienne version stable, sur Debian et Ubuntu.


### yum (CentOS, Fedora, ou RHEL)
{: #yum}

CentOS, Fedora, et RHEL utilisent le gestionnaire de paquets yum.
Vous pouvez l'utiliser de la façon suivante :

{% highlight sh %}
$ sudo yum install ruby
{% endhighlight %}

La version installée est généralement la version la plus récente disponible de
Ruby au moment de la sortie de la version spécifique de la distribution.


### portage (Gentoo)
{: #portage}

Gentoo utilise le gestionnaire de paquets portage.

{% highlight sh %}
$ sudo emerge dev-lang/ruby
{% endhighlight %}

Par défaut, les versions 1.9 et 2.0 seront installées, mais d'autres versions
sont disponibles.
Pour installer une version précise, ajustez `RUBY_TARGETS` dans votre
`make.conf`.
Voir le [site web du Projet Gentoo Ruby][gentoo-ruby] pour les détails.


### pacman (Arch Linux)
{: #pacman}

Arch Linux utilise le gestionnaire de paquets pacman.
Pour installer Ruby, faite juste :

{% highlight sh %}
$ sudo pacman -S ruby
{% endhighlight %}

La version stable la plus récente de Ruby sera installée.


### Homebrew (macOS)
{: #homebrew}

Sur OS X Yosemite et Mavericks, Ruby 2.0 est déjà présent.
OS X Mountain Lion, Lion, et Snow Leopard sont fournis avec Ruby 1.8.7.

Beaucoups sur macOS utilisent [Homebrew][homebrew] comme gestionnaire de paquets.
Il est très simple d'obtenir une version plus récente de Ruby avec Homebrew :

{% highlight sh %}
$ brew install ruby
{% endhighlight %}

La version la plus récente de Ruby sera installée.


### Ruby sur Solaris et OpenIndiana
{: #solaris}

Ruby 1.8.7 est disponible de Solaris 8 à Solaris 10 sur
[Sunfreeware][sunfreeware] et Ruby 1.8.7 est disponible sur
Blastwave.
Ruby 1.9.2p0 est aussi disponible sur [Sunfreeware][sunfreeware], mais il est
obsolète.

Pour installer Ruby sur [OpenIndiana][openindiana], utilisez le client pour l'
[Image Packaging System (IPS)][opensolaris-pkg].
La version la plus récente des binaires de Ruby et de RubyGems sera installée
directement depuis les dépôts d'OpenSolaris pour Ruby 1.9. c'est facile :

{% highlight sh %}
$ pkg install runtime/ruby-18
{% endhighlight %}

Cependant, les outils tiers peuvent être une bonne façon d'obtenir la version la
plus récente de Ruby.


### Autres Distributions
{: #other-systems}

Sur les autres systèmes, vous pouvez rechercher Ruby dans le dépôt de paquets du
gestionnaire de votre distribution Linux, ou les outils tiers peuvent être le
bon choix pour vous.


## Installateurs
{: #installers}

Si la version de Ruby fournie par votre système ou gestionnaire de paquets est
obsolète, une plus récente peut être installée grâce à un installateur tiers.
Certains d'entre-eux permettent aussi d'installer plusieurs versions sur le même
système ; ces managers peuvent aider à basculer entre les différentes
installations de Rubis.

Si vous prévoyez d'utiliser le gestionnaire de versions [RVM](#rvm), vous n'avez
pas besoin d'un installateur séparé, il est fourni avec son propre installateur.


### ruby-build
{: #ruby-build}

[ruby-build][ruby-build] est un plugin pour [rbenv](#rbenv) qui vous permet de
compiler et d'installer différentes versions de Ruby dans les répertoires de
votre choix.
ruby-build peut aussi être utilisé comme un programme _standalone_, sans rbenv.
Il est disponible sur les systèmes d'exploitation macOS, Linux, et autres
systèmes basés sur UNIX.


### ruby-install
{: #ruby-install}

[ruby-install][ruby-install] vous permet de compiler et d'installer différentes
version de Ruby dans les répertoires de votre choix.
Il existe aussi une alternative, [chruby](#chruby), qui gère le basculement
entre différentes versions de Ruby.
Il est disponible sur les systèmes d'exploitation macOS, Linux, et autres
systèmes basés sur UNIX.


### RubyInstaller
{: #rubyinstaller}

Si vous êtes sur Windows, il existe un projet génial qui vous aide à installer
Ruby : [RubyInstaller][rubyinstaller]. Il vous fournit tout ce dont vous avez
besoin pour mettre en place un environnement complet de développement Ruby sur
Windows.

Téléchargez-le, lancez-le, et c'est réglé !


### RailsInstaller et Ruby Stack
{: #railsinstaller}

Si vous installez Ruby dans le but d'utiliser Ruby on Rails, vous pouvez
utiliser les installateurs suivants :

* [RailsInstaller][railsinstaller],
  qui utilise RubyInstaller mais vous fournit des outils supplémentaires aidant
  au développement avec Rails.
  Il est disponible pour OS X et Windows.
* [Bitnami Ruby Stack][rubystack],
  qui fournit un environnement compet de développement pour Rails.
  Il est disponible pour macOS, Linux, Windows, les machines virtuelles, et les
  images pour le cloud.


## Managers
{: #managers}

Beaucoup de _rubyistes_ utilisent des managers Ruby pour gérer différentes
« installations » de Ruby. Une installation de Ruby correspond à un ensemble de
programmes (gems et utilitaires liés à Ruby) associés à une version spécifique
de Ruby. Par exemple, si vous utilisez un manager pour alterner entre les
versions 1.9.2 et 2.2.0 de Ruby, vous serez en mesure d'installer des gems
différents pour ces deux versions de Ruby. Deux « installations » totalement
indépendantes de Ruby seront ainsi présentes sur votre système.

Les managers confèrent divers avantages, mais ne sont pas officiellement
supportés. Toutefois, leurs communautés respectives sont très serviables.


### chruby
{: #chruby}

[chruby][chruby] vous permet de basculer entre différentes installation de Ruby.
chruby peut gérer les installations de [ruby-install](#ruby-install) ou même
les installations faites à partir des sources.


### rbenv
{: #rbenv}

[rbenv][rbenv] vous permet de gérer différentes installations de Ruby.
Il ne permet pas d'installer Ruby, mais il existe un plugin très utilisé
s'appelant [ruby-build](#ruby-build) qui s'occupe de l'installation de Ruby.
Tous deux sont disponibles pour les systèmes d'exploitation macOS, Linux, ou
autres systèmes basés sur UNIX.


### RVM ("Ruby Version Manager")
{: #rvm}

[RVM][rvm] vous permet d'installer et de gérer plusieurs installations de Ruby
sur votre système. Il peut aussi gérer différent gemsets.
Il est disponible pour les systèmes d'exploitation macOS, Linux, ou autres
systèmes basés sur UNIX.


### RVM 4 Windows
{: #rvm-windows}

[RVM 4 Windows][rvm-windows] permet d'installer et de gérer plusieurs installations 
de Ruby sous Windows. C'est un clone du RVM original qui supporte la ligne de commande 
classique ainsi que Powershell en fournissant la même interface de ligne de commande 
que le RVM original.

### uru
{: #uru}

[Uru][uru] est un outil en ligne de commande léger et multi-plateforme qui vous
aide à utiliser différentes installation de Ruby sur les systèmes macOS, Linux,
ou Windows.


## Compiler les sources
{: #building-from-source}

Évidemment, vous pouvez installer Ruby à partir des sources.
[Téléchargez](/fr/downloads/) et décompressez l'archive, puis lancez la suite
de commandes suivantes :

{% highlight sh %}
$ ./configure
$ make
$ sudo make install
{% endhighlight %}

Par défaut, Ruby sera installé dans `/usr/local`.
Pour changer, passez l'option `--prefix=DIR` au script `./configure`.

Si on pourra préférer utiliser des outils tiers ou de gestionnaires de paquets
pour installer Ruby, il faut garder à l'esprit que de telles installations de
Ruby ne pourront pas être gérées par un gestionnaire de versions.


[rvm]: http://rvm.io/
[rvm-windows]: https://github.com/magynhard/rvm-windows#readme
[rbenv]: https://github.com/rbenv/rbenv#readme
[ruby-build]: https://github.com/rbenv/ruby-build#readme
[ruby-install]: https://github.com/postmodern/ruby-install#readme
[chruby]: https://github.com/postmodern/chruby#readme
[uru]: https://bitbucket.org/jonforums/uru
[rubyinstaller]: https://rubyinstaller.org/
[railsinstaller]: http://railsinstaller.org/
[rubystack]: http://bitnami.com/stack/ruby/installer
[sunfreeware]: http://www.sunfreeware.com
[openindiana]: http://openindiana.org/
[opensolaris-pkg]: http://opensolaris.org/os/project/pkg/
[gentoo-ruby]: http://www.gentoo.org/proj/en/prog_lang/ruby/
[homebrew]: http://brew.sh/
