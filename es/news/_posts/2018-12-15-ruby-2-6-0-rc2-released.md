---
layout: news_post
title: "Publicado Ruby 2.6.0-rc2"
author: "naruse"
translator: "vtamara"
date: 2018-12-15 00:00:00 +0000
lang: es
---

Nos complace anunciar la publicación de Ruby 2.6.0-rc2.

Ruby 2.6.0-rc2 es el seguno candidato a publicación de Ruby 2.6.0.
Se publica RC2 para probar Bundler 1.17 que se incorpora en lugar de 2.0.
Introduce algunas características nuevas y mejoras en desempeño, por ejemplo:

## JIT

Ruby 2.6 introduce una implementación inicial de un compilador JIT
(Just-in-time).

Un compilador JIT busca mejorar el desempeño de cualquier ejecución de un
programa en Ruby.
A diferencia de los compiladores JIT ordinarios para otros lenguajes, el
compilador JIT de Ruby hace la compilación JIT de manera única,
emitiendo código C en un disco y lanzando el proceso ordinario de
compilación en C para generar código nativo.
Ver también: [Organización MJIT por Vladimir Makarov](https://github.com/vnmakarov/ruby/tree/rtl_mjit_branch#mjit-organization).

Forma de uso: Sólo especifique `--jit` en la línea de comandos o en la
variable de entorno `$RUBYOPT`.
Al especificar `--jit-verbose=1` se presentará información básica de la
compilación JIT.  Vea más opciones con `ruby --help`.

El propósito principal de esta versión JIT es darle oportunidad de
comprobar que funciona en su plataforma y encontrar riesgos de seguridad
antes de la versión 2.6.
El compilador JIT es soportado cuando Ruby se construye con GCC, Clang o
Microsoft VC++, que debe estar disponible en tiempo de ejecución.  De
lo contrario no podrá usarlo por el momento.

Con Ruby 2.6.0-rc2, hemos alcanzado una mejora en velocidad de 1.7 veces
la de Ruby 2.5 con una carga de trabajo intensiva en el uso de la CPU,
denominada Optcarrot <https://gist.github.com/k0kubun/d7f54d96f8e501bbbc78b927640f4208>.
También vamos a mejorar el desempeño de cargas de trabajo intensivas en el
uso de memoria tales como las aplicaciones Rails.

Este pendiente de la nueva era en el desempeño de Ruby.

## RubyVM::AbstractSyntaxTree [Experimental]

Ruby 2.6 introduce el módulo `RubyVM::AbstractSyntaxTree`.

Este módulo tiene un método `parse` que puede reconocer código ruby en una cadena y retornar nodos del AST (Abstract Syntax Tree - Árbol de sintaxis abstracta), y el método `parse_file` que reconoce código ruby en un archivo y retorna los nodos del AST.
También se introduce la clase `RubyVM::AbstractSyntaxTree::Node`. Puede obtener información de la localización y los nodos hijos de objetos `Node`. Esta característica es experimental.  No se garantiza compatibilidad de la estructura de los nodos AST.



## Nuevas características

* Se agregó el alias `then` a `Kernel#yield_self`. [[Característica #14594]](https://bugs.ruby-lang.org/issues/14594)

* `else` sin `rescue` ahora causa un error de sintaxis.  [EXPERIMENTAL][[Feature #14606]](https://bugs.ruby-lang.org/issues/14606)

* Los nombres de constantes pueden comenzar con una letra mayúscula fuera de la tabla ASCII.  [[Característica #13770]](https://bugs.ruby-lang.org/issues/13770)

* Rangos no acotados [[Característica #12912]](https://bugs.ruby-lang.org/issues/12912)

  Se introduce un rango no acotado `(1..)`. Funciona como si no terminara.  A continuación se presenta un uso típico:

      ary[1..]                          # igual a ary[1..-1] sin el mágico -1
      (1..).each {|index| ... }         # ciclo infinito desde el índice 1
      ary.zip(1..) {|elem, index| ... } # ary.each.with_index(1) { ... }

* Añadido `Binding#source_location`.  [[Característica #14230]](https://bugs.ruby-lang.org/issues/14230)

  Este método retorna la localización en la fuente de una unión,  un arreglo de 2 elementos `__FILE__` y `__LINE__`.  Tradicionalmente, la misma información podría recuperarse con `eval("[__FILE__, __LINE__]", binding)`, pero planeamos cambiar este comportamiento para que `Kernel#eval` ignore la localización de uniones en las fuentes [[Falla #4352]](https://bugs.ruby-lang.org/issues/4352).  Así que los usuarios deberían emplear este método recién introducido en lugar de `Kernel#eval`.

* Añadida la opción `:exception` para que `Kernel.#system` lance un error en lugar de retornar `false`.  [[Característica #14386]](https://bugs.ruby-lang.org/issues/14386)


* Agregado el modo oneshot [[Característica #15022]](https://bugs.ruby-lang.org/issues/15022)
  * Este modo revisa "si cada línea fue ejecutada al menos una vez o no", en lugar de "cuantas veces fue ejecutada cada línea".  Un gancho para cada línea es disparado al menos una vez, y después de que es disparado se elimina la bandera del gancho, i.e., corre sin gastos adicionales.
  * Agregada el argumento de palabra clave `:oneshot_lines` a `Coverage.start`.
  * Agregadas el argumento de palabra clave `:stop` y `:clear` a `Coverage.result`. Si `clear` es verdadero, deja el contador en cero.  Si `stop` es verdadero, deshabilita las mediciones de cobertura.
  * Coverage.line_stub, que es una función auixiliar que crea la "colilla" para cobertura de líneas de una código fuente dado.

* `FileUtils#cp_lr`.  [[Característica #4189]](https://bugs.ruby-lang.org/issues/4189)


## Mejoras en desempeño

* Mejorada la velocidad de `Proc#call` porque ya no necesitamos preocuparnos por `$SAFE`.  [[Característica #14318]](https://bugs.ruby-lang.org/issues/14318)

  Con la prueba de referencia `lc_fizzbuzz` que usa `Proc#call` repetidas veces podemos medir mejoras de 1.4 veces [[Falla #10212]](https://bugs.ruby-lang.org/issues/10212).

* Mejorada velocidad de `block.call` cuando `block` es un parámetro de
  bloque pasado a una función. [[Característica #14330]](https://bugs.ruby-lang.org/issues/14330)

  Ruby 2.5 mejora el desempeño al pasar bloques. [[Característica #14045]](https://bugs.ruby-lang.org/issues/14045)
  Además, Ruby 2.6 mejora el desempeño al llamar bloques pasados.
  Con micro-pruebas de referencia podemos observar una mejora de 2.6 veces.

* Se introduce la estructura de datos Montón transitorio (Transient Heap - theap). [[Falla #14858]](https://bugs.ruby-lang.org/issues/14858) [[Característica #14989]](https://bugs.ruby-lang.org/issues/14858)
  theap es un montón usado para objetos en memoria de corta duración que son
  apuntados por clases específicas (`Array`, `Hash`, `Object`, and `Struct`).
  Por ejemplo, hacer objetos Hash pequeños y de corta duración es 2 veces
  más rápido.  Con la prueba de referencia rdoc, observamos una mejora en
  desempeño de entre 6 y 7%.


## Otros cambios notables desde 2.5

* `$SAFE` es el estado global del proceso y podemos ponerlo nuevamente en `0`.  [[Característica #14250]](https://bugs.ruby-lang.org/issues/14250)

* Es obsoleto pasar `safe_level` a `ERB.new`. Los argumentos `trim_mode` y `eoutvar` se cambian a argumentos de palabra clave (keyword arguments). [[Característica #14256]](https://bugs.ruby-lang.org/issues/14256)

* La versión de Unicode soportada se ha actualizado a la 11.  Se planea actualizar a 12 y 12.1 en las futuras versiones menores (TEENY) de Ruby 2.6.

* Mezclado RubyGems 3.0.0.beta3. Se eliminaron las opciones `--ri` y `--rdoc`. Por favor use las opciones `--document` y `--no-document` en lugar de esas.

* Mezclado [Bundler](https://github.com/bundler/bundler) como una gema por omisión.

Vea detalles en [NOTICIAS](https://github.com/ruby/ruby/blob/v2_6_0_rc2/NEWS)
o en [la bitácora de commits](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_rc2).

Con esos cambios,
[cambiaron 6411 archivos, 228864 inserciones(+), 97600 eliminaciones (-)](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_rc2)
desde Ruby 2.5.0!

Disfrute programar con Ruby 2.6.0-rc2!

## Descargas

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-rc2.tar.gz>

      SIZE:   16723556 bytes
      SHA1:   a4d7f8c8c3584a60fe1a57d03d80162361fe3c78
      SHA256: 9c0245e96379246040f1fd0978f8e447e7f47cdccbdaffdb83302a995276b62b
      SHA512: 789f608f93db6e12835911f3105d9abe2fabb67cd22dc3bafdff38716ac56974925738e7f7788ebef5bdf67b6fd91f84a4ee78a3e5d072cfc8ee0972de737b08

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-rc2.zip>

      SIZE:   20643747 bytes
      SHA1:   c1a2898949d929dd952880f1c1c2bac2ef2609b4
      SHA256: e8a446cf1f2ffc14483604de0a5e12c2578dd2f672ae87798ca2bbb9b7b73899
      SHA512: 2d06feae13f485f5da59574672b14d03881ed532d652648f94e2435f5d81df623b5ef532b8ba8e0b9bc4ee6baf7c0328a5610eab753a9020a0fea2673254c76c

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-rc2.tar.bz2>

      SIZE:   14581998 bytes
      SHA1:   94bbee97de4955e67effb7f512c58300617a3a09
      SHA256: b3d03e471e3136f43bb948013d4f4974abb63d478e8ff7ec2741b22750a3ec50
      SHA512: 9bfbe83fd3699b71bae2350801d8c967eb128e79b62a9d36fc0f011b83c53cab28a280939f4cc9f0a28f9bf02dce8eea30866ca4d06480dc44289400abf580ba

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-rc2.tar.xz>

      SIZE:   11908088 bytes
      SHA1:   13a7f06d832dc28989e3e4321490a6ba528ed023
      SHA256: d620b3d87b3190867304067f3ce77f5305f7ec1b2e73b09c17710c97c028986d
      SHA512: a3dc43c0bc70dfdb9ff0d18b5b9797bbf332524f5d3bbb7940cf4e32286ca715808acfd11ebf3cdbe358a2466b7c6b5be3a7a784af7eb95c071fe1f8b4ab1261
