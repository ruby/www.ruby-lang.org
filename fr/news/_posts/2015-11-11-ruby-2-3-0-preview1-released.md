---
layout: news_post
title: "Ruby 2.3.0-preview1 est disponible"
author: "naruse"
translator: "Jean-Denis Vauguet"
date: 2015-11-11 14:00:00 +0000
lang: fr
---

Nous avons le plaisir de vous annoncer la sortie de Ruby 2.3.0-preview1.

Il s'agit de la première preview de la branche 2.3.0. En plus des habituelles
améliorations et corrections, de nombreuses nouvelles fonctionnalités sont de la
partie.

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

À vous maintenant de tester Ruby 2.3.0-preview1 et de faire vos retours.

Consultez les fichiers [NEWS](https://github.com/ruby/ruby/blob/v2_3_0_preview1/NEWS)
et [ChangeLog](https://github.com/ruby/ruby/blob/v2_3_0_preview1/ChangeLog)
pour plus de détails sur cette *release*.

Par rapport à la version précédente, la 2.2, 1036 fichiers ont été modifiés,
avec 81 312 insertions(+) et 51 322 suppressions(-).

## Download

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview1.tar.bz2>

  * SIZE:   14174035 bytes
  * SHA1:   55ad4f04d7a33ab780458ee0999de9f6124217ea
  * SHA256: 42b9c9e1740a5abe2855d11803524370bd95744c8dcb0068572ed5c969ac7f0f
  * SHA512: ae6d46c87f59e1fd3703b76dfc45bfcf208625f95ab9f4559f0b9f7050e8681f1a6e419f5fa06b704c83e56879c3a9ff1337dba443bcfca76fadb49c97d97a93

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview1.tar.gz>

  * SIZE:   17560800 bytes
  * SHA1:   6249572e5dca27d8c73a0cbf036e24e5d88fe82f
  * SHA256: dc8f9d48392a2bb226df5f4b4fd2074d81af155cdf3f3799139a6e31e012aefe
  * SHA512: 58384ef6e743dde20ea263692dab86ce9d6d22d722ef4c02a84396aa3128ce06d933d9b69078a3cd666d72320a8a6ffdc93296bc0d5338595b2a44c29d4db383

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview1.tar.xz>

  * SIZE:   11225228 bytes
  * SHA1:   85b4f631efa4b6435b2b41df6ce6c46da294c4d4
  * SHA256: a88e19d9dc001db8f49ca3986a8a4e69980affff876854585725e40de0eedcd8
  * SHA512: 3be0f3ed4de73509b2f6975fe3fbe28bb4d51df87db6e2c0019e8a107edf49be60b2127ba5b18bca91f9f5964b07f1adde3042dac6327017359eeb130760672b

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview1.zip>

  * SIZE:   19777010 bytes
  * SHA1:   3458666c250dd333ac4b537be25f1913dd311ea1
  * SHA256: 0fc1d4450e9141f541038a4433f8fb49fb929e43c7bf5985685a4fa7b213a811
  * SHA512: f53653cf11d8dce1d627f7db3a15acca29c74c78735406a5d64bbbdc39fac232ef63110eb4d83521bef40c6f3006d55bbeaf54d1ddab1d4b6e5a13cee9247e85

## Commentaire de version

Il est possible de consulter un [calendrier de *release* pour la version 2.3](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering23).
