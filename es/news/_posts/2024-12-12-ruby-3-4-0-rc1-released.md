---
layout: news_post
title: "Publicado Ruby 3.4.0 rc1"
author: "naruse"
translator: vtamara
date: 2024-12-12 00:00:00 +0000
lang: es
---

{% assign release = site.data.releases | where: "version", "3.4.0-rc" | first %}
Nos complace anunciar la publicación de Ruby {{ release.version }}.

## Prism

Cambia el analizador sintáctico predeterminado de parse.y a Prism.
[[Característica #20564]]

## Recolector de basura modular

* Pueden cargarse dinámicamente implementaciones alternativas del recolector
  de basura (__Garbage Collector__ o __GC__) mediante la característica
  recolector de basura modular.  Para habilitar esta característica
  configure Ruby con `--with-modular-gc` durante la compilación.
  Las librerías del GC pueden cargarse en tiempo de ejecución con la
  variable de ambiente `RUBY_GC_LIBRARY`. [[Característica #20351]]

* El recolector de basura incorporado en Ruby se ha dividido en un archivo
  `gc/default/default.c` que interacuta con Ruby usando la API definida en
  `gc/gc_impl.h`. El recolector de basura incorporado ahora puede ser compilado
  como librería usando `make modular-gc MODULAR_GC=default` y se habilita
  con la variable de ambiente `RUBY_GC_LIBRARY=default`. [[Característica#20470]]

* Se provee una librería de GC experimental en [MMTk](https://www.mmtk.io/).
  Esta librería de GC puede compilarse usando `make modular-gc MODULAR_GC=mmtk`
  y se habiita usando la variable de ambiente `RUBY_GC_LIBRARY=mmtk`.
  Esto requiere las herramientas de Rust en el computador donde se compila.
  [[Característica#20860]]


## Cambios en el lenguaje

* Las cadenas literales en archivos sin el comentario `frozen_string_literal`
  ahora emiten una advertencia de deprecación cuando se mutan.
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

## YJIT

TL;DR:
* Mejor resultado en la mayoría de pruebas de desempeño tanto en plataformas
  x86-64 como en arm64.
* Uso de memoria reducido en los meta-datos de compilación.
* Se corrigen diversas fallas.  YJIT es ahora más robusto y mejor probado.

Nuevas características:
* Agrega un límite de memoria unificado mediante la opción en la línea
  de ordenes `--yjit-mem-size` (128MiB de manera predeterminada)
  que hace seguimiento al uso total de memoria de YJIT y que es más
  intuitivo que el anterior `--yjit-exec-mem-size`.
* Ahora hay más estadísticas disponible con `RubyVM::YJIT.runtime_stats`
* Añade a la bitácora de compilación seguimiento de lo que
  se ha compilado con `--yjit-log`
* La cola de la bitácora también está disponible en tiempo de ejecución
  con `RubyVM::YJIT.log`
* Añade soporte para constantes compartidas en modo multi-ractor.
* Ahora puede hacer seguimiento a la cuenta de salidas con `--yjit-trace-exits=COUNTER`

Nuevas optimizaciones:
* El contexto comprimido reduce la memoria requerida para almacenar los
  metadatos de YJIT.
* Localizador mejorado con la habilidad de localizar registros para
  variables locales.
* Cuando YJIT está habilitado, usa más primitivas fundamentales escritas
  en Ruby:
  * `Array#each`, `Array#select`, `Array#map` reescritas en Ruby para dar
     mejor desempeño [[Caracteristica #20182]].
* Habilidad de ejecutar en línea métodos pequeños/triviales tales como:
  * Métodos vacios.
  * Métodos que retornan una constante.
  * Métodos que retornan self.
  * Métodos que retornan directamente un argumento.
* codegen especializado para muchos más métodos en tiempo de ejecución.
* Optimiza `String#getbyte`, `String#setbyte` y otros métodos de string.
* Optimiza operaciones entre bits para hacer más rápidas las manipulaciones de
  bits/bytes a bajo nivel.
* Otra optimizaciones incrementales diversas.

## Clases fundamentales actualizadas

Nota: Listamos sólo actualizaciones mayores de clases.

* Exception

  * `Exception#set_backtrace` ahora acepta arreglos de
    `Thread::Backtrace::Location`.
    `Kernel#raise`, `Thread#raise` y `Fiber#raise` también aceptan
    este nuevo formato. [[Característica #13557]]

* Range

  * `Range#size` ahora lanza `TypeError` si el rango no es iterable.
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
          from test.rb:2:in '<main>'
  ```


## Actualizaciones del API en C

* Se han eliminado `rb_newobj` y `rb_newobj_of` (y los respectivos macros
  `RB_NEWOBJ`, `RB_NEWOBJ_OF`, `NEWOBJ`, `NEWOBJ_OF`).
  [[Característica #20265]]
* Se eliminó la función despreciada `rb_gc_force_recycle`.
  [[Característica #18290]]

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
plataformas y se usa en todo el mundo especialmente para
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
[Característica #20351]: https://bugs.ruby-lang.org/issues/20351
[Característica #20429]: https://bugs.ruby-lang.org/issues/20429
[Característica #20470]: https://bugs.ruby-lang.org/issues/20470
[Característica #20564]: https://bugs.ruby-lang.org/issues/20564
[Característica #20860]: https://bugs.ruby-lang.org/issues/20860
