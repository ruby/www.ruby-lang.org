---
layout: news_post
title: "Publicado Ruby 3.0.4"
author: "nagachika and mame"
translator: vtamara
date: 2022-04-12 12:00:00 +0000
lang: es
---

Ruby 3.0.4 ha sido publicado.

Esta versión incluye correcciones de seguridad.
Por favor revise los temas siguientes para ver detalles.

* [CVE-2022-28738: Doble free en compilación de expresiones regulares]({%link es/news/_posts/2022-04-12-double-free-in-regexp-compilation-cve-2022-28738.md %})
* [CVE-2022-28739: Desbordamiento de buffer en conversión de String a Float]({%link es/news/_posts/2022-04-12-buffer-overrun-in-string-to-float-cve-2022-28739.md %})

Ver más detalles en la [bitácora de cambios](https://github.com/ruby/ruby/compare/v3_0_3...v3_0_4).

## Descargas

{% assign release = site.data.releases | where: "version", "3.0.4" | first %}

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


## Comentario sobre la versión

Muchos contribuidores, desarrolladores y usuarios proveyeron reportes
de fallas que nos ayudaron a completar esta versión.
Gracias por sus contribuciones.
