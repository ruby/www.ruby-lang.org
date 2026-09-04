---
layout: news_post
title: "Ruby 4.0.2 est disponible"
author: k0kubun
translator: "Alexandre ZANNI"
date: 2026-03-16 23:18:29 +0000
lang: fr
---
Ruby 4.0.2 est désormais disponible.

Il s'agit d'une mise à jour de routine qui inclut une correction de bogue dans YJIT concernant l'erreur [NoMethodError sur Puma](https://github.com/puma/puma/issues/3620).
Veuillez consulter les [versions GitHub](https://github.com/ruby/ruby/releases/tag/v4.0.2) pour plus de détails.

## Calendrier de publication

Nous avons l'intention de publier la dernière version stable de Ruby (actuellement Ruby 4.0) tous les deux mois après la sortie de la version la plus récente.
Ruby 4.0.3 sera publié en mai, 4.0.4 en juillet, 4.0.5 en septembre et 4.0.6 en novembre.

Si un changement susceptible d'affecter significativement les utilisateurs survient, une version pourrait être publiée plus tôt que prévu, et le calendrier suivant pourrait être modifié en conséquence.

## Téléchargements

{% assign release = site.data.releases | where: "version", "4.0.2" | first %}

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

## Remarque concernant cette version

De nombreux contributeurs, développeurs et utilisateurs qui ont signalé des bogues nous ont aidés à réaliser cette version.
Merci à eux pour leur contribution.
