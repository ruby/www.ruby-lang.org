---
layout: news_post
title: "Publicado Ruby 2.6.9"
author: "usa"
translator: vtamara
date: 2021-11-24 12:00:00 +0000
lang: es
---

Ruby 2.6.9 ha sido publicado.
CVE-2021-41819: Suplantación de identidad del prefijo de galletas en CGI::Cookie.parse
Esta versión incluye correcciones de seguridad.
Por favor revise los temas siguientes para ver detalles.
Please check the topics below for details.

* [CVE-2021-41817: Vulnerabilidad de denegación de servicio por Expresiones Reguales en los métodos para reconocer fechas]({%link es/news/_posts/2021-11-15-date-parsing-method-regexp-dos-cve-2021-41817.md %})
* [CVE-2021-41819: Suplantación de identidad del prefijo de galletas en CGI::Cookie.parse]({%link es/news/_posts/2021-11-24-cookie-prefix-spoofing-in-cgi-cookie-parse-cve-2021-41819.md %})

Ver detalles en la [bitácora de cambios](https://github.com/ruby/ruby/compare/v2_6_8...v2_6_9).

Ruby 2.6 ahora está en la fase de mantenimiento de seguridad, hasta el final
de Marzo de 2022.
Tras esa fecha, cesará el mantenimiento a Ruby 2.6.
Le recomendamos empezar a planear la migración a una versińo más
reciente de ruby, tal como 3.0 o 2.7.

## Descargas

{% assign release = site.data.releases | where: "version", "2.6.9" | first %}

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
de fallas que ayudaron a completar esta versión.
Gracias por sus contribuciones.
