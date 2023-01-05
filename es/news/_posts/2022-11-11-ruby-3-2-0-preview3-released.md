---
layout: news_post
title: "Publicado Ruby 3.2.0 Preview 3"
author: "naruse"
translator: vtamara
date: 2022-11-11 00:00:00 +0000
lang: es
---

{% assign release = site.data.releases | where: "version", "3.2.0-preview3" | first %}

Nos complace anunciar la publicación de Ruby {{ release.version }}.
Ruby 3.2 añade muchas características y mejoras en desempeño.


## Soporte para WebAssembly basado en WASI

Este es un porte inicial del soporte para WebAssembly basado en WASI.
Esto permite que un binario de CRuby esté disponible en navegadores Web,
ambientes sin servidor Edge y otros empotrables WebAssembly/WASI.
Actualmente este porte pasa los juegos de pruebas básicas de bootstrap
que no usan la API de Threads.

![](https://i.imgur.com/opCgKy2.png)

### Trasfondo

[WebAssembly (Wasm)](https://webassembly.org/) inicialmente se introdujo
para ejecutar programas de manera segura y rápida en navegadores web.
Pero buena parte de su objetivo --ejecutar programar eficientemente y con
seguridad-- es anhelado hace tiempo no sólo para el web sino para aplicaciones
en general.

[WASI (The WebAssembly System Interface)](https://wasi.dev/) fue diseñado
para ese caso de uso.  Dado que una aplicación necesita comunicarse con
el sistema operativo pero WebAssembly corre en una máquina virtual sin
interfaz al sistema operativo, WASI estandariza dicha interfaz.

El soporte para WebAssembly/WASI en ruby pretende aprovechar estos
proyectos.  Habilita a los desarrolladores de ruby para escribir aplicaciones
que corran en esa plataforma prometida.

### Caso de uso

Este soporte hace posible que los desarrolladores utilicen
CRuby en un ambiente WebAssembly.  Un caso de uso de ejemplo es
el soporte CRuby del
[espacio de entrenamiento TryRuby](https://try.ruby-lang.org/playground/).
Ahora usted puede probar CRuby original en su navegador web.

### Puntos técnicos

Hoy en día WASI y WebAssembly carecen de algunas características para
implementar Fibras, excepciones y el Recolector de Basura porque aún está
evolucionado y también por razones de seguridad.
Así que CRuby llena ese vació mediante Asyncify, que es una técnica de
transformación binaria para controlar la ejecución en el espacio
del usuario.

Además, construimos un [Sistema Virtual de Archivos (VFS) sobre WASI](https://github.com/kateinoigakukun/wasi-vfs/wiki/Getting-Started-with-CRuby)
que permite empaquetar con facilidad aplicación Ruby en un sólo archivo
.wasm. Esto hace un poco más fácil la distribución de aplicaciones.


### Enlaces relacionados

* [Add WASI based WebAssembly support #5407](https://github.com/ruby/ruby/pull/5407)
* [An Update on WebAssembly/WASI Support in Ruby](https://itnext.io/final-report-webassembly-wasi-support-in-ruby-4aface7d90c9)


## Mejora en Regexp contra Denegación de Servicio por Expresión Regular (ReDoS)

Es conocido que la correspondencia de expresiones regulares puede tomar
un tiempo inesperadamente largo. Si su código intenta hacer corresponder una
expresión regular ineficiente con un entrada no confiable, un atacante
puede explotarlo y producir efectivamente una Denegación de Servicio (también
llamada Denegación de Servicio por Expersión Regular o ReDoS).

Hemos introducido dos mejoras que mitigan significativamente un ReDoS.

### Algoritmo de correspondecia mejorado

Desde Ruby 3.2, el algoritmo de correspondencia de expresiones regulares ha
sido ejorado significativamente empleando técnicas de memorización.

```
# Esta corresponencia tarda 10 seg. en Ruby 3.1, y 0.003 seg. en Ruby 3.2

/^a*b?a*$/ =~ "a" * 50000 + "x"
```

El algoritmo de correspondencia mejorado permite que la mayoría de
correspondencia de expresiones regulares (cerca del 90% en nuestros
experimentos) se complete en tiempo lineal.

(Para usuarios de la versión preview: esta optimización puede consumir memoria
proporcional a la longitud de la entrada por cada correspondencia. Esperamos
que no se presenten problemas prácticos porque la localización de memoria
para esto usualmente se hace de manera tardía, y una correspondencia de Regexp
normal debería consumir a lo sumo 10 veces la memoria de la entrada. Si
se le agota la memoria al hacer correspondencia de expresiones regulares
en aplicaciones del mundo real, por favor repórtelo.)

La propuesta original es <https://bugs.ruby-lang.org/issues/19104>

### Temporizador de Regexp

La optimización anterior no puede aplicarse a algunos tipos de expresiones
regulares, como las que incluyen características avanzadas (e.g.,
referencias-anteriores --back-references-- y mirar-alrededor --look-arond--),
o con un número inmenso y fijo de repeticiones.  Como medida alternativa,
también se introduce un temporizador para expresiones regulares.

```ruby
Regexp.timeout = 1.0

/^a*b?a*()\1$/ =~ "a" * 50000 + "x"
#=> Regexp::TimeoutError is raised in one second
```

Tenga en cuenta que `Regexp.timeout` es una configuración global. Si quiere
emplear configuraciones del temporizadores diferentes para algunas
expresiones regulares especiales, puede usar la palabra clave `timeout`
de `Regexp.new`.

```ruby
Regexp.timeout = 1.0

# Esta regexp no tiene tiempo límite
long_time_re = Regexp.new('^a*b?a*()\1$', timeout: Float::INFINITY)

long_time_re =~ "a" * 50000 + "x" # nunca se interrumpe
```

La propuesta original es <https://bugs.ruby-lang.org/issues/17837>

## Otras características nuevas y notables

### Ya no se incluyen fuentes de terceros

* Ya no incluimos código fuente de terceros como `libyaml` y `libffi`.

    * la fuente de `libyaml` fue eliminada de `psych`. Puede instalar
      `libyaml-dev` en plataformas Ubuntu/Debian. El nombre del
      paquete difiere en cada plataforma.

    * el código fuente incluido de `libffi` también fue eliminado de `fiddle`


### Lenguaje

* Los argumentos anónimos para el resto y con palabra clave para el resto ahora
  pueden ser pasados como argumentos, en lugar de sólo ser usados en
  parámetros de métodos.
  [[Característica #18351]]

    ```ruby
    def foo(*)
      bar(*)
    end
    def baz(**)
      quux(**)
    end
    ```

* Un proc que acepte un solo argumento posicional y palabras clave
  ya no hará splat automaticamente. [[Falla #18633]]

  ```ruby
  proc{|a, **k| a}.call([1, 2])
  # Ruby 3.1 and before
  # => 1
  # Ruby 3.2 and after
  # => [1, 2]
  ```

* El orden de evaluación de la asignación de constantes para constantes
  establecidas en objetos explícitos se ha hecho consistente con el
  orden de evaluación de la asignación de atributos. Por ejemplo con
  este código:

    ```ruby
    foo::BAR = baz
    ```

  `foo` ahora es llamado antes que `baz`. De forma similar, para
  asignaciones múltiples a constantes, se usa un orden de evaluación
  de izquierda a derecha. Por ejemplo con el siguiente código:

    ```ruby
      foo1::BAR1, foo2::BAR2 = baz1, baz2
    ```

  Ahora se usa el siguiente orden de evaluación:

  1. `foo1`
  2. `foo2`
  3. `baz1`
  4. `baz2`

  [[Falla #15928]]

* El patrón Find ya no es experimental.
  [[Característica #18585]]

* Los métodos que reciben un parámetro para el resto (como `*args`)
  y que quieren delegar argumentos de palabra clave como
  `foo(*args)` ahora deben marcarse con `ruby2_keywords`
  (si es que aún hace falta). En otras palabras, todos los métodos
  que quieren delegar argumentos de palabra clave por medio de
  `*args` ahora deben marcarse con `ruby2_keywords`,
  sin excepción.  Esto hará más fácil la transición a otras formas
  de delegación una vez una librería pueda requerir
  Ruby 3+. Antes, la opción `ruby2_keywords`
  se mantenía si el método receptor tomaba `*args`, pero esto
  era una falla y una inconsistencia.  Una buena técnica para encontrar
  posibles `ruby2_keywords` faltantes es ejecutar la suite de pruebas,
  y donde falle buscar el último método que debe recibir
  argumentos de palabra clave , usar `puts nil, caller, nil` allí,
  y revisar que cada método/bloque en la cadena de llamados que delegue
  palabras clave esté marcado correctamente como `ruby2_keywords`.
  [[Falla #18625]] [[Falla #16466]]

    ```ruby
    def target(**kw)
    end

    # Accidentalmente funcionaba sin ruby2_keywords en Ruby 2.7-3.1,
    # necesita ruby2_keywords en 3.2+.
    # Así como (*args, **kwargs) o (...) se necesitarían tanto en #foo
    # como  #bar cuando deje de usar ruby2_keywords.
    ruby2_keywords def bar(*args)
      target(*args)
    end

    ruby2_keywords def foo(*args)
      bar(*args)
    end

    foo(k: 1)
    ```


## Mejoras en desempeño

### YJIT

* Soporte para arm64 / aarch64 sobre plataformas UNIX.
* La compilación de YJIT requiere Rust 1.58.1+. [[Característica #18481]]

## Otros cambios notables desde 3.1

* Hash
    * Hash#shift ahora siempre retorna nil si el hash está vacío,
      en lugar de retornar el valor predeterminado o llamar el
      proc predeterminado. [[Falla #16908]]

* MatchData
    * Se ha añadido `MatchData#byteoffset`. [[Característica #13110]]

* Módulos
    * Se ha añadido `Module.used_refinements`. [[Característica #14332]]
    * Se ha añadido `Module#refinements`. [[Característica #12737]]
    * Se ha añadido `Module#const_added`. [[Característica #17881]]

* Proc
    * `Proc#dup` retorna una instancia de subclase. [[Falla #17545]]
    * `Proc#parameters` ahora acepta la palabra clave lambda. [[Característica #15357]]

* Refinamiento
    * Se ha añadido `Refinement#refined_class`. [[Característica #12737]]

* RubyVM::AbstractSyntaxTree
    * Se agrega la opción `error_tolerant` a `parse`, `parse_file` y `of`.
      [[Característica #19013]]


* Conjuntos
    * `Set` ahora está disponible como una clase incorporada que no exige
      `require "set"`. [[Característica #16989]]
      Ahora se llama de manera automática al usar la constante `Set` o con una
      llamada a `Enumerable#to_set`.

* Cadenas
    * Se han añadido `String#byteindex` y `String#byterindex`.
      [[Característica #13110]]
    * Se actualizó Unicode a la versión 14.0.0 y Emoji a la version 14.0.
      [[Característica #18037]]
      (también aplica para Regexp)
    * Se ha añadido `String#bytesplice`.  [[Característica #18598]]

* `Struct`
    * Una clase `Struct` también puede inicializarse con argumentos de
      palabra clave sin `keyword_init: true` en `Struct.new`
      [[Característica #16806]]

## Asuntos de compatibilidad

Nota: Excluyendo arreglos de fallas.

### Constantes eliminadas

Las siguientes constantes despreciadas han sido eliminados.

* `Fixnum` y `Bignum` [[Característica #12005]]
* `Random::DEFAULT` [[Característica #17351]]
* `Struct::Group`
* `Struct::Passwd`

### Métodos eliminados

Los siguientes métodos despreciados han sido eliminados.

* `Dir.exists?` [[Característica #17391]]
* `File.exists?` [[Característica #17391]]
* `Kernel#=~` [[Característica #15231]]
* `Kernel#taint`, `Kernel#untaint`, `Kernel#tainted?`
  [[Característica #16131]]
* `Kernel#trust`, `Kernel#untrust`, `Kernel#untrusted?`
  [[Característica #16131]]

## Asuntos de compatibilidad en Stdlib

* `Psych` ya no incluye las fuentes de libyaml.
  Los usuarios necesitan instalar la librería libyaml por su cuenta
  con el sistema de paquetes. [[Característica #18571]]

## Actualización al API en C

### Funciones actualizadas del API en C

Se actualizaron las siguientes funciones del API.

* Generador de números seudo aleatorios (PRNG)
  `rb_random_interface_t` actualizado y con versiones.
  Las librerías de extensión que usan esta interfaz y construidas
  para versiones antiguas.
  También la función `init_int32` debe ser definida.

### Funciones eliminadas del API en C

Los siguientes elementos del APIs han sido eliminados.

* variable `rb_cData` .
* funciones "taintedness" y "trustedness". [[Característica #16131]]


### Actualizaciones a la librería estándar

* SyntaxSuggest
  * La característica de `syntax_suggest` antes llamada `dead_end` se ha
    integrado en Ruby [[Característica #18159]]

* ErrorHighlight
  * Ahora puede resaltar errores en argumentos de TypeError y ArgumentError

```
test.rb:2:in `+': nil can't be coerced into Integer (TypeError)

sum = ary[0] + ary[1]
               ^^^^^^
```
*   Las siguientes gemas predeterminadas han sido actualizadas
    * RubyGems 3.4.0.dev
    * bigdecimal 3.1.2
    * bundler 2.4.0.dev
    * cgi 0.3.2
    * date 3.2.3
    * error_highlight 0.4.0
    * etc 1.4.0
    * io-console 0.5.11
    * io-nonblock 0.1.1
    * io-wait 0.3.0.pre
    * ipaddr 1.2.4
    * json 2.6.2
    * logger 1.5.1
    * net-http 0.2.2
    * net-protocol 0.1.3
    * ostruct 0.5.5
    * psych 5.0.0.dev
    * reline 0.3.1
    * securerandom 0.2.0
    * set 1.0.3
    * stringio 3.0.3
    * syntax_suggest 0.0.1
    * timeout 0.3.0
*   Las siguientes gemas incluidas han sido actualizadas
    * minitest 5.16.3
    * net-imap 0.2.3
    * rbs 2.6.0
    * typeprof 0.21.3
    * debug 1.6.2
*   Las siguientes gemas predeterminadas ahora son gemas incluidas


Ver más detalles en [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
o en [la bitácora de cambios](https://github.com/ruby/ruby/compare/v3_1_0...{{ release.tag }}).

Con estos cambios, [{{ release.stats.files_changed }} archivos cambiados, {{ release.stats.insertions }} inserciones(+), {{ release.stats.deletions }} eliminaciones(-)](https://github.com/ruby/ruby/compare/v3_1_0...{{ release.tag }}#file_bucket)
desde Ruby 3.1.0!

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

Ruby fue desarrollado inicialmente por Matz (Yukihiro Matsumoto) en 1993,
y ahora es desarrollado como Código Abierto. Corre en múltiples plataformas
y se usa en todo el mundo especialmente para desarrollo web.

[Característica #12005]: https://bugs.ruby-lang.org/issues/12005
[Característica #12655]: https://bugs.ruby-lang.org/issues/12655
[Característica #12737]: https://bugs.ruby-lang.org/issues/12737
[Característica #13110]: https://bugs.ruby-lang.org/issues/13110
[Característica #14332]: https://bugs.ruby-lang.org/issues/14332
[Característica #15231]: https://bugs.ruby-lang.org/issues/15231
[Característica #15357]: https://bugs.ruby-lang.org/issues/15357
[Falla #15928]:     https://bugs.ruby-lang.org/issues/15928
[Característica #16131]: https://bugs.ruby-lang.org/issues/16131
[Falla #16466]:     https://bugs.ruby-lang.org/issues/16466
[Característica #16806]: https://bugs.ruby-lang.org/issues/16806
[Falla #16889]:     https://bugs.ruby-lang.org/issues/16889
[Falla #16908]:     https://bugs.ruby-lang.org/issues/16908
[Característica #16989]: https://bugs.ruby-lang.org/issues/16989
[Característica #17351]: https://bugs.ruby-lang.org/issues/17351
[Característica #17391]: https://bugs.ruby-lang.org/issues/17391
[Falla #17545]:     https://bugs.ruby-lang.org/issues/17545
[Característica #17881]: https://bugs.ruby-lang.org/issues/17881
[Característica #18037]: https://bugs.ruby-lang.org/issues/18037
[Característica #18159]: https://bugs.ruby-lang.org/issues/18159
[Característica #18351]: https://bugs.ruby-lang.org/issues/18351
[Falla #18487]:     https://bugs.ruby-lang.org/issues/18487
[Característica #18571]: https://bugs.ruby-lang.org/issues/18571
[Característica #18585]: https://bugs.ruby-lang.org/issues/18585
[Característica #18598]: https://bugs.ruby-lang.org/issues/18598
[Falla #18625]:     https://bugs.ruby-lang.org/issues/18625
[Falla #18633]:     https://bugs.ruby-lang.org/issues/18633
[Característica #18685]: https://bugs.ruby-lang.org/issues/18685
[Falla #18782]:     https://bugs.ruby-lang.org/issues/18782
[Característica #18788]: https://bugs.ruby-lang.org/issues/18788
[Característica #18809]: https://bugs.ruby-lang.org/issues/18809
[Característica #18481]: https://bugs.ruby-lang.org/issues/18481
[Falla #19100]:     https://bugs.ruby-lang.org/issues/19100
[Caracteristica #19013]: https://bugs.ruby-lang.org/issues/19013
