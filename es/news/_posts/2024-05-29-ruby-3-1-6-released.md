---
layout: news_post
title: "Publicado Ruby 3.1.6"
author: "hsbt"
translator: vtamara
date: 2024-05-29 9:00:00 +0000
lang: es
---

Ruby 3.1.6 ha sido publicado.

La serie Ruby 3.1 ahora está en fase de mantenimiento de seguridad.
En general, corregiremos sólo fallas de seguridad en esta fase.
Pero tuvimos varios problemas de compilación después
de la publicación de Ruby 3.1.5. Decidimos publicar Ruby 3.1.6
para corregir esos problemas.

Por favor vea los temas siguientes para conocer detalles.

* [Falla #20151: No puede compilar Ruby 3.1 en FreeBSD 14.0](https://bugs.ruby-lang.org/issues/20151)
* [Falla #20451: Retro-porte con falla en Ruby 3.1.5 impide compilación de fiddle](https://bugs.ruby-lang.org/issues/20451)
* [Falla #20431: Ruby 3.3.0 falla al compilar con make: *** \[io_buffer.o\] Error 1](https://bugs.ruby-lang.org/issues/20431)

Ver la más detalles en la [publicación de GitHub](https://github.com/ruby/ruby/releases/tag/v3_1_6).

## Descargas

{% assign release = site.data.releases | where: "version", "3.1.6" | first %}

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

Muchos contribuidores, desarrolladores y usuarios que proveyeron reportes de
fallas nos ayudaron a hacer esta publicación.

Gracias por sus contribuciones.
