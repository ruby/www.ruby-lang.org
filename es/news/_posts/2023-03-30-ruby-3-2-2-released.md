---
layout: news_post
title: "Publicado Ruby 3.2.2"
author: "naruse"
translator: vtamara
date: 2023-03-30 12:00:00 +0000
lang: es
---

Se ha publicado Ruby 3.2.2.

Esta versión incluye correcciones de seguridad.
Por favor vea detalles en los siguientes temas.

* [CVE-2023-28755: Vulnerabilidad ReDoS en URI]({%link en/news/_posts/2023-03-28-redos-in-uri-cve-2023-28755.md %})
* [CVE-2023-28756: Vulnerabilidad ReDoS en Time]({%link en/news/_posts/2023-03-30-redos-in-time-cve-2023-28756.md %})

Ver más detalles en la [publicación en GitHub](https://github.com/ruby/ruby/releases/tag/v3_2_2).

## Descargas

{% assign release = site.data.releases | where: "version", "3.2.2" | first %}

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
