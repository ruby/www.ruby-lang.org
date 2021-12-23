---
layout: news_post
title: "Publicado Ruby 2.7.5"
author: "usa"
translator: vtamara
date: 2021-11-24 12:00:00 +0000
lang: es
---

Ruby 2.7.5 ha sido publicado.

Esta versión incluye correcciones de seguridad.
Por favor revise los temas siguientes para ver detalles.

* [CVE-2021-41817: Vulnerabilidad de denegación de servicio por Expresiones Reguales en los métodos para reconocer fechas]({%link es/news/_posts/2021-11-15-date-parsing-method-regexp-dos-cve-2021-41817.md %})
* [CVE-2021-41819: Suplantación de identidad del prefijo de galletas en CGI::Cookie.parse]({%link es/news/_posts/2021-11-24-cookie-prefix-spoofing-in-cgi-cookie-parse-cve-2021-41819.md %})
* [CVE-2021-41816: Desbordamiento de búfer en CGI.escape_html]({%link es/news/_posts/2021-11-24-buffer-overrun-in-cgi-escape_html-cve-2021-41816.md %})

Ver detalles en la
[bitácora de cambios](https://github.com/ruby/ruby/compare/v2_7_4...v2_7_5).


## Descargas

{% assign release = site.data.releases | where: "version", "2.7.5" | first %}


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

## Comentario de la versión

Muchos contribuidores, desarrolladores y usuarios proveyeron reportes
de fallas que nos ayudaron a completar esta versión.
Gracias por sus contribuciones.

El mantenimiento de Ruby 2.7, incluida esta versión, se basa en el "Acuerdo
para una versión estable de Ruby" de la Asociación Ruby.
