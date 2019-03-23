---
layout: news_post
title: "Publicado Ruby 2.6.0"
author: "naruse"
translator: "vtamara"
date: 2018-12-25 00:00:00 +0000
lang: es
---

Nos complace anunciar la publicación de Ruby 2.6.0.
Introduce diversas características nuevas y mejoras en desempeño, las más
notables son:

 * Un nuevo compilador JIT
 * El módulo `RubyVM::AbstractSyntaxTree`

## JIT [Experimental]

Ruby 2.6 introduce una implementación inicial de un compilador JIT
(Just-in-time).

El compilador JIT busca mejorar el desempeño de los programas Ruby.
A diferencia de los compiladores JIT ordinarios que operan
en-el-proceso, el compilador JIT de Ruby escribe código C en disco y lanza
un compilador de C común para generar código nativo.  Para ver más detalles
sobre este, ver la [Organización del MJIT por Vladimir Makarov](https://bugs.ruby-lang.org/projects/ruby/wiki/MJIT#MJIT-organization).

Para habilitar el compilador JIT, especifique `--jit` en la línea de
comandos o en la variable de entorno `$RUBYOPT`.
Al especificar `--jit-verbose=1` el compilador JIT presentará información
adicional.  Vea más opciones examinando el resultado de `ruby --help` o en
[la documentación](https://bugs.ruby-lang.org/projects/ruby/wiki/MJIT#Basic-usage).

El compilador JIT es soportado cuando Ruby se construye con GCC, Clang o
Microsoft VC++, que debe estar disponible en tiempo de ejecución.

Con Ruby 2.6.0, hemos alcanzado una mejora en velocidad de [1.7 veces](https://gist.github.com/k0kubun/d7f54d96f8e501bbbc78b927640f4208)
respecto a Ruby 2.5 con una carga de trabajo no trivial e
intensiva en el uso de la CPU denominada [Optcarrot](https://github.com/mame/optcarrot).
Sin embargo aún es experimental y muchas otras cargas de trabajo intensivas en
el uso de la memoria como Rails, puede que en el momento no se benefician de
este.  Puede ver más detalles  en [Ruby 2.6 JIT - Progress and Future](https://medium.com/@k0kubun/ruby-2-6-jit-progress-and-future-84e0a830ecbf).

Este pendiente de la nueva era en el desempeño de Ruby.

## RubyVM::AbstractSyntaxTree [Experimental]

Ruby 2.6 introduce el módulo `RubyVM::AbstractSyntaxTree`.  **No se
garantiza compatibilidad futura de este módulo**.

Este módulo tiene un método `parse` que puede reconocer código ruby en una
cadena y retornar nodos del AST (Abstract Syntax Tree - Árbol de sintaxis
abstracta), y el método `parse_file` que reconoce código ruby en un archivo
y retorna los nodos del AST.

También se introduce la clase `RubyVM::AbstractSyntaxTree::Node`. Puede
obtener información de la localización y de los nodos hijos de objetos `Node`.
Esta característica es experimental.


## Otras características notables

* Se agregó un alias de `Kernel#yield_self` llamado `#then`. [[Característica #14594]](https://bugs.ruby-lang.org/issues/14594)

* Los nombres de constantes pueden comenzar con una letra mayúscula fuera de la tabla ASCII.  [[Característica #13770]](https://bugs.ruby-lang.org/issues/13770)

* Introduce rangos no acotados [[Característica #12912]](https://bugs.ruby-lang.org/issues/12912)

  Un rango no acotado `(1..)`, funciona como si no terminara.  A continuación se presentan casos de uso:

      ary[1..]                          # igual a ary[1..-1] sin el mágico -1
      (1..).each {|index| ... }         # enumera valores comenzando en el índice 1
      ary.zip(1..) {|elem, index| ... } # ary.each.with_index(1) { ... }

* Añadidos `Enumerable#chain` y `Enumerator#+` [[Característica #15144]](https://bugs.ruby-lang.org/issues/15144)

* Añadidos operadores de composición `<<` y `>>` a `Proc` y a `Method`. [[Característica #6284]](https://bugs.ruby-lang.org/issues/6284)

      f = proc{|x| x + 2}
      g = proc{|x| x * 3}
      (f << g).call(3) # -> 11; identical to f(g(3))
      (f >> g).call(3) # -> 15; identical to g(f(3))

* Añadido `Binding#source_location`.  [[Característica #14230]](https://bugs.ruby-lang.org/issues/14230)

  Este método retorna la localización en la fuente de una unión,  un arreglo
  de 2 elementos `__FILE__` y `__LINE__`.  Técnicamente hablando, es identico
  a `eval("[__FILE__, __LINE__]", binding)`. Sin embargo planeamos cambiar
  este comportamiento para que `Kernel#eval` ignore la localización de
  uniones en las fuentes [[Falla #4352]](https://bugs.ruby-lang.org/issues/4352).
  Así que se recomienda usar `Binding#source_location` en lugar
  de `Kernel#eval`.

* Añadida la opción `exception:` a `Kernel.#system` que lo hace lanzar una
  excepción en caso de falla en lugar de retornar `false`.  [[Característica #14386]](https://bugs.ruby-lang.org/issues/14386)

* Agregado el modo oneshot a `Coverage` [[Característica #15022]](https://bugs.ruby-lang.org/issues/15022)

  * Este modo revisa "si cada línea fue ejecutada al menos una vez o no", en
    lugar de "cuantas veces fue ejecutada cada línea".  Un gancho para cada
    línea es disparado al menos una vez, y después de que es disparado se
    elimina la bandera del gancho, i.e., corre sin gastos adicionales.
  * Agregada el argumento de palabra clave `:oneshot_lines` a `Coverage.start`.
  * Agregados los argumentos de palabra clave `:stop` y `:clear` a
    `Coverage.result`. Si `clear` es verdadero, deja el contador en cero.
    Si `stop` es verdadero, deshabilita las mediciones de cobertura.
  * `Coverage.line_stub` es una función auxiliar que crea la "colilla"
    para cobertura de líneas de una código fuente dado.

* Añadido `FileUtils#cp_lr`. Funciona tal como `cp_r` pero enlaza en lugar
  de copiar.  [[Característica #4189]](https://bugs.ruby-lang.org/issues/4189)


## Mejoras en desempeño

* Mejorada la velocidad de `Proc#call` al eliminar la localización temporal
  para `$SAFE`.  [[Característica #14318]](https://bugs.ruby-lang.org/issues/14318)

  Hemos observado una mejora en desempeño de 1.4 veces en la prueba de
  referencia `lc_fizzbuzz` que usa `Proc#call` repetidas veces [[Falla #10212]](https://bugs.ruby-lang.org/issues/10212).

* Mejorada velocidad de `block.call` cuando `block` es pasado como
  un parámetro de bloque. [[Característica #14330]](https://bugs.ruby-lang.org/issues/14330)

  Cobinado con mejoras en el manejo de bloques introducidas en Ruby 2.5,
  la evaluación e bloques ahora se realiza 2.6 veces más rápido en
  micro-pruebas de referencia en Ruby 2.6. [[Característica #14045]](https://bugs.ruby-lang.org/issues/14045)

* Se introduce la estructura de datos `theap` - Montón transitorio (Transient Heap). [[Falla #14858]](https://bugs.ruby-lang.org/issues/14858) [[Característica #14989]](https://bugs.ruby-lang.org/issues/14858)
  Un `theap` es un montón usado para objetos en memoria de corta duración
  que son apuntados por clases específicas (`Array`, `Hash`, `Object`, y
  `Struct`).
  Hacer objetos Hash pequeños y de corta duración es 2 veces
  más rápido.  Con la prueba de referencia `rdoc`, observamos una mejora en
  desempeño de entre 6 y 7%.

* Implementación nativa (`arm32`, `arm64`, `ppc64le`, `win32`, `win64`,
  `x86`, `amd64`) de corrutinas para mejorar significativamente el
  desempeño de cambios de contexto de Fiber. [[Caracter#14739]](https://bugs.ruby-lang.org/issues/14739)

  `Fiber.yield` y `Fiber#resume` son cerca de 5 veces más rápidos en Linux de
  64-bits.  Los programas que usen Fiber de manera intensiva pueden esperar
  una mejora general del 5%.

## Otros cambios notables desde 2.5

* `$SAFE` ahora es el estado global del proceso y puede ponerse en `0`.  [[Característica #14250]](https://bugs.ruby-lang.org/issues/14250)

* Es obsoleto pasar `safe_level` a `ERB.new`. Se han cambiado los argumentos
  `trim_mode` y `eoutvar` a argumentos de palabra clave (keyword arguments). [[Característica #14256]](https://bugs.ruby-lang.org/issues/14256)

* La versión de Unicode soportada se ha actualizado a la 11.  Se planea
  actualizar a las versiones 12 y 12.1 en las futuras publicacioens menores
  (TEENY) de Ruby 2.6. Esto incluirá soporte para la [nueva era japonesa](http://blog.unicode.org/2018/09/new-japanese-era.html).

* Mezclado RubyGems 3.0.1. Se eliminaron las opciones `--ri` y `--rdoc`.
  Por favor use las opciones `--document` y `--no-document` en lugar de esas.

* [Bundler](https://github.com/bundler/bundler) es ahora instalado como una
  gema por omisión.

* En bloques para manejar excepciones, `else` sin `rescue` ahora produce un
  error de sintaxis. [EXPERIMENTAL][[Característica #14606]](https://bugs.ruby-lang.org/issues/14606)

Vea más detalles en [NOTICIAS](https://github.com/ruby/ruby/blob/v2_6_0/NEWS)
o en [la bitácora de contribuciones](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0).

¡Con esos cambios,
[cambiaron 6437 archivos, 231471 inserciones(+), 98498 eliminaciones (-)](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0)
desde Ruby 2.5.0!

Feliz Navidad, Felices Fiestas y disfrute programar con Ruby 2.6.0!

## Descargas

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0.tar.gz>

      SIZE:   16687800 bytes
      SHA1:   c95f4e86e21390270dad3ebb94491fd42ee2ce69
      SHA256: f3c35b924a11c88ff111f0956ded3cdc12c90c04b72b266ac61076d3697fc072
      SHA512: 01f886b0c0782a06315c4a46414e9f2b66ee634ba4349c8e0697f511793ae3c56d2ad3cad6563f2b0fdcedf0ff3eba51b9afab907e7e1ac243475772f8688382

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0.zip>

      SIZE:   20582054 bytes
      SHA1:   a804e63d18da12107e1d101918a3d8f4c5462a27
      SHA256: 8a4fb6ca58202495c9682cb88effd804398bd0ef023e3e36f001ca88d8b5855a
      SHA512: 16d66ec4a2c6a2e928d5b50e094a5efa481ac6e4d5ed77459d351ef19fe692aa59b68307e3e25229eec5f30ae2f9adae2663bafe9c9d44bfb45d3833d77839d4

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0.tar.bz2>

      SIZE:   14585856 bytes
      SHA1:   b8638eb806efbf7b6af87b24ccc6ad915f262318
      SHA256: c89ca663ad9a6238f4b1ec4d04c7dff630560c6e6eca6d30857c4d394f01a599
      SHA512: ca3daf9acf11d3db2900af21b66231bd1f025427a9d2212b35f6137ca03f77f57171ddfdb99022c8c8bcd730ff92a7a4af54e8a2a770a67d8e16c5807aa391f1

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0.tar.xz>

      SIZE:   11918536 bytes
      SHA1:   9ddaeba3505d2855460c8c653159fc0ac8928c0f
      SHA256: acb00f04374899ba8ee74bbbcb9b35c5c6b1fd229f1876554ee76f0f1710ff5f
      SHA512: c56eaf85ef7b79deb34ee4590b143c07f4fc83eb79775290761aee5a7c63374659613538a41f25706ed6e19e49d5c67a1014c24d17f29948294c7abd0b0fcea8
