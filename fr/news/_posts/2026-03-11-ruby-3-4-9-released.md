---
layout: news_post
title: "Ruby 3.4.9 est disponible"
author: nagachika
translator: "Alexandre ZANNI"
date: 2026-03-11 11:00:00 +0000
lang: fr
---
Ruby 3.4.9 est désormais disponible.

Cette version comprend [une mise à jour de la gem zlib corrigeant la vulnérabilité CVE-2026-27820](https://www.ruby-lang.org/fr/news/2026/03/05/buffer-overflow-zlib-cve-2026-27820/),
ainsi que d'autres corrections de bogues.
Veuillez consulter les [versions GitHub](https://github.com/ruby/ruby/releases/tag/v3_4_9) pour plus de détails.

Nous vous recommandons de mettre à jour votre version de la gem zlib. Cette version a été publiée pour faciliter la tâche à ceux qui souhaitent continuer à l'utiliser comme gem par défaut.

## Téléchargements

{% assign release = site.data.releases | where: "version", "3.4.9" | first %}

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
