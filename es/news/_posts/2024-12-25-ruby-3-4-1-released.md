---
layout: news_post
title: "Publicado Ruby 3.4.1"
author: "naruse"
translator: vtamara
date: 2024-12-25 00:00:00 +0000
lang: es
---

Se ha publicado Ruby 3.4.1.

Este corrige la descripción de la versión.

Ver más detalles en la [publicación de GitHub](https://github.com/ruby/ruby/releases/tag/v3_4_1).

## Descargas

{% assign release = site.data.releases | where: "version", "3.4.1" | first %}

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
