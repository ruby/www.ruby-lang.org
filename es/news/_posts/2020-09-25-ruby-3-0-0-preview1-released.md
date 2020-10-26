---
layout: news_post
title: "Publicado Ruby 3.0.0 versión previa 1"
author: "naruse"
translator: vtamara
date: 2020-09-25 00:00:00 +0000
lang: es
---

Nos complace anunciar la publicación de Ruby 3.0.0-preview1.

Introduce una serie de características nuevas y mejoras en
desempeño.

## RBS

RBS es un lenguaje para describir los tipos de los programas Ruby.
Los verificadores de tipos,  incluyendo perfiladores de tipos, y otras
herramientas que soporten RBS entenderán mejor los programas
Ruby con definiciones RBS.

Usted puede escribir la definición de clases y módulos: métodos que se
definen en la clase, variables de instancia y sus tipos, y relaciones
herencia/mix-in.
El objetivo de RBS es soportar los patrones que comúnmente se ven
en programas en Ruby y permitir escribir tipos avanzados incluyendo
tipos unión, sobrecarga de métodos y genéricos.
También soporta tipado pato (duck typing) con _tipos de interfaz_.

Ruby 3.0 se distribuye con la gema `rbs`, que permite analizar
y procesar definiciones de tipos escritas en RBS.

El siguiente es un pequeño ejemplo de RBS.

``` rbs
module AplicacionMensajeria
  VERSION: String

  class Channel
    attr_reader nombre: String
    attr_reader mensajes: Array[Mensaje]
    attr_reader usaurios: Array[Usuario | Robot]           # `|` significa tipos unión, `Usuario` or `Robot`.

    def initialize: (String) -> void

    def publicar: (String, de: Usuario | Robot) -> Mensaje # Se soporta sobrecarga de métodos.
            | (File, de: Usuaurio | Robot) -> Mensaje
  end
end
```

