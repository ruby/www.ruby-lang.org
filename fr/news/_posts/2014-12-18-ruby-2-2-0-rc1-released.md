---
layout: news_post
title: "Ruby 2.2.0-rc1 est disponible"
author: "naruse"
translator: "Geoffrey Roguelon"
date: 2014-12-18 09:00:00 +0000
lang: fr
---

Nous avons le plaisir de vous annoncer la sortie de Ruby 2.2.0-rc1.
Après cette version, tous les changements seront limités à des corrections de bugs.
La version finale de Ruby 2.2.0 est planifié pour le 25 décembre 2014.

Ruby 2.2 inclut beaucoup de nouvelles fonctionnalités et d'améliorations pour
répondre aux  diverses demandes qui sont toujours de plus en plus nombreuses.

Par exemple, le ramasse miettes des symboles diminuera le risque d'épuisement de
la mémoire (les symboles ne libèrent pas la mémoire actuellement).
C'est pour cela que Rails 5.0 nécessitera le ramasse miettes des symboles et par
conséquent nécessitera Ruby 2.2 ou plus récent (consultez Rails
[4.2](http://weblog.rubyonrails.org/2014/12/19/Rails-4-2-final/) pour plus de
détails).

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

Essayez et profiter de Ruby 2.2.0-rc1 et rapportez nous le moindre problème !

## Changements importants depuis Ruby 2.1

* [Ramasse miettes incrémental](https://bugs.ruby-lang.org/issues/10137) ([YARV Maniacs No.12](http://magazine.rubyist.net/?0048-YARVManiacs))
* [Ramasse miettes des symboles](https://bugs.ruby-lang.org/issues/9634) ([présenté à la RubyKaigi 2014](http://www.slideshare.net/authorNari/symbol-gc))
* configure --with-jemalloc [Fonctionnalité #9113](https://bugs.ruby-lang.org/issues/9113)
* bibliothèque Ruby :
  * support d'Unicode 7.0 [#9092](https://bugs.ruby-lang.org/issues/9092)
  * nouvelles méthodes :
    * Enumerable#slice_after [#9071](https://bugs.ruby-lang.org/issues/9071), Enumerable#slice_when [#9826](https://bugs.ruby-lang.org/issues/9826)
    * Float#next_float, Float#prev_float [#9834](https://bugs.ruby-lang.org/issues/9834)
    * File.birthtime, File#birthtime [#9647](https://bugs.ruby-lang.org/issues/9647)
    * String#unicode_normalize [#10084](https://bugs.ruby-lang.org/issues/10084)
* bibliothèques pré-installées :
  * mise à jour à Psych 2.0.8
  * mise à jour à Rake 10.4.0
  * mise à jour à RDoc 4.2.0.alpha (21b241a)
  * mise à jour à RubyGems 2.4.5
  * mise à jour à test-unit 3.0.8 (supprimée du répertoire CRuby mais fournie dans l'archive)
  * mise à jour à minitest 5.4.3 (supprimée du répertoire CRuby mais fournie dans l'archive)
  * dépréciation de mathn
* API C
  * suppression des APIs dépréciées

Consultez le fichier [NEWS dans le répertoire Ruby](https://github.com/ruby/ruby/blob/v2_2_0_rc1/NEWS) pour plus de détails.

Avec ces changements, 1 548 fichiers changés, 123 658 ajouts(+), 74 306 suppréssions(-).

## Téléchargements

* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-rc1.tar.bz2>
  * SIZE:   12475612 bytes
  * MD5:    7144732d30dd4547c0a59862b3345d54
  * SHA256: e6a1f8d45ea749bdc92eb1269b77ec475bc600b66039ff90d77db8f50820a896
  * SHA512: 181201168360bee37dceeef3481a69e8a333a5d329680031fd9d371d30ac64460bbdf4db07546133024f541774e51301f1630cfd988c5e5bf2464834f3abe6bf
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-rc1.tar.gz>
  * SIZE:   15531233 bytes
  * MD5:    51f218fabc3ceb7bf3fe5f4f87ddebd3
  * SHA256: a59c8db71b967015ad7c259ba8ef638c7943ec78580412bb86e97791a9322b6b
  * SHA512: 4a35e78c4c0747f9c79e506e98acc117efb0be72fc103d6f9c13d5eb5efa5c6d6748f491526fc7ebb24397f25238f06d552f841e9e898be30aa7cd6c2df38494
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-rc1.tar.xz>
  * SIZE:   9675108 bytes
  * MD5:    3f482b88eda45c1bc6bab1921763ce52
  * SHA256: dcfad9bb6e0b513b03f08f86b195da6a6a7045559b558d3493decac0e0abb86c
  * SHA512: 3ec8955d8a269a1e5f28c3e0e6023bd613f244c83914a4a8c96d2761b11914c21ce67cfadb2bcebc480d9c0b9c7b54da6dfa67cdf4b4350db2a85d379265ffed
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-rc1.zip>
  * SIZE:   17219660 bytes
  * MD5:    49f5aae44c00f4d57be47576c29a53bd
  * SHA256: 1bd3e83d44b4e5879b4ecdc496d19905bc03637a8c88027c2dc98a369f1ebb83
  * SHA512: bf0e39e5add532ca338095ad6eaaafbe4f84cc9df1e8d4bad986c44e17614623430c2670d9751865e8d645cb483007d5473be82536b985ccab40a7dde72c4161

## Commentaire

* [Tickets ouverts](https://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=115)

Consultez également le planning de versions et d'autres informations :

[ReleaseEngineering22](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering22)
