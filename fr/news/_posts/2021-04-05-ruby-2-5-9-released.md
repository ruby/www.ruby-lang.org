---
layout: news_post
title: "Ruby 2.5.9 est disponible"
author: "usa"
translator: "Kevin Rosaz"
date: 2021-04-05 12:00:00 +0000
lang: fr
---

Ruby 2.5.9 est disponible.

Cette version contient des corrections concernant des problèmes de sécurité.
Merci de regarder les sujets suivants pour plus de détails.

- [CVE-2020-25613: Potential HTTP Request Smuggling Vulnerability in WEBrick]({%link en/news/_posts/2020-09-29-http-request-smuggling-cve-2020-25613.md %})
- [CVE-2021-28965: XML round-trip vulnerability in REXML]({% link en/news/_posts/2021-04-05-xml-round-trip-vulnerability-in-rexml-cve-2021-28965.md %})

Voir les [logs de commit](https://github.com/ruby/ruby/compare/v2_5_8...v2_5_9) pour de plus amples informations.

Après cette version, la branche 2.5 n'est plus officiellement supportée. Cela signifie donc que c'est la dernière version de la branche 2.5.
Nous ne publierons pas de version 2.5.10 même si une faille de sécurité est découverte.
Nous recommandons à tous les utilisateurs de Ruby 2.5 de passer à la version de Ruby 3.0, 2.7 ou 2.6 immédiatement.

## Téléchargement

{% assign release = site.data.releases | where: "version", "2.5.9" | first %}

- <{{ release.url.bz2 }}>

      SIZE: {{ release.size.bz2 }}
      SHA1: {{ release.sha1.bz2 }}
      SHA256: {{ release.sha256.bz2 }}
      SHA512: {{ release.sha512.bz2 }}

- <{{ release.url.gz }}>

      SIZE: {{ release.size.gz }}
      SHA1: {{ release.sha1.gz }}
      SHA256: {{ release.sha256.gz }}
      SHA512: {{ release.sha512.gz }}

- <{{ release.url.xz }}>

      SIZE: {{ release.size.xz }}
      SHA1: {{ release.sha1.xz }}
      SHA256: {{ release.sha256.xz }}
      SHA512: {{ release.sha512.xz }}

- <{{ release.url.zip }}>

      SIZE: {{ release.size.zip }}
      SHA1: {{ release.sha1.zip }}
      SHA256: {{ release.sha256.zip }}
      SHA512: {{ release.sha512.zip }}

## Commentaire de version

Merci à celles et ceux qui ont aidé pour cette version, notamment les personnes ayant reporté les vulnérabilités.
