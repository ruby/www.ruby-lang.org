---
layout: news_post
title: "Ruby 2.3.0-preview2 est disponible"
author: "naruse"
translator: "Jean-Denis Vauguet"
date: 2015-12-11 14:00:00 +0000
lang: fr
---

Nous avons le plaisir de vous annoncer la sortie de Ruby 2.3.0-preview2.

Cette seconde preview de la branche 2.3 amène de nombreuses nouvelles
fonctionnalités et améliorations.

On notera en particulier l'ajout des [*Frozen String Literal
Pragma*](https://bugs.ruby-lang.org/issues/11473). Avec Ruby 2.1,
`"str".freeze` avait été optimisé afin de réduire la quantité d'allocations
objet. Ruby 2.3 permet en plus l'utilisation d'un nouveau commentaire sémantique
et d'une option en ligne de commande, pour *freeze* d'un seul coup tout ou
partie des chaînes de caractères litérales présentes dans le code source. Par
ailleurs, du coté du deboggage, il est maintenant possible de savoir où
exactement une certaine chaîne de caractère gelée était sur le point d'être
modifiée lorsque survient une erreur du type `"can't modify frozen String"`, en
utilisant le drapeau `--enable-frozen-string-literal-debug`.

Autre nouveauté, l'[opérateur de navigation sécurisé](https://bugs.ruby-lang.org/issues/11537)
(*Safe navigation operator*) `&.` qui va faciliter la gestion de `nil`. Déjà
présent dans C#, Groovy, Swift ou encore CoffeeScript, cet opérateur permet
d'écrire `obj&.foo` sans se soucier de savoir si `foo` existe. À noter
également, l'ajout de `Array#dig` and `Hash#dig`.

La gem `did_you_mean` [a été intégrée à Ruby MRI](https://bugs.ruby-lang.org/issues/11252).
Cette librairie permet de proposer au développeur des corrections probables
lorsque survient une erreur du type `NameError` ou `NoMethodError`. Pratique !

Les méthodes [RubyVM::InstructionSequence#to_binary et .load_from_binary](https://bugs.ruby-lang.org/issues/11788)
ont été ajoutées en tant que foncionnalités expérimentales. Elles permettent de
concevoir un système de pré-compilation ISeq (sur base de bytecode).

Par ailleurs, Ruby 2.3 apporte de nombreuses améliorations coté performances.
Par exemple,
[une optimisation de Proc#call](https://bugs.ruby-lang.org/issues/11569),
[la refonte du modèle de données liant méthodes et classes](https://bugs.ruby-lang.org/issues/11278),
[la mise en place d'une nouvelle structure de données pour gérer les ID de façon générique](https://bugs.ruby-lang.org/issues/11420),
des optimisations du code machine gérant l'allocation objet et l'appel des méthodes, etc.

À vous maintenant de tester Ruby 2.3.0-preview2 et de faire vos retours.

## Changements depuis la 2.2

Consultez les fichiers [NEWS](https://github.com/ruby/ruby/blob/v2_3_0_preview2/NEWS)
et [ChangeLog](https://github.com/ruby/ruby/blob/v2_3_0_preview2/ChangeLog)
pour plus de détails sur cette *release*.

Par rapport à la version précédente, la 2.2, [1097 fichiers ont été modifiés,
avec 97 466 insertions(+) et 58 685 suppressions(-)](https://github.com/ruby/ruby/compare/v2_2_0...v2_3_0_preview2.

## Téléchargement

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview2.tar.bz2>

  * SIZE:   14126752 bytes
  * SHA1:   7e717ef7a0a1523ad696b5fe693f7f7a613a3810
  * SHA256: e9b0464e50b2e5c31546e6b8ca8cad71fe2d2146ccf88b7419bbe9626af741cb
  * SHA512: e397f321d4338edba8d005d871408775f03d975da90c8abcfdb457a1bc7e6c87efe58c53b2c3bc122e9f58f619767b271bcc8d5d9663ed4b4288c60556e8d288

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview2.tar.gz>

  * SIZE:   17623519 bytes
  * SHA1:   2deaf3ccbbfc5e08d3d840a4f1c33ff5f62f931d
  * SHA256: cb1c745bda33ba9e812b48c87852571ef6486f985c5e6ff4508a137d1c9734a3
  * SHA512: 83022f99775eb139beec281d59029dcc7c59de1e313182685b0a785334ac53d0c445212460d00d065169b922949263f30a1f981e19fc6e59814e79e6e53ae8e0

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview2.tar.xz>

  * SIZE:   11249780 bytes
  * SHA1:   e1dfca06cd3c2cf6456a7feb0b1cd0752bde1a3b
  * SHA256: 7c3119268af87c137f415301b299281762453ad78f86e35562be014dabd67b11
  * SHA512: ab3376145d95a2188e6345984f0e5592c8d33515d7046a2ab2565dc418fa2306cdcf797aae9494d4d10446ada54ba638d8a8ad2d4b7510544d7eaea3de4faa87

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview2.zip>

  * SIZE:   19841531 bytes
  * SHA1:   db7fa5291d90e0a9c6f75c0cd068bc54050520d6
  * SHA256: 90d036fd1ec40aa8f5493821ac162bf69f505c5977db54afe53b8bf689d79b9d
  * SHA512: 05784df420018aaae7d09d41e872df708e861cacc74dc8ee97a9e3ac7458cb12b937523ad6def34d5ae2890a0cf037a8d61e365beb88d28acd84879b9391ad65

## Commentaire de version

Vous pouvez également consulter [un calendrier de *release* (avec diverses infos)](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering23).
