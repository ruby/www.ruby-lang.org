---
layout: news_post
title: "Ruby 2.2.0 est disponible"
author: "naruse"
translator: "Geoffrey Roguelon"
date: 2014-12-25 09:00:00 +0000
lang: fr
---

Nous avons le plaisir de vous annoncer la sortie de Ruby 2.2.0.

Ruby 2.2 contient beaucoup de nouvelles fonctionnalités et d'améliorations pour
répondre aux diverses demandes qui sont toujours de plus en plus nombreuses.

Par exemple, le ramasse miettes de Ruby peut désormais désallouer les objets Symbol.
Ceci permet de diminuer l'usage mémoire des symboles. Avant Ruby 2.2, les symboles
n'étaient jamais désallouer.
De plus Rails 5.0 utilisera le ramasse miettes des symboles, c'est pour cela qu'il sera nécessaire d'utiliser Ruby 2.2 ou plus récent.
(Consultez [Rails 4.2](http://weblog.rubyonrails.org/2014/12/19/Rails-4-2-final/) pour plus de
détails.)

Le ramasse miettes incrémental est également très utile pour diminuer les temps
de pauses entre chaque action du ramasse miettes.
Cela contribuera aux performances des applications Rails.
Les récents développements de Rails mentionnés sur le [blog Rails](http://weblog.rubyonrails.org/)
laisse penser que Rails 5.0 profitera des bénéfices du ramasse miettes
incrémental et du ramassse miettes des symboles.

Une autre fonctionnalité concernant la gestion de la mémoire est l'ajout d'une
option pour le configure.in pour utiliser jemalloc
[Ticket #9113](https://bugs.ruby-lang.org/issues/9113).
C'est une fonctionnalité expérimentale et est désactivée par défaut.
Nous avons besoin de collecter des données d'utilisation et quand nous serons
convaincus des bénéfices, cette fonctionnalité sera activée par défaut.

L'ajout expérimentale pour l'utilisation de vfork(2) dans les appels system() et
spawn(). Vous pouvez lire le [blog de tanaka-san en japonais](http://www.a-k-r.org/d/2014-09.html#a2014_09_06)
pour plus de détails. Ceci doit permettre une grosse amélioration de la vitesse
d'exécution de large processus exécuté fréquemment. Cependant vfork(2) est un
appel système risqué.
Nous souhaitons mesurer les bénéfices apportés à travers des cas concrets d'utilisations.

Essayez et profiter de Ruby 2.2.0 et rapportez nous le moindre problème !

## Changements importants depuis Ruby 2.1

* [Ramasse miettes incrémental](https://bugs.ruby-lang.org/issues/10137)
  ([présentation à la RubyConf 2014 : "Incremental GC for Ruby interpreter"](http://www.atdot.net/~ko1/activities/2014_rubyconf_pub.pdf))
* [Ramasse miettes des symboles](https://bugs.ruby-lang.org/issues/9634)
  ([présenté à la RubyKaigi 2014](http://www.slideshare.net/authorNari/symbol-gc))
* configure --with-jemalloc
  [Fonctionnalité #9113](https://bugs.ruby-lang.org/issues/9113)
* bibliothèque Ruby :
  * support d'Unicode 7.0 [#9092](https://bugs.ruby-lang.org/issues/9092)
  * nouvelles méthodes :
    * Enumerable#slice_after [#9071](https://bugs.ruby-lang.org/issues/9071),
      Enumerable#slice_when [#9826](https://bugs.ruby-lang.org/issues/9826)
    * Float#next_float, Float#prev_float
      [#9834](https://bugs.ruby-lang.org/issues/9834)
    * File.birthtime, File#birthtime
      [#9647](https://bugs.ruby-lang.org/issues/9647)
    * String#unicode_normalize [#10084](https://bugs.ruby-lang.org/issues/10084)
* bibliothèques pré-installées :
  * mise à jour à Psych 2.0.8
  * mise à jour à Rake 10.4.2
  * mise à jour à RDoc 4.2.0
  * mise à jour à RubyGems 2.4.5
  * mise à jour à test-unit 3.0.8 (supprimée du répertoire CRuby mais fournie dans l'archive)
  * mise à jour à minitest 5.4.3 (supprimée du répertoire CRuby mais fournie dans l'archive)
  * dépréciation de mathn
* API C
  * suppression des APIs dépréciées

Consultez le fichier [NEWS dans le répertoire Ruby](https://github.com/ruby/ruby/blob/v2_2_0/NEWS) pour plus de détails.

Avec ces changements, 1 557 fichiers changés, 125 039 ajouts(+), 74 376 suppréssions(-).

## Téléchargements

* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0.tar.bz2>
  * SIZE:   13304042 bytes
  * MD5:    d03cd4690fec1fff81d096d1c1255fde
  * SHA256: 1c031137999f832f86be366a71155113675b72420830ce432b777a0ff4942955
  * SHA512: 04edc53e8cd1732c3ca61ebeb1d6133614beb10f77f9abb80d8d36352fe8aa205112068e460bf600b2c7e81e0ddcc3b311e7e027c320366f1bd992b3e378a6ad
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0.tar.gz>
  * SIZE:   16494584 bytes
  * MD5:    cd03b28fd0b555970f5c4fd481700852
  * SHA256: 7671e394abfb5d262fbcd3b27a71bf78737c7e9347fa21c39e58b0bb9c4840fc
  * SHA512: 1ba0c68e1c8d2b60bbd1e218cf36463edbe34cf9418d7593702b631e68d02297465f752e71395f6cfa4104f4cd70a1eb44381ffb74bc7801758b830931fdcfc6
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0.tar.xz>
  * SIZE:   10304244 bytes
  * MD5:    54b43c6c6c9dd4c4b08ceb03ad0ded7a
  * SHA256: 848714e280fc5fb44dbac3b060b206e56c1947006324ee68a174d68b483ef8ca
  * SHA512: cd7e52faa464df8aca7ccfa23a5f06248e1ad82bc8c9f1829aa1b51ff37b15973b8caaa68e914d837325b8d59427fda4f3cad82c50925e1c84e688324a2a155d
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0.zip>
  * SIZE:   18441027 bytes
  * MD5:    f8e1d0cee4f2d9535a9529ed23ae3700
  * SHA256: e06c1e2b1248cf881749833084b2bec93f7612676009190ff9bc89b8fd07c29f
  * SHA512: 364dd927b496520d95a1b06c68e1a265015f4cab08bdf3efaa323d385e7bf075eae47f2e1db78a629db0f3c0c1ed24e086603ba21e2da02ac06dd3c8b716766e
