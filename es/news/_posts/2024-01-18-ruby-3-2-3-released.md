---
layout: news_post
title: "Publicado Ruby 3.2.3"
author: "nagachika"
translator: vtamara
date: 2024-01-18 09:00:00 +0000
lang: es
---

Se ha publicado Ruby 3.2.3.

Esta versión incluye diversas correcciones a fallas.
Ver detalles en las [publicaciones de GitHub](https://github.com/ruby/ruby/releases/tag/v3_2_3).

Esta versión también incluye la actualización de uri.gem a 0.12.2
que contiene una corrección de seguridad.
Por favor vea detalles en el siguiente tema.

* [CVE-2023-36617: vulnerabilidad de ReDoS en URI]({%link es/news/_posts/2023-06-29-redos-in-uri-CVE-2023-36617.md %})

## Descargas

{% assign release = site.data.releases | where: "version", "3.2.3" | first %}

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

## Notas de publicación

Muchos contribuyentes, desarrolladores, y usuarios que proveyeron
reportes de fallas nos ayudaron a hacer esta versión.
Gracias por sus contribuciones.
