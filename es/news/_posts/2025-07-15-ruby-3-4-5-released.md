---
layout: news_post
title: "Publicado Ruby 3.4.5"
author: k0kubun
translator: vtamara
date: 2025-07-15 17:00:00 +0000
lang: es
---

Ruby 3.4.5 ha sido publicado.

Esta es una actualización rutinaria que incluye tanto correcciones a fallas
y soporte para GCC 15. Por favor revise las
[notas de publicación en GitHub](https://github.com/ruby/ruby/releases/tag/v3_4_5)
para ver más detalles.

## Calendario de publicaciones

Proponemos publicar la versión estable más reciente de Ruby (actualmente
Ruby 3.4) cada dos meses siguiendo a la publicación más reciente.
Ruby 3.4.6 está programada para Septiembre, 3.4.7 para Noviembre, y
3.4.8 para Enero.

Si ocurre algún cambio que afecte significativamente a los usuarios,
puede ocurrir una publicación antes de lo planeado, y el subsiguiente
calendario se correrá de acuerdo a esto.

## Descargas

{% assign release = site.data.releases | where: "version", "3.4.5" | first %}

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
de fallas nos ayudaron a hacer esta versión.

Gracias por sus contribuciones.
