---
layout: news_post
title: "Ruby 4.0.1 est disponible"
author: k0kubun
translator: "Alexandre ZANNI"
date: 2026-01-13 02:28:48 +0000
lang: fr
---
Ruby 4.0.1 est désormais disponible.

Cette version corrige un bogue provoquant un réveil intempestif de `Kernel#sleep` lorsqu'un sous-processus se termine dans un autre fil (_thread_),
ainsi que d'autres bogues. Pour plus de détails, veuillez consulter la page [GitHub Releases](https://github.com/ruby/ruby/releases/tag/v4.0.1).

## Calendrier de publication

Nous prévoyons de publier la dernière version stable de Ruby (actuellement Ruby 4.0) tous les deux mois après la sortie de la version précédente.
Ruby 4.0.2 sera publié en mars, 4.0.3 en mai, 4.0.4 en juillet, 4.0.5 en septembre et 4.0.6 en novembre.

Si un changement susceptible d'avoir un impact significatif sur les utilisateurs survient, une version pourrait être publiée plus tôt que prévu, et le calendrier suivant pourrait être modifié en conséquence.

## Téléchargements

{% assign release = site.data.releases | where: "version", "4.0.1" | first %}

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
