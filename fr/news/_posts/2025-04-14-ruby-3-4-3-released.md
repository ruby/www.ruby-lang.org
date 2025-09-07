---
layout: news_post
title: "Ruby 3.4.3 est disponible"
author: k0kubun
translator: Florent Drousset
date: 2025-04-14 08:06:57 +0000
lang: fr
---

Ruby 3.4.3 est sorti.

Ceci est une mise à jour de routine incluant des corrections de bugs. Veuillez consulter les
[notes de version sur GitHub](https://github.com/ruby/ruby/releases/tag/v3_4_3) pour plus de détails.

## Calendrier des versions

Nous prévoyons de publier la dernière version stable de Ruby (actuellement Ruby 3.4) tous les 2 mois.
Ruby 3.4.4 sortira en juin, 3.4.5 en août, 3.4.6 en octobre et 3.4.7 en décembre.

Si un changement affecte un grand nombre de personnes, ces versions pourront être publiées plus tôt que prévu.

## Téléchargement

{% assign release = site.data.releases | where: "version", "3.4.3" | first %}

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

## Commentaire sur la version

De nombreux contributeurs, développeurs et utilisateurs ayant fourni des rapports de bugs nous ont aidés à réaliser cette version.
Merci pour leurs contributions.
