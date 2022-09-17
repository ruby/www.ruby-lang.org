---
layout: news_post
title: "Publicado Ruby 3.2.0 Preview 2"
author: "naruse"
translator: vtamara
date: 2022-09-09 00:00:00 +0000
lang: es
---

{% assign release = site.data.releases | where: "version", "3.2.0-preview2" | first %}

Nos complace anunciar la publicación de Ruby {{ release.version }}.
Ruby 3.2 añade muchas características y mejoras en desempeño.


## Soporte para WebAssembly basado en WASI

Esta es un porte inicial del soporte para WebAssembly basado en WASI.
Esto permite que un binario de CRuby esté disponible en navegadores Web,
ambientes sin servidor Edge y otros empotrables WebAssembly/WASI.
Actualmente este porte pasa los juegos de pruebas básicas de bootstrap
que no usan el API de Threads.

![](https://i.imgur.com/opCgKy2.png)

### Trasfondo

[WebAssembly (Wasm)](https://webassembly.org/) fue introducido inicialmente
para ejecutar programas de manera segura y rápida en navegadores web.
Pero buena parte de su objetivo --ejecutar programar eficientemente y con
seguridad-- es anhelado hace tiempo no sólo para el web sino para aplicaciones
en general.

[WASI (The WebAssembly System Interface)](https://wasi.dev/) fue diseñado
para ese caso de uso.  Aunque una aplicación necesita comunicarse con
el sistema operativo, WebAssembly corre en una máquina virtual que no tiene
una interfaz del sistema.  WASI lo estandariza.

El soporte para WebAssembly/WASI en ruby pretende aprovechar estos
proyectos.  Habilita a los desarrolladores de ruby para escribir aplicaciones
que corran en esa plataforma prometida.

### Caso de uso

Este soporte hace posible que los desarrolladores utilicen
CRuby en un ambiente WebAssembly.  Un caso de uso de ejemplo es
el soporte CRuby del
[espacio de juego TryRuby](https://try.ruby-lang.org/playground/).
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


## Temporizadore para Regexp

Se introduce una característica de temporizador durante concordancias de
expresiones regulares.

```ruby
Regexp.timeout = 1.0

/^a*b?a*$/ =~ "a" * 50000 + "x"
#=> Regexp::TimeoutError is raised in one second
```

Se sabe que la concordancia de expresiones regulares puede tardar un tiempo
inesperadamente largo.  Si su código intenta concordar una expresión regular
posiblemente ineficiente con una cadena no confiable, un atacante podría
explotarlo para lograr una Denegación de Servicio efectiva (también llamada
Denegación de servicio por expresiones regulares o ReDoS).

El riesgo de Denegaciones de Servicio (DoS) puede prevenirse o mitigarse
significativamente al configurar `Regexp.timeout` de acuerdo a los
requerimientos de su aplicación Ruby.  Por favor pruébelo en su aplicación,
después le damos la bienvenida a su retroalimentación.

Observe que `Regexp.timeout` es una configuración global. Si quiere usar una
configuración del temporizador diferente para una cierta
expresión regular, puede usar la palabra reservada `timeout`
junto con `Regexp.new`.

```ruby
Regexp.timeout = 1.0

# Esta regexp no tiene tiempo límite
long_time_re = Regexp.new("^a*b?a*$", timeout: nil)

long_time_re =~ "a" * 50000 + "x" # nunca interrumpido
```

La propuesta original está en <https://bugs.ruby-lang.org/issues/17837>

## Otras características nuevas y notables

### Ya no se incluyen fuentes de terceros

* Ya no incluimos las fuentes de terceros como `libyaml` y `libffi`.

    * la fuente de `libyaml` fue eliminada de `psych`. Puede instalar
      `libyaml-dev` en plataformas Ubuntu/Debian. El nombre del
      paquete difiere en cada plataforma.

    * `libffi` será eliminado de `fiddle` durante la segunda versión previa.

### Lenguaje

* Argumentos anónimos para el resto y con palabra clave para el resto ahora
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
  orden de evaluación de la asignación de atributos. Con este código:

    ```ruby
    foo::BAR = baz
    ```

  `foo` ahora es llamado antes que `baz`. De forma similar, para
  asignaciones múltiples a constantes, se usa un orden de evalulacón
  de izquierda a derecha. Con el siguiente código:

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

* Los métodos que reciben un parametro para el resto (como `*args`)
  y que quieren delegar argumentos de palabra clave con
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
  y donde falle buscar el último método que debe recibiri
  argumentos de palabra clave , usar `puts nil caller, nil` allí,
  y revisar que cada método/bloque en la cadena de llamados que delegue
  palabras clave esté marcado correctamente como `ruby2_keywords`.
  [[Falla #18625]] [[Falla #16466]]

    ```ruby
    def target(**kw)
    end

    # Accidentalmente funcionaba sin ruby2_keywords en Ruby 2.7-3.1,
    # necesita ruby2_keywords en 3.2+.
    # Tal como (*args, **kwargs) o (...) se necesitarían tanto en #foo
    # como  #bar cuando se migró de ruby2_keywords.
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

* Modulos
    * Se ha añadido `Module.used_refinements`. [[Característica #14332]]
    * Se ha añadido `Module#refinements`. [[Característica #12737]]
    * Se ha añadido `Module#const_added`. [[Característica #17881]]

* Proc
    * `Proc#dup` retorna una instancia de subclase. [[Falla #17545]]
    * `Proc#parameters` ahora acepta la palabra reservada lambda. [[Característica #15357]]

* Refinamiento
    * Se ha añadido `Refinement#refined_class`. [[Característica #12737]]

* Conjuntos
    * `Set` ahora está disponible como una clase incorporada que no necesita
      `require "set"`. [[Característica #16989]]
      Ahora se llama de manera automática al usar la constante `Set` o con una
      llamada a `Enumerable#to_set`.

* Cadenas
    * Se han añadido `String#byteindex` y `String#byterindex`. [[Característica #13110]]
    * Se actualizó Unicode a la versión 14.0.0 y Emoji a la version 14.0. [[Característica #18037]]
      (también aplica para Regexp)
    * Se ha añadido `String#bytesplice`.  [[Característica #18598]]

* `Struct`
    * Una clase `Struct` también puede inicializarse con argumentos de
      palabra reservada sin `keyword_init: true` en `Struct.new` [[Característica #16806]]

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
  Los usuarios necesitan instalar la librería libyaml por si mismos
  con el sistema de paquetes. [[Característica #18571]]

## Actualización al API en C

### Eliminado del API en C

Las siguientes APIs han sido eliminadas.

* variable `rb_cData` .
* funciones "taintedness" y "trustedness". [[Característica #16131]]


### Actualizaciones a la librería estándar

*   Se actualizaron las siguientes gemas predeterminadas.

    * TBD

*   Se actualizaron las siguientes gemas incluidas.

    * TBD

*   Las siguientes gemas predeterminadas ahora son gemas incluidas (bundled).
    Debe agregar las siguientes librerías al `Gemfile` en entornos que usan
    `bundler`.

    * TBD

Ver más detalles en [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
o en [la bitácora de cambios](https://github.com/ruby/ruby/compare/v3_1_0...{{ release.tag }}).

Con esos cambios, [{{ release.stats.files_changed }} archivos cambiados, {{ release.stats.insertions }} inserciones(+), {{ release.stats.deletions }} eliminaciones(-)](https://github.com/ruby/ruby/compare/v3_1_0...{{ release.tag }}#file_bucket)
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
