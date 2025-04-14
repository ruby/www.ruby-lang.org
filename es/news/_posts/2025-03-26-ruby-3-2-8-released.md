---
layout: news_post
title: "Ruby 3.2.8 Publicado"
author: hsbt
translator: vtamara
date: 2025-03-26 04:45:01 +0000
lang: es
---

Ruby 3.2.8 ha sido publicado. Esta version incluye
[correcciones a las fallas CVE-2025-27219, CVE-2025-27220 y CVE-2025-27221](https://www.ruby-lang.org/es/news/2025/02/26/security-advisories/).

Por favor ver más detalles en la [publicación en GitHub](https://github.com/ruby/ruby/releases/tag/v3_2_8).

Esta versión es la última versión del mantenimiento normal para la serie
Ruby 3.2. Corregiremos sólo fallas de seguridad para la serie Ruby 3.2 hasta
Marzo de 2026.

Por favor considere actualizar a la serie Ruby 3.3 o 3.4.

## Descargas

{% assign release = site.data.releases | where: "version", "3.2.8" | first %}

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

Muchas contribuyentes, desarrolladores y usuarios que proveyeron reportes de
fallas nos ayudaron a producir esta versión.

Gracias por sus contribuciones.
