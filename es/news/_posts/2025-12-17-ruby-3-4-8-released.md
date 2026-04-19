---
layout: news_post
title: "Publicación de Ruby 3.4.8"
author: k0kubun
translator: vtamara
date: 2025-12-17 00:24:30 +0000
lang: es
---

Ruby 3.4.8 ha sido publicado.

Esta es una actualización rutinaria que incluye correcciones a fallas.
Por favor ve más detalles en las [notas de publicación de GitHub](https://github.com/ruby/ruby/releases/tag/v3_4_8).

## Calendario de Publicación

Planeamos publicar la versión más reciente de Ruby
(actualmente Ruby 3.4) cada dos meses tras la versión anterior.
Ruby 3.4.9 está programada para Febrero de 2026.

Si ocurre un cambio que afecte significativamente a los usuarios,
podría publicarse una versión antes de lo planeado, y las
siguientes se correrán respectivamente.

## Descargas

{% assign release = site.data.releases | where: "version", "3.4.8" | first %}

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

Muchos contribuyentes, desarrolladores y usuarios que proveyeron reportes
de fallas nos ayudaron a crear esta versión.
Gracias por sus contribuciones.
