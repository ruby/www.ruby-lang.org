---
layout: news_post
title: "Ruby 3.4.2 est disponible"
author: k0kubun
translator: "Florent Drousset"
date: 2025-02-14 21:55:17 +0000
lang: fr
---

Ruby 3.4.2 est disponible.

Ceci est une mise à jour de routine incluant des corrections de bugs.
Veuillez vous référer aux [release notes sur GitHub](https://github.com/ruby/ruby/releases/tag/v3_4_2) for further details.

## Calendrier de publication

Nous prévoyons de publier la version stable la plus récente de Ruby (actuellement la 3.4) tous les deux mois.
Ruby 3.4.3 sortira en avril, 3.4.4 en juin, 3.4.5 en août, 3.4.6 en octobre et 3.4.7 en décembre.

Si un changement affecte un grand nombre d’utilisateurs, certaines de ces versions pourraient être publiées plus tôt que prévu.

## Téléchargement

{% assign release = site.data.releases | where: "version", "3.4.2" | first %}

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

## Commentaire sur la version

Grâce aux nombreux contributeurs, développeurs et utilisateurs qui ont fourni des rapports de bugs, nous avons pu réaliser cette version.
Merci à tous pour leurs contributions.
