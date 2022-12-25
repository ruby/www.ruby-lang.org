---
layout: news_post
title: "Publicado Ruby 3.2.0"
author: "naruse"
translator: vtamara
date: 2022-12-25 00:00:00 +0000
lang: es
---

{% assign release = site.data.releases | where: "version", "3.2.0" | first %}

Nos complace anunciar la publicación de Ruby {{ release.version }}.
Ruby 3.2 añade muchas características y mejoras en desempeño.


## Soporte para WebAssembly basado en WASI

Este es un porte inicial del soporte para WebAssembly basado en WASI.
Esto permite que un binario de CRuby esté disponible en un navegador Web,
en un ambiente sin servidor Edge y en otros tipos de empotrados
de WebAssembly/WASI.
Actualmente este porte pasa los juegos de pruebas básicas y de bootstrap
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
que corran en esas plataformas prometidas.

### Caso de uso

Este soporte promueve que los desarrolladores utilicen
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

## YJIT listo para producción

![](https://i.imgur.com/X9ulfac.png)

* YJIT ya no es experimental
  * Se ha probado con cargas de producción por más de un año y a demostrado ser
    estable.
* YJIT ahora soporta tanto CPUs x86-64 como arm64/aarch64 en Linux, MacOS,
  BSD and otras plataformas UNIX.
  * Esta versión trae soporte para procesadores Mac M1/M2, AWS Graviton,
    Raspberry Pi 4 y más.
* La compilación de YJIT ahora requiere Rust 1.58.0+. [[Característica #18481]]
  * Para asegurar que CRuby se compila con YJIT, por favor instale
    rustc >= 1.58.0 antes de ejecutar el script `./configure`
  * Por favor comuníquese con el equipo de YJIT en caso de que tenga
    algún inconveniente.
* La versión 3.2 es más veloz que la 3.1, y tiene alrededor de 1/3 de
  sobrecarga de memoria.
  * En generla YJIT es 41% más rápido (media geométrica) que el interpret
    de Ruby en  [yjit-bench](https://github.com/Shopify/yjit-bench).
  * La memoria física para el código JIT se localiza tardiamente. A diferencia
    de Ruby 3.1, el RSS de un proceso Ruby se minimiza porque las páginas
    de memoria virtual localizadas con `--yjit-exec-mem-size` no se
    mapearán a páginas de memoria física sino hasta que en efecto sean
    utilizadas por el código JIT.
  * Se introduce código al Recolector de Basura que libera todas las páginas
    cuando el consumo de memoria del código JIT alcanza `--yjit-exec-mem-size`.
  * RubyVM::YJIT.runtime_stats retorna métricas del código del Recolector de
    Basura además de las llaves existentes `inline_code_size` y
    `outlined_code_size`:
      `code_gc_count`, `live_page_count`, `freed_page_count`, y
      `freed_code_size`.
* La mayoría de las estadísticas producidas por `RubyVM::YJIT.runtime_stats`
  ahora están disponibles en las versiones publicadas.
    * Sencillamente ejecute ruby con `--yjit-stats` para calcular
      estadísticas stats (esto incurre en alguna sobrecarga en el tiempo
      de ejecución).
* YJIT ahora está optimizado para aprovechar Formas de Objetos (Object Shapes).
  [[Característica #18776]]
* Aprovecha la invalidación de constantes a una escala más fina para
  invalidar menos código cuando se definen nuevas constantes.
  [[Característica #18589]]
* El valor predeterminado de `--yjit-exec-mem-size` se ha cambiado a 64 (MiB).
* El valor predeterminado de `--yjit-call-threshold` se ha cambiado a 30.


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

![](https://cache.ruby-lang.org/pub/media/ruby320_regex_1.png)
![](https://cache.ruby-lang.org/pub/media/ruby320_regex_2.png)

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

### SyntaxSuggest

* La característica de `syntax_suggest` (antes llamada `dead_end`) se ha
  integrado en Ruby. Le ayuda a encontrar la posición de errores tales como
  `end`s falantes o superfluos, para permitirle continuar su camino
  más rápido, como en el siguiente ejemplo:

  ```
  Unmatched `end', missing keyword (`do', `def`, `if`, etc.) ?

    1  class Perro
  > 2    defladra
  > 3    end
    4  end
  ```

    [[Característica #18159]]

### ErrorHighlight

* Ahora puede resaltar errores en los argumentos relevantes para
  errores `TypeError` y `ArgumentError`

```
test.rb:2:in `+': nil can't be coerced into Integer (TypeError)

sum = ary[0] + ary[1]
               ^^^^^^
```

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
  donde puede faltar `ruby2_keywords` es ejecutar la suite de pruebas,
  y donde falle buscar el último método que debe recibir
  argumentos de palabra clave , usar `puts nil, caller, nil` allí.
  Después revisar que cada método/bloque en la cadena de llamados que delegue
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

### MJIT

* El compilador MJIT se ha vuelto a implementar en Ruby como
  `ruby_vm/mjit/compiler`.
* El compilador MJIT se ejecuta en un proceso Ruby bifurcado en lugar de
  hacerlo en un hilo (thread) nativo llamado trabajador MJIT
  [[Característica #18968]]
    * Como resultado de esto, ya no soporta Microsoft Visual Studio (MSWIN).
* MinGW ya no es soportado. [[Característica #18824]]
* Renombrar `--mjit-min-calls` por `--mjit-call-threshold`.
* Se cambió el valor predeterminado para `--mjit-max-cache` de 10000 a 100.

### PubGrub

* Bundler 2.4 ahora usa el resolvedor [PubGrub](https://github.com/jhawthorn/pub_grub) en lugar de [Molinillo](https://github.com/CocoaPods/Molinillo).

  * PubGrub es la siguiente generación de algoritmos de resolución usado
    por el manejador de paquetes `pub` para el lenguaje de programación Dart.
  * Puede obtener resultados de resolución diferentes tras este cambio.
    Por favor reportenos tales casos como [Incidentes de RubyGems/Bundler](https://github.com/rubygems/rubygems/issues)

* RubyGems seguirá usando el resolvedor Molinillo en Ruby 3.2.
  Planeamos remplazarlo por PubGrub en el futuro.


## Otros cambios notables desde 3.1

* Data
    * Nueva clase central para representar un objeto con valor inmutable.
      La clase es similar a Struct y comparte parcialment la implementación,
      pero tiene una API más limpia y estricta [[Característica #16122]]

        ```ruby
        Medicion = Data.define(:cantidad, :undad)
        distancia = Medicion.new(100, 'km')             #=> #<data Medicion cantidad=100, unidad="km">
        peso = Medicion.new(cantidad: 50, unidad: 'kg') #=> #<data Medicion cantidad=50, unidad="kg">
        peso.with(cantidad: 40)                         #=> #<data Medicion cantidad=40, unidad="kg">
        peso.cantidad                                   #=> 50
        peso.cantidad = 40                                #=> NoMethodError: undefined method `cantidad='
        ```

* Hash
    * `Hash#shift` ahora siempre retorna `nil` si el diccionario está vacío,
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
    * `Proc#parameters` ahora acepta la palabra clave `lambda`. [[Característica #15357]]

* Refinamiento
    * Se ha añadido `Refinement#refined_class`. [[Característica #12737]]

* RubyVM::AbstractSyntaxTree
    * Se agrega la opción `error_tolerant` a `parse`, `parse_file` y `of`.
      [[Característica #19013]]
      Con esta opción
        1. Se suprime `SyntaxError`
        2. Se retorna un AST con entradas inválidas
        3. `end` se complementa cuando el reconocedor llega al final de la
           entrada pero `end` es insuficiente.
        4. `end` se trata como una palabra reservada con base en la indentación.

        ```ruby
        # Sin la opción error_tolerant
        raiz = RubyVM::AbstractSyntaxTree.parse(<<~RUBY)
        def m
          a = 10
          if
        end
        RUBY
        # => <internal:ast>:33:in `parse': syntax error, unexpected `end' (SyntaxError)

        # Con la opción error_tolerant
        raiz = RubyVM::AbstractSyntaxTree.parse(<<~RUBY, error_tolerant: true)
        def m
          a = 10
          if
        end
        RUBY
        p root # => #<RubyVM::AbstractSyntaxTree::Node:SCOPE@1:0-4:3>

        # `end` se trata como palabra reservada con base en la indentación
        raiz = RubyVM::AbstractSyntaxTree.parse(<<~RUBY, error_tolerant: true)
        module Z
          class Foo
            foo.
          end

          def bar
          end
        end
        RUBY
        p raiz.children[-1].children[-1].children[-1].children[-2..-1]
        # => [#<RubyVM::AbstractSyntaxTree::Node:CLASS@2:2-4:5>, #<RubyVM::AbstractSyntaxTree::Node:DEFN@6:2-7:5>]
        ```

    * Se agrega la opción `keep_tokens` a `parse`, `parse_file` y `of`. [[Característica #19070]]

        ```ruby
        root = RubyVM::AbstractSyntaxTree.parse("x = 1 + 2", keep_tokens: true)
        root.tokens # => [[0, :tIDENTIFIER, "x", [1, 0, 1, 1]], [1, :tSP, " ", [1, 1, 1, 2]], ...]
        root.tokens.map{_1[2]}.join # => "x = 1 + 2"
        ```



* Conjuntos
    * `Set` ahora está disponible como una clase incorporada que no exige
      `require "set"`. [[Característica #16989]]
      Ahora se llama de manera automática al usar la constante `Set` o con una
      llamada a `Enumerable#to_set`.

* Cadenas
    * Se han añadido `String#byteindex` y `String#byterindex`.
      [[Característica #13110]]
    * Se actualizó Unicode a la versión 15.0.0 y Emoji a la version 15.0.
      [[Característica #18039]]
      (también aplica para Regexp)
    * Se ha añadido `String#bytesplice`.  [[Característica #18598]]

* `Struct`
    * Una clase `Struct` también puede inicializarse con argumentos de
      palabra clave sin `keyword_init: true` en `Struct.new`
      [[Característica #16806]]

        ```ruby
        Publicacion = Struct.new(:id, :nombre)
        Publicacion.new(1, "Hola") #=> #<struct Publicacion id=1, nombre="hola">
        # Desde Ruby 3.2, el siguiente código también opera sin keyword_init: true.
        Publicacion.new(id: 1, nombre: "hola") #=> #<struct Publicacion id=1, nombre="hello">
        ```
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

### Ya no se incluyen fuentes de terceros

* Ya no incluimos código fuente de terceros como `libyaml` y `libffi`.

    * La fuente de `libyaml` fue eliminada de `psych`. Puede tener que
       instalar `libyaml-dev` en plataformas Ubuntu/Debian. El nombre del
      paquete difiere en cada plataforma.

    * El código fuente incluido de `libffi` también fue eliminado de `fiddle`

* `Psych` ya no incluye las fuentes de libyaml.
  Los usuarios necesitan instalar la librería libyaml por su cuenta
  con el sistema de paquetes. [[Característica #18571]]
* Psych y fiddle soportaban compilación estática con versiones específicas
  de las fuentes de libyaml y libffi.  Puede compilar psych con
  libyaml-0.2.5 así:

    ```bash
    $ ./configure --with-libyaml-source-dir=/path/to/libyaml-0.2.5
    ```

    Y puede compilar fifdel con libffi-3.4.4 así:

    ```bash
    $ ./configure --with-libffi-source-dir=/path/to/libffi-3.4.4
    ```

  [[Feature #18571]]

## Actualización al API en C

### Funciones actualizadas del API en C

Se actualizaron las siguientes funciones del API.

* Generador de números seudo aleatorios (PRNG)
  * `rb_random_interface_t` actualizado y con versiones.
    Las librerías de extensión que usan esta interfaz y construidas
    para versiones antiguas.
    También la función `init_int32` debe ser definida.

### Funciones eliminadas del API en C

Los siguientes elementos del APIs han sido eliminados.

* variable `rb_cData` .
* funciones "taintedness" y "trustedness". [[Característica #16131]]


## Actualizaciones a la librería estándar

* Bundler

    * Añadido soporte para --ext=rust para empaquetar gemas simples con
      extensiones Rust. [[GH-rubygems-6149]]
    * La clonación de repositorios git es más rápida [[GH-rubygems-4475]]

* RubyGems

    * Agrega soporte mswin para el constructor cargo. [[GH-rubygems-6167]]

* ERB

    * Se implementa `ERB::Util.html_escape` más rápido que `CGI.escapeHTML`.
        * Ya no localiza un objeto String cuando no se requiere escapar
          caracteres.
        * Evita llamar métodos `#to_s` cuando un argumento ya es String.
        * Se agrega `ERB::Escape.html_escape` como alias de
          `ERB::Util.html_escape`, que no ha tenido un parchado-monkey
          de Rails.

* IRB

    * Se han añadido ordenes de integración con debug.gem: `debug`, `break`,
      `catch`, `next`, `delete`, `step`, `continue`, `finish`, `backtrace`,
      `info`
        * Funcionan incluso si no tiene `gem "debug"` en su Gemfile.
        * Ver también: [What's new in Ruby 3.2's IRB?](https://st0012.dev/whats-new-in-ruby-3-2-irb)
    * Se han añadido más ordenes como de Pry y  características.
        * Se añadieron `edit` y `show_cmds` (como `help` en Pry).
        * `ls` recibe la opción `-g` o `-G` para filtrar la salida.
        * `show_source` es un alias de `$` y acepta entradas sin comillas.
        * `whereami` es un alias de `@`.

*   Las siguientes gemas predeterminadas han sido actualizadas

    * RubyGems 3.4.1
    * abbrev 0.1.1
    * benchmark 0.2.1
    * bigdecimal 3.1.3
    * bundler 2.4.1
    * cgi 0.3.6
    * csv 3.2.6
    * date 3.3.3
    * delegate 0.3.0
    * did_you_mean 1.6.3
    * digest 3.1.1
    * drb 2.1.1
    * english 0.7.2
    * erb 4.0.2
    * error_highlight 0.5.1
    * etc 1.4.2
    * fcntl 1.0.2
    * fiddle 1.1.1
    * fileutils 1.7.0
    * forwardable 1.3.3
    * getoptlong 0.2.0
    * io-console 0.6.0
    * io-nonblock 0.2.0
    * io-wait 0.3.0
    * ipaddr 1.2.5
    * irb 1.6.2
    * json 2.6.3
    * logger 1.5.3
    * mutex_m 0.1.2
    * net-http 0.3.2
    * net-protocol 0.2.1
    * nkf 0.1.2
    * open-uri 0.3.0
    * open3 0.1.2
    * openssl 3.1.0
    * optparse 0.3.1
    * ostruct 0.5.5
    * pathname 0.2.1
    * pp 0.4.0
    * pstore 0.1.2
    * psych 5.0.1
    * racc 1.6.2
    * rdoc 6.5.0
    * readline-ext 0.1.5
    * reline 0.3.2
    * resolv 0.2.2
    * resolv-replace 0.1.1
    * securerandom 0.2.2
    * set 1.0.3
    * stringio 3.0.4
    * strscan 3.0.5
    * syntax_suggest 1.0.2
    * syslog 0.1.1
    * tempfile 0.1.3
    * time 0.2.1
    * timeout 0.3.1
    * tmpdir 0.1.3
    * tsort 0.1.1
    * un 0.2.1
    * uri 0.12.0
    * weakref 0.1.2
    * win32ole 1.8.9
    * yaml 0.2.1
    * zlib 3.0.0

*   Las siguientes gemas incluidas han sido actualizadas

    * minitest 5.16.3
    * power_assert 2.0.3
    * test-unit 3.5.7
    * net-ftp 0.2.0
    * net-imap 0.3.3
    * net-pop 0.1.2
    * net-smtp 0.3.3
    * rbs 2.8.2
    * typeprof 0.21.3
    * debug 1.7.1


Ver en la publicación de GitHub [GitHub Releases of logger](https://github.com/ruby/logger/releases)
o en la bitácora de cambios los detalles de las gemas predeterminadas e
incluidas.

Ver más detalles en [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
o en [la bitácora de cambios](https://github.com/ruby/ruby/compare/v3_1_0...{{ release.tag }}).

Con estos cambios, [{{ release.stats.files_changed }} archivos cambiados, {{ release.stats.insertions }} inserciones(+), {{ release.stats.deletions }} eliminaciones(-)](https://github.com/ruby/ruby/compare/v3_1_0...{{ release.tag }}#file_bucket)
desde Ruby 3.1.0!

¡Feliz navidad, felices fiestas y disfrute programar con Ruby 3.2!

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


[Característica #12005]:     https://bugs.ruby-lang.org/issues/12005
[Característica #12084]:     https://bugs.ruby-lang.org/issues/12084
[Característica #12655]:     https://bugs.ruby-lang.org/issues/12655
[Característica #12737]:     https://bugs.ruby-lang.org/issues/12737
[Característica #13110]:     https://bugs.ruby-lang.org/issues/13110
[Característica #14332]:     https://bugs.ruby-lang.org/issues/14332
[Característica #15231]:     https://bugs.ruby-lang.org/issues/15231
[Característica #15357]:     https://bugs.ruby-lang.org/issues/15357
[Falla #15928]:         https://bugs.ruby-lang.org/issues/15928
[Característica #16122]:     https://bugs.ruby-lang.org/issues/16122
[Característica #16131]:     https://bugs.ruby-lang.org/issues/16131
[Falla #16466]:         https://bugs.ruby-lang.org/issues/16466
[Característica #16663]:     https://bugs.ruby-lang.org/issues/16663
[Característica #16806]:     https://bugs.ruby-lang.org/issues/16806
[Falla #16889]:         https://bugs.ruby-lang.org/issues/16889
[Falla #16908]:         https://bugs.ruby-lang.org/issues/16908
[Característica #16989]:     https://bugs.ruby-lang.org/issues/16989
[Característica #17351]:     https://bugs.ruby-lang.org/issues/17351
[Característica #17391]:     https://bugs.ruby-lang.org/issues/17391
[Falla #17545]:         https://bugs.ruby-lang.org/issues/17545
[Falla #17767]:         https://bugs.ruby-lang.org/issues/17767
[Característica #17837]:     https://bugs.ruby-lang.org/issues/17837
[Característica #17881]:     https://bugs.ruby-lang.org/issues/17881
[Característica #18033]:     https://bugs.ruby-lang.org/issues/18033
[Característica #18159]:     https://bugs.ruby-lang.org/issues/18159
[Característica #18239]:     https://bugs.ruby-lang.org/issues/18239#note-17
[Característica #18351]:     https://bugs.ruby-lang.org/issues/18351
[Característica #18367]:     https://bugs.ruby-lang.org/issues/18367
[Falla #18435]:         https://bugs.ruby-lang.org/issues/18435
[Característica #18462]:     https://bugs.ruby-lang.org/issues/18462
[Característica #18481]:     https://bugs.ruby-lang.org/issues/18481
[Falla #18487]:         https://bugs.ruby-lang.org/issues/18487
[Característica #18564]:     https://bugs.ruby-lang.org/issues/18564
[Característica #18571]:     https://bugs.ruby-lang.org/issues/18571
[Característica #18585]:     https://bugs.ruby-lang.org/issues/18585
[Característica #18589]:     https://bugs.ruby-lang.org/issues/18589
[Característica #18595]:     https://bugs.ruby-lang.org/issues/18595
[Característica #18598]:     https://bugs.ruby-lang.org/issues/18598
[Falla #18625]:         https://bugs.ruby-lang.org/issues/18625
[Característica #18630]:     https://bugs.ruby-lang.org/issues/18630
[Falla #18633]:         https://bugs.ruby-lang.org/issues/18633
[Característica #18639]:     https://bugs.ruby-lang.org/issues/18639
[Característica #18685]:     https://bugs.ruby-lang.org/issues/18685
[Falla #18729]:         https://bugs.ruby-lang.org/issues/18729
[Falla #18751]:         https://bugs.ruby-lang.org/issues/18751
[Característica #18774]:     https://bugs.ruby-lang.org/issues/18774
[Característica #18776]:     https://bugs.ruby-lang.org/issues/18776
[Falla #18782]:         https://bugs.ruby-lang.org/issues/18782
[Característica #18788]:     https://bugs.ruby-lang.org/issues/18788
[Característica #18798]:     https://bugs.ruby-lang.org/issues/18798
[Característica #18809]:     https://bugs.ruby-lang.org/issues/18809
[Característica #18821]:     https://bugs.ruby-lang.org/issues/18821
[Característica #18822]:     https://bugs.ruby-lang.org/issues/18822
[Característica #18824]:     https://bugs.ruby-lang.org/issues/18824
[Característica #18832]:     https://bugs.ruby-lang.org/issues/18832
[Característica #18875]:     https://bugs.ruby-lang.org/issues/18875
[Característica #18925]:     https://bugs.ruby-lang.org/issues/18925
[Característica #18944]:     https://bugs.ruby-lang.org/issues/18944
[Característica #18949]:     https://bugs.ruby-lang.org/issues/18949
[Característica #18968]:     https://bugs.ruby-lang.org/issues/18968
[Característica #19008]:     https://bugs.ruby-lang.org/issues/19008
[Característica #19013]:     https://bugs.ruby-lang.org/issues/19013
[Característica #19026]:     https://bugs.ruby-lang.org/issues/19026
[Característica #19036]:     https://bugs.ruby-lang.org/issues/19036
[Característica #19060]:     https://bugs.ruby-lang.org/issues/19060
[Característica #19070]:     https://bugs.ruby-lang.org/issues/19070
[Característica #19071]:     https://bugs.ruby-lang.org/issues/19071
[Característica #19078]:     https://bugs.ruby-lang.org/issues/19078
[Falla #19087]:         https://bugs.ruby-lang.org/issues/19087
[Falla #19100]:         https://bugs.ruby-lang.org/issues/19100
[Característica #19104]:     https://bugs.ruby-lang.org/issues/19104
[Característica #19135]:     https://bugs.ruby-lang.org/issues/19135
[Característica #19138]:     https://bugs.ruby-lang.org/issues/19138
[Característica #19194]:     https://bugs.ruby-lang.org/issues/19194
[Molinillo]:          https://github.com/CocoaPods/Molinillo
[PubGrub]:            https://github.com/jhawthorn/pub_grub
[GH-net-protocol-14]: https://github.com/ruby/net-protocol/pull/14
[GH-pathname-20]:     https://github.com/ruby/pathname/pull/20
[GH-6791]:            https://github.com/ruby/ruby/pull/6791
[GH-6868]:            https://github.com/ruby/ruby/pull/6868
[GH-rubygems-4475]:   https://github.com/rubygems/rubygems/pull/4475
[GH-rubygems-6149]:   https://github.com/rubygems/rubygems/pull/6149
[GH-rubygems-6167]:   https://github.com/rubygems/rubygems/pull/6167
[sec-156615]:         https://hackerone.com/reports/156615
[CVE-2021-33621]:     https://www.ruby-lang.org/en/news/2022/11/22/http-response-splitting-in-cgi-cve-2021-33621/
[wasm/README.md]:     https://github.com/ruby/ruby/blob/master/wasm/README.md
[ruby.wasm]:          https://github.com/ruby/ruby.wasm
