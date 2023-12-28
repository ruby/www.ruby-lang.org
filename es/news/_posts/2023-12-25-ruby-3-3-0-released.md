---
layout: news_post
title: "Publicado Ruby 3.3.0"
author: "naruse"
translator: vtamara
date: 2023-12-25 00:00:00 +0000
lang: es
---

{% assign release = site.data.releases | where: "version", "3.3.0" | first %}

Nos complace anunciar la publicación de Ruby {{ release.version }}. Ruby 3.3
añade un nuevo analizador sintáctico llamado Prism, usa Lrama como
generador de analizadores, añade un nuevo compilador JIT en puro Ruby
llamado RJIT, e incluye muchas mejoras de desempeño especialmente de YJIT.

## Prism

* Se introduce [el analizador sintáctico Prism](https://github.com/ruby/prism)
  como gema predeterminada.
    * Prism es un analizador recursivo-descendente para el lenguaje Ruby
     portable, tolerante a errores y mantenible
* Prism está listo para operar en producción es mantenido activamente
  y puede emplearlo en lugar de Ripper
    * Hay [amplia documentación](https://ruby.github.io/prism/) sobre como
      usar Prism
    * Prism es tanto una librería en C que es usada internamente por CRuby
     como una gema que puede ser usada por cualquier herramienta que
     necesite analizar código Ruby.
    * Unos métodos notables de la API de Prism son:
        * `Prism.parse(fuente)` que retorna el árbol de sintaxis
          abstracta (AST) como parte de un objeto con el resultado del
          reconocimiento
        * `Prism.parse_success?(fuente)` que retorna verdadeor si no
          hay errores
        * `Prism.parse_comments(fuente)` que retorna los comentarios
* Puede hacer solicitudes de cambio o crear incidentes directamente en el
 [repositorio de Prism](https://github.com/ruby/prism) si desea
 contribuir.
* Ahora puede usar `ruby --parser=prism` o `RUBYOPT="--parser=prism"`
  para experimentar con el compilador Prism. Por favor note que
  esta opción es sólo para depurar.

## Uso de Lrama en lugar de Bison

* Se remplazó Bison por [el generador de analizadores LALR Lrama](https://github.com/ruby/lrama)
  [[Característica #19637]](https://bugs.ruby-lang.org/issues/19637)
  * Si tiene interés, por favor vea
    [The future vision of Ruby Parser](https://rubykaigi.org/2023/presentations/spikeolaf.html)
  * El analizadores interno de Lrama se ha remplazado con un
    analizador LR generado por Racc para hacerlo más mantenible.
  * Se soportan reglas de parametrización `(?, *, +)`, que serán
    usadas en la fuente parse.y de Ruby.

## YJIT

* Mejoras mayores en desempeño respecto a Ruby 3.2
  * Mejorado el soporte para argumentos splat y para el resto de argumentos.
  * Los registros se localizan para operaciones en la pila de la máquina
    virtual.
  * Se compilan más llamadas con argumentos opcionales. Los manejadores de
    excepciones también se compilan.
  * Las llamadas a tipos y los sitios de llamadas mega-mórficas ya no
    salen al interprete.
  * Métodos básicos como Rails `#blank?` y
    [`#present?` especializado](https://github.com/rails/rails/pull/49909)
    se manejan inline.
  * `Integer#!=`, `String#!=`,
    `Kernel#block_given?`, `Kernel#is_a?`, `Kernel#instance_of?` y
    `Module#===` fueron optimizados de manera especial.
  * La velocidad de compilación es un poco superior a la de Ruby 3.2.
  * ¡Ahora es 3 veces más rápido que el interprete normal con Optcarrot!
* Mejora significativa en el uso de memoria respecto a 3.2
    * Los meta-datos para el código compilado usan mucha menos memoria.
    * `--yjit-call-threshold` se eleva automáticamente de 30 a 120
      cuando la aplicación tiene más de 40,000 ISEQs.
    * `--yjit-cold-threshold` se agrega para saltarse la compilación
      de ISEQs en frio.
    * Generación de código más compacto en ARM64
* La velocidad de compilación es ahora un poco más rápida que en 3.2.
* El recolector de basura en el código (code GC) ahora está deshabilitado
  de manera predeterminada
  * `--yjit-exec-mem-size` es tratado como un límite fuerte
    en el que se detendrá la compilación de nuevo código.
  * No hay disminuciones inesperadas en el desempeño debidas al
    recolector de código basura.
  * Aún puede habilitar el recolector de basura en el código si lo
    desea con `--yjit-code-gc`
* Añade `RubyVM::YJIT.enable` que puede habilitar YJIT en tiempo de ejecución
  * Puede iniciar YJIT sin modificar argumentos en la línea de ordenes
    o variables de ambiente.
    Rails 7.2 [habilitará YJIT de manera predeterminada](https://github.com/rails/rails/pull/49947)
  * Esto también puede usarse para habilitar YJIT sólo después de que la
    aplicación haya completado el arranque. `--yjit-disable` puede usarse
    si quiere usar otras opciones YJIT mientras deshabilita YJIT durante
    el arranque.
* Hay más estadísticas de YJIT disponibles de manera predeterminada
  * `yjit_alloc_size` y muchas más estadísticas relacionadas con
     metadatos ahora están disponibles de manera predeterminada.
  * La estadística `ratio_in_yjit` producida por `--yjit-stats` ahora está
  disponible en las compilaciones publicadas, ya no se requiere una
  estadística especial o una compilación de desarrollo para acceder
  a la mayoría de estadísticas.
* Se agregan más posibilidades para analizar rendimiento
  * Se añade `--yjit-perf` para facilitar el análisis de rendimiento
    con la herramienta perf de Linux
  * `--yjit-trace-exits` ahora soporta muestreo con
    `--yjit-trace-exits-sample-rate=N`
* Pruebas más extensas y correcciones a múltiples fallas

## RJIT

* Se introdujo RJIT un compilador JIT en puro Ruby que remplaza a MJIT.
  * RJIT soporta sólo la arquitectura x86-64 en plataformas Unix.
  * A diferencia de MJIT, no require de un compilador C en tiempo de ejecución.
* RJIT existe sólo con propósitos experimentales.
  * Debería seguir usando YJIT en producción.
* Si le interesa desarrollar un compilador JIT para Ruby, por favor
  revise la [presentación de k0kubun en el día 3 de RubyKaigi](https://rubykaigi.org/2023/presentations/k0kubun.html#day3).


### Planificador de hilos M:N

* Se introdujo un planificador de hilos M:N. [[Característica #19842]](https://bugs.ruby-lang.org/issues/19842)
  * M hilos de Ruby son manejados por N hilos nativos (hilos del
    sistema operativo) reduciendo así el costo de creación y
    administración.
  * Como puede romper la compatibilidad con extensiones en C, el
    planificador de hilos M:N está deshabilitado de manera predeterminada
    en el Ractor principal.
      * La variable de ambiente `RUBY_MN_THREADS=1` habilita los hilos
        M:N en el Ractor principal.
      * Los hilos M:N se habilitan siempre en Ractors que no son el principal.
  * La variable de ambiente `RUBY_MAX_CPU=n` establece el máximo número
    de `N` (número máximo de hilos nativos). El valor predeterminado es 8.
      * Como sólo un hilo de Ruby por Ractor puede correr al mismo tiempo,
        el número de hilos nativos se usará, sera el menor entre
        el especificado en `RUBY_MAX_CPU` y el número de Ractors
        que estén corriendo. Así que las aplicaciones con un sólo Ractor
       (la mayoría de aplicaciones) sólo usarán un hilo nativo.
      * Para soportar operaciones de bloqueo, pueden usarse más de
       `N` hilos nativos.


## Mejoras en desempeño

* `defined?(@ivar)` se optimiza con Formas de Objetos.
* La resolución de nombres como con `Socket.getaddrinfo` ahora puede
  interrumpirse (en ambientes donde estén disponibles pthreads).
  [[Característica #19965]](https://bugs.ruby-lang.org/issues/19965)
  * Con este propósito, se crea un pthread por cada llamada a
    getaddrinfo o getnameinfo. Esto incurre en algo de gasto en la
    resolución de nombres (alrededor de 2.5x en nuestros experimentos).
    No esperamos que el gasto adicional en la resolución de nombres
    sea un problema para la mayoría de aplicaciones, pero si lo nota,
    o si ve efectos inesperados que crea que pueden deberse a este
    cambio, por favor reportelos.
* Diversas mejoras de desempeño al Recolector de Basura
  * Los objetos jóvenes referenciados por objetos viejos ya no se promueve
    de inmediato a la generación vieja.  Esto reduce significativamente la
    frecuencia de recolección del Recolector de Basura (GC).
    [[Característica #19678]](https://bugs.ruby-lang.org/issues/19678)
  * Se introdujo la nueva variable de ajuste
    `REMEMBERED_WB_UNPROTECTED_OBJECTS_LIMIT_RATIO`
    para controlar el número de objetos no protegidos que activan una
    recolección del.  De manera predeterminada se establece en `0.01` (1%).
    Esto reduce significativamente la frecuencia de las recolecciones
    mayores del GC. [[Característica #19571]](https://bugs.ruby-lang.org/issues/19571)
  * Se implementaron Barreras de Escritura para muchos tipos básicos a los que
    les hacia falta, son notables `Time`, `Enumerator`, `MatchData`,
    `Method`, `File::Stat`, `BigDecimal` y muchos otros. Esto reduce
    significativamente el tiempo de las recolecciones menores del GC
    y la frecuencia de las recolecciones mayores.
  * La mayoría de clases ahora usan Localización de Ancho Variable,
    son notables `Hash`, `Time`, `Thread::Backtrace`,
    `Thread::Backtrace::Location`, `File::Stat`, `Method`.
    Esto hace más veloces estas clases para reservar y liberar, que
    usen menos memoria y reduce la fragmentación en el montón (*heap*).
  * Se ha agregado soporte para referencias débiles en el recolector
    de basura.  [[Característica #19783]](https://bugs.ruby-lang.org/issues/19783)


## Otros cambios notables desde 3.2

### IRB

IRB ha recibido diversas mejoras, incluyendo --no limitadas a estas:

* Integración avanzada `irb:rdbg` que provee una experiencia
  de depuración equivalente a la de `pry-byebug`
  ([doc](https://github.com/ruby/irb#debugging-with-irb)).
* Soporte de paginador para las ordenes `ls`, `show_source` y `show_cmds`.
* Las ordenes `ls` y `show_cmds` dan información más precisa y útil.
* Autocompletación experimental usando análisis de tipos
  ([doc](https://github.com/ruby/irb#type-based-completion)).
* Ahora es posible cambiar el color del tipo de letra así como su estilo
  en el diálogo de completación gracias a la recien introducida
  clase Reline::Face ([doc](https://github.com/ruby/ruby/blob/master/doc/reline/face.md))

Además, IRB ha experimentado una re-factorización extensa y ha recibido
docenas de correcciones a fallas que facilitan ampliaciones futuras.

Para actualizaciones más detalladas, por favor vea
[Unveiling the big leap in Ruby 3.3's IRB](https://railsatscale.com/2023-12-19-irb-for-ruby-3-3/).

## Incidentes de compatibilidad

Nota: Excluyendo correcciones a errores en características

* Se desprecian llamadas a `it` sin argumentos en bloques sin parámetros
  ordinarios. `it` será una referencia al primer parámetro de bloque en
  Ruby 3.4.
  [[Característica #18980]](https://bugs.ruby-lang.org/issues/18980)

### Variables de ambientes eliminadas

* La variable de ambiente `RUBY_GC_HEAP_INIT_SLOTS` es despreciada
  y representa la operación de no hacer nada. En su remplazo por favor use las
  variables de ambiente `RUBY_GC_HEAP_{0,1,2,3,4}_INIT_SLOTS`.
  [[Característica #19785]](https://bugs.ruby-lang.org/issues/19785)

## Problemas de compatibilidad con Stdlib

### Eliminación de `ext/readline`

* Tenemos `reline` que es una implementación en Ruby puro compatible con
  el API de `ext/readline`.  Dependeremos de `reline` a futuro. Si
  necesita usar `ext/readline`, puede instalar `ext/readline` vía rubygems.org
  con `gem install readline-ext`.
* Ya no necesitamos instalar librerías como `libreadline` o `libedit`.

## Actualizaciones al API en C

### APIs en C actualizados

Los siguientes APIs han sido actualizados.



### APIs en C eliminados

Los siguientes APIs despreciados han sido eliminados.

## Actualizaciones a la librería estándar

RubyGems y Bundler avisan cuando el usuario hace `require` de las
gemas siguientes sin añadirlas al Gemfile o al gemspec.
Esto porque se convertirán en gemas incluidas en versiones futuras
de Ruby.

Librerías que son objetivo:
  * abbrev
  * base64
  * bigdecimal
  * csv
  * drb
  * getoptlong
  * mutex_m
  * nkf
  * observer
  * racc
  * resolv-replace
  * rinda
  * syslog

Se ha añadido la siguiente gema.

* prism 0.19.0

Las siguientes gemas predeterminadas se han actualizado.

* RubyGems 3.5.3
* abbrev 0.1.2
* base64 0.2.0
* benchmark 0.3.0
* bigdecimal 3.1.5
* bundler 2.5.3
* cgi 0.4.1
* csv 3.2.8
* date 3.3.4
* delegate 0.3.1
* drb 2.2.0
* english 0.8.0
* erb 4.0.3
* error_highlight 0.6.0
* etc 1.4.3
* fcntl 1.1.0
* fiddle 1.1.2
* fileutils 1.7.2
* find 0.2.0
* getoptlong 0.2.1
* io-console 0.7.1
* io-nonblock 0.3.0
* io-wait 0.3.1
* ipaddr 1.2.6
* irb 1.11.0
* json 2.7.1
* logger 1.6.0
* mutex_m 0.2.0
* net-http 0.4.0
* net-protocol 0.2.2
* nkf 0.1.3
* observer 0.1.2
* open-uri 0.4.1
* open3 0.2.1
* openssl 3.2.0
* optparse 0.4.0
* ostruct 0.6.0
* pathname 0.3.0
* pp 0.5.0
* prettyprint 0.2.0
* pstore 0.1.3
* psych 5.1.2
* rdoc 6.6.2
* readline 0.0.4
* reline 0.4.1
* resolv 0.3.0
* rinda 0.2.0
* securerandom 0.3.1
* set 1.1.0
* shellwords 0.2.0
* singleton 0.2.0
* stringio 3.1.0
* strscan 3.0.7
* syntax_suggest 2.0.0
* syslog 0.1.2
* tempfile 0.2.1
* time 0.3.0
* timeout 0.4.1
* tmpdir 0.2.0
* tsort 0.2.0
* un 0.3.0
* uri 0.13.0
* weakref 0.1.3
* win32ole 1.8.10
* yaml 0.3.0
* zlib 3.1.0

La siguiente gema incluida ha sido promovida a gema predeterminada.

* racc 1.7.3

Las siguientes gemas incluidas han sido actualizadas.

* minitest 5.20.0
* rake 13.1.0
* test-unit 3.6.1
* rexml 3.2.6
* rss 0.3.0
* net-ftp 0.3.3
* net-imap 0.4.9
* net-smtp 0.4.0
* rbs 3.4.0
* typeprof 0.21.9
* debug 1.9.1

Ver la publicación en GitHub como
[Logger](https://github.com/ruby/logger/releases) o
bien la bitácora de cambios con detalles de las gemas predeterminadas
y las gemas incluidas.

Ver más detalles en el archivo
[NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
o en [la bitácora de cambios](https://github.com/ruby/ruby/compare/v3_2_0...{{ release.tag }}).

¡Con estos cambios, [{{ release.stats.files_changed }} archivos cambiados, {{ release.stats.insertions }} inserciones(+), {{ release.stats.deletions }} eliminaciones(-)](https://github.com/ruby/ruby/compare/v3_2_0...{{ release.tag }}#file_bucket)
desde Ruby 3.2.0!

¡Feliz Navidad, Felices Fiestas, y disfrute programando con Ruby 3.3!

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

Ruby primero fue desarrollado por Matz (Yukihiro Matsumoto) en 1993,
y ahora es desarrollado como Código Abierto. Corre en múltiples
plataformas y es usado en todo el mundo especialmente para desarrollo web.
