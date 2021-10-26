---
layout: news_post
title: "Ruby 2.7.4 est disponible"
author: "usa"
translator: "Kevin Rosaz"
date: 2021-07-07 09:00:00 +0000
lang: fr
---

Ruby 2.7.4 est disponible.

Cette version contient des correctifs concernant des problèmes de sécurité.
Merci de regarder les sujets suivants pour plus de détails.

* [CVE-2021-31810: Une vulnérabilité concernant la confiance des réponses FTP PASV dans Net::FTP]({%link fr/news/_posts/2021-07-07-trusting-pasv-responses-in-net-ftp.md %})
* [CVE-2021-32066: Une vulnérabilité StartTLS stripping dans Net::IMAP]({%link fr/news/_posts/2021-07-07-starttls-stripping-in-net-imap.md %})
* [CVE-2021-31799: Faille d'injection de commandes dans RDoc]({%link fr/news/_posts/2021-05-02-os-command-injection-in-rdoc.md %})

Voir les [logs de commit](https://github.com/ruby/ruby/compare/v2_7_3...v2_7_4) pour de plus amples informations.

## Téléchargement

{% assign release = site.data.releases | where: "version", "2.7.4" | first %}

* <{{ release.url.bz2 }}>

      SIZE: {{ release.size.bz2 }}
      SHA1: {{ release.sha1.bz2 }}
      SHA256: {{ release.sha256.bz2 }}
      SHA512: {{ release.sha512.bz2 }}

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

Merci aux contributeurs, développeurs et utilisateurs qui, en reportant les bugs, nous ont permis de faire cette version.

Le support de la branche 2.7 est documenté et encadré par le document *Agreement for the Ruby stable version* publié par la Ruby Association.
