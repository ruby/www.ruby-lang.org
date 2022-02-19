---
layout: news_post
title: "Ruby 3.1.1 est disponible"
author: "naruse"
translator: "Kevin Rosaz"
date: 2022-02-18 12:00:00 +0000
lang: fr
---

Ruby 3.1.1 est disponible.

C'est la première TEENY version disponible de la branche 3.1.

Voir les [logs de commit](https://github.com/ruby/ruby/compare/v3_1_0...v3_1_1) pour de plus amples informations.

## Téléchargement

{% assign release = site.data.releases | where: "version", "3.1.1" | first %}

* <{{ release.url.gz }}>

      SIZE: {{ release.size.gz }}
      SHA1: {{ release.sha1.gz }}
      SHA256: {{ release.sha256.gz }}
      SHA512: {{ release.sha512.gz }}

* <{{ release.url.xz }}>

      SIZE: {{ release.size.xz }}
      SHA1: {{ release.sha1.xz }}
      SHA256: {{ release.sha256.xz }}
      SHA512: {{ release.sha512.xz }}

* <{{ release.url.zip }}>

      SIZE: {{ release.size.zip }}
      SHA1: {{ release.sha1.zip }}
      SHA256: {{ release.sha256.zip }}
      SHA512: {{ release.sha512.zip }}

## Commentaire de version

Merci aux contributeurs, développeurs et utilisateurs qui, en reportant les bugs, nous ont permis de sortir cette version.
