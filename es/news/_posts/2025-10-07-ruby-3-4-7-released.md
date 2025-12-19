---
layout: news_post
title: "Publicado Ruby 3.4.7"
author: k0kubun
translator: vtamara
date: 2025-10-07 17:14:11 +0000
lang: es
---

Ruby 3.4.7 ha sido publicado.

Esta versión incluye [una actualización a la gema uri que resuelve el CVE-2025-61594](https://www.ruby-lang.org/es/news/2025/10/07/uri-cve-2025-61594/),
junto con otras correcciones a fallas. 
Para ver más detalles por favor refiérase a las
[notas de publicación en Github](https://github.com/ruby/ruby/releases/tag/v3_4_7).

Recomendamos actualizar su versión de la gem uri. Esta versión ha sido 
publicada por conveniencia de quienes quieren seguir usándola como 
gema predeterminada.

## Calendario de publicaciones

Planeamos publicar la versión más reciente de Ruby
(actualmente Ruby 3.4) cada dos meses tras la versión anterior.
Ruby 3.4.8 está programada para Diciembre y 3.4.9 para Febrero.

Si ocurre un cambio que afecte significativamente a los usuarios,
podría publicarse una versión antes de lo planeado, y las
siguientes se correrán igualmente.

## Descargas

{% assign release = site.data.releases | where: "version", "3.4.7" | first %}

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

## Comentario de la Versión

Muchos contribuyentes, desarrolladores y usuarios que proveyeron reportes
de fallas nos ayudaron a crear esta versión.
Gracias por sus contribuciones.
