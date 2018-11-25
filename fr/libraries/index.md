---
layout: page
title: "Bibliothèques"
lang: fr
---

Comme la plupart des langages de programmation actuels, Ruby s'appuie
sur tout un écosystème de bibliothèques logicielles (ou "librairies",
de l'anglais "library" : bibliothèque).
{: .summary}

Ces bibliothèques sont bien souvent disponibles sous la forme d’une *gem*.
[RubyGems][1] est le « gestionnaire de paquets de Ruby » permettant
de télécharger et d'installer ces gems. Il facilite également leur
création et leur partage. Il s'agit donc d'un équivalent à Apt ou
Homebrew (gestionnaires de paquets Debian ou Mac respectivement),
mais pour Ruby spécifiquement.

Depuis Ruby 1.9, RubyGems est intégré dans Ruby. Pour les versions
précédentes, il faudra l'installer séparement.

Lorsqu'une gem n'est pas disponible, il est toujours possible d'installer
une librairie à partir de son code source, ce dernier étant généralement
mis à disposition sous la forme d'une archive (.zip ou .tar.gz). Chaque
projet pouvant avoir ses spécificités, on consultera sa documentation (en
général, un fichier `README` ou `INSTALL` décrit la procédure
d'installation).

### Trouver des bibliothèques

[**RubyGems.org**][1] est le dépôt principal où vous trouverez des
bibliothèques pour Ruby. Vous pouvez aussi bien consulter le site dans
votre navigateur qu'utiliser la commande `gem`.

`gem search -r` permet d'effectuer une recherche sur RubyGems. Par
exemple, `ruby search -r rails` vous listera toutes les gems liées à
Rails de par leur nom. L'option `--local` (`-l`) fera de même, en ne
listant que les gems disponibles sur votre machine. Pour installer une
gem, il suffit de faire `gem install [gem]`. On peut lister ses gems
avec `gem list`. Pour plus d'informations sur la commande `gem`,
voyez ci-après et/ou la [documentation sur le site officiel][3].

D'autres sources ou dépôts existent aux cotés de RubyGems.org.
[RubyForge][4] était très populaire aux débuts de Ruby. Il est
aujourd'hui largement supplanté par [**GitHub**][5]. La plupart du
temps, le code source d'une gem est hébergé sur GitHub tandis que la
gem associée est publiée sur RubyGems.org.

[Ruby Application Archive][6] (RAA) recense tous types de
programmes Ruby, organisés selon leur fonction opérationnelle. Très
riche à une époque, mais plus vraiment d'actualité.

### Utilisation de RubyGems

On peut rapidement se familiariser avec la commande `gem` et couvrir
en quelques lignes l'usage quotidien qu'on peut en faire. Une
[documentation complète][7] est disponible par ailleurs.

#### Rechercher une gem

La commande **search** permet de faire une recherche lexicale sur les
gems du dépôt (donc, de chercher sur le *nom* des gems, pas leur
description). Ainsi, une recherche sur le mot « html » :

{% highlight sh %}
$ gem search -r html

*** REMOTE GEMS ***

html-sample (1.0, 1.1)
{% endhighlight %}

L'option `--remote` / `-r` indique à la commande `gem` que nous souhaitons
inspecter le dépôt « distant » RubyGems.org (il s'agit du comportement par
défaut, l'option est… optionnelle). L'option `--local` / `-l` permet de
faire une recherche locale (sur votre machine, parmi les gems déjà
installés).

#### Installer une gem

Une fois que vous avez choisi une librairie à installer, utilisez la
commande `gem install`. Par exemple, pour installer Rails :

{% highlight sh %}
$ gem install rails
{% endhighlight %}

Vous pouvez par ailleurs demander l’installation d’une version précise,
avec l’option `--version` :

{% highlight sh %}
$ gem install rails --version 5.0
{% endhighlight %}

#### Lister toutes les gems

Pour récupérer la (très longue) liste complète des gems disponibles :

{% highlight sh %}
$ gem list -r
{% endhighlight %}

Pour afficher uniquement les gems que *vous* avez installées :

{% highlight sh %}
$ gem list
{% endhighlight %}

#### Au secours !

Une aide succinte est disponible directement en ligne de commande :

{% highlight sh %}
$ gem help
{% endhighlight %}

Par exemple, `gem help commands` liste et décrit toutes les sous-commandes
de la commande `gem`.

#### Fabriquer vos propres gems

RubyGems.org propose [plusieurs guides][3] sur ce sujet. Vous serez sans
doute également intéressé par [Bundler][9], un outil générique visant à
simplifier la gestion des dépendances et qui s'intègre totalement à
RubyGems.



[1]: https://rubygems.org/
[2]: https://rubygems.org/pages/download/
[3]: http://guides.rubygems.org/
[4]: http://rubyforge.org/
[5]: https://github.com/
[6]: http://raa.ruby-lang.org/
[7]: http://guides.rubygems.org/command-reference/
[9]: http://bundler.io/
