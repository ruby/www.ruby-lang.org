---
layout: news_post
title: "Ruby 2.6.7 est disponible"
author: "usa"
translator: "Kevin Rosaz"
date: 2021-04-05 12:00:00 +0000
lang: fr
---

Ruby 2.6.7 est disponible.

Cette version contient des corrections concernant des problèmes de sécurité.
Merci de regarder les sujets suivants pour plus de détails.

- [CVE-2020-25613: Potential HTTP Request Smuggling Vulnerability in WEBrick]({%link en/news/_posts/2020-09-29-http-request-smuggling-cve-2020-25613.md %})
- [CVE-2021-28965: XML round-trip vulnerability in REXML]({% link en/news/_posts/2021-04-05-xml-round-trip-vulnerability-in-rexml-cve-2021-28965.md %})

Voir les [logs de commit](https://github.com/ruby/ruby/compare/v2_6_6...v2_6_7) pour de plus amples informations.

A partir de cette version, nous terminons la phase de maintenance standard de la branche 2.6 et entrons dans la phase de maintenance de sécurité.
Cela signifie qu'il n'y aura plus de _backports_ de correctifs pour Ruby 2.6 sauf pour ceux concernant la sécurité.
Cette phase de maintenance réduite se terminera dans un an. La branche 2.6 de Ruby ne sera alors plus officiellement supportée.
Nous vous recommandons donc de passer vers Ruby 2.7 ou 3.0.

## Téléchargement

{% assign release = site.data.releases | where: "version", "2.6.7" | first %}

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

Merci aux contributeurs, développeurs et utilisateurs qui, en reportant les bugs, nous ont permis de faire cette version.

La maintenance de Ruby 2.6, incluant cette version, est basée sur l' "Agreement for the Ruby stable version" de la Ruby Association.
