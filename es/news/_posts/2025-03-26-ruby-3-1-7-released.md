---
layout: news_post
title: "Publicado Ruby 3.1.7"
author: hsbt
translator: vtamara
date: 2025-03-26 04:44:27 +0000
lang: es
---

Ruby 3.1.7 ha sido publicado. Esta versión incluye
[correcciones a las fallas CVE-2025-27219, CVE-2025-27220 y CVE-2025-27221](https://www.ruby-lang.org/es/news/2025/02/26/security-advisories/)
y actualiza las gemas incluidas REXML y RSS.

Por favor vea más detalles en la [publicación en GitHub](https://github.com/ruby/ruby/releases/tag/v3_1_7).

Esta versión es una versión final de la serie Ruby 3.1.
No proveeremos más actualizaciones ni siquiera de seguridad para la serie
Ruby 3.1.

Le recomendamos actualizar a las series Ruby 3.3 o 3.4.

## Descargas

{% assign release = site.data.releases | where: "version", "3.1.7" | first %}

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

Muchos contribuyentes, desarrolladores y usuarios que proveyeron reportes de
fallas nos ayudaron a producir esta versión.

Gracias por sus contribuciones.
