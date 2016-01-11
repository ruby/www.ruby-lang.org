---
layout: news_post
title: "Ruby 2.3.0 est disponible"
author: "naruse"
translator: "Jean-Denis Vauguet"
date: 2015-12-25 17:00:00 +0000
lang: fr
---

Nous avons le plaisir de vous annoncer la sortie de Ruby 2.3.0.

Il s'agit de la première version stable de la branche 2.3. Au menu, de nombreuses
nouvelles fonctionnalités, avec par exemple…


L'ajout des [*Frozen String Literal
Pragma*](https://bugs.ruby-lang.org/issues/11473). Avec Ruby 2.1,
`"str".freeze` avait été optimisé afin de réduire la quantité d'allocations
objet. Ruby 2.3 permet en plus l'utilisation d'un nouveau commentaire sémantique
et d'une option en ligne de commande, pour *freeze* d'un seul coup tout ou
partie des chaînes de caractères litérales présentes dans le code source. Par
ailleurs, du coté du deboggage, il est maintenant possible de savoir où
exactement une certaine chaîne de caractère gelée était sur le point d'être
modifiée lorsque survient une erreur du type `"can't modify frozen String"`, en
utilisant le drapeau `--enable-frozen-string-literal-debug`.

L'[opérateur de navigation sécurisé](https://bugs.ruby-lang.org/issues/11537)
(*Safe navigation operator*) `&.` qui va faciliter la gestion de `nil`. Déjà
présent dans C#, Groovy, Swift ou encore CoffeeScript, cet opérateur permet
d'écrire `obj&.foo` sans se soucier de savoir si `foo` existe.
Il s'agit de la même chose que le [`try!` d'Active Support](http://api.rubyonrails.org/v4.2.5/classes/Object.html#method-i-try-21),
mais qui est limité à `nil`. À noter également, l'ajout de `Array#dig` and `Hash#dig`.

La gem `did_you_mean` [a été intégrée à Ruby MRI](https://bugs.ruby-lang.org/issues/11252).
Cette librairie permet de proposer au développeur des corrections probables
lorsque survient une erreur du type `NameError` ou `NoMethodError`. Pratique !

Les méthodes [RubyVM::InstructionSequence#to_binary et .load_from_binary](https://bugs.ruby-lang.org/issues/11788),
qui ont été ajoutées en tant que fonctionnalités expérimentales. Elles permettent de
concevoir un système de pré-compilation ISeq (sur base de bytecode).

Par ailleurs, Ruby 2.3 apporte de nombreuses améliorations coté performances.
Par exemple,
[une optimisation de Proc#call](https://bugs.ruby-lang.org/issues/11569),
[la refonte du modèle de données liant méthodes et classes](https://bugs.ruby-lang.org/issues/11278),
[la mise en place d'une nouvelle structure de données pour gérer les ID de façon générique](https://bugs.ruby-lang.org/issues/11420),
des optimisations du code machine gérant l'allocation objet et l'appel des méthodes,
[une structure de donnée plus ingénieuse pour les variables](https://bugs.ruby-lang.org/issues/11170),
[la gestion de `exception: false` dans les argument des méthodes `Socket#*_nonblock`](https://bugs.ruby-lang.org/issues/11229), etc.
Consultez la section "Implementation improvements" du fichier NEWS pour plus de
détails.

Vous trouverez une liste exhaustive des changements, ainsi que des notes de
compatibilité, dans le fichier [NEWS](https://github.com/ruby/ruby/blob/v2_3_0/NEWS)
et dans le [ChangeLog](https://github.com/ruby/ruby/blob/v2_3_0/ChangeLog).

Par rapport à la version précédente, la 2.2, [2946 fichiers ont été modifiés,
avec 104 057 insertions(+) et 59 478 suppressions(-)](https://github.com/ruby/ruby/compare/v2_2_0...v2_3_0_preview2).

Joyeux Noël, bonnes vacances et amusez-vous bien avec Ruby 2.3 !

## Téléchargement

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0.tar.bz2>

      SIZE:   14185617 bytes
      SHA1:   6c8a832d49d22755ea8c45b6d53faf2ccc6d6ac9
      SHA256: ec7579eaba2e4c402a089dbc86c98e5f1f62507880fd800b9b34ca30166bfa5e
      SHA512: 77b707359e754c3616699d21697752741497c719dc3d6fdfb55ed639e76d52560d293ae54cbe5c63be78dc73fbe60f1b8615d704d017bdfe1994aa9747d26a6c

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0.tar.gz>

      SIZE:   17648682 bytes
      SHA1:   2dfcf7f33bda4078efca30ae28cb89cd0e36ddc4
      SHA256: ba5ba60e5f1aa21b4ef8e9bf35b9ddb57286cb546aac4b5a28c71f459467e507
      SHA512: 914d0201ecefaeb67aca0531146d2e89900833d8d2a597ec8a19be94529ab6b4be367f9b0cee2868b407288896cc14b64d96150223cac0aef8aafc46fc3dd7cc

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0.tar.xz>

      SIZE:   11294412 bytes
      SHA1:   96e620e38af351c8da63e40cfe217ec79f912ba1
      SHA256: 70125af0cfd7048e813a5eecab3676249582bfb65cfd57b868c3595f966e4097
      SHA512: d893c5e6db5a0533e0da48d899c619964388852ef90e7d1b92a4363d5f189cd2dba32a009581f62b9f42a8e6027975fc3c18b64faf356f5e3ac43a8d69ec5327

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0.zip>

      SIZE:   19840511 bytes
      SHA1:   3f88617568d9a4f491e8b32dca532363f73eaa71
      SHA256: 8270bdcbc6b62a18fdf1b75bd28d5d6fc0fc26b9bd778d422393a1b98006020a
      SHA512: a3f397bb3c9c19d9b797552c5d60bb01c82db884cfa966df84881125bea35713cffd99f88fb86b271bae72d9cfb09ad9b33838cffcf6365c091459479914fdef
