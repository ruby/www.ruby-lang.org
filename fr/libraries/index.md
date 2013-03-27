---
layout: page
title: "Bibliothèques"
lang: fr
---

Il existe une très large gamme de bibliothèques, bien souvent
distribuées [sous la forme d’une *gem*][1], sinon en tant qu’archive
contenant le code source. Cette page décrit comment trouver et installer
ces bibliothèques.

### Trouver des bibliothèques
{: #finding-libraries}

[**RubyForge**][2] est un des sites principaux—sinon le site principal.
Vous pouvez commencer par jeter un œil à la [carte des logiciels][3],
qui regroupe les bibliothèques par thématiques. Si vous êtes vous-même
l’auteur d’une bibliothèque et souhaitez la faire héberger sur
RubyForge, [inscrivez-vous][4] pour avoir un accès Subversion, un espace
perso et des listes de diffusion.

[***Ruby Application Archive***][5] (RAA) recense tout type de
programmes Ruby, organisés selon leur fonction opérationnelle. Très
riche.

### Utiliser RubyGems
{: #using-rubygems}

RubyGems est décrit sur son [site officiel][1] comme le « système de
paquetage principal pour Ruby. Il offre un format standard de
distribution des programmes et librairies ruby, les “gems”, et met à
disposition un outil en ligne de commande simple à utiliser pour
installer et gérer les gems. » D’une certaine manière, RubyGems est un
équivalent à, par exemple, apt-get, mais spécifiquement conçu pour les
programmes ruby. Le dépôt officiel de gems est [RubyGems.org][6].

Bien que l’installateur Windows de Ruby propose d’emblée RubyGems, ce
n’est pas forcément le cas pour tous les systèmes d’exploitation. Voyez
donc pour commencer la section [Installer
RubyGems](#installing-rubygems) ci-dessous, dans le cas où vous n’auriez
pas encore installé RubyGems.

#### Rechercher des gems

La commande **search** permet de retrouver des gems selon leurs noms.
Ainsi, une recherche sur le mot « audio » :

{% highlight sh %}
$ gem search html --remote

 *** REMOTE GEMS ***

 html-sample (1.0, 1.1)
    A sample Ruby gem, just to illustrate how RubyGems works.
{% endhighlight %}

*Le mot-clé `--remote` ordonne d’effectuer la recherche directement dans
le catalogue officiel des gems hébergées sur Gemcutter.*

#### Installer une gem

Une fois que vous avez choisi une bibliothèque à installer, utilisez la
commande `install`\:

{% highlight sh %}
$ gem install html-sample
{% endhighlight %}

Vous pouvez par ailleurs ordonner l’installation d’une version précise
avec l’option `--version`\:

{% highlight sh %}
$ gem install html-sample --version 1.0
{% endhighlight %}

#### Lister toutes les gems

Pour récupérer la liste complète des gems disponibles sur Gemcutter :

{% highlight sh %}
$ gem list --remote
{% endhighlight %}

Pour afficher uniquement les gems que vous avez installées :

{% highlight sh %}
$ gem list
{% endhighlight %}

Pour plus d’informations sur l’usage de RubyGems, reportez-vous à la
[**documentation officielle**][7], qui donne notamment des exemples sur
l’utilisation de RubyGems dans vos programmes.

### Installer RubyGems
{: #installing-rubygems}

Pour pouvoir utiliser RubyGems, récupérez la dernière version du
programme (1.3.7) sur la page [Téléchargement][8] du projet.
Décompressez l’archive et lancez `setup.rb`. Sur certains systèmes
d’exploitation, il vous faudra les droits d’administrateur pour procéder
à l’installation complète.

Ainsi, sous GNU/Linux :

{% highlight sh %}
$ tar xzvf rubygems-1.3.7.tar.gz
$ cd rubygems-1.3.7
$ su -
# ruby setup.rb
{% endhighlight %}

Si vous avez besoin d’informations complémentaires sur l’installation de
Ruby, voyez le chapitre [Installation][9] du manuel RubyGems.



[1]: http://docs.rubygems.org
[2]: http://rubyforge.org/
[3]: http://rubyforge.org/softwaremap/trove_list.php
[4]: http://rubyforge.org/register/
[5]: http://raa.ruby-lang.org/
[6]: http://rubygems.org
[7]: http://rubygems.org/read/chapter/1
[8]: http://rubyforge.org/frs/?group_id=126
[9]: http://rubygems.org/read/chapter/3
