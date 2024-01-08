---
layout: news_post
title: "Publicado Ruby 3.3.0-preview3"
author: "naruse"
translator: vtamara
date: 2023-11-12 00:00:00 +0000
lang: es
---

{% assign release = site.data.releases | where: "version", "3.3.0-preview3" | first %}

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
            abstracta (AST) como parte de un ParseResult
        * `Prism.dump(fuente, ruta)` que retorna el AST serializado como una
          cadena
        * `Prism.parse_comments(fuente)` que retorna los comentarios
* Puede hacer solicitudes de cambio o crear incidentes directamente en el
 [repositorio de Prism](https://github.com/ruby/prism) si desea
 contribuir.

## Uso de Lrama en lugar de Bison

* Se remplazó Bison por [el generador de analizadores LALR Lrama](https://github.com/yui-knk/lrama)
  [Característica #19637](https://bugs.ruby-lang.org/issues/19637)
  * Si tiene interés, por favor vea
    [The future vision of Ruby Parser](https://rubykaigi.org/2023/presentations/spikeolaf.html)
  * El analizadores interno de Lrama se ha remplazado con un
    analizador LR generado por Racc para hacerlo más mantenible.
  * Se soportan reglas de parametrización `(?, *, +)`, que serán
    usadas en la fuente parse.y de Ruby.

## RJIT

* Se introdujo RJIT un compilador JIT en puro Ruby que remplaza a MJIT.
  * RJIT soporta sólo la arquitectura x86-64 en plataformas Unix.
  * A diferencia de MJIT, no require de un compilador C en tiempo de ejecución.
* RJIT existe sólo con propósitos experimentales.
  * Debería seguir usando YJIT en producción.
* Si le interesa desarrollar un compilador JIT para Ruby, por favor
  revise la [presentación de k0kubun en el día 3 de RubyKaigi](https://rubykaigi.org/2023/presentations/k0kubun.html#day3).

## YJIT

* Mejoras mayores en desempeño respecto a 3.2
  * Mejorado el soporte para argumentos splat y para el resto de argumentos.
  * Los registros se localizan para operaciones en pila de la máquina virtual.
  * Se compilan más llamados con argumentos opcionales.
  * Los manejadores de excepciones también se compilan.
  * Las variables de instancia ya no salen al interprete con Formas de Objetos
    mega-mórficas.
  * Se optimizaron de manera especial `Integer#!=`, `String#!=`,
    `Kernel#block_given?`, `Kernel#is_a?`, `Kernel#instance_of?` y
    `Module#===`.
  * Ahora es 3 veces más rápido que el interprete normal con optcarrot!
* Mejora significativa en el uso de memoria respecto a 3.2
    * Los meta-datos para el código compilado usan mucha menos memoria.
    * Generación de código más compacto en ARM64
* La velocidad de compilación es ahora un poco más rápida que en 3.2.
* Añade `RubyVM::YJIT.enable` que puede habilitar YJIT en tiempo de ejecución
  * Puede iniciar YJIT sin modificar argumentos en la línea de ordenes
    o variables de ambiente.
  * Esto también puede usarse para habilitar YJIT sólo después de que la
    aplicación haya completado el arranque. `--yjit-disable` puede usarse
    si quiere usar otras opciones YJIT mientras deshabilita YJIT durante
    el arranque.
* Opción para deshabilitar el recolectar de basura codíficado y tratar
  `--yjit-exec-mem-size` como un límite duro.
  * Puede producir un mejor comportamiento de copiar-al-escribir en
    servidores que usen unicorn y bifurcación de procesos (forking)
* La estadística `ratio_in_yjit` producida por `--yjit-stats` ahora está
  disponible en compilaciones publicadas, ya no se requiere una
  estadística especial o una compilación de desarrollo para acceder
  a la mayoría de estadísticas.
* La opción para salir del modo con trazas ahora soporta muestreo
  * `--trace-exits-sample-rate=N`
* Se añade `--yjit-perf` para facilitar hacer medición de desempeño
  usando la herramienta perf de Linux
* Pruebas más extensas y correcciones a múltiples fallas


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
      * Los hilos M:N se habilitan en Ractos que no son el principal.
  * La variable de ambiente `RUBY_MAX_CPU=n` establece el máximo número
    de `N` (número máximo de hilos nativos). El valor predeterminado es 8.
      * Como sólo un hilo de Ruby por Ractor puede correr al mismo tiempo,
        el número de hilos nativos se usará, sera el menor entre
        el especificado en `RUBY_MAX_CPU` y el número de Ractors
        que estén corriendo. Así que las aplicaciones con un sólo Ractor
       (la mayoría de aplicaciones) usarán un solo hilo.
      * Para soportar operaciones de bloqueo, pueden usarse más de
       `N` hilos nativos.


## Otros Características Nuevas Notables

### Lenguaje

## Mejoras en desempeño

* `defined?(@ivar)` se optimiza con Formas de Objetos.
* La resolución de nombres como con `Socket.getaddrinfo` ahora puede
  interrumpirse (en ambientes donde estén disponibles pthreads).
  [Característica #19965](https://bugs.ruby-lang.org/issues/19965)
  * Con este propósito, se crea un pthread por cada llamada a
    getaddrinfo o getnameinfo. Esto incurre en algo de gasto en la
    resolución de nombres (alrededor de 2.5x en nuestros experimentos).
    No esperamos que el gasto adicional en la resolución de nombres
    sea un problema para la mayoría de aplicaciones, pero si lo nota,
    o si ve efectos inesperados que crea que pueden deberse a este
    cambio, por favor reportelos.
* Se ha añadido la variable de ambiente `RUBY_GC_HEAP_REMEMBERED_WB_UNPROTECTED_OBJECTS_LIMIT_RATIO`.
  [Característica #19571](https://bugs.ruby-lang.org/issues/19571)
* Los hijos de objetos antiguos ya no son promovidos de inmediato a la
  antigua generación en el recolector de basura.
  [Característica #19678](https://bugs.ruby-lang.org/issues/19678)
* Se ha agregado soporte para referencias débiles al recolector de basura.
  [Característica #19783](https://bugs.ruby-lang.org/issues/19783)


## Otros cambios notables desde 3.2

### IRB

IRB ha recibido diversas mejoras, incluyendo --no limitadas a estas:

- Integración avanzada `irb:rdbg` que provee una experiencia
  de depuración equivalente a la de `pry-byebug`
  ([doc](https://github.com/ruby/irb#debugging-with-irb)).
- Soporte de paginador para las ordenes `ls`, `show_source` y `show_cmds`.
- Las ordenes `ls` y `show_cmds` dan información más precisa y útil.
- Autocompletación experimental usando análisis de tipos
  ([doc](https://github.com/ruby/irb#type-based-completion)).
- Ahora es posible cambiar el color del tipo de letra así como su estilo
  en el diálogo de completación gracias a la recien introducida
  clase Reline::Face ([doc](https://github.com/ruby/ruby/blob/master/doc/reline/face.md))

Además, IRB ha experimentado una re-factorización extensa y ha recibido
docenas de correcciones a fallas que facilitan ampliaciones futuras.


## Incidentes de compatibilidad

Nota: Correciones a falla que excluía características.

### Constantes elminadas

Las siguientes constantes que eran despreciadas han sido eliminadas.


### Métodos eliminados

Los siguientes métodos que eran despreciados han sido eliminados.


### Variables de ambientes eliminadas

* La variable de ambiente `RUBY_GC_HEAP_INIT_SLOTS` es despreciada
  y es operación de no hacer nada. En su remplazo por favor use las
  variables de ambiente `RUBY_GC_HEAP_{0,1,2,3,4}_INIT_SLOTS`.
  [Característica #19785](https://bugs.ruby-lang.org/issues/19785)

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

RubyGems y Bundler avisan cuando el usuario requiere gemas que están
programadas para convertirse en gemas incluidas en versiones futuras
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

* prism 0.15.1

Las siguientes gemas predeterminadas se han actualizado.

* RubyGems 3.5.0.dev
* base64 0.2.0
* benchmark 0.3.0
* bigdecimal 3.1.5
* bundler 2.5.0.dev
* cgi 0.4.0
* csv 3.2.8
* date 3.3.4
* delegate 0.3.1
* drb 2.2.0
* english 0.8.0
* erb 4.0.3
* etc 1.4.3.dev.1
* fcntl 1.1.0
* fiddle 1.1.2
* fileutils 1.7.2
* find 0.2.0
* getoptlong 0.2.1
* io-console 0.6.1.dev
* irb 1.8.3
* logger 1.6.0
* mutex_m 0.2.0
* net-http 0.4.0
* net-protocol 0.2.2
* nkf 0.1.3
* observer 0.1.2
* open-uri 0.4.0
* open3 0.2.0
* openssl 3.2.0
* optparse 0.4.0
* ostruct 0.6.0
* pathname 0.3.0
* pp 0.5.0
* prettyprint 0.2.0
* pstore 0.1.3
* psych 5.1.1.1
* rdoc 6.6.0
* reline 0.3.9
* rinda 0.2.0
* securerandom 0.3.0
* shellwords 0.2.0
* singleton 0.2.0
* stringio 3.0.9
* strscan 3.0.7
* syntax_suggest 1.1.0
* tempfile 0.2.0
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
* net-imap 0.4.4
* net-smtp 0.4.0
* rbs 3.2.2
* typeprof 0.21.8
* debug 1.8.0

Ver la publicación en GitHub como
[Logger](https://github.com/ruby/logger/releases) o
bien la bitácora de cambios con detalles de las gemas predeterminadas
y las gemas incluidas.

Ver más detalles en el archivo
[NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
o en [la bitácora de cambios](https://github.com/ruby/ruby/compare/v3_2_0...{{ release.tag }}).

¡Con estos cambios, [{{ release.stats.files_changed }} archivos cambiados, {{ release.stats.insertions }} inserciones(+), {{ release.stats.deletions }} eliminaciones(-)](https://github.com/ruby/ruby/compare/v3_2_0...{{ release.tag }}#file_bucket)
desde Ruby 3.2.0!

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
