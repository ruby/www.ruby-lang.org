---
layout: news_post
title: "Ruby 2.4.0 est disponible"
author: "naruse"
translator: "Jean-Denis Vauguet"
date: 2016-12-25 00:00:00 +0000
lang: fr
---

Nous sommes heureux d'annoncer la sortie de Ruby 2.4.0.

Il s'agit de la première version stable de la branche 2.4.
Elle apporte de nombreuses nouveautés, notamment :

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
[2523 fichiers modifiés, 289129 insertions(+) et 84670 suppressions(-)](https://github.com/ruby/ruby/compare/v2_3_0...v2_4_0)
depuis la sortie de Ruby 2.3.0 !

Joyeux Noël, bonnes vacances et amusez-vous avec cette version 2.4 de Ruby !

## Téléchargement

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0.tar.bz2>

      SIZE:   12572424 bytes
      SHA1:   944d2588308391b20a89642472454d1dfe7b2360
      SHA256: 440bbbdc49d08d3650f340dccb35986d9399177ad69a204def56e5d3954600cf
      SHA512: bef7bb53f63fb74073d071cc125fb67b273ed0779ef43c2d2969089b9ca21fff1bd012281c5b748f7a3c24dd26e71730d7248c05a01cb23ab2089eb4d02115fe

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0.tar.gz>

      SIZE:   14104044 bytes
      SHA1:   d44a3c50a0e742341ed3033d5db79d865151a4f4
      SHA256: 152fd0bd15a90b4a18213448f485d4b53e9f7662e1508190aa5b702446b29e3d
      SHA512: 21c9f596b42dd9cba7a53963a59fed0c2e0c1eb960a4ac7087ea3eaa991ce9252d32639e1edcb75b1d709bc07c4820a6dc336ab427d0643c6e6498e0eacdbc8b

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0.tar.xz>

      SIZE:   9906880 bytes
      SHA1:   038804bbd0e77508dd2510b729a9f3b325489b2e
      SHA256: 3a87fef45cba48b9322236be60c455c13fd4220184ce7287600361319bb63690
      SHA512: 975a5388592adc038461e0acebb6c0efee242891b2ea8621476401458efe2bc0fdd317d3bf99beb745b0b3808410efdff33862da29c95c027f457943721e3ab6

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0.zip>

      SIZE:   15758757 bytes
      SHA1:   29e1bab11551011718c35a51827edcb55bd656fc
      SHA256: 5c2bbfa26fd6a15a2d70961874b0f3a386206fcc5f698e240dd8b0c9f0f18c5e
      SHA512: 31d932372ce490eeac0a70bc8dcf842909a90435422398d069c05cf01d994936064b8f4e60879e28a8655c1296eb8e180e348cb95e001ed6ca73cda0ff77de23
