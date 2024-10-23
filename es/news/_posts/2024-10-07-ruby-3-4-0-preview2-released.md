---
layout: news_post
title: "Ruby 3.4.0 preview2 Released"
author: "naruse"
translator: vtamara
date: 2024-10-07 00:00:00 +0000
lang: es
---

{% assign release = site.data.releases | where: "version", "3.4.0-preview2" | first %}
Nos complace anunciar la publicación de Ruby {{ release.version }}.

## Prism

Cambió el analizador sintáctico predeterminado de parse.y a Prism.
[[Característica #20564]]

## Cambios en el lenguaje

* Las cadenas literales en archivos sin un comentario `frozen_string_literal`
  ahora producen una advertencia de obsolescencia cuando se mutan.
  Estas advertencias pueden habilitarse con `-W:deprecated`
  o estableciendo `Warning[:deprecated] = true`.
  Para deshabilitar este cambio, puede ejecutar Ruby con el argumento
  `--disable-frozen-string-literal` en la línea de ordenes.
  [[Característica #20205]]

* Se añade `it` para referenciar un parámetro de bloque.
  [[Característica #18980]]

* Ahora soporta splat de palabra clave `nil`
  cuando se llaman métodos.
  `**nil` se trata de manera similar a `**{}`, al no pasar
  palabras clave, ni llamar método de conversión alguno [[Falla #20064]]

* Ya no se permite pasar bloques como índices.  [[Falla #19918]]

* Argumentos de palabra clave ya no son permitidos como índices.
  [[Falla #20218]]


## Actualización a clases fundamentales

Nota: Listamos sólo actualizaciones a clases muy importantes.

* Excepción

  * `Exception#set_backtrace` ahora acepta un arreglo de
    `Thread::Backtrace::Location`.
    `Kernel#raise`, `Thread#raise` y `Fiber#raise` también aceptan
    este nuevo formato. [[Característica #13557]]

* Rangos

  * `Range#size` ahora lanza `TypeError` si el rango no es iterable.
    [[Varios #18984]]



## Problemas de compatibilidad

Nota: Excluyendo correcciones a fallas.

* Se han cambiado mensajes de error y presentación de trazas.
  * Se usa un sólo apostrofe en lugar de un acento grave para iniciar
    citas. [[Característica #16495]]
  * Presentar el nombre de la clase antes del nombre del método (sólo
    cuando la clase tiene un nombre permanente). [[Característica #19117]]
  * Los métodos de `Kernel#caller`, `Thread::Backtrace::Location` se
    han cambiado análogamente.

  ```
  Antiguo:
  test.rb:1:in `foo': undefined method `time' for an instance of Integer
          from test.rb:2:in `<main>'

  Nuevo:
  test.rb:1:in 'Object#foo': undefined method 'time' for an instance of Integer
          from test.rb:2:in '<main>'
  ```

* La presentación de `Hash#inspect` ha cambiado. [[Falla #20433]]
  * Las llaves que son símbolos se presentan con la sintaxis moderna
    para llaves que son símbolos: `"{user: 1}"`
  * Otras llaves ahora tiene espacios alrededor de `=>`:
    `'{"user" => 1}'`, mientras que antes no tenían: `'{"user"=>1}'`

## Actualizaciones al  API en C

* Se han eliminado `rb_newobj` y `rb_newobj_of` (y los respectivos macros
  `RB_NEWOBJ`, `RB_NEWOBJ_OF`, `NEWOBJ`, `NEWOBJ_OF`). [[Característica #20265]]
* Se eliminó la función obsoleta `rb_gc_force_recycle`. [[Característica #18290]]

## Mejoras a la implementación

* `Array#each` se ha reescrito en Ruby para mejorar desempeño
  [[Característica #20182]].

## Cambios varios

* Al pasar un bloque a un método que no usa el bloque pasado ahora presentará
  una advertencia en modo verboso (`-w`).
  [[Característica #15554]]

* Al redefinir algunos métodos fundamentales que son optimizados de manera
  especial por el interprete y el JIT como `String.freeze` o `Integer#+`
  ahora se emite una advertencia de desempeño
  (`-W:performance` o `Warning[:performance] = true`).
  [[Característica #20429]]

En la publicación en Github como [Logger](https://github.com/ruby/logger/releases) o en la bitácora de cambios pueden verse detalles de las gemas
predeterminadas y las gemas incluidas.

Ver más detalles en
[NOTICIAS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
o en [la bitácora de contribuciones](https://github.com/ruby/ruby/compare/v3_3_0...{{ release.tag }}).

Con estos cambios, [{{ release.stats.files_changed }} archivos modificados,
{{ release.stats.insertions }} inserciones(+),
{{ release.stats.deletions }} eliminaciones(-)](https://github.com/ruby/ruby/compare/v3_3_0...{{ release.tag }}#file_bucket)
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

## Lo que es Ruby

Ruby fue desarrolladoa primero por Matz (Yukihiro Matsumoto) en 1993,
y ahora es desarrollado como Fuentes Abiertas.
Opera en múltiples platformas y es usado en todo el mundo
especialmente para desarrollo web.

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
[Característica #20564]: https://bugs.ruby-lang.org/issues/20564
[Falla #20433]:     https://bugs.ruby-lang.org/issues/20433
