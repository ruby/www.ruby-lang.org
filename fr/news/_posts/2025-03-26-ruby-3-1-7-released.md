---
layout: news_post
title: "Ruby 3.1.7 est disponible"
author: hsbt
translator: Florent Drousset
date: 2025-03-26 04:44:27 +0000
lang: fr
---

Ruby 3.1.7 est sorti. Cette version inclut les [correctifs pour CVE-2025-27219, CVE-2025-27220 et CVE-2025-27221](https://www.ruby-lang.org/en/news/2025/02/26/security-advisories/) ainsi qu’une mise à jour des gems REXML et RSS intégrés.

Veuillez consulter les [releases GitHub](https://github.com/ruby/ruby/releases/tag/v3_1_7) pour plus de détails.

Cette version est la version finale de la série Ruby 3.1. Aucune mise à jour supplémentaire, y compris les correctifs de sécurité, ne sera fournie pour la série Ruby 3.1.

Nous vous recommandons de passer à la série Ruby 3.3 ou 3.4.

## Téléchargement

{% assign release = site.data.releases | where: "version", "3.1.7" | first %}

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

## Commentaire de publication

De nombreux contributeurs, développeurs et utilisateurs ayant signalé des bugs nous ont aidés à réaliser cette version.
Merci à tous pour leurs contributions.
