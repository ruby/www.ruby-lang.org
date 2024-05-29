---
layout: news_post
title: "Publicado Ruby 3.0.0"
author: "naruse"
translator: vtamara
date: 2020-12-25 00:00:00 +0000
lang: es
---

Nos complace anunciar la publicación de Ruby 3.0.0.
Desde el 2015 desarrollamos Ruby 3 con esfuerzo y con metas en desempeño,
concurrencia y tipado.
Especialmente en desempeño, Matz estableció "Ruby3 será 3 veces más rápido
que Ruby2", afirmación también conocida como
[Ruby 3x3](https://blog.heroku.com/ruby-3-by-3).

{% assign release = site.data.releases | where: "version", "3.0.0" | first %}

<img src='https://cache.ruby-lang.org/pub/media/ruby3x3.png' alt='Optcarrot 3000 frames' width='100%' />

Con [el punto de referencia Optcarrot](https://github.com/mame/optcarrot), que
mide desempeño con un solo hilo de ejecución con la carga de emular juegos para NES,
¡logra un desempeño 3 veces más rápido que Ruby 2.0! <details>Se midió en el ambiente anotado en [github.com/ruby/ruby/tree/master/benchmark](https://github.com/ruby/ruby/tree/master/benchmark). La [contribución 8c510e4095](https://github.com/ruby/ruby/commit/8c510e4095) se usó como Ruby 3.0. Podría no resultar 3 veces más rápido en de su ambiente o con otros punto de referencia.</details>

Ruby 3.0.0 cubre esas metas asi
* Desempeño
  * MJIT
* Concurrencia
  * Ractor
  * Planificador de fibras (__Fiber Scheduler__)
* Tipado (Análisis Estático)
  * RBS
  * TypeProf

Con la mejora en desempeño mencionada, Ruby 3.0 introduce diversas
características nuevas que se describen a continuación.

## Desempeño

> Cuando mencioné "Ruby3x3" en la charla principal de una conferencia,
muchos, incluso miembros del equipo nuclear, sintieron "Matz está exagerando".
De hecho, yo también lo sentí así.  Pero lo hicimos. Me honra ver que el
equipo nuclear en realidad logró hacer que Ruby 3.0 fuera tres veces más rápido
que Ruby 2.0 (con algunos puntos de referencia).  -- Matz

### MJIT

Se implementaron muchas mejoras en MJIT. Ver detalles en el
archivo [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md).

Con Ruby 3.0, el compilador justo a tiempo (JIT) se supone que da mejoras en
desempeño en cargas de trabajo limitadas, como juegos
([Optcarrot](https://github.com/mame/optcarrot)),
Inteligencia Artificila([Rubykon](https://github.com/benchmark-driver))
o cualquier aplicación que emplee la mayoría del tiempo llamando unos pocos métodos
muchas veces.

Aunque Ruby 3.0 [disminuyó significativamente el tamaño del código compilado justo a tiempo](https://twitter.com/k0kubun/status/1256142302608650244),
aún no está listo para optimizar cargas de trabajo como aplicaciones Rails, que
suelen emplear el tiempo en muchos métodos, y por eso sufren de demasiados desatinos
con el i-cache debido al JIT.  Esté pendiente de Ruby 3.1 que incluirá otras
mejoras en esta área.

## Concurrencia / Paralelismo

> Hoy es un era de múltiples núcleos. La concurrencia es muy importante.
Con Ractor, junto con fibras asincronas, Ruby será un lenguaje concurrente
real --- Matz

### Ractor (experimental)

Un Ractor es una abstracción de concurrencia al estilo Actor-modelo,
diseñada para brindar una forma de ejecución en paralelo sin
preocuparse por la seguridad de los hilos (thread-safe) de ejecución.

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
y con el primer `Ractor.new` se presenta una advertencia de característica
experimental.

El siguiente programita mide el tiempo de ejecución de un punto de referencia
famoso, la función tak
([Función Tak - Wikipedia](https://en.wikipedia.org/wiki/Tak_(function))),
que se ejecuta 4 veces de manera secuencial o 4 veces en paralelo con ractores.

``` ruby
def tarai(x, y, z) =
  x <= y ? y : tarai(tarai(x-1, y, z),
                     tarai(y-1, z, x),
                     tarai(z-1, x, y))
require 'benchmark'
Benchmark.bm do |x|
  # sequential version
  x.report('seq'){ 4.times{ tarai(14, 7, 0) } }

  # parallel version
  x.report('par'){
    4.times.map do
      Ractor.new { tarai(14, 7, 0) }
    end.each(&:take)
  }
end
```

```
Benchmark result:
          user     system      total        real
seq  64.560736   0.001101  64.561837 ( 64.562194)
par  66.422010   0.015999  66.438009 ( 16.685797)
```

El resultado se midió en Ubuntu 20.04, con procesador Intel(R) Core(TM) i7-6700
(4 núcleos, 8 hilos por hardware). Muestra que la versión paralela
es 3.87 veces más rápida que la versión secuencial.

Vea más detalles en [doc/ractor.md](https://docs.ruby-lang.org/en/3.0/ractor_md.html).


## Planificador (__Scheduler__) de Fibras

Se introduce `Fiber#scheduler` para interceptar operaciones que bloquean.
Esto permite contar con una concurrencia liviana sin cambiar el
código existente. De un vistazo general y vea como funciona en
["Don't Wait For Me, Scalable Concurrency for Ruby 3"](https://www.youtube.com/watch?v=Y29SSOS4UOc).

Los métodos y clases que se soportan en el momento son:

- `Mutex#lock`, `Mutex#unlock`, `Mutex#sleep`
- `ConditionVariable#wait`
- `Queue#pop`, `SizedQueue#push`
- `Thread#join`
- `Kernel#sleep`
- `Process.wait`
- `IO#wait`, `IO#read`, `IO#write` y métodos relacionados (e.g.
  `#wait_readable`, `#gets`, `#puts` y así sucesivamente).
- `IO#select` *no es soportado*.

Este programa de ejemplo realizará varias peticiones HTTP concurrentemente:

``` ruby
require 'async'
require 'net/http'
require 'uri'

Async do
  ["ruby", "rails", "async"].each do |topic|
    Async do
      Net::HTTP.get(URI "https://www.google.com/search?q=#{topic}")
    end
  end
end
```

Note que usa [async](https://github.com/socketry/async) que provee el
ciclo de eventos.
Este ciclo de eventos usa ganchos `Fiber#scheduler` para lograr
un `Net::HTTP` no-bloqueante. Otras gemas pueden usar esta interfaz
para proveer ejecución no-bloqueante para Ruby, y aquellas gemas pueden
ser compatibles con otras implementaciones de Ruby (e.g. JRuby, TruffleRuby)
que pueden soportar los mismos ganchos no-bloqueantes.

## Análisis Estático

> La decada del 2010 fue de lenguajes de programación tipados estaticamente.
Ruby busca el futuro con chequeo de tipos estáticos, sin declaración de tipos pero
usando interpretación abstracta. RBS & TypeProf son los primeros pasos
hacia el futuro.  Vendrán más pasos. --- Matz

### RBS

RBS es un lenguaje para describir los tipos de los programas Ruby.

Los verificadores de tipos, incluyendo TypeProf y otras herramientas
que soporten RBS entenderán mejor los programas Ruby que tengan
definiciones RBS.

Usted puede escribir la definición de clases y módulos: métodos que se
definen en la clase, variables de instancia y sus tipos, y relaciones
de herencia/mix-in.

El objetivo de RBS es soportar los patrones que comúnmente se ven
en programas Ruby y permitir escribir tipos avanzados incluyendo
tipos unión, sobrecarga de métodos y genéricos. También soporta tipado
pato (duck typing) con _tipos de interfaz_.

Ruby 3.0 se distribuye con la gema `rbs`, que permite analizar
y procesar definiciones de tipos escritas en RBS.
El siguiente es un pequeño ejemplo de RBS con una clase, un modulo y
definiciones de constantes.

``` rbs
module AplicacionMensajeria
  VERSION: String
  class Channel
    attr_reader nombre: String
    attr_reader mensajes: Array[Mensaje]
    attr_reader usuarios: Array[Usuario | Robot]           # `|` significa tipos unión, `Usuario` o `Robot`.

    def initialize: (String) -> void

    def publicar: (String, de: Usuario | Robot) -> Mensaje # Se soporta sobrecarga de métodos.
            | (File, de: Usuaurio | Robot) -> Mensaje
  end
end
```

Ver más detalles en el
[archivo README de la gema rbs](https://github.com/ruby/rbs).


### TypeProf

TypeProf es una herramienta para análisis de tipos incluida en el paquete
Ruby.

Actualmente, TypeProf sirve como una forma de inferencia de tipos.

Lee código Ruby plano (sin anotiaciones de tipos), analiza que métodos se
definen y como se usan, y genera un prototipo de la firma de los tipos en
formato RBS.

Aquí hay una simple demostración de TypeProf.

Entrada de ejemplo:

``` ruby
# prueba.rb
class Usuario
  def initialize(nombre:, edad:)
    @nombre, @edad= nombre, edad
  end
  attr_reader :nombre, :edad
end
Usuario.new(nombre: "Juan", edad: 20)
```

Salida de ejemplo:

```
$ typeprof prueba.rb
# Classes
class Usuario
  attr_reader nombre : String
  attr_reader edad : Integer
  def initialize : (nombre: String, edad: Integer) -> [String, Integer]
end
```

Puede ejecutar TypeProf, tras guardar el archivo de entrada como "prueba.rb"
tecleando "typeprof prueba.rb".

También puede [probar TypeProf en línea](https://mame.github.io/typeprof-playground/#rb=%23+test.rb%0Aclass+User%0A++def+initialize%28name%3A%2C+age%3A%29%0A++++%40name%2C+%40age+%3D+name%2C+age%0A++end%0A++%0A++attr_reader+%3Aname%2C+%3Aage%0Aend%0A%0AUser.new%28name%3A+%22John%22%2C+age%3A+20%29&rbs=).  (TypeProf corre al lado del servidor, así que ¡disculpe si no está operando!)

Ver detalles en [la documentación de TypeProf](https://github.com/ruby/typeprof/blob/master/doc/doc.md)
y en [las demostraciones](https://github.com/ruby/typeprof/blob/master/doc/demo.md).

TypeProf es experimental y aún no es una herramienta madura, sólo soporta un
subconjunto del lenguaje Ruby y la detección de errores de tipos es limitada.
Pero está creciendo rapidamente para mejorar la cobertura de las
características del lenguaje, el desempeño del análisis y la usabilidad.
Toda retroalimentación es bienvenida.


## Otras características notables

* El reconocimiento de patrones en una línea se ha rediseñado (experimental)

  * se añade `=>`.  Puede usarse como una asignación al lado derecho.

    ```ruby
    0 => a
    p a #=> 0

    {b: 0, c: 1} => {b:}
    p b #=> 0
    ```

  * `in` se ha cambiado para retornar `true` o `false`.

    ``` ruby
    # version 3.0
    0 in 1 #=> false

    # version 2.7
    0 in 1 #=> raise NoMatchingPatternError
    ```

* Se agrega un patrón Encontrar (__Find__). (experimental)

  ``` ruby
  case ["a", 1, "b", "c", 2, "d", "e", "f", 3]
  in [*pre, String => x, String => y, *post]
    p pre  #=> ["a", 1]
    p x    #=> "b"
    p y    #=> "c"
    p post #=> [2, "d", "e", "f", 3]
  end
  ```

* Se agrega una definición de métodos que no requiere `end`.

  ``` ruby
  def cuadrado(x) = x * x
  ```

* `Hash#except` ahora es un método incorporado.

  ``` ruby
  h = { a: 1, b: 2, c: 3 }
  p h.except(:a) #=> {:b=>2, :c=>3}
  ```

* __Memory view__ se agrega como característica experimental

    * Este es un nuevo conjunto de llamados en la API de C para intercambiar
    áreas de memoria puras, como arreglos numéricos o mapas de bits de imagenes,
    entre las librerías que son extensiones.
    Las librerías que son extensiones pueden compartir también los
    metadatos del área de memoria que constan de la forma, el formato del
    elemento y así sucesivamente.  Usando esta clase de metadatos, las
    librerías que son extensiones pueden compartir apropiadamente incluso un
    arreglo multidimensional.  Esta nueva característica se diseñó empleando
    como referencia el protocolo de colchón (__buffer__ ) de Python.


## Mejoras en desempeño

* Pegar código largo en IRB es 53 veces más rápido que con Ruby 2.7.0.
  Por ejemplo el tiempo requerido para pegar [este código de ejemplo](https://gist.github.com/aycabta/30ab96334275bced5796f118c9220b0b)
  pasa de 11.7 segundos a 0.22 segundos.

<video autoplay="autoplay" controls="controls" muted="muted" width="764" height="510" poster="https://cache.ruby-lang.org/pub/media/ruby-3.0-irb-highspeed.png">
  <source src="https://cache.ruby-lang.org/pub/media/ruby-3.0-irb-highspeed.mp4" type="video/mp4">
</video>

* A IRB se le ha añadido la orden `measure`. Permite una medición sencilla del tiempo
  de ejecución.

  ```
  irb(main):001:0> 3
  => 3
  irb(main):002:0> measure
  TIME is added.
  => nil
  irb(main):003:0> 3
  processing time: 0.000058s
  => 3
  irb(main):004:0> measure :off
  => nil
  irb(main):005:0> 3
  => 3
  ```

## Otros cambios notables desde 2.7

* Los argumentos de palabra clave se separan de otros argumentos.
  * En principio, el código que presente una advertencia en Ruby 2.7 no
  funcionará.  Ver detalles en
  [este documento](https://www.ruby-lang.org/es/news/2019/12/12/separation-of-positional-and-keyword-arguments-in-ruby-3-0/).
  * Por cierto, el re-envío de argumentos ahora soporta argumentos principales.

    ``` ruby
    def method_missing(meth, ...)
      send(:"do_#{ meth }", ...)
    end
    ```

* El reconocimiento de patrones (`case`/`in`) ya no es experimental.
  * Ver detalles en el [documento del reconocimiento de patrones](https://docs.ruby-lang.org/en/3.0/syntax/pattern_matching_rdoc.html).

* La característica `$SAFE` se eliminó por completo; ahora es una variable
  global normal.

* El orden de la traza de llamados (__backtrace__) se había invertido
  en Ruby 2.5, pero esto se ha revertido.  Ahora las trazas de llamados se
  comportan como en Ruby 2.4; se imprime primero un mensaje de error y el número
  de línea donde ocurrió la excepción; las funciones que había hecho la llamada
  se imprimen después.


* Se actualizaron algunas librerías estándar.
  * RubyGems 3.2.3
  * Bundler 2.2.3
  * IRB 1.3.0
  * Reline 0.2.0
  * Psych 3.3.0
  * JSON 2.5.1
  * BigDecimal 3.0.0
  * CSV 3.1.9
  * Date 3.1.0
  * Digest 3.0.0
  * Fiddle 1.0.6
  * StringIO 3.0.0
  * StringScanner 3.0.0
  * etc.

* Las siguientes librerías ya no son gemas distribuidas con ruby. Instale las
  gemas correspondientes para usar sus funcionalidades.
  * sdbm
  * webrick
  * net-telnet
  * xmlrpc

* Las siguientes gemas por omisión ahora se distribuyen con Ruby.
  * rexml
  * rss

* Los siguientes archivos de stdlib  ahora son gemas y se publicaron en
  rubygems.org.
  * English
  * abbrev
  * base64
  * drb
  * debug
  * erb
  * find
  * net-ftp
  * net-http
  * net-imap
  * net-protocol
  * open-uri
  * optparse
  * pp
  * prettyprint
  * resolv-replace
  * resolv
  * rinda
  * set
  * securerandom
  * shellwords
  * tempfile
  * tmpdir
  * time
  * tsort
  * un
  * weakref
  * digest
  * io-nonblock
  * io-wait
  * nkf
  * pathname
  * syslog
  * win32ole


Ver más detalles en el archivo
[NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
o [en la bitácora de contribuciones](https://github.com/ruby/ruby/compare/v2_7_0...{{ release.tag }})

Con estos cambios, [{{ release.stats.files_changed }} archivos cambiados, {{ release.stats.insertions }} inserciones(+), {{ release.stats.deletions }} eliminaciones(-)](https://github.com/ruby/ruby/compare/v2_7_0...{{ release.tag }}#file_bucket)
desde Ruby 2.7.0!

> Ruby3.0 es un hito. El lenguaje ha evolucionado, manteniendo compatibilidad.
Pero no es el final. Ruby seguirá progresando, y haciendose más grande.
¡Esté pendiente! --- Matz

!Feliz Navidad, Feliz Año Nuevo y disfrute programando con Ruby 3.0!

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

Ruby fue desarrollado inicialmente por Matz (Yukihiro Matsumoto) en 1993,
y ahora es desarrollado como código abierto. Corre en muchas
plataformas y se usa en todas partes del mundo especialmente para
desarrollo web.
