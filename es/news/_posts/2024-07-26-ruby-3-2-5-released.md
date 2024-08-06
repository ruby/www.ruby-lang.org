---
layout: news_post
title: "Publicado Ruby 3.2.5"
author: "nagachika"
translator: vtamara
date: 2024-07-26 10:00:00 +0000
lang: es
---

Ruby 3.2.5 ha sido publicado.

Esta versión incluye muchas correcciones a fallas.
Y actualizamos la versión de la gema incluida `rexml` para incorporar
la corrección a la falla de seguridad
[CVE-2024-39908 : Denegación de servicio (DoS) en REXML]({%link es/news/_posts/2024-07-16-dos-rexml-cve-2024-39908.md %}).

Por favor vea detalles en la [publicación en GitHub](https://github.com/ruby/ruby/releases/tag/v3_2_5).

## Descargas

{% assign release = site.data.releases | where: "version", "3.2.5" | first %}

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

## Comentarios de la versión

Muchos contribuidores, desarrolladores y usuarios que proveyeron reportes de fallas nos ayudaron a hacer esta versión.

Gracias por sus contribuciones.