Ver más detalles en el
[archivo README de la gema rbs](https://github.com/ruby/rbs).

## Ractor (experimental)

Un Ractor es una abstracción de concurrencia al estilo Actor-modelo,
diseñada para brindar una forma de ejecución en paralelo sin
preocuparse por la seguridad de los hilos de ejecución.

Puede crear múltiples ractors y puede ejecutarlos en paralelo.
Un Ractor permite hacer programas paralelos con seguridad en los hilos
de ejecución porque los ractors no comparten objetos normales.
La comunicación entre ractors se soporta mediante envío de
mensajes.

Para limitar los objetos que se comparten, Ractor introduce diversas
restricciones a la sintaxis de Ruby (no hay cambio cuando no hay múltiples
Ractors).

La especificación e implementación no es madura y podría cambiar a
futuro, por eso esta característica se señala como experimental
y cuando se crea un Ractor se presenta una advertencia de característica
experimental.

El siguiente pequeño programa calcula `prime?` en paralelo con dos
ractores y es casi 2 veces más rápido con dos o más núcleos
que el programa secuencial.

``` ruby
require 'prime'

# n.prime? con enteros enviados en r1, r2 que corren en paralelo
r1, r2 = *(1..2).map do
  Ractor.new do
    n = Ractor.recv
    n.prime?
  end
end

# send parameters
r1.send 2**61 - 1
r2.send 2**61 + 15

# wait for the results of expr1, expr2
p r1.take #=> true
p r2.take #=> true
```

Ver más detalles en
[doc/ractor.md](https://github.com/ruby/ruby/blob/master/doc/ractor.md).

## Planificador (__Scheduler__ Experimental)

Se introduce `Thread#scheduler` para interceptar operaciones
que bloquean.  Esto permite una concurrencia liviana sin cambiar el
código existente.

Los métodos y clases que se soportan en el momento son:

- `Mutex#lock`, `Mutex#unlock`, `Mutex#sleep`
- `ConditionVariable#wait`
- `Queue#pop`, `SizedQueue#push`
- `Thread#join`
- `Kernel#sleep`
- `IO#wait`, `IO#read`, `IO#write` y métodos relacionados (e.g.
  `#wait_readable`, `#gets`, `#puts` y así sucesivamente).
- `IO#select` *no es soportado*.

El actual punto de entrada para la concurrencia es
`Fiber.schedule{...}` sin embargo está sujeto a cambios para
cuando se publique Ruby 3.

En el momento, hay disponible un planificador de prueba en
[`Async::Scheduler`](https://github.com/socketry/async/pull/56).
Ver más detalles en
[`doc/scheduler.md`](https://github.com/ruby/ruby/blob/master/doc/scheduler.md).
[Feature #16786]

**ADVERTENCIA**: Esta característica es altamente experimental.
Tanto el nombre como sus características cambiarán en la siguiente
versión prevía.

## Otras características notables

* Se agrega una asignación al lado derecho.

  ``` ruby
  fib(10) => x
  p x #=> 55
  ```

* Se agrega una definición de métodos que no requiere `end`.

  ``` ruby
  def cuadrado(x) = x * x
  ```

* Se agrega un patrón Encontrar (__Find__).

  ``` ruby
  case ["a", 1, "b", "c", 2, "d", "e", "f", 3]
  in [*pre, String => x, String => y, *post]
    p pre  #=> ["a", 1]
    p x    #=> "b"
    p y    #=> "c"
    p post #=> [2, "d", "e", "f", 3]
  end
  ```

* `Hash#except` ahora es un método incorporado.

  ``` ruby
  h = { a: 1, b: 2, c: 3 }
  p h.except(:a) #=> {:b=>2, :c=>3}
  ```

* Se agrega como característica experimental __Memory view__

    * Este es un nuevo conjunto de llamados en la API de C para intercambiar
    áreas de memoria puras entre las librerías que son extensiones, por
    ejemplo para intercambiar un arreglo numérico con un mapa de bits.
    Las librerías que son extensiones pueden compartir también los
    metadatos del área de memoria que constan de la forma, el formato del
    elemento y así sucesivamente.  Usando esta clase de metadatos, las
    librerías que son extensiones pueden compartir apropiadamente incluso un
    rreglo multidimensional.  Esta nueva característica se diseñó empleando
    como referencia el protocolo de colchón (__buffer__ ) de Python.

## Mejoras en desempeño

* Se implemetaron muchas mejoras en MJIT. Ver detalles en el archivo
  NEWS.

## Otros cambios notables desde 2.7

* Los argumentos de palabra clave se separan de otros argumentos.
  * En principio, el código que presente una advertencia en Ruby 2.7 no
  funcionará.  Ver detalles en la
  [documentación](https://www.ruby-lang.org/es/news/2019/12/12/separation-of-positional-and-keyword-arguments-in-ruby-3-0/).
  * Por cierto, el re-envío de argumentos ahora soporta argumentos principales.

    ``` ruby
    def method_missing(meth, ...)
      send(:"do_#{ meth }", ...)
    end
    ```

* La característica `$SAFE` se eliminó por completo; ahora es una variable
  global normal.

* El orden de la traza de llamados (__backtrace__) se había revertido para ser
  como en Ruby 2.5, pero esto se ha cancelado.  Ahora se comporta como
  Ruby 2.4; se imprime primero un mensaje de error y el número de línea donde
  ocurrió la excepción; las funciones que había hecho la llamada se imprimen
  después.

* Se actualizaron algunas librerías estándar.
  * RubyGems 3.2.0.rc.1
  * Bundler 2.2.0.rc.1
  * IRB 1.2.6
  * Reline 0.1.5

* Las siguientes librerías ya no son gemas distribuidas con Ruby.
  Instale las gemas correspondientes para usar sus funcionalidades.
  * net-telnet
  * xmlrpc

* Las siguientes gemas por omisión se volvieron gemas distribuidas
  con Ruby.
  * rexml
  * rss

* stdlib se volvió gema por omisión. Las siguientes gemas por omisión
  se publicaron en rubygems.org
  * abbrev
  * base64
  * English
  * erb
  * find
  * io-nonblock
  * io-wait
  * net-ftp
  * net-http
  * net-imap
  * net-protocol
  * nkf
  * open-uri
  * optparse
  * resolv
  * resolv-replace
  * rinda
  * securerandom
  * set
  * shellwords
  * tempfile
  * time
  * tmpdir
  * tsort
  * weakref

Ver más detalles en el archivo
[NEWS](https://github.com/ruby/ruby/blob/v3_0_0_preview1/NEWS.md)
o [en la bitácora de contribuciones](https://github.com/ruby/ruby/compare/v2_7_0...v3_0_0_preview1).

{% assign release = site.data.releases | where: "version", "3.0.0-preview1" | first %}

Con estos cambios, [{{ release.stats.files_changed }} archivos cambiados, {{ release.stats.insertions }} inserciones(+), {{ release.stats.deletions }} eliminaciones(-)](https://github.com/ruby/ruby/compare/v2_7_0...v3_0_0_preview1)
desde Ruby 2.7.0!

¡Por favor pruebe Ruby 3.0.0-preview1, y denos cualquier retroalimentación!

## Descargas

* <{{ release.url.bz2 }}>

      SIZE: {{ release.size.bz2 }}
      SHA1: {{ release.sha1.bz2 }}
      SHA256: {{ release.sha256.bz2 }}
      SHA512: {{ release.sha512.bz2 }}

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

## Avance de 3.0.0-preview2

Planeamos incluir ["type-profiler"](https://github.com/mame/ruby-type-profiler)
que es un analizador de tipos estáticos.  ¡Esté pendiente!

## Qué es Ruby

Ruby fue desarrollado inicialmente por Matz (Yukihiro Matsumoto) en 1993,
y ahora es desarrollado como código abierto. Corre en muchas
plataformas y se usa en todas partes del mundo especialmente para
desarrollos web.
