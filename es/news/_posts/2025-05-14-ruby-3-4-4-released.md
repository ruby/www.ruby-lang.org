---
layout: news_post
title: "Publicado Ruby 3.4.4"
author: k0kubun
translator: vtamara
date: 2025-05-14 18:20:00 +0000
lang: es
---

Ruby 3.4.4 ha sido publicado.

Esta versión incluye un arreglo a una falla relacionada con YJIT con
variables locales y resuelve un problema de compliación en Windows usando
GCC 15.
Se publicó antes de lo planeado para distribuir esas soluciones
tan pronto como sea posible.

También se incluyen otras pocas correcciones a fallas.

Por favor vea detalles en las [notas de publicación en GitHub](https://github.com/ruby/ruby/releases/tag/v3_4_4).

## Calendario de publicación

Procuramos publicar la versión estable más reciente de Ruby (actualmente
Ruby 3.4) cada dos meses después de la última publicación.
Tras esta versión (3.4.4), Ruby 3.4.5 está planeado para Julio, 3.4.6
para Septiembre, 3.4.7 para Noviembre y 3.4.8 para Enero.


Si hay algún cambio que afecte a un número considerable de personas,
podría haber una publiación antes de lo planead, y el calendario que sigue
podría moverse de acuerdo a esto.

## Descargas

{% assign release = site.data.releases | where: "version", "3.4.4" | first %}

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
