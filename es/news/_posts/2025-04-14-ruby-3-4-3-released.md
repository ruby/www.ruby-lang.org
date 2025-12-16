---
layout: news_post
title: "Publicado Ruby 3.4.3"
author: k0kubun
translator: vtamara
date: 2025-04-14 08:06:57 +0000
lang: es
---

Ruby 3.4.3 ha sido publicado.

Esta es una actualización rutinaria que incluye correcciones a fallas.
Por favor vea más detalles en las
[notas de publicación en Github](https://github.com/ruby/ruby/releases/tag/v3_4_3).

## Calendario de publicación

Procuramos publicar la versión más estable y reciente de Ruby (actualmente
Ruby 3.4) cada 2 meses.
Ruby 3.4.4 será publicada en Junio, 3.4.5 en Agosto,
3.4.6 en Octubre, y 3.4.7 en Diciembre.

Si hay algún cambio que afecte a un número considerable de personas,
esas versiones podrían publicarse antes de lo planeado.

## Descargas

{% assign release = site.data.releases | where: "version", "3.4.3" | first %}

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
