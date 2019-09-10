---
layout: page
title: "A Ruby desde PHP"
lang: es
---

PHP es muy utilizado para realizar aplicaciones web, pero si quieres
usar Ruby on Rails o simplemente quieres un lenguaje más orientado al
uso en general, vale la pena considerar Ruby.

### Similaridades

Como en PHP, en Ruby…

* las variables son dinámicamente tipadas, así que no tienes que
  preocuparte por declararlas.
* hay clases, y puedes controlar el acceso a ellas como en PHP 5
  (`public`, `protected` y `private`).
* algunas variables comienzan con $, pero no todas.
* también está `eval`.
* puedes usar el interpolado de strings. En vez de hacer `"$foo es un $bar"`,
  puedes hacer `"#{foo} es un #{bar}"`—al igual que en PHP,
  esto no aplica para los strings definidos con comillas simples.
* tienes “documentos internos” (“heredocs” en inglés).
* tienes excepciones, como PHP 5.
* hay una biblioteca estándar bastante grande.
* los arrays y hashes funcionan como se espera que lo hagan, si cambias
  `array()` por `{` y `}`\: `array('a' => 'b')` en Ruby es `{'a' =>
  'b'}`.
* `true` y `false` se comportan como en PHP, pero `null` se llama `nil`.

### Diferencias

A diferencia de PHP, en Ruby…

* hay tipado fuerte. Necesitarás utilizar `to_s`, `to_i`, etc. para
  convertir entre strings, integers y así en más, en vez de depender del
  lenguaje para que lo haga.
* los strings, números, arrays, hashes, etc. son objetos. En vez de
  utilizar `abs(-1)` se usa `-1.abs`.
* los paréntesis son opcionales en las llamadas a los métodos, excepto
  para clarificar qué parámetros van para qué método, cuando es
  necesario.
* en vez de usar condiciones de nombrado, como guiones bajos
  (underscores), la biblioteca estándar y las extensiones están
  organizadas en módulos y clases.
* la reflexión es una capacidad inherente de los objetos, no necesitas
  usar clases `Reflection` como con PHP 5.
* las variables son referencias.
* no hay clases `abstract` o interfaces.
* los hashes y arrays no son intercambiables.
* sólo `false` y `nil` son falsos: `0`, `array()` y `""`, son todos
  verdaderos en las condiciones lógicas.
* casi todo es una llamada a un método, incluso `raise` (equivalente a
  `throw` en PHP).
