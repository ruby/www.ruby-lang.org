---
layout: news_post
title: "Publicado Ruby 3.0.6"
author: "usa"
translator: vtamara
date: 2023-03-30 12:00:00 +0000
lang: es
---

Se ha publicado Ruby 3.0.6.

Esta versión incluye correcciones de seguridad.
Por favor vea detalles en los siguientes temas.

* [CVE-2023-28755: Vulnerabilidad ReDoS en URI]({%link en/news/_posts/2023-03-28-redos-in-uri-cve-2023-28755.md %})
* [CVE-2023-28756: Vulnerabilidad ReDoS en Time]({%link en/news/_posts/2023-03-30-redos-in-time-cve-2023-28756.md %})

Esta versión también incluye algunas soluciones a fallas.
Ver más detalles en la [publicación en GitHub](https://github.com/ruby/ruby/releases/tag/v3_0_6).

Después de esta versión, terminamos la fase normal de mantenimiento de
Ruby 3.0, y Ruby 3.0 entra a la fase de seguridad.
Esto significa que ya no retro-portaremos soluciones a fallas en Ruby 3.0
excepto a fallas de seguridad.

El periodo de la fase de mantenimiento de seguridad se ha programada a
un año.
Ruby 3.0 llegará a su EOL (fin de vida) y su soporte oficial terminará
al final de la fase de mantenimiento.
Por tanto, le recomendamos comenzar a planear la actualización a Ruby 3.1
o 3.2

## Descargas

{% assign release = site.data.releases | where: "version", "3.0.6" | first %}

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

El mantenimiento de Ruby 3.0, incluyendo esta versión,
se basa en el "Acuerdo por una versión estable de Ruby" de la
Asociación Ruby.
