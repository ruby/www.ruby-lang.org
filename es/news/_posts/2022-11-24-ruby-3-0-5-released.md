---
layout: news_post
title: "Publicado Ruby 3.0.5"
author: "usa"
translator: vtamara
date: 2022-11-24 12:00:00 +0000
lang: es
---

Ruby 3.0.5 ha sido publicado.

Esta versión incluye una corrección de seguridad.
Por favor revise los temas siguientes para ver detalles.

* [CVE-2021-33621: División de respuesta HTTP en CGI]({%link es/news/_posts/2022-11-22-http-response-splitting-in-cgi-cve-2021-33621.md %})

Esta versión también incluye algunas correcciones a fallas.
Ver más detalles en la [bitácora de cambios](https://github.com/ruby/ruby/compare/v3_0_4...v3_0_5).

## Descargas

{% assign release = site.data.releases | where: "version", "3.0.5" | first %}

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

El mantenimiento de Ruby 3.0, incluyendo esta versión se basa en el
"Acuerdo por una versión estable de Ruby" de la Asociación Ruby.
