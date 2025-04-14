---
layout: news_post
title: "Publicado Ruby 3.4.2"
author: k0kubun
translator: vtamara
date: 2025-02-14 21:55:17 +0000
lang: es
---

Ruby 3.4.2 ha sido publicado

Esta es una actualización rutinaria que incluye correciones a fallas.
Por favor vea detalles en las
[notas de publicación en GitHub](https://github.com/ruby/ruby/releases/tag/v3_4_2)

## Calendario de publicaciones

Queremos publicar la versión de Ruby estable más recieente (acutalmente
Ruby 3.4) cada 2 meses.
Ruby 3.4.3 será publicado en Abril, 3.4.4 en Junio, 3.4.5 en Agosto,
3.4.6 en Octubre, y 3.4.7 en Diciembre.

Si hay algún cambio que afecte a un número considerabl de personas,
esas versiones sera publicadas más pronto de lo esperado.

## Descargas

{% assign release = site.data.releases | where: "version", "3.4.2" | first %}

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

Muchos contribuidores, desarrolladores y usuarios que proveyeron reportes de
fallas nos ayudaron a producir esta versión.

Gracias por sus contribuciones.
