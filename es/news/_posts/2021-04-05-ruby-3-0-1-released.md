---
layout: news_post
title: "Publicado Ruby 3.0.1"
author: "naruse"
translator: vtamara
date: 2021-04-05 12:00:00 +0000
lang: es
---

Ruby 3.0.1 ha sido ha publicado

Esta versión incluye arreglos a fallas de seguridad.
Por favor revise detalles en los los siguientes enlaces.

* [CVE-2020-25613: WEBrick potencialmente vulnerable a contrabando de solicitudes HTTP]({%link es/news/_posts/2020-09-29-http-request-smuggling-cve-2020-25613.md %})
* [CVE-2021-28965: Vulnerabilidad de XML de ida y vuelta en REXML]({% link es/news/_posts/2021-04-05-xml-round-trip-vulnerability-in-rexml-cve-2021-28965.md %})

Ver detalles en [la bitácora de contribuciones](https://github.com/ruby/ruby/compare/v3_0_0...v3_0_1)


## Descargas

{% assign release = site.data.releases | where: "version", "3.0.1" | first %}

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

Muchos contribuyentes, desarrolladores, y usuarios que proveyeron reportes
de fallas nos ayudaron a completar esta versión.
Gracias por sus contribuciones.
