---
layout: news_post
title: "Ruby 2.7.0-preview2 Publicado"
author: "naruse"
translator: vtamara
date: 2019-10-22 12:00:00 +0000
lang: es
---

Nos complace anunciar la publicación de Ruby 2.7.0-preview2.

Es una versión previa que se publica para obtener retroalimentación sobre la
versión final planeada para Diciembre.
Introduce una serie de características nuevas y mejoras de desempeño,
las más notorias son:

* Compactar en el Recolector de Basura (GC)
* Reconocimiento de patrones
* Mejoras en REPL
* Separación de argumentos posicionales y con palabra clave

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
end
```

Puede ver más detalles en [Pattern matching - New feature in Ruby 2.7](https://speakerdeck.com/k_tsj/pattern-matching-new-feature-in-ruby-2-dot-7).

## Mejoras a REPL

`irb`, el ambiente interactivo incluido con Ruby
(REPL; Read-Eval-Print-Loop; Bucle-Leer-Evaluar-Presentar), ahora soporta
edición de múltiples líneas.
Es potenciado por `reline`, la implementación en puro Ruby de `readline`.
También provee integración con rdoc. En `irb` puede presentar el manual de
referencia para una clase dada, para un modulo o para un método.
[[Característica #14683]](https://bugs.ruby-lang.org/issues/14683),
[[Característica #14787]](https://bugs.ruby-lang.org/issues/14787),
[[Característica #14918]](https://bugs.ruby-lang.org/issues/14918)
Además, ahora se presentan con colores tanto el código fuente de su programa
al iniciar una sesión IRB con `binding.irb` como los resultados de
inspeccionar los objetos de las clases del núcleo de ruby.

<video autoplay="autoplay" controls="controls" muted="muted" width="576" height="259">
  <source src="https://cache.ruby-lang.org/pub/media/irb_improved_with_key_take2.mp4" type="video/mp4">
</video>

## Separación de argumentos posicionales y con palabra clave

Se desecha la conversión automática de argumentos con palabra clave a
argumentos posicionales, y tal conversión se eliminará en Ruby 3.
[[Característica #14183]](https://bugs.ruby-lang.org/issues/14183)

* Si la llamada a un método pasa un diccionario (Hash) cómo último
  argumento y si no pasa palabras clave, y si el método llamado
  acepta palabras clave, se emitirá una advertencia.
  Para mantener la palabra clave en la definición de la función, agregue un
  operador doble splat all llamarla para evitar la advertencia y asegurar el
  comportamiento correcto en Ruby 3.

  ```ruby
  def foo(key: 42); end; foo({key: 42})   # advertencia
  def foo(**kw);    end; foo({key: 42})   # advertencia
  def foo(key: 42); end; foo(**{key: 42}) # OK
  def foo(**kw);    end; foo(**{key: 42}) # OK
  ```

* Si la llamada a un método pasa palabras clave a un método que acepta
  palabras clave, pero no pasa suficientes argumentos posicionales,
  las palabras clave se tratarán como los argumentos posicionales finales
  que requiera el método pero se emitirá una advertencia.
  Pase los argumentos como un diccionario en lugar de palabras clave para
  evitar la advertencia y asegurar el comportamiento correcto en Ruby 3.

  ```ruby
  def foo(h, **kw); end; foo(key: 42)      # warned
  def foo(h, key: 42); end; foo(key: 42)   # warned
  def foo(h, **kw); end; foo({key: 42})    # OK
  def foo(h, key: 42); end; foo({key: 42}) # OK
  ```

* Si un método acepta palabras clave especificas, pero no una palabra
  clave splat, y si se pasa un diccionario o palabra clave splat al método
  que incluye unas llaves que son símbolos y otras que no son símbolos,
  el diccionario seguirá siendo dividido y se emitirá una advertencia.
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

* Las cadenas que no sean símbolos se aceptarán como argumentos con
  palabras clave si el método acepta palabras clave arbitrarias.
  [[Característica #14183]](https://bugs.ruby-lang.org/issues/14183)

  ```ruby
  def foo(**kw); p kw; end; foo("str" => 1) #=> {"str"=>1}
  ```

* <code>**nil</code> se permite en la definición de métodos para marcar
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

* Si se pasa una palabra clave splat a un método que no acepta
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

## Otras caracerísticas nuevas y notables

* Un operador para referenciar un método, <code>.:</code>, se introduce
  como característica experimental.
  [[Característica #12125]]( https://bugs.ruby-lang.org/issues/12125),
  [[Característica #13581]]( https://bugs.ruby-lang.org/issues/13581)

* Como característica experimental se introducen paramétros numerados como
  párametros por omisión en bloques.
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

* Ahora se permite llamar un método privado con`self`.
  [[Característica #11297]](https://bugs.ruby-lang.org/issues/11297),
  [[Característica #16123]](https://bugs.ruby-lang.org/issues/16123)

  ```ruby
  def foo
  end
  private :foo
  self.foo
  ```

* Se añade `Enumerator::Lazy#eager`.  Que genera un enumerador no-perezoso
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
    experimetnal y muchos métodos aún no se consideran puros.

  * El valor por omisión de `--jit-min-calls` cambió de 5 a 10,000

  * El valor por omisión de `--jit-max-cache` cambió de 1,000 a 100

