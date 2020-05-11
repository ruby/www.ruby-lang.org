---
layout: news_post
title: "Ruby 2.7.0-rc2 Publicado"
author: "naruse"
translator: vtamara
date: 2019-12-21 12:00:00 +0000
lang: es
---

{% assign release = site.data.releases | where: "version", "2.7.0-rc2" | first %}

Nos complace anunciar la publicación de Ruby 2.7.0-rc2.

Una versión candidata se publica para recibir retroalimentación sobre la
versión final planeada para Diciembre 25.

También introduce una serie de características nuevas y mejoras de desempeño,
las más notorias son:

* Reconocimiento de patrones
* Mejoras en REPL
* Compactar en el Recolector de Basura (GC)
* Separación de argumentos posicionales y de palabra clave

## Reconocimiento de patrones [Experimental]

El reconocimiento de patrones, es una característica ampliamente usada en
lenguajes de programación funcional, se introduce como característica
experimental.
[[Característica #14912]](https://bugs.ruby-lang.org/issues/14912)

Puede recorrer un objeto dado y asignar su valor si concuerda con un patrón.

```ruby
json ='{
  "nombre": "Alice",
  "edad": 30,
  "hijos": [
    {
      "nombre": "Bob",
      "edad": 2
    }
  ]
}'
case JSON.parse(json, symbolize_names: true)
in {nombre: "Alice", hijos: [{nombre: "Bob", edad: edad}]}
  p edad
  ...
end
```

Puede ver más detalles en [Pattern matching - New feature in Ruby 2.7](https://speakerdeck.com/k_tsj/pattern-matching-new-feature-in-ruby-2-dot-7).

## Mejoras a REPL

`irb`, el ambiente interactivo incluido con Ruby
(REPL; Read-Eval-Print-Loop; Bucle-Leer-Evaluar-Presentar), ahora soporta
edición de múltiples líneas.
Es potenciado por la gema `reline`, implementanda en Ruby puro y
compatible con la librería `readline`.
También provee integración con rdoc. En `irb` puede presentar el manual de
referencia para una clase dada, para un modulo o para un método.
[[Característica #14683]](https://bugs.ruby-lang.org/issues/14683),
[[Característica #14787]](https://bugs.ruby-lang.org/issues/14787),
[[Característica #14918]](https://bugs.ruby-lang.org/issues/14918)

Además, ahora se presentan con colores tanto el código fuente de su programa
al iniciar una sesión IRB con `Binding#irb` como los resultados de
inspeccionar los objetos de las clases del núcleo de ruby.

<video autoplay="autoplay" controls="controls" muted="muted" width="576" height="259">
  <source src="https://cache.ruby-lang.org/pub/media/irb_improved_with_key_take2.mp4" type="video/mp4">
</video>

## Compactar en el recolector de basura (GC)

Esta versión introduce compactar en el recolector de basura, que
defragmenta un espacio de memoria fragmentado.

Algunos programas Ruby de múltiples hilos pueden causar fragmentación en la
memoria, que conlleva a un alto uso de la memoria y a que se degrade
la velocidad.

El método `GC.compact` se introduce para compactar el montón (heap). Esta
función compacta los objetos vivos en el montón de forma que usen menos
páginas y que el montón sea más amigable con la técnica de administración
de recursos compartidos "Copiar ante Escritura" (Copy on Write o CoW).
[[Característica #15626]](https://bugs.ruby-lang.org/issues/15626)


## Separación de argumentos posicionales y de palabra clave

Se desecha la conversión automática de argumentos de palabra clave a
argumentos posicionales, y tal conversión se eliminará en Ruby 3.
[[Característica #14183]](https://bugs.ruby-lang.org/issues/14183)

* Si la llamada a un método pasa un diccionario (Hash) cómo último
  argumento y si no pasa palabras clave, y si el método llamado
  acepta palabras clave, se emitirá una advertencia.
  Para seguir tratando el diccionario como palabras clave, agregue un
  operador doble splat al llamar para evitar la advertencia y asegurar el
  comportamiento correcto en Ruby 3.

  ```ruby
  def foo(key: 42); end; foo({key: 42})   # advertencia
  def foo(**kw);    end; foo({key: 42})   # advertencia
  def foo(key: 42); end; foo(**{key: 42}) # OK
  def foo(**kw);    end; foo(**{key: 42}) # OK
  ```

* Si la llamada a un método pasa palabras clave a un método que acepta
  palabras clave, pero no pasa suficientes argumentos posicionales
  requeridos, las palabras clave se tratarán como los
  argumentos posicionales finales que requiera el método
  pero se emitirá una advertencia.
  Pase el argumento como un diccionario en lugar de palabras clave para
  evitar la advertencia y asegurar el comportamiento correcto en Ruby 3.

  ```ruby
  def foo(h, **kw); end; foo(key: 42)      # warned
  def foo(h, key: 42); end; foo(key: 42)   # warned
  def foo(h, **kw); end; foo({key: 42})    # OK
  def foo(h, key: 42); end; foo({key: 42}) # OK
  ```

* Si un método acepta palabras clave especificas, pero no una palabra
  clave splat, y si en la llamada al método se pasa un diccionario
  o palabra clave  con unas llaves que sean símbolos y otras que no
  sean símbolos, el diccionario será dividido y se emitirá una advertencia.
  Tendrá que actualizar el código que hace la llamada para pasar diccionarios
  separados y asegurar el comportamiento correcto en Ruby 3.

  ```ruby
  def foo(h={}, key: 42); end; foo("key" => 43, key: 42)   # warned
  def foo(h={}, key: 42); end; foo({"key" => 43, key: 42}) # warned
  def foo(h={}, key: 42); end; foo({"key" => 43}, key: 42) # OK
  ```

* Si un método no acepta palabras clave, y se llama con palabras clave,
  las palabras clave se tratarán como un diccionario posicional, sin
  advetencias.  Este comportamiento seguirá operando en Ruby 3.

  ```ruby
  def foo(opt={});  end; foo( key: 42 )   # OK
  ```

* Las cadenas que no sean símbolos se aceptarán como llaves en
  argumentos de palabra clave si el método acepta palabras clave
  arbitrarias.
  [[Característica #14183]](https://bugs.ruby-lang.org/issues/14183)

  ```ruby
  def foo(**kw); p kw; end; foo("str" => 1) #=> {"str"=>1}
  ```

* `**nil` se permite en la definición de métodos para marcar
  explicitamente que el método no acepta palabras clave.  Llamar
  a un método así con palabras clave resultará en un `ArgumentError`.
  [[Característica #14183]](https://bugs.ruby-lang.org/issues/14183)

  ```ruby
  def foo(h, **nil); end; foo(key: 1)       # ArgumentError
  def foo(h, **nil); end; foo(**{key: 1})   # ArgumentError
  def foo(h, **nil); end; foo("str" => 1)   # ArgumentError
  def foo(h, **nil); end; foo({key: 1})     # OK
  def foo(h, **nil); end; foo({"str" => 1}) # OK
  ```

* Si se pasa una palabra clave splat vacía a un método que no acepta
  palabras clave, ya no pasará un diccionario vacío, a menos que el
  diccionario vacío sea necesario para una parámetro requerido, en cuyo
  caso se emite una advertencia.  Elimine el doble splat para continuar
  pasando un diccionario posicional.
  [[Característica #14183]](https://bugs.ruby-lang.org/issues/14183)

  ```ruby
  h = {}; def foo(*a) a end; foo(**h) # []
  h = {}; def foo(a) a end; foo(**h)  # {} and warning
  h = {}; def foo(*a) a end; foo(h)   # [{}]
  h = {}; def foo(a) a end; foo(h)    # {}
  ```

NOTA: Muchos mensajes de obsolecencia por incompatibilidades de
argumentos de palabra clave han sido señalados de ser muy extensos.
En el momento, se discuten dos soluciones posibles; deshabilitar los
mensajes de obsolecencia por omisión
([#16345](https://bugs.ruby-lang.org/issues/16345))
o suprimir las advertencias duplicadas
([#16289](https://bugs.ruby-lang.org/issues/16289)).
La decisión final no se ha tomado, pero se adoptará una con
la versión oficial.

## Otras caracerísticas nuevas y notables

* Un operador para referenciar un método, <code>.:</code>, se introdujo
  como característica experimental en versiones preview anteriores,
  pero se ha revertido.
  [[Característica #12125]]( https://bugs.ruby-lang.org/issues/12125),
  [[Característica #13581]]( https://bugs.ruby-lang.org/issues/13581)
  [[Característica #16275]](https://bugs.ruby-lang.org/issues/16275)

* Como característica experimental se introducen paramétros numerados como
  parámetros por omisión en bloques.
 [[Característica #4475]](https://bugs.ruby-lang.org/issues/4475)

* Un rango sin inicio se introduce de forma experimental.  Podría no ser tan
  útil como un rango sin terminación, pero es bueno para lenguajes
  específicos para un domino (DSL).
  [[Característica #14799]](https://bugs.ruby-lang.org/issues/14799)

  ```ruby
  ary[..3]  # identico a ary[0..3]
  rel.where(ventas: ..100)
  ```

* Se añade `Enumerable#tally`.  Que cuenta las ocurrencias de cada elemento.

  ```ruby
  ["a", "b", "c", "b"].tally
  #=> {"a"=>1, "b"=>2, "c"=>1}
  ```

* Ahora se permite llamar un método privado con un literal `self` como
  receptor.
  [[Característica #11297]](https://bugs.ruby-lang.org/issues/11297),
  [[Característica #16123]](https://bugs.ruby-lang.org/issues/16123)

  ```ruby
  def foo
  end
  private :foo
  self.foo
  ```

* Se añade `Enumerator::Lazy#eager` que genera un enumerador no-perezoso
  a partir de un enumerador perezoso.
  [[Característica #15901]](https://bugs.ruby-lang.org/issues/15901)

  ```ruby
  a = %w(foo bar baz)
  e = a.lazy.map {|x| x.upcase }.map {|x| x + "!" }.eager
  p e.class               #=> Enumerator
  p e.map {|x| x + "?" }  #=> ["FOO!?", "BAR!?", "BAZ!?"]
  ```

## Mejoras en desempeño

* JIT [Experimental]

  * El código compilado con JIT es recompilado a uno menos optimizado cuando
   los supuestos de la optimización dejan de ser válidos.

  * Un método se puede ejecutar en línea (method inlining o inserción en lugar
    de llamado) cuando un método se considera puro.  Esta optimización aún es
    experimental y muchos métodos aún NO se consideran puros.

  * El valor por omisión de `--jit-min-calls` cambió de 5 a 10,000

  * El valor por omisión de `--jit-max-cache` cambió de 1,000 a 100

* `Module#name`, `true.to_s`, `false.to_s`
  y `nil.to_s` ahora siempre retornan una cadena congelada.
  La cadena retornada es siempre la misma para
  un objeto dado. [Experimental]
  [[Característica#16150]](https://bugs.ruby-lang.org/issues/16150)

* Se mejora el desempeño de `CGI.escapeHTML`.
  [GH-2226](https://github.com/ruby/ruby/pull/2226)

* Se mejora el desempeño de `Monitor y MonitorMixin
  [[Característica #16255]](https://bugs.ruby-lang.org/issues/16255)

## Otros cambios notables desde la versión 2.6

* Se actualizaron algunas librerías estándar
  * Bundler 2.1.0.pre.3
    ([Historia](https://github.com/bundler/bundler/blob/2-1-stable/CHANGELOG.md#210pre3-november-8-2019))
  * RubyGems 3.1.0.pre.3
    ([Historia](https://github.com/rubygems/rubygems/blob/3.1/History.txt))
  * CSV 3.1.2
    ([NOVEDADES](https://github.com/ruby/csv/blob/v3.1.2/NEWS.md))
  * Racc 1.4.15
  * REXML 3.2.3
    ([NOVEDADES](https://github.com/ruby/rexml/blob/v3.2.3/NEWS.md))
  * RSS 0.2.8
    ([NOVEDADES](https://github.com/ruby/rss/blob/v0.2.8/NEWS.md))
  * StringScanner 1.0.3
  * Algunas de las otras librerías que no tienen versión original también se
    actualizaron.

* Se promovieron de stdlib a gemas por omisión
  * Las siguientes gemas por omisión se publicaron en rubygems.org
    * benchmark
    * cgi
    * delegate
    * getoptlong
    * net-pop
    * net-smtp
    * open3
    * pstore
    * singleton
  * Las siguientes gemas por omisión se promovieron en ruby-core pero
    aún no se han publicado en rubygems.org
    * monitor
    * observer
    * timeout
    * tracer
    * uri
    * yaml

* `Proc.new` y `proc` sin bloque en un método llamado con un bloque
   ahora produce una advertencia.

* `lambda` sin un bloque en un método llamado con un bloque lanza
   una excepción.

* Actualizada la versión de Unicode y de Emoji de 11.0.0 a 12.0.0.
  [[Característica #15321]](https://bugs.ruby-lang.org/issues/15321)

* Actualizada la versión de Unicode a 12.1.0, añadiendo soporte para
  U+32FF SQUARE ERA NAME REIWA.
  [[Característica #15195]](https://bugs.ruby-lang.org/issues/15195)

* `Date.jisx0301`, `Date#jisx0301`, y `Date.parse` soportan la nueva era
  japonesa.  [[Característica#15742]](https://bugs.ruby-lang.org/issues/15742)

* Requiere compiladores que soporten C99.
  [[Misc #15347]](https://bugs.ruby-lang.org/issues/15347)
  * Detalles de nuestro dialecto en: <https://bugs.ruby-lang.org/projects/ruby-master/wiki/C99>

Vea más detalles en el archivo [NEWS](https://github.com/ruby/ruby/blob/v2_7_0_rc2/NEWS)
o en [la bitácora de cambios](https://github.com/ruby/ruby/compare/v2_6_0...v2_7_0_rc2).

Con estos cambios, [{{ release.stats.files_changed }} archivos modificados, {{ release.stats.insertions }} inserciones(+), {{ release.stats.deletions }} eliminaciones (-)](https://github.com/ruby/ruby/compare/v2_6_0...v2_7_0_rc2)
desde Ruby 2.6.0!

¡Disfrute programando con Ruby 2.7!

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

## ¿Qué es Ruby?

Ruby fue desarrollado primero por Matz (Yukihiro Matsumoto) en 1993, y ahora
es desarrollado como Código Abierto.
Corre en múltiples plataformas y se usa en todo el mundo especialmente
para desarrollo web.
