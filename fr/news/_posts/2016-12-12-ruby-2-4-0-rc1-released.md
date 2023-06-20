---
layout: news_post
title: "Ruby 2.4.0-rc1 est disponible"
author: "naruse"
translator: "Jean-Denis Vauguet"
date: 2016-12-12 09:00:00 +0000
lang: fr
---

Nous sommes heureux d'annoncer la sortie de Ruby 2.4.0-rc1.

Ruby 2.4.0-rc1 est la première *release candidate* pour la version stable 2.4.0
Le but de cette version est d'obtenir des retours de la communauté : n'hésitez
pas à nous [envoyer vos remarques](https://github.com/ruby/ruby/wiki/How-To-Report).

## [Améliorations de la table de hachage (par Vladimir Makarov)](https://bugs.ruby-lang.org/issues/12142)

La structure interne de la table de hachage (st_table) a été retouchée pour
supporter l'adressage ouvert (une méthode de résolution de collisions), et
de ce fait maintient un ordre d'inclusion. Cette modification substantielle
a été conçue par de nombreuses personnes, notamment Yura Sokolov.

## Binding#irb: lancement d'une session REPL similaire à `binding.pry`

Lors de vos phases de deboggage, vous utilisez sans doute souvent `p` pour
inspecter le contenu de variables. Avec [pry](https://github.com/pry/pry),
il est possible d'écrire `binding.pry` pour lancer une session REPL à partir
de n'importe quel endroit, pour exécuter du code Ruby.

[r56624](https://github.com/ruby/ruby/commit/493e48897421d176a8faf0f0820323d79ecdf94a)
reproduit cette fonctionnalité pour IRB, avec `binding.irb`.

## [Fusion de Fixnum et Bignum dans Integer](https://bugs.ruby-lang.org/issues/12005)

Bien que la spec [ISO/IEC 30170:2012](http://www.iso.org/iso/iso_catalogue/catalogue_tc/catalogue_detail.htm?csnumber=59579)
ne préjauge pas de l'implémentation de la classe Integer, Ruby a historiquement
construit une abstraction basé sur deux classes spécialisées : Fixnum et Bignum.
Ruby 2.4 procède à une unification de ces APIs dans la classe « mère » Integer.
Toutes les extensions C qui modifieraient Fixnum ou Bignum devront être corrigées.

Pour plus de détails, consultez [ce ticket](https://bugs.ruby-lang.org/issues/12005)
et la [présentation de akr](http://www.a-k-r.org/pub/2016-09-08-rubykaigi-unified-integer.pdf).

## [Support de Unicode dans les transformations de String](https://bugs.ruby-lang.org/issues/10085)

L'ensemble de méthode `String/Symbol#upcase/downcase/swapcase/capitalize(!)`
supporte désormais Unicode. Jusqu'ici, les transformations étaient limitées
à ASCII.

## Améliorations des performances

Ruby 2.4 apporte plusieurs améliorations de performances via l'implémentation
de méthodes de l'API standard :

### [Array#max, Array#min](https://bugs.ruby-lang.org/issues/12172)

`[x, y].max` et `[x, y].min` ont été optimisées pour ne pas créer de tableau
temporaire dans certains cas qui le permettent.

### [Regexp#match?](https://bugs.ruby-lang.org/issues/8110)

Ajout de `Regexp#match?`, qui exécute une expression régulière sans créer l'objet
de référence arrières (*back reference*), ni changer `$~`, de façon à réduire la
charge d'allocation mémoire.

### Autres améliorations

* [accélération de l'accès aux variables d'instance](https://bugs.ruby-lang.org/issues/12274)

## Deboggage

### [Thread#report_on_exception et Thread.report_on_exception](https://bugs.ruby-lang.org/issues/6647)

Ruby ignore les exceptions non traitées par `rescue` dans les threads, sauf
quand un autre thread impose le comportement contraire du fait de l'utilisation
de [Thread#join](https://ruby-doc.org/core-2.4.0/Thread.html#method-i-join). Avec
`report_on_exception = true`, vous pouvez désormais contrôler *a priori* ce
comportement, et ainsi être notifiés quand un thread arbitraire meurt du fait
d'une exception non traitée.

Dites-nous quelle valeur par défaut vous souhaiteriez que Ruby définisse pour
le réglage `report_on_exception`, et aussi pour *report-on-GC*, qui affiche un
rapport quand un thread (non-`join`) est recyclé par le ramasse-miette.

### [La détection d'interblocage de Thread affiche désormais les threads avec leur backtrace et dépendances](https://bugs.ruby-lang.org/issues/8214)

Ruby comporte une détection des interblocages (*deadlocks*) pour les threads
mis en attente, mais le rapport de détection ne fournissait pas suffisamment
d'information jusqu'ici pour être réellement utile en phase de deboggage.
Ruby 2.4 ajoute la backtrace au rapport, ainsi qu'une liste des threads
dépendants.

Nous vous invitons à essayer tous ces changements apportés par Ruby 2.4.0-rc1
et à nous [faire vos retours](https://github.com/ruby/ruby/wiki/How-To-Report) !

## Autres changements notables depuis la version 2.3

* Support de OpenSSL 1.1.0 (et fin du support des versions 0.9.7 et précédentes)
* ext/tk retiré de la librairie standard ([#8539](https://bugs.ruby-lang.org/issues/8539))
* XMLRPC retiré de la librairie standard ([#12160](https://bugs.ruby-lang.org/issues/12160))

Consultez le fichier [NEWS](https://github.com/ruby/ruby/blob/v2_4_0_rc1/NEWS)
et le log de commits pour plus de détails.

Ces modifications correspondent en tout et pour tout à
[2519 fichiers modifiés, 288606 insertions(+) et 83896 suppressions(-)](https://github.com/ruby/ruby/compare/v2_3_0...v2_4_0_rc1)
depuis la sortie de Ruby 2.3.0 !

## Téléchargement

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-rc1.tar.bz2>

      SIZE:   12512729 bytes
      SHA1:   a0439652a97a2406b691e8a1e586e2cf08c258ba
      SHA256: 3b156b20f9df0dd62cbeeb8e57e66ea872d2a5b55fabdef1889650122bcc2ea7
      SHA512: b43902ac7794487197df55a45256819d2e7540b77f1ed4eb68def3e0473ee98860a400862075bafadbde74f242e1dfe36a18cd6fe05ac42aae1ea6dddc9978ce

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-rc1.tar.gz>

      SIZE:   14098505 bytes
      SHA1:   6b242f9ec7b908c9aa26e497440684ba06d86927
      SHA256: e41ada7650eed2a5800534d1201ba7c88f1627085659df994f47ab4c5e327745
      SHA512: 26d3c60483ce2d6eaabd7077085102fad6633f18cf5d772bacf6f563670030cb7bba22d54d8b7dfa5eac8b52990371c4a6ad1c095dff6f6b3a7bbe1a8ffb3754

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-rc1.tar.xz>

      SIZE:   9930088 bytes
      SHA1:   7c404e8bec9859f708927f7203d4f42187e678b7
      SHA256: 3f014b3186d10676da6c512d14c65db23ccc4bf200fed9d7c6f9a58fd1e3295b
      SHA512: 22e209e28da1f2394f50c0a7dd5d0d4d4c0c5a6b5b0b02260fad0267a0940b98f0e2b0f36a44f87d1612555cb3022f43cd136a5186c7f87650aa20264408d415

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-rc1.zip>

      SIZE:   15785968 bytes
      SHA1:   7d82386434ccbb1701f2995286bf29c8b9179e01
      SHA256: 14e6910e36618cddffeb22bad5f1052f907dc31ec93d4aa945bca0905d8a52c4
      SHA512: 5dd89320d429e5bd5faf3709be7e5b70f7355304d6324d7ac13a69187e5f1446ad5988c8186bc33f4fea8934288294f9d16fea173f39b2b39967746c4b03d1d4

## Commentaire de release

Consultez également notre calendrier de sortie :

[ReleaseEngineering24](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering24)
