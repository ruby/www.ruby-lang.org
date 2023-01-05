---
layout: news_post
title: "Publicado Ruby 2.7.7"
author: "usa"
translator: vtamara
date: 2022-11-24 12:00:00 +0000
lang: es
---

Ruby 2.7.7 ha sido publicado.

Esta versión incluye una corrección de seguridad.
Por favor revise los temas siguientes para ver detalles.

* [CVE-2021-33621: División de respuesta HTTP en CGI]({%link es/news/_posts/2022-11-22-http-response-splitting-in-cgi-cve-2021-33621.md %})

Esta versión también incluye algunas correcciones a problemas de compilación.
No se considera que afecten la compatibilidad con versiones anteriores.
Ver más detalles en la [bitácora de cambios](https://github.com/ruby/ruby/compare/v2_7_6...v2_7_7).

## Descargas

{% assign release = site.data.releases | where: "version", "2.7.7" | first %}

* <{{ release.url.bz2 }}>

      SIZE: {{ release.size.bz2 }}
      SHA1: {{ release.sha1.bz2 }}
      SHA256: {{ release.sha256.bz2 }}
      SHA512: {{ release.sha512.bz2 }}

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
