---
layout: news_post
title: "Ruby 3.2.8 est disponible"
author: hsbt
translator: Florent Drousset
date: 2025-03-26 04:45:01 +0000
lang: fr
---

Ruby 3.2.8 est sorti. Cette version inclut les correctifs pour [CVE-2025-27219, CVE-2025-27220 et CVE-2025-27221](https://www.ruby-lang.org/fr/news/2025/02/26/security-advisories/).

Veuillez consulter les [releases GitHub](https://github.com/ruby/ruby/releases/tag/v3_2_8) pour plus de détails.

Cette version est la dernière version de maintenance normale de la série Ruby 3.2. Nous corrigerons uniquement les failles de sécurité pour la série Ruby 3.2 jusqu’à la fin mars 2026.

Veuillez envisager de mettre à jour vers Ruby 3.3 ou 3.4.

## Téléchargement

{% assign release = site.data.releases | where: "version", "3.2.8" | first %}

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
