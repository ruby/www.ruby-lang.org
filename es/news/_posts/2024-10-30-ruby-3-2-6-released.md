---
layout: news_post
title: "Publicado Ruby 3.2.6"
author: nagachika
translator: vtamara
date: 2024-10-30 10:00:00 +0000
lang: es
---

Ruby 3.2.6 ha sido publicado.

Por favor vea detalles en la [publicación en GitHub](https://github.com/ruby/ruby/releases/tag/v3_2_6).

## Descargas

{% assign release = site.data.releases | where: "version", "3.2.6" | first %}

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

Muchos contribuidores, desarrolladores y usuarios que proveyeron reportes de
fallas nos ayudaron a producir esta versión.

Gracias por sus contribuciones.
