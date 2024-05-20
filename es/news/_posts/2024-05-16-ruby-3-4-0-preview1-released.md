---
layout: news_post
title: "Publicado Ruby 3.4.0 preview1"
author: "naruse"
translator: vtamara
date: 2024-05-16 00:00:00 +0000
lang: es
---

{% assign release = site.data.releases | where: "version", "3.4.0-preview1" | first %}
Nos complace anunciar la publicación de Ruby {{ release.version }}.

## Cambios en el lenguaje

* Las cadenas literales en archivos sin el comentario `frozen_string_literal`
  ahora se comportan como si estuvieran congeladas.
  Si llegan a ser mutadas se produce una advertencia de desprecio.
  Estas advertencia pueden ser habilitadas con `-W:deprecated`
  o estableciendo `Warning[:deprecated] = true`.
  Para deshabilitar este cambio, puede ejecutar Ruby con el argumento
  `--disable-frozen-string-literal` desde la línea de ordenes.
  [[Característica #20205]]

* `it` se agrega para referenciar un parámetro de bloque.
  [[Característica #18980]]

* Ahora se soporta hacer splat de palabras clave con `nil` cuando se
  llaman métodos.
  `**nil` se trata de manera similar a `**{}`, no pasar palabras clave,
  y no llamar método de conversión alguno.  [[Falla #20064]]

* Ya no se permite pasar bloques como índices.  [[Falla #19918]]

* Ya no se permiten argumentos de palabra clave como índices.  [[Falla #20218]]

## Clases fundamentales actualizadas

Nota: Listamos sólo actualizaciones mayores de clases.

* Exception

  * Exception#set_backtrace ahora acepta arreglos de
    `Thread::Backtrace::Location`.
    `Kernel#raise`, `Thread#raise` y `Fiber#raise` también aceptan
    este nuevo formato. [[Característica #13557]]

* Range

  * Range#size ahora lanza `TypeError` si el rango no es iterable.
    [[Varios #18984]]



## Problemas de compatibilidad

Nota: Excluyendo correcciones a problemas en características.

* Los mensajes de error y la presentación de trazas han sido cambiadas.
  * Se usa un sólo apóstrofe en lugar de un apostrofe invertido para
    iniciar una cita. [[Característica #16495]]
  * Se presenta un nombre de clase antes del nombre de un método
   (sólo cuando la clase tiene un nombre permanente). [[Característica #19117]]
  * También se cambiaron de la manera análoga los métodos `Kernel#caller`,
    `Thread::Backtrace::Location`, etc.

  ```
  Antes:
  test.rb:1:in `foo': undefined method `time' for an instance of Integer
          from test.rb:2:in `<main>'

  Ahora:
  test.rb:1:in 'Object#foo': undefined method 'time' for an instance of Integer
          from test.rb:2:in `<main>'
  ```


## Actualizaciones del API en C

* Se han eliminado `rb_newobj` y `rb_newobj_of` (y los respectivos macros
  `RB_NEWOBJ`, `RB_NEWOBJ_OF`, `NEWOBJ`, `NEWOBJ_OF`).
  [[Característica #20265]]
* Se eliminó la función despreciada `rb_gc_force_recycle`.
  [[Característica #18290]]

## Mejoras en implementación

* Se re-escribió `Array#each` en Ruby para mejorar el desempeño [[Característica #20182]].

## Cambios diversos

* Al pasar un bloque a un método que no use el bloque recibido se
  presentará una advertencia en modo verboso (`-w`).
  [[Característica #15554]]

* Al redefinir algunos métodos fundamentales que se han optimizado
  de manera especial por el interprete y por JIT como `String.freeze` o
  `Integer#+` ahora produce una advertencia en la clase de
  desempeño (`-W:performance` o `Warning[:performance] = true`).
  [[Característica #20429]]

Vea notas de publicación como las de
[Logger](https://github.com/ruby/logger/releases) o
archivos de cambios (changelog) con detalles de las gemas
predeterminadas y las gemas incluidas.

Ver más detalles en
[NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
o en la [bitácora de contribuciones](https://github.com/ruby/ruby/compare/v3_3_0...{{ release.tag }}).

Con estas novedades, [{{ release.stats.files_changed }} archivos cambiados, {{ release.stats.insertions }} inserciones(+), {{ release.stats.deletions }} eliminaciones(-)](https://github.com/ruby/ruby/compare/v3_3_0...{{ release.tag }}#file_bucket)
desde Ruby 3.3.0!


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

## Qué es Ruby

Ruby fu desarrollado inicialmente por Matz (Yukihiro Matsumoto) en 1993,
y ahora se desarrolla como Fuentes Abiertas. Corre en múltiples
plataformas y se usa en todo el mundoa especialmente para
de desarrollo de aplicaciones web.

[Característica #13557]: https://bugs.ruby-lang.org/issues/13557
[Característica #15554]: https://bugs.ruby-lang.org/issues/15554
[Característica #16495]: https://bugs.ruby-lang.org/issues/16495
[Característica #18290]: https://bugs.ruby-lang.org/issues/18290
[Característica #18980]: https://bugs.ruby-lang.org/issues/18980
[Varios #18984]:    https://bugs.ruby-lang.org/issues/18984
[Característica #19117]: https://bugs.ruby-lang.org/issues/19117
[Falla #19918]:     https://bugs.ruby-lang.org/issues/19918
[Falla #20064]:     https://bugs.ruby-lang.org/issues/20064
[Característica #20182]: https://bugs.ruby-lang.org/issues/20182
[Característica #20205]: https://bugs.ruby-lang.org/issues/20205
[Falla #20218]:     https://bugs.ruby-lang.org/issues/20218
[Característica #20265]: https://bugs.ruby-lang.org/issues/20265
[Característica #20429]: https://bugs.ruby-lang.org/issues/20429
