---
layout: news_post
title: "Publicado Ruby 3.2.1"
author: "naruse"
translator: vtamara
date: 2023-02-08 12:00:00 +0000
lang: en
---

Ruby 3.2.1 ha sido publicado

Esta es la primera versión PEQUEÑA de la serie estable 3.2.

Ver más detalles de las [versiones en GitHub](https://github.com/ruby/ruby/releases/tag/v3_2_1).

## Descargas

{% assign release = site.data.releases | where: "version", "3.2.1" | first %}

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

Muchos contribuidores, desarrolladores y usuarios que proveyeron
reportes de fallas nos ayudaron a darle forma a esta versión.
Gracias por sus contribuciones.
