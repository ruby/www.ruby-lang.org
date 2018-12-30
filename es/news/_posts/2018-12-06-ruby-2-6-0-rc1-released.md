---
layout: news_post
title: "Publicado Ruby 2.6.0-rc1"
author: "naruse"
translator: "vtamara"
date: 2018-12-06 00:00:00 +0000
lang: es
---

Nos complace anunciar la publicación de Ruby 2.6.0-rc1.

Ruby 2.6.0-rc1 es el primer candidato a publicación de Ruby 2.6.0.
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

Con Ruby 2.6.0 preview3, hemos alcanzado una mejora en velocidad de 1.7 veces
sobre Ruby 2.5 con una carga de trabajo intensiva en el uso de la CPU,
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

* `else` sin `rescue` ahora causa un error de sintaxis.  [EXPERIMENTAL]

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

Vea detalles en [NOTICIAS](https://github.com/ruby/ruby/blob/v2_6_0_preview3/NEWS)
o en [la bitácora de commits](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_preview3).

Con esos cambios,
[cambiaron 6376 archivos, 227364 inserciones(+), 51599 eliminaciones (-)](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_rc1)
desde Ruby 2.5.0!

Disfrute programar con Ruby 2.6.0-rc1!

## Descargas

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-rc1.tar.gz>

      SIZE:   16823448 bytes
      SHA1:   889db7731fd43f6dbf7f31ffdb0a29bba1a8d356
      SHA256: 6d6183639ed9c02320d7132e97c65489a39e24d8b55fc4ed35ac53d1189cb61d
      SHA512: ad101adee5c43f3645561e73970f15d4e9141f707da69a92e224575c665949e18ca53389e5315fca2ea3934d77967a59e304353cde4a915537e7c4e4ee20be73

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-rc1.zip>

      SIZE:   20737499 bytes
      SHA1:   457e39aee1978da5e42af42a6ad230421544aa07
      SHA256: 2bcdf468de499e4d6983d60d63dcc883f4c54fdc05a08a54eb93d315477bc4cc
      SHA512: 0842fae8a199f6c1e76f5d775edbf468e18a54f0419324eb73595e0268c728c71733371d71dc2fa342105dbc487987ca5556948a9ef067276a7b5f552462802a

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-rc1.tar.bz2>

      SIZE:   14607078 bytes
      SHA1:   269fe9d414d7731e4a63959fadffe5c50c08ce0e
      SHA256: b4e9c0e8801946e9f0baba30948955f4341e9e04f363c206b7bd774208053eb5
      SHA512: cbd6281b2aab6fbce3f699c1ab57e5423304dca7a547a0b3cd4e8e980326dc7b85b2ca2bfaf3f3a648d40f4222fdf1740d81d422790ee7ae1ba1ed33eb11e3e8

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-rc1.tar.xz>

      SIZE:   11851908 bytes
      SHA1:   3b93fdf1c5bd969ab4fe0a8176a6cf64e4597e6e
      SHA256: 21d9d54c20e45ccacecf8bea4dfccd05edc52479c776381ae98ef6a7b4afa739
      SHA512: 3d93d8d80e4900e8b3a27f904ed60581cebc6c55f4ab7acafc81e95001f92f3ea4ddec2da6169b1ed5e0146f7b7c35c1c13b3243955d5825c72170834fe933f3