* `Symbol#to_s`, `Module#name`, `true.to_s`, `false.to_s` and `nil.to_s` ahora
  retornan una cadena congelada. La cadena retornada es siempre la misma para
  un objeto dado. [Experimental]
  [[Característica#16150]](https://bugs.ruby-lang.org/issues/16150)

* Se mejora el desempeño de `CGI.escapeHTML`.
  [GH-2226](https://github.com/ruby/ruby/pull/2226)

## Otros cambios notables desde la versión 2.6

* Se actualizaron algunas librerías estándar
  * Bundler 2.1.0.pre.1
  * RubyGems 3.1.0.pre.1
  * CSV 3.1.2 ([NEWS](https://github.com/ruby/csv/blob/v3.1.2/NEWS.md))
  * Racc 1.4.15
  * REXML 3.2.3 ([NEWS](https://github.com/ruby/rexml/blob/v3.2.3/NEWS.md))
  * RSS 0.2.8 ([NEWS](https://github.com/ruby/rss/blob/v0.2.8/NEWS.md))
  * StringScanner 1.0.3
  * Algunas de las otras librerías que no tienen versión original también se
    actualizaron.

* `Proc.new` y `proc` sin bloque en un método llamado con un bloque produce
  una advertencia.

* `lambda` sin un bloque en un método llamado con un bloque produce un error.

* Actualizada la versión de Unicode y de Emoji de 11.0.0 a 12.0.0.
  [[Característica #15321]](https://bugs.ruby-lang.org/issues/15321)

* Actualizada la versión de Unicode a 12.1.0, añadiendo soporte para
  U+32FF SQUARE ERA NAME REIWA.
  [[Característica #15195]](https://bugs.ruby-lang.org/issues/15195)

* `Date.jisx0301`, `Date#jisx0301`, y `Date.parse` soportan la nueva era
  japonesa.  [[Característica#15742]](https://bugs.ruby-lang.org/issues/15742)

* Requiere compiladores que soporten C99
  [[Misc #15347]](https://bugs.ruby-lang.org/issues/15347)
  * Detalles de nuestro dialecto en: <https://bugs.ruby-lang.org/projects/ruby-master/wiki/C99>

Vea más detalles en el archivo [NEWS](https://github.com/ruby/ruby/blob/v2_7_0_preview1/NEWS) o en [la bitácora de cambios](https://github.com/ruby/ruby/compare/v2_6_0...v2_7_0_preview2).

¡Estos cambios constan de [3670 archivos cambiados, 201242 inserciones(+), 88066 eliminaciones(-)](https://github.com/ruby/ruby/compare/v2_6_0...v2_7_0_preview2) desde Ruby 2.6.0!

¡Disfrute programando con Ruby 2.7!

## Descargas

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview2.tar.bz2>

      SIZE:   14555229 bytes
      SHA1:   7d9eed71115acfc8851747517904c1c6809872a9
      SHA256: 417c84346ba84d664a13833c94c6d9f888c89bb9bee9adf469580441eaede30b
      SHA512: 7066ececebbbba4b2933ba1a4f70cdef373169910802259a3e52b4fc144ba298f3cffda4be5fe8a7be8ef769ed43076fa046a9ac2c13bb733475b9852112c6f0

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview2.tar.gz>

      SIZE:   16622499 bytes
      SHA1:   5e998eb37ef54e650c0206184d56f506359d5477
      SHA256: bda4b8dc340fad425c8099400fe3ef8e7393837d7e6e1bfae41843d1d938ebc4
      SHA512: dbf05d6ddab59062f507342b25b8c21670b02bdd49e77bda947870607f4bf9049e5e7ddfde6bbce2e1749ca92568da9be3e5f30601b1eb450f10d8add952239a

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview2.tar.xz>

      SIZE:   11874200 bytes
      SHA1:   4356e1726027795a5c6b08572bb37bcb5a8c55d6
      SHA256: fa39f088331f6d505154aa9d025aab177fdffedfbbabccd900b8c02e745bc077
      SHA512: a057a186d85fcdf123abd69d584ef3adb20ad4397521e14306395d34102c3d818fe2d34a6476db01effcde479da9a77076cbb6d30bca40f1471ce3f5d3a995a9

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview2.zip>

      SIZE:   20576618 bytes
      SHA1:   891b70ec76e9e776774a49b3ce24832a944422b3
      SHA256: 81a240bead4438b064cb4cde562b483b82ec8e414bac057a6df43df5a247545c
      SHA512: 1a8d4503374d31abf43182e2af6902ea6e5295f55d539415c8268b1d6a0fa83a975648c225ae986e687d5283dc2d180cf1e608841485506e4b0ac5efc154949a

## ¿Qué es Ruby?

Ruby fue desarrollado primero por Matz (Yukihiro Matsumoto) en 1993, y ahora
es desarrollado como Código Abierto.
Corre en múltiples plataformas y se usa en todo el mundo especialmente
para desarrollo web.
