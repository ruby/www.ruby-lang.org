---
layout: news_post
title: "Publicación de Ruby 4.0.0 preview2"
author: "naruse"
translator: vtamara
date: 2025-11-17 00:00:00 +0000
lang: es
---

{% assign release = site.data.releases | where: "version", "4.0.0-preview2" | first %}
Nos complace anunciar el lanzamiento de Ruby {{ release.version }}.
Ruby 4.0 actualiza su versión de Unicode a 17.0.0, entre otras novedades.

## Cambios en el lenguaje

* `*nil` ya no llama a `nil.to_a`, de forma similar a como `**nil`
  no llama a `nil.to_hash`. [[Característica #21047]]

## Actualizaciones de clases principales

Nota: Solo se enumeran las actualizaciones más importantes de las clases
principales.

* Binding

* `Binding#local_variables` ya no incluye parámetros numerados.
  Además, `Binding#local_variable_get` y `Binding#local_variable_set`
  rechazan el manejo de parámetros numerados.
  [[Falla #21049]]

* IO

* `IO.select` acepta +Float::INFINITY+ como argumento de tiempo de espera.
  [[Característica #20610]]

* String

* Actualización a Unicode versión 17.0.0 y Emoji versión 17.0.
  [[Característica #19908]][[Característica #20724]][[Característica #21275]]
  (también aplica a Regexp)


## Actualizaciones de la biblioteca estándar

Nota: Solo se enumeran las actualizaciones más importantes de las bibliotecas
estándar.

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

Nota: Se excluyen las correcciones de errores de características.

## Problemas de compatibilidad con la biblioteca estándar

## Actualizaciones de la API de C


## JIT

* YJIT
    * Estadísticas de YJIT
        * `ratio_in_yjit` ya no funciona en la compilación predeterminada.
            Use `--enable-yjit=stats` en `configure` para habilitarlo
            con `--yjit-stats`.
        * Se agregó `invalidate_everything` a las estadísticas
            predeterminadas, que se incrementa cuando TracePoint invalida
            todo el código.
    * Se agregaron las opciones `mem_size:` y `call_threshold:` a
      `RubyVM::YJIT.enable`.
* ZJIT
    * Se agregó un compilador JIT experimental basado en métodos.
      Use `--enable-zjit` en `configure` para habilitar el soporte `--zjit`.
    * A partir de Ruby 4.0.0-preview2, ZJIT aún no está listo para acelerar
      la mayoría de los benchmarks.
      Por favor, absténgase de evaluar ZJIT por el momento. Manténgase
      atento al lanzamiento de Ruby 4.0.
* RJIT
    * Se eliminó `--rjit`. Trasladaremos la implementación de la API JIT de
      terceros al repositorio [ruby/rjit](https://github.com/ruby/rjit).

## Cambios varios

Consulte [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
o los [registros de commits](https://github.com/ruby/ruby/compare/v3_4_0...{{ release.tag }})
para obtener más detalles.

Con estos cambios, ¡[{{ release.stats.files_changed }} archivos modificados, {{ release.stats.insertions }} inserciones (+), {{ release.stats.deletions }} eliminaciones (-)](https://github.com/ruby/ruby/compare/v3_4_0...{{ release.tag }}#file_bucket)
desde Ruby 3.4.0!

## Descarga

* <{{ release.url.gz }}>

TAMAÑO: {{ release.size.gz }}
SHA1: {{ release.sha1.gz }}
SHA256: {{ release.sha256.gz }}
SHA512: {{ release.sha512.gz }}

* <{{ release.url.xz }}>

TAMAÑO: {{ release.size.xz }}
SHA1: {{ release.sha1.xz }}
SHA256: {{ release.sha256.xz }}
SHA512: {{ release.sha512.xz }}

* <{{ release.url.zip }}>

TAMAÑO: {{ release.size.zip }}
SHA1: {{ release.sha1.zip }}
SHA256: {{ release.sha256.zip }}
SHA512: {{ release.sha512.zip }}

## ¿Qué es Ruby?

Ruby fue desarrollado por primera vez por Matz (Yukihiro Matsumoto) en 1993,
y actualmente se desarrolla como software de código abierto. Se ejecuta en múltiples plataformas
y se utiliza en todo el mundo, especialmente para el desarrollo web.

[Característica #21047]: https://bugs.ruby-lang.org/issues/21047
[Falla #21049]: https://bugs.ruby-lang.org/issues/21049
[Característica #20610]: https://bugs.ruby-lang.org/issues/20610
[Característica #19908]: https://bugs.ruby-lang.org/issues/19908
[Característica #20724]: https://bugs.ruby-lang.org/issues/20724
[Característica #21275]: https://bugs.ruby-lang.org/issues/21275
