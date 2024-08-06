---
layout: news_post
title: "Publicado Ruby 3.3.4"
author: "k0kubun"
translator: vtamara
date: 2024-07-09 00:30:00 +0000
lang: es
---

Ruby 3.3.4 ha sido publicado.

Esta versión corrige una regresión en Ruby 3.3.3 de dependencias
que faltaban en el gemspec de algunas gemas incluidas: `net-pop`,
`net-ftp`, `net-imap`, y `prime` 
[[Falla #20581]](https://bugs.ruby-lang.org/issues/20581).

Esta corrección permite que Bundler instale correctamente esas gemas
en plataformas como Heroku.

Si `bundle install` le opera correctamente, puede que no tenga
esta falla.

Otros cambios son correcciones a fallas menores.
Por favor ver detalles en [la publicación en GitHub](https://github.com/ruby/ruby/releases/tag/v3_3_4).

## Calendario de publicación

Para avanzar, queremos publicar una nueva versión de Ruby estable
(en este momento Ruby 3.3) cada 2 meses después de la versión `.1`.
En el caso de Ruby 3.3, la versión 3.3.5 se supone que debe ser
liberada el 3 de Septiembre, 3.3.6 el 5 de noviembre, y la
3.3.7 el 7 de Enero.

Si hay algún cambio que afecte a una cantidad considerable de personas,
e.g. para esta versión, los usuarios de Ruby 3.3.3 en Heroku,
liberaremos una nueva versión antes de lo planeado.

## Descargas

{% assign release = site.data.releases | where: "version", "3.3.4" | first %}

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

## Comentario  de la versión

Muchos contribuidores, desarrolladores y usuarios que proveyeron reportes de
fallas nos ayudaron a hacer esta versión.

Gracias por sus contribuciones.
