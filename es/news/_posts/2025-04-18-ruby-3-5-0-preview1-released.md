---
layout: news_post
title: "Publicado Ruby 3.5.0 preview1"
author: "naruse"
translator: vtamara
date: 2025-04-18 00:00:00 +0000
lang: es
---

{% assign release = site.data.releases | where: "version", "3.5.0-preview1" | first %}
Nos complace anunciar la publicación de Ruby {{ release.version }}.
Ruby 3.5 actualiza su versión de Unicode a 15.1.0, entre otros cambios.

## Cambios en el lenguaje

* `*nil` ya no llama a `nil.to_a`, similar a como `**nil` tampoco
  llama a `nil.to_hash`.  [[Caracterítica #21047]]

## Actualización de clases fundamentales

Nota: Sólo listamos actualizaciones notables a clases fundamentales.

* Binding

    * `Binding#local_variables` ya no incluye parámetros numerados.
      También, `Binding#local_variable_get` y `Binding#local_variable_set`
      se rehusan a manejar parámetros numerados.
      [[Falla #21049]]

* IO

    * `IO.select` acepta +Float::INFINITY+ como argumento de
      límite de tiempo. [[Caracterítica #20610]]

* String

    * Actualiza Unicode a la Version 15.1.0 y Emoji Version 15.1. [[Caracterítica #19908]]
        (aplica también para Regexp)


## Actualización de la librería estándar

Nota: Listamos solo actualizaciones notables a las librerías estándar.

* ostruct 0.6.1
* pstore 0.2.0
* benchmark 0.4.0
* logger 1.7.0
* rdoc 6.13.1
* win32ole 1.9.2
* irb 1.15.2
* reline 0.6.1
* readline 0.0.4
* fiddle 1.1.6

## Problemas de compatibilidad

Note: Excluyendo correcciones a fallas.


## Problemas de compatibilidad de la librería estándar


## Actualizaciones al API en C



## Cambios diversos



Ver más detalles en
[NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
o en [la bitácora de contribuciones](https://github.com/ruby/ruby/compare/v3_4_0...{{ release.tag }}).

Con estos cambios, [{{ release.stats.files_changed }} archivos cambiados, {{ release.stats.insertions }} inserciones(+), {{ release.stats.deletions }} eliminacion)](https://github.com/ruby/ruby/compare/v3_3_0...{{ release.tag }}#file_bucket)
desde Ruby 3.4.0!

## Descargas

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

## ¿Qué es Ruby?

Ruby primero fue desarrollado por Matz (Yukihiro Matsumoto) en 1993,
y ahora es desarrollado como código de Fuentes Abiertas. Corre en diversas
plataformas y es usado en todo el mundo especialmente para desarrollo
web.

[Caracterítica #21047]: https://bugs.ruby-lang.org/issues/21047
[Falla #21049]: https://bugs.ruby-lang.org/issues/21049
[Caracterítica #20610]: https://bugs.ruby-lang.org/issues/20610
[Caracterítica #19908]: https://bugs.ruby-lang.org/issues/19908
