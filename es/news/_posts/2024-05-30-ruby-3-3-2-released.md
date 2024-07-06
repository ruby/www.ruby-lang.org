---
layout: news_post
title: "Publicado Ruby 3.3.2"
author: "k0kubun"
translator: vtamara
date: 2024-05-30 03:50:00 +0000
lang: es
---

Ruby 3.3.2 ha sido publicado.

Esta versión incluye muchas correcciones a fallas.
Ver más detalles en la [publicación en GitHub](https://github.com/ruby/ruby/releases/tag/v3_3_2).

## Descarga

{% assign release = site.data.releases | where: "version", "3.3.2" | first %}

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

## Comntario de la versión

Muchos contribuidores, desarrolladores y usuarios que proveyeron reportes de
fallas nos ayudaron a hacer esta versión.

Gracias por sus contribuciones.
