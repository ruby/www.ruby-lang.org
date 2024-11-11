---
layout: news_post
title: "Publicado Ruby 3.3.6"
author: k0kubun
translator: vtamara
date: 2024-11-05 04:25:00 +0000
lang: es
---

Ruby 3.3.6 ha sido publicado.

Esta es una actualización de rutina que incluye soluciones a fallas menores.
También detiene las advertencias sobre dependencias faltantes de gemas
predeterminadas que serán gemas incluidas en Ruby 3.5.

Para ver más detalles, por favor refiérase a
[las notas de la publicación en GitHub](https://github.com/ruby/ruby/releases/tag/v3_3_6).

## Calendario de versiones

Como se [anunció anteriormente](https://www.ruby-lang.org/es/news/2024/07/09/ruby-3-3-4-released/),
queremos publicar la versión de Ruby más estable (Ruby 3.3 al momento de este
escrito) cada 2 meses después de una versión `.1`.

Esperamos publicar Ruby 3.3.7 en Enero 7. Si ocurre algún cambio significativo
que impacte un gran número de usuario, podríamos publicar una nueva versión
antes de lo programado.

## Descargas

{% assign release = site.data.releases | where: "version", "3.3.6" | first %}

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
