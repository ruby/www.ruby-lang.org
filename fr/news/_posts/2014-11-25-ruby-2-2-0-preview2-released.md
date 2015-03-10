---
layout: news_post
title: "Ruby 2.2.0-preview2 est disponible"
author: "naruse"
translator: "Geoffrey Roguelon"
date: 2014-11-28 09:00:00 +0000
lang: fr
---

Nous avons le plaisir de vous annoncer la sortie de Ruby 2.2.0-preview2.

Ruby 2.2.0-preview2 est la seconde pré-version de Ruby 2.2.0.
Beaucoup de nouvelles fonctionnalités et d'améliorations ont été ajoutées par
les diverses demandes qui sont toujours de plus en plus nombreuses.

Par exemple, le ramasse miettes des symboles diminuera le risque d'épuisement de
la mémoire (les symboles ne libèrent pas la mémoire actuellement).
C'est pour cela que
[Rails 5.0](http://weblog.rubyonrails.org/2014/8/20/Rails-4-2-beta1/)
nécessitera Ruby 2.2 ou plus récent.

Le ramasse miettes incrémental est également très utile pour diminuer les temps
de pauses entre chaque action du ramasse miettes.
Cela contribuera aux performances des applications Rails.

Une autre fonctionnalité concernant la gestion de la mémoire est l'ajout d'une
option pour le configure.in pour utiliser jemalloc
[Ticket #9113](https://bugs.ruby-lang.org/issues/9113).
C'est une fonctionnalité expérimentale et est désactivée par défaut.
Nous avons besoin de collecter des données d'utilisation et quand nous serons
convaincus des bénéfices, cette fonctionnalité sera activée par défaut.

Enfin, un dernier point, [l'utilisation de vfork(2) dans system() et spawn() (japonnais)](http://www.a-k-r.org/d/2014-09.html#a2014_09_06).
Ceci doit permettre une grosse amélioration de la vitesse d'exécution de large processus exécuté fréquemment. Cependant vfork(2) est un appel système risqué.
Nous souhaitons mesurer les bénéfices apportés à travers des cas concrets d'utilisations.

Essayez et profiter de Ruby 2.2.0-preview2 et rapportez nous le moindre problème !

## Changements importants depuis Ruby 2.1

* [Ramasse miettes incrémental](https://bugs.ruby-lang.org/issues/10137) ([YARV Maniacs No.12](http://magazine.rubyist.net/?0048-YARVManiacs))
* [Ramasse miettes des symboles](https://bugs.ruby-lang.org/issues/9634) ([présentaté à la RubyKaigi 2014](http://www.slideshare.net/authorNari/symbol-gc))
* configure --with-jemalloc [Fonctionnalité #9113](https://bugs.ruby-lang.org/issues/9113)
* bibliothèque Ruby :
  * support d'Unicode 7.0 [#9092](https://bugs.ruby-lang.org/issues/9092)
  * nouvelles méthodes :
    * Enumerable#slice_after [#9071](https://bugs.ruby-lang.org/issues/9071), Enumerable#slice_when [#9826](https://bugs.ruby-lang.org/issues/9826)
    * Float#next_float, Float#prev_float [#9834](https://bugs.ruby-lang.org/issues/9834)
    * File.birthtime, File#birthtime [#9647](https://bugs.ruby-lang.org/issues/9647)
    * String#unicode_normalize [#10084](https://bugs.ruby-lang.org/issues/10084)
* bibliothèques pré-installées :
  * mise à jour à Psych 2.0.6
  * mise à jour à Rake 10.4.0
  * mise à jour à RDoc 4.2.0.alpha (21b241a)
  * mise à jour à RubyGems 2.4.4+ (2f6e42e)
  * mise à jour à test-unit 3.0.7 (supprimée du répertoire CRuby mais fournie dans l'archive)
  * mise à jour à minitest 5.4.3 (supprimée du répertoire CRuby mais fournie dans l'archive)
  * dépréciation de mathn
* API C
  * suppression des APIs dépréciées

Consultez le fichier [NEWS dans le répertoire Ruby](https://github.com/ruby/ruby/blob/v2_2_0_preview2/NEWS) pour plus de détails.

Avec ces changements, 1 239 fichiers changés, 98 343 ajouts(+), 61 858 suppréssions(-).

## Téléchargements

* <http://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-preview2.tar.bz2>
  * SIZE:   12505279 bytes
  * MD5:    d7abace25a8ffe861cb2807bef1c58a6
  * SHA256: 9e49583f3fad3888fefc85b719fdb210a88ef54d80f9eac439b7ca4232fa7f0b
  * SHA512: c654d4c047f9463a5fb81eaea0fa5ab7bf316962bc7fb0fb356861e6336ce8ce2162c7779d8b27f72d7bc0e9604b5e5af2910abcb0b0a1f197b3138eaddfd4a5
* <http://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-preview2.tar.gz>
  * SIZE:   15505521 bytes
  * MD5:    bde388d6f10012a92d5dc36196fd6755
  * SHA256: dfcef7b01bd3acb41da6689993ac8dd30e2ecd4fd14bc1a833f46188a9fe2614
  * SHA512: e2d316a679c15c021e40b0f9b7810b319c6a5e771a9b869fda35b6745aecac881bbb05d62192893799816a8673e05c8f17713f10ccdec077f546483608ab85c1
* <http://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-preview2.tar.xz>
  * SIZE:   9649216 bytes
  * MD5:    0d582e28b92ce9d1456e40fb8d821422
  * SHA256: d14d1fa045263fa242a515d7b9e8c485bf8a9ee9d9d3012dc2b6add0f3a370c6
  * SHA512: 4a8a75ab21b2bd43db4a22d9c63f189f3c7805d575d662b07a4ddc25aa5b156b0c23053d8c48eecf23d5e22f1ea7131467f1cdc48f9ae0a83214b4cd46b08491
* <http://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-preview2.zip>
  * SIZE:   17239396 bytes
  * MD5:    d94160c214016863932c25cc1ac6ff90
  * SHA256: 88d6c73ee1a4f5fe1f8ad37fe1f56c1ca50622f1338c20b9d46bbb5c2cd94040
  * SHA512: 0a021d31f54c47c5c3901ef6f2ab02a1bfb5cc698f971978c1e16b1aeda78fdadec0c1cdd48af1c8784b8f72ad00d35cf2433d78e20d4447fa0630e02b4e3917

## Commentaire

* [Tickets ouverts](http://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=115)

Consultez également le planning de versions et d'autres informations :

[ReleaseEngineering22](http://bugs.ruby-lang.org/projects/ruby-trunk/wiki/ReleaseEngineering22)
