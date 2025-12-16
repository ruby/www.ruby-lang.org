---
layout: news_post
title: "Ruby 3.3.8 est disponible"
author: nagachika
translator: Florent Drousset
date: 2025-04-09 11:00:00 +0000
lang: fr
---

Ruby 3.3.8 est sorti.

Veuillez consulter les [releases GitHub](https://github.com/ruby/ruby/releases/tag/v3_3_8) pour plus de détails.

## Téléchargement

{% assign release = site.data.releases | where: "version", "3.3.8" | first %}

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
