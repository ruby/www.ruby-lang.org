---
layout: news_post
title: "Publicado Ruby 3.0.0 versión previa 2"
author: "naruse"
translator: vtamara
date: 2020-12-08 00:00:00 +0000
lang: es
---

Nos complace anunciar la publicación de Ruby 3.0.0-preview2.

Introduce una serie de características nuevas y mejoras en
desempeño.

## Análisis Estático

###RBS

RBS es un lenguaje para describir los tipos de los programas Ruby.

Los verificadores de tipos, incluyendo TypeProf y otras herramientas
que soporten RBS entenderán mejor los programas Ruby con definiciones RBS.

Usted puede escribir la definición de clases y módulos: métodos que se
definen en la clase, variables de instancia y sus tipos, y relaciones
herencia/mix-in.

El objetivo de RBS es soportar los patrones que comúnmente se ven
en programas en Ruby y permitir escribir tipos avanzados incluyendo
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
# test.rb
class User
  def initialize(name:, age:)
    @name, @age = name, age
  end
  attr_reader :name, :age
end
User.new(name: "John", age: 20)
```

Salida de ejemplo:

```
$ typeprof test.rb
# Classes
class User
  attr_reader name : String
  attr_reader age : Integer
  def initialize : (name: String, age: Integer) -> [String, Integer]
end
```

Puede ejecutar TypeProf guardando el archivo de entrada como "test.rb" y
ejecutandolo como "typeprof test.rb".

También puede [probar TypeProf en línea](https://mame.github.io/typeprof-playground/#rb=%23+test.rb%0Aclass+User%0A++def+initialize%28name%3A%2C+age%3A%29%0A++++%40name%2C+%40age+%3D+name%2C+age%0A++end%0A++%0A++attr_reader+%3Aname%2C+%3Aage%0Aend%0A%0AUser.new%28name%3A+%22John%22%2C+age%3A+20%29&rbs=).  (TypeProf corre al lado del servidor, así que ¡disculpe si no está operando!)

Ver detalles en [la documentación](https://github.com/ruby/typeprof/blob/master/doc/doc.md) y en [demostraciones](https://github.com/ruby/typeprof/blob/master/doc/demo.md).

TypeProf es experimental y aún no es una herramienta madura, sólo soporta un
subconjunto del lenguaje Ruby, y la detección de errores en tipos es limitada.
Pero está creciendo rapidamente para mejorar la cobertura de las
características del lenguaje, el desempeño del análisis y la usabilidad.
Toda retroalimentación es bienvenida.

## Ractor (experimental)

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

El siguiente programita calcula `prime?` en paralelo con dos
ractores. Podrá comprobar que la ejecución es casi 2 veces más rápida
que la del programa secuencial en un computador paralelo.

``` ruby
require 'prime'

# n.prime? con enteros enviados en r1, r2 que corren en paralelo
r1, r2 = *(1..2).map do
  Ractor.new do
    n = Ractor.recv
    n.prime?
  end
end

# enviar parámetros
r1.send 2**61 - 1
r2.send 2**61 + 15

# esperar resultados de expr1 y expr2
p r1.take #=> true
p r2.take #=> true
```

Ver más detalles en
[doc/ractor.md](https://github.com/ruby/ruby/blob/master/doc/ractor.md).


## Planificador (__Scheduler__) de Fibras

Se introduce `Fiber#scheduler` para interceptar operaciones que bloquean.
Esto permite una concurrencia liviana sin cambiar el
código existente. Dar un vistazo general y ver como funciona en ["Don't Wait For Me, Scalable Concurrency for Ruby 3"](https://www.youtube.com/watch?v=Y29SSOS4UOc).

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

El actual punto de entrada para la concurrencia es
`Fiber.schedule{...}` sin embargo está sujeto a cambios para
cuando se publique Ruby 3.

(Explicar la gema Async con enlaces). Este programa de ejemplo realizará
varias peticiones HTTP de manera concurrente:
(Explicar esto:)
1. async es una gema exterior
2. async usa esta nueva característica

``` ruby
require 'async'
require 'net/http'
require 'uri'
Async do
  ["ruby", "python", "c"].each do |topic|
    Async do
      Net::HTTP.get(URI "https://www.google.com/search?q=#{topic}")
    end
  end
end
```


## Otras características notables

* El reconocimiento de patrones en una línea ahora usa `=>` en lugar
  de `in`.

  ``` ruby
   # version 3.0
    {a: 0, b: 1} => {a:}
    p a # => 0
    # version 2.7
    {a: 0, b: 1} in {a:}
    p a # => 0
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
    áreas de memoria puras entre las librerías que son extensiones, por
    ejemplo para intercambiar un arreglo numérico con un mapa de bits.
    Las librerías que son extensiones pueden compartir también los
    metadatos del área de memoria que constan de la forma, el formato del
    elemento y así sucesivamente.  Usando esta clase de metadatos, las
    librerías que son extensiones pueden compartir apropiadamente incluso un
    arreglo multidimensional.  Esta nueva característica se diseñó empleando
    como referencia el protocolo de colchón (__buffer__ ) de Python.

## Mejoras en desempeño

* Se implemetaron muchas mejoras en MJIT. Ver detalles en el archivo
  NEWS.
* Pegar código largo en IRB es 53 veces más rápido que con Ruby 2.7.0.
  Por ejemplo el tiempo requerido para pegar [este código de ejemplo](https://gist.github.com/aycabta/30ab96334275bced5796f118c9220b0b)
  pasa de 11.7 segundos a 0.22 segundos.


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

* La característica `$SAFE` se eliminó por completo; ahora es una variable
  global normal.

* El orden de la traza de llamados (__backtrace__) se había invertido
  en Ruby 2.5, pero esto se ha revertido.  Ahora se comporta como
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

* Los siguientes archivos de stdlib ahora son gemas y se publicaron en
  rubygems.org.
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
[NEWS](https://github.com/ruby/ruby/blob/v3_0_0_preview2/NEWS.md)
o [en la bitácora de contribuciones](https://github.com/ruby/ruby/compare/v2_7_0...v3_0_0_preview2).

{% assign release = site.data.releases | where: "version", "3.0.0-preview2" | first %}

Con estos cambios, [{{ release.stats.files_changed }} archivos cambiados, {{ release.stats.insertions }} inserciones(+), {{ release.stats.deletions }} eliminaciones(-)](https://github.com/ruby/ruby/compare/v2_7_0...v3_0_0)
desde Ruby 2.7.0!

¡Por favor pruebe Ruby 3.0.0-preview2, y denos cualquier retroalimentación!

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
desarrollos web.
