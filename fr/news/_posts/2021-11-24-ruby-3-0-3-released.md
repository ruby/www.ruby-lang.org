---
layout: news_post
title: "Ruby 3.0.3 est disponible"
author: "nagachika"
translator: "Kevin Rosaz"
date: 2021-11-24 12:00:00 +0000
lang: fr
---

Ruby 3.0.3 est disponible.

Cette version contient des corrections concernant des problèmes de sécurité.
Merci de regarder les sujets suivants pour plus de détails.

* [CVE-2021-41817: Vulnérabilité de déni de service d'expression régulière (ReDoS) sur les méthodes d'analyse de date]({%link fr/news/_posts/2021-11-15-date-parsing-method-regexp-dos-cve-2021-41817.md %})
* [CVE-2021-41816: Dépassement de la mémoire tampon dans CGI.escape_html]({%link fr/news/_posts/2021-11-24-buffer-overrun-in-cgi-escape_html-cve-2021-41816.md %})
* [CVE-2021-41819: Usurpation de préfixes de cookie dans CGI::Cookie.parse]({%link fr/news/_posts/2021-11-24-cookie-prefix-spoofing-in-cgi-cookie-parse-cve-2021-41819.md %})

Voir les [logs de commit](https://github.com/ruby/ruby/compare/v3_0_2...v3_0_3) pour de plus amples informations.

## Téléchargement

{% assign release = site.data.releases | where: "version", "3.0.3" | first %}

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
