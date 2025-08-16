---
layout: news_post
title: "Publicado Ruby 3.2.9"
author: "hsbt"
translator: vtamara
date: 2025-07-24 08:51:53 +0000
lang: es
---

Ruby 3.2.9 ha sido publicado.

Esta versión incluye correcciones a la siguientes fallas de seguridad:

* [CVE-2025-24294: Posible Denegación de Servicio en la gema resolv](https://www.ruby-lang.org/es/news/2025/07/08/dos-resolv-cve-2025-24294/)
* [CVE-2025-43857: Vulnerabilidad de denegaciónd e servicio en net-imap](https://www.ruby-lang.org/es/news/2025/04/28/dos-net-imap-cve-2025-43857/)


y las siguientes correcciones a problemaas de compilación:

* GCC 15.1
* Visual Studio 2022 Version 17.14

Por favor vea más detalles en las [publicaciones en GitHub](https://github.com/ruby/ruby/releases/tag/v3_2_9).

## Descargas

{% assign release = site.data.releases | where: "version", "3.2.9" | first %}

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

Muchos contribuyentes, desarrolladores, y usuarios que proveyeron reportes
de fallas nos ayudaron a hacer esta versión.

Gracias por sus contribuciones.
