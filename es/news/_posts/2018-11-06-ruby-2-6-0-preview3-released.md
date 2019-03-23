---
layout: news_post
title: "Publicado Ruby 2.6.0-preview3"
author: "naruse"
translator: "vtamara"
date: 2018-11-06 00:00:00 +0000
lang: es
---

Nos complace anunciar la publicación de Ruby 2.6.0-preview3.

Ruby 2.6.0-preview3 es la tercera vista premiliminar de Ruby 2.6.0.
Esta vista preliminar 3 se publica para probar nuevas
características antes del Candidato a Publicación.

## JIT

Ruby 2.6 introduce una implementación inicial de un compilador JIT
(Just-in-time).

Un compilador JIT busca mejorar el desempeño de cualquier ejecución de un
programa en Ruby.
A diferencia de los compiladores JIT ordinarios para otros lenguajes, el
compilador JIT de Ruby hace la compilación JIT de manera única,
emitiendo código C en un disco y lanzando el proceso ordinario de
compilación en C para generar código nativo.
Ver también: [MJIT organization by Vladimir Makarov](https://github.com/vnmakarov/ruby/tree/rtl_mjit_branch#mjit-organization).

Forma de uso: Sólo especifique `--jit` en la línea de ordenes o en la
varialbe de entorno `$RUBYOPT`.
Al especificar `--jit-verbose=1` se presentará información básica de la
compilación JIT.  Vea más opciones con `ruby --help`.

El propósito principal de esta versión JIT es darle oportunidad de
comprobar que funciona en su plataforma y encontrar riesgos de seguridad
antes de la versión 2.6.
El compilador JIT es soportado cuando Ruby se construye con GCC, Clang o
Microsoft VC++, que debe estar disponible en tiempo de ejecución.  De
lo contrario no podrá usarlo por el momento.

Con Ruby 2.6.0 preview3, hemos alcanzado una mejora en velocidad de 1.7 veces
sobre Ruby 2.5 con una carga de trabajo intensiva en el uso de la CPU,
denominada Optcarrot <https://gist.github.com/k0kubun/d7f54d96f8e501bbbc78b927640f4208>.
Vamos a a mejorar el desempeño de cargas de trabajo intensivas en el uso
de memoria tales como las aplicaciones Rails.

Este pendiente de la nueva era del desempeño de Ruby.

## RubyVM::AST [Experimental]

Ruby 2.6 introduce el módulo `RubyVM::AST`.

Este módulo tiene un método `parse` que puede reconocer código ruby en una cadena y retornar nodos del AST (Abstract Syntax Tree - Árbol de sintaxis abstract), y el método `parse_file` que reconoe código ruby en un archivo y retorna nodos del AST.
También se introduce la clase `RubyVM::AST::Node`. Puede obtener información de la localización y los nodos hijos de objetos `Node`. Esta característica es experimental.  No se garantiza compatibilidad de la estructura de los nodos AST.

## Nuevas características

* Se agregó el alias `then` a `Kernel#yield_self`. [[Característica #14594]](https://bugs.ruby-lang.org/issues/14594)

* `else` sin `rescue` ahora causa un error de sintaxis.  [EXPERIMENTAL]

* Los nombres de constantes pueden comenzar con una letra mayúscula fuera de la tabla AASCII.  [[Característica #13770]](https://bugs.ruby-lang.org/issues/13770)

* Rangos no acotados [[Característica #12912]](https://bugs.ruby-lang.org/issues/12912)

  Se introduce un rango no acotado `(1..)`. Funciona como si no terminara.  A continuación se presenta un uso típico:

      ary[1..]                          # igual a ary[1..-1] sin el mágico -1
      (1..).each {|index| ... }         # ciclo infinito desde el índice 1
      ary.zip(1..) {|elem, index| ... } # ary.each.with_index(1) { ... }

* Añadido `Binding#source_location`.  [[Característica #14230]](https://bugs.ruby-lang.org/issues/14230)

  Este método retorna la localización en la fuente de una unión,  un arreglo de 2 elementos `__FILE__` y `__LINE__`.  Tradicionalmente, la misma información podría recuperarse con `eval("[__FILE__, __LINE__]", binding)`, pero planeamos cambiar este comportamiento para que `Kernel#eval` ignore la localización de uniones en las fuentes [[Falla #4352]](https://bugs.ruby-lang.org/issues/4352).  Así que los usuarios deberían emplear este método recién introducido en lugar de `Kernel#eval`.

* Añadir la opción `:exception` para que `Kernel.#system` lance un error en lugar de retornar `false`.  [[Característica #14386]](https://bugs.ruby-lang.org/issues/14386)

## Mejoras en desempeño

* Mejorada la velocidad de `Proc#call` porque ya no necesitamos preocuparnos por `$SAFE`.  [[Característica #14318]](https://bugs.ruby-lang.org/issues/14318)

  Con la prueba de referencia `lc_fizzbuzz` que usa `Proc#call` repetidas veces podemos medir mejoras de 1.4 veces [[Falla #10212]](https://bugs.ruby-lang.org/issues/10212).

* Mejorada velocidad de `block.call` cuando `block` es un parámetro de
  bloque pasado a una función. [[Característica #14330]](https://bugs.ruby-lang.org/issues/14330)

  Ruby 2.5 mejora el desempeño al pasar bloques. [[Característica #14045]](https://bugs.ruby-lang.org/issues/14045)
  Además, Ruby 2.6 mejora el desempeño al llamar bloques pasados.
  Con micro-pruebas de referencia podemos observar una mejora de 2.6 veces.

* Se introduce la estructura de datos Montón transitorio (Transient Heap - theap). [Falla #14858] [Característica #14989]
  theap es un montón usado para objetos en memoria de corta duración que son
  apuntados por clases específicas (Array, Hash, Object, and Struct).
  Por ejemplo, hacer objetos Hash pequeños y de corta duración es 2 veces
  más rápido.  Con la prueba de referencia rdoc, observamos una mejora en
  desempeño de entre 6 y 7%.

## Otros cambios notables desde 2.5

* `$SAFE` es el estado global del proceso y podemos ponerlo nuevamente en `0`.  [[Característica #14250]](https://bugs.ruby-lang.org/issues/14250)

* Es obsoleto pasar `safe_level` a `ERB.new`. Los argumentos `trim_mode` y `eoutvar` se cambian a argumentos de palabra clave (keyword arguments). [[Característica #14256]](https://bugs.ruby-lang.org/issues/14256)

* Mezclado RubyGems 3.0.0.beta2. Se eliminaron las opciones `--ri` y `--rdoc`. Por favor use las opciones `--document` y `--no-document` en lugar de esas.

* Mezclado [Bundler](https://github.com/bundler/bundler) como una gema por omisión.

Vea detalles en [NOTICIAS](https://github.com/ruby/ruby/blob/v2_6_0_preview3/NEWS)
o en [la bitácora de commits](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_preview3).

Con esos cambios,
[cambiaron 6474 archivos, 171888 inserciones(+), 46617 eliminaciones (-)](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_preview3)
desde Ruby 2.5.0!

Disfrute programar con Ruby 2.6.0-preview3!

## Descargas

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview3.tar.gz>

      SIZE:   17071670 bytes
      SHA1:   67836fda11fa91e0b988a6cc07989fbceda025b4
      SHA256: 60243e3bd9661e37675009ab66ba63beacf5dec748885b9b93916909f965f27a
      SHA512: 877278cd6e9b947f5bb6ed78136efb232dcc9c5c218b7236576171e7c3cd7f6b7d10d07d8402014a14aba1fcd1913a4370f0725c561ead41d8a3fe92029f7f76

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview3.zip>

      SIZE:   21537655 bytes
      SHA1:   45f3c90dfffe03b746f21f24152666e361cbb41a
      SHA256: 9152af9e700349dcfa2eec196dd91587d42d70a6837fa2c415ebba1167587be1
      SHA512: 335de36cf56706326f4acc4bbd35be01e0ac5fff30d0a69b2e1630ba4c78f0e711822d1623d0099a517c824b154917d2f60be192dfb143a422cf1d17b38e1183

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview3.tar.bz2>

      SIZE:   14973451 bytes
      SHA1:   5f2df5d8c5a3888ccb915d36a3532ba32cda8791
      SHA256: 1f09a2ac1ab26721923cbf4b9302a66d36bb302dc45e72112b41d6fccc5b5931
      SHA512: d1693625723796e8902f3e4c4fae444f2912af9173489f7cf18c99db2a217afc971b082fce7089e39f8edd54d762d2b4e72843c8306ed29b05ccb15ac03dbb5b

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview3.tar.xz>

      SIZE:   12291692 bytes
      SHA1:   7f8216247745215e9645568e7a02140f9a029b31
      SHA256: 9856d9e0e32df9e5cdf01928eec363d037f1a76dab2abbf828170647beaf64fe
      SHA512: b4d3b17ecf96272c43cd7518c0b54dee63fc1150ad143e1d9c9d708506fe78676c80eb96cc47b8d46d1128bd483a53f16c944963a03d1f99f00131b74714df7b
