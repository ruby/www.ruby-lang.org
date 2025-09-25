---
layout: news_post
title: "Ruby 3.5.0 preview1 est disponible"
author: "naruse"
translator: Florent Drousset
date: 2025-04-18 00:00:00 +0000
lang: fr
---

{% assign release = site.data.releases | where: "version", "3.5.0-preview1" | first %}
Nous avons le plaisir d’annoncer la sortie de Ruby {{ release.version }}. Ruby 3.5 met à jour sa version Unicode vers 15.1.0, et plus encore.

## Changements du langage

* `*nil` n’appelle plus `nil.to_a`, de la même façon que `**nil`
  n’appelle pas `nil.to_hash`.  [[Feature #21047]]

## Mises à jour des classes Core

Note : nous listons uniquement les changements notables des classes Core.

* Binding

    * `Binding#local_variables` n’inclut plus les paramètres numérotés.
      De plus, `Binding#local_variable_get` et `Binding#local_variable_set` refusent désormais de gérer les paramètres numérotés.
      [[Bug #21049]]

* IO

    * `IO.select` accepte désormais +Float::INFINITY+ comme argument de timeout.
      [[Feature #20610]]

* String

    * Mise à jour vers Unicode Version 15.1.0 et Emoji Version 15.1. [[Feature #19908]]
      (s’applique aussi aux expressions rationnelles `Regexp`)

## Mises à jour de la bibliothèque standard

Note : nous listons uniquement les mises à jour notables des bibliothèques standard.

* ostruct 0.6.1
* pstore 0.2.0
* benchmark 0.4.0
* logger 1.7.0
* rdoc 6.13.1
* win32ole 1.9.2
* irb 1.15.2
* reline 0.6.1
* readline 0.0.4
* fiddle 1.1.6

## Problèmes de compatibilité

Note : hors corrections de bugs liés aux fonctionnalités.

## Problèmes de compatibilité des bibliothèques standard

## Mises à jour de l’API C

## Autres changements divers

Voir [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
ou les [journaux de commits](https://github.com/ruby/ruby/compare/v3_4_0...{{ release.tag }})
pour plus de détails.

Avec ces changements, [{{ release.stats.files_changed }} fichiers modifiés, {{ release.stats.insertions }} ajouts(+), {{ release.stats.deletions }} suppressions(-)](https://github.com/ruby/ruby/compare/v3_3_0...{{ release.tag }}#file_bucket)
depuis Ruby 3.4.0 !

## Téléchargement

* <{{ release.url.gz }}>

      TAILLE : {{ release.size.gz }}
      SHA1   : {{ release.sha1.gz }}
      SHA256 : {{ release.sha256.gz }}
      SHA512 : {{ release.sha512.gz }}

* <{{ release.url.xz }}>

      TAILLE : {{ release.size.xz }}
      SHA1   : {{ release.sha1.xz }}
      SHA256 : {{ release.sha256.xz }}
      SHA512 : {{ release.sha512.xz }}

* <{{ release.url.zip }}>

      TAILLE : {{ release.size.zip }}
      SHA1   : {{ release.sha1.zip }}
      SHA256 : {{ release.sha256.zip }}
      SHA512 : {{ release.sha512.zip }}

## Qu’est-ce que Ruby

Ruby a été développé pour la première fois par Matz (Yukihiro Matsumoto) en 1993,
et est maintenant développé comme un logiciel Open Source.
Il fonctionne sur de multiples plateformes et est utilisé dans le monde entier, en particulier pour le développement web.

[Feature #21047]: https://bugs.ruby-lang.org/issues/21047
[Bug #21049]: https://bugs.ruby-lang.org/issues/21049
[Feature #20610]: https://bugs.ruby-lang.org/issues/20610
[Feature #19908]: https://bugs.ruby-lang.org/issues/19908
