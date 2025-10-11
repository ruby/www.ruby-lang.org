---
layout: news_post
title: "Sortie de Ruby 3.4.4"
author: k0kubun
translator: Florent Drousset
date: 2025-05-14 18:20:00 +0000
lang: fr
---

Ruby 3.4.4 est sorti.

Cette version inclut une correction d’un bug dans YJIT lié aux variables locales, ainsi qu’une correction d’un problème de compilation sous Windows lors de l’utilisation de GCC 15.
Elle a été publiée plus tôt que prévu afin de rendre ces correctifs disponibles dès que possible.
Quelques autres corrections de bugs sont également incluses.

Veuillez consulter les [notes de version sur GitHub](https://github.com/ruby/ruby/releases/tag/v3_4_4) pour plus de détails.

## Calendrier des sorties

Nous avons pour objectif de publier la dernière version stable de Ruby (actuellement Ruby 3.4) tous les deux mois suivant la dernière sortie.
Après cette version (3.4.4), Ruby 3.4.5 est prévue pour juillet, 3.4.6 pour septembre, 3.4.7 pour novembre et 3.4.8 pour janvier.

Si un changement ayant un impact significatif sur les utilisateurs survient, une version pourra être publiée plus tôt que prévu, et le calendrier suivant pourra être ajusté en conséquence.

## Téléchargement

{% assign release = site.data.releases | where: "version", "3.4.4" | first %}

* <{{ release.url.gz }}>

      TAILLE : {{ release.size.gz }}
      SHA1 : {{ release.sha1.gz }}
      SHA256 : {{ release.sha256.gz }}
      SHA512 : {{ release.sha512.gz }}

* <{{ release.url.xz }}>

      TAILLE : {{ release.size.xz }}
      SHA1 : {{ release.sha1.xz }}
      SHA256 : {{ release.sha256.xz }}
      SHA512 : {{ release.sha512.xz }}

* <{{ release.url.zip }}>

      TAILLE : {{ release.size.zip }}
      SHA1 : {{ release.sha1.zip }}
      SHA256 : {{ release.sha256.zip }}
      SHA512 : {{ release.sha512.zip }}

## Remerciements

De nombreux contributeurs, développeurs et utilisateurs ayant signalé des bugs ont aidé à la réalisation de cette version.
Merci à eux pour leurs contributions.
