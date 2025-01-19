---
layout: news_post
title: "Publicado Ruby 3.3.7"
author: k0kubun
translator: vtamara
date: 2025-01-15 07:51:59 +0000
lang: es
---

Ruby 3.3.7 ha sido publicado.

Esta es una actualización de rutina que incluye corrección a fallas menores.
Por favor revise  más detalles en las
[notas de publicación en GitHub](https://github.com/ruby/ruby/releases/tag/v3_3_7).

## Descargas

{% assign release = site.data.releases | where: "version", "3.3.7" | first %}

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

## Comentario de la versión

Many committers, developers, and users who provided bug reports helped us make this release.
Thanks for their contributions.
