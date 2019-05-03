---
layout: news_post
title: "Versionnage sémantique à partir de Ruby 2.1.0"
author: "zzak"
translator: "Geoffrey Roguelon"
date: 2013-12-21 2:00:00 +0000
lang: fr
---

Nous avons décidé de changer la façon d'incrémenter les versions de Ruby en
utilisant le système des [versions sémantiques](http://semver.org/) à partir de
Ruby 2.1.0.

Afin de fournir une gestion claire du schéma de versionnage, nous avons décidé
de basculer progressivement à la politique suivante.

## Politique de changement

Cette politique est basée sur une proposition d'un administrateur de ruby-lang.org,
Hiroshi Shibata ([@hsbt](https://twitter.com/hsbt)).

### Schéma de versionnage

* `MAJEUR`: incrémenté lorsque des changements incompatibles ne peuvent être sortis en version `MINEURE`
  * Réservée pour des occasions spéciales
* `MINEUR`: incrémenté à chaque Noël, peut inclure des changements d'API incompatibles
* `MICRO`: correction de bugs ou de failles de sécurité en conservant la compatibilité avec l'API
  * Peut être incrémenté plus de 10 fois (comme `2.1.11`) et sortira tous les 2 ou 3 mois
* `PATCH`: nombre de commits depuis la dernière version `MINEURE` (sera remise à 0 à chaque sortie d'une version `MINEURE`)

### Schéma de gestion des branches

Nous maintiendrons les branches suivantes :

* trunk
* `ruby_{MAJEUR}_{MINEUR}`

La branche `ruby_{MAJEUR}_{MINEUR}` sera maintenue tant que des versions `MICRO`
sortiront.
Nous utiliserons des tags pour chaque version.

### Compatibilité de l'API

Les critères suivants peuvent être qualifiés de changements incompatibles,
nécessitant la sortie d'une version `MINEURE`:

* Suppression d'une fonctionnalité de l'API écrite en C
* Changements ou ajouts incompatibles avec l'API

### Compatibilité de l'ABI

L'ABI respectera le schéma suivant : `{MAJEUR}.{MINEUR}.0`

Nous fournirons le maximum d'effort pour conserver la compatibilité de l'ABI avec
la version `MINEURE`, par conséquent le numéro de version `MICRO` sera fixé à 0.

## Références

Pour plus d'informations sur cette proposition, veuillez consulter les liens
suivants :

* [Introduction au schéma de versionnage et à la politique de gestion des branches](https://bugs.ruby-lang.org/issues/8835)
* [Proposition acceptée en anglais](https://gist.github.com/sorah/7803201)
* [Proposition acceptée en japonais](https://gist.github.com/hsbt/7719305)

## Merci !

Je souhaiterais remercier personnellement tous ceux qui ont contribué à ce débat.
Chaque décision permet d'avoir un Ruby plus stable et plus efficace.
