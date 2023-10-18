---
layout: news_post
title: "Publicado Ruby 3.3.0-preview2"
author: "naruse"
translator: vtamara
date: 2023-09-14 00:00:00 +0000
lang: es
---

{% assign release = site.data.releases | where: "version", "3.3.0-preview2" | first %}

Nos complace anunciar la publicación de Ruby {{ release.version }}. Ruby 3.3
añade un nuevo compilador JIT en puro Ruby llamado RJIT, usa Lrama
como generador del analizador sintáctico así como muchas mejoras
de desempeño especialmente de YJIT.

## RJIT

* Se introdujo RJIT un compilador JIT en puro Ruby que remplaza a MJIT.
  * RJIT soporta sólo la arquitectura x86\_64 en plataformas Unix.
  * A diferencia de MJIT, no require de un compilador C en tiempo de ejecución.
* RJIT existe sólo con propósitos experimentales.
  * Debería seguir usando YJIT en producción.
* Si le interesa desarrollar un compilador JIT para Ruby, por favor
  revise la [presentación de k0kubun en el día 3 de RubyKaigi](https://rubykaigi.org/2023/presentations/k0kubun.html#day3).

## Usa Lrama en lugar de Bison

* Remplaza Bison con [el generador de analizadores sintácticos LALR Lrama](https://github.com/yui-knk/lrama) [Característica #19637](https://bugs.ruby-lang.org/issues/19637)
  * Si tiene interés por favor vea [la visión futura de los analizadores sintácticos de Ruby](https://rubykaigi.org/2023/presentations/spikeolaf.html)

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
* Los metadatos para el código compilado usan mucha menos memoria.
* Generación de código más compacto en ARM64
* Opción para iniciar YJIT en modo pausado para después habilitarlo
  manualmente
  * `--yjit-pause` y `RubyVM::YJIT.resume`
  * Esto puede usarse para habilitar YJIT sólo después de que su aplicación
    haya completado el arranque.
* La estadística `ratio_in_yjit` producida por `--yjit-stats` ahora está
  disponible en compilaciones publicadas, ya no se requiere una
  estadística especial o una compilación de desarrollo.
* La opción para salir del modo con trazas ahora soporta muestreo
  * `--trace-exits-sample-rate=N`
* Pruebas más extensas y correcciones a múltiples fallas



## Otros Características Nuevas Notables

### Lenguaje

## Mejoras en desempeño

* `defined?(@ivar)` se optimiza con Formas de Objetos.

## Otros cambios notables desde 3.2

### IRB

IRB ha recibido diversas mejoras, incluyendo --no limitadas a estas:

- Integración avanzada `irb:rdbg` que provee una experiencia
  de depuración equivalente a la de `pry-byebug`
  ([doc](https://github.com/ruby/irb#debugging-with-irb)).
- Soporte de paginador en ordenes como `ls` y `show_cmds`.
- Las ordenes `ls` y `show_cmds` dan información más precisa y útil.

Además, IRB ha experimentado una re-factorización extensa y ha recibido
docenas de correcciones a fallas que facilitan ampliaciones futuras.


## Incidentes de compatibilidad

Nota: Correciones a falla que excluía características.

### Constantes elminadas

Las siguientes constantes que eran despreciadas han sido eliminadas.


### Métodos eliminados

Los siguientes métodos que eran despreciados han sido eliminados.


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

Las siguientes gemas predeterminadas se han actualizado.

* RubyGems 3.5.0.dev
* bigdecimal 3.1.4
* bundler 2.5.0.dev
* csv 3.2.8
* erb 4.0.3
* fiddle 1.1.2
* fileutils 1.7.1
* irb 1.7.4
* nkf 0.1.3
* optparse 0.4.0.pre.1
* psych 5.1.0
* reline 0.3.8
* stringio 3.0.9
* strscan 3.0.7
* syntax_suggest 1.1.0
* time 0.2.2
* timeout 0.4.0
* uri 0.12.2
* yarp 0.9.0

Las siguientes gemas incluidas han sido actualizadas.

* minitest 5.19.0
* test-unit 3.6.1
* rexml 3.2.6
* rss 0.3.0
* net-imap 0.3.7
* rbs 3.2.1
* typeprof 0.21.8
* debug 1.8.0

La siguiente gema predeterminada pasa a ser gema incluida.

* racc 1.7.1

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
y ahora es desarrollado como Código Abieto. Corre en múltiples
plataformas y es usado en todo el mundo especialmente para desarrollo web.
