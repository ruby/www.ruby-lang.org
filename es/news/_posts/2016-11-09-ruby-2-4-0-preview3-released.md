---
layout: news_post
title: "Liberado Ruby 2.4.0-preview3"
author: "naruse"
translator: "Fernando Perales"
date: 2016-11-09 09:00:00 +0000
lang: es
---

Nos complace anunciar el lanzamiento de Ruby 2.4.0-preview3.

Ruby 2.4.0-preview3 es las tercer versión preelimiar de Ruby 2.4.0.
Esta versión preview3 es liberada para obtener retroalimentación de la comunidad.
Tómate la libertad de
[enviar tus comentarios](https://github.com/ruby/ruby/wiki/How-To-Report)
ya que aún puedes influir en las funcionalidades.

## [Presentamos una mejora a las tablas de hash por Vladimir Makarov](https://bugs.ruby-lang.org/issues/12142)

Se mejora la estructura interna de las tablas de hash (st_table) al agregar direccionamiento
abierto y arreglos con orden de inclusión.
Esta mejora se discute con varias personas, especialmente con Yura Sokolov.

## Binding#irb: Inicia una sesión de REPL al igual que `binding.pry`

Cuando estás depurando código, quizá usas `p` frecuentemente para ver el valor de las variables.
Al usar [pry](https://github.com/pry/pry) y escribir `binding.pry` en tu aplicación, se inicia un ciclo
REPL (Lectura-Evaluación-Impresión) donde puedes correr código de Ruby.
[r56624](https://github.com/ruby/ruby/commit/493e48897421d176a8faf0f0820323d79ecdf94a) añade `binding.irb` que se
comporta de la misma manera con irb.

## [Unificación de Fixnum y Bignum en Integer](https://bugs.ruby-lang.org/issues/12005)

A pesar de que [ISO/IEC 30170:2012](http://www.iso.org/iso/iso_catalogue/catalogue_tc/catalogue_detail.htm?csnumber=59579) no especifica detalles sobre la clase Integer,
Ruby tuvo dos clases visibles para Integer: Fixnum y Bignum.
Ruby 2.4 las unifica en Integer.
Todas las extensiones que tocan las clases Fixnum o Bignum necesitan ser reparadas.

Ve también [el incidente](https://bugs.ruby-lang.org/issues/12005) y la [presentación de akr](http://www.a-k-r.org/pub/2016-09-08-rubykaigi-unified-integer.pdf).

## [String soporta casos de mapeo en Unicode](https://bugs.ruby-lang.org/issues/10085)

`String/Symbol#upcase/downcase/swapcase/capitalize(!)` ahora manejan
los casos de mapeo de Unicode en vez de únicamente los casos de mapeo de ASCII.

## Mejoras de rendimiento

Ruby 2.4 también tiene las siguientes mejores de rendimiento incluyendo cambios
en el lenguage:

### [Array#max, Array#min](https://bugs.ruby-lang.org/issues/12172)

`[x, y].max` y `[x, y].min` están optimizados para no crear un arreglo vacío temporal
bajo ciertas condiciones.

### [Regexp#match?](https://bugs.ruby-lang.org/issues/8110)

Se añade `Regexp#match?`, ejecuta una comparación con expresiones regulares sin crear
un objeto de referencia y cambia $~ para ejecutar asignación de memoria.

### Otras mejoras al rendimiento

* [incrementa la velocidad de acceso a variables de instancia](https://bugs.ruby-lang.org/issues/12274)

## Depuración

### [Thread#report_on_exception y Thread.report_on_exception](https://bugs.ruby-lang.org/issues/6647)

Ruby ignora excepciones en hilos a menos que otro hilo se les una explicitamente.
Con `report_on_exception = true`,
puedes darte cuenta si un hilo ha muerto debido a una excepción no controlada.

Mándanos tu retroalimentación sobre cuál debería ser el comportamiento
predeterminado para `report_on_exception` y sobre report-on-GC, que
muestra un reporte cuando un hilo es recogido por el recolector de basura sin unirse.

### [Detección de deadlocks en hilos ahora muestra los hilos con sus trazas y depencencias](https://bugs.ruby-lang.org/issues/8214)

Ruby tiene detección de deadlocks en los hilos que están a la espera, pero este reporte
no incluye suficiente información para depuración.
La detección de deadlocks en Ruby 2.4 muestra los hilos con sus respectivas trazas e hilos dependientes.

¡Prueba y disfruta programar con Ruby 2.4.0-preview3, y
[envíanos retroalimentación](https://github.com/ruby/ruby/wiki/How-To-Report)!

## Otros cambios notables desde 2.3

* Soporte para OpenSSL 1.1.0
* ext/tk fue removido de stdlib [Funcionalidad #8539](https://bugs.ruby-lang.org/issues/8539)
* XMLRPC fue removido de stdlib [Funcionalidad #12160](https://bugs.ruby-lang.org/issues/12160)

Ve [NEWS](https://github.com/ruby/ruby/blob/v2_4_0_preview3/NEWS)
y [ChangeLog](https://github.com/ruby/ruby/blob/v2_4_0_preview3/ChangeLog)
para todos los detalles.

¡Con estos cambios,
[2470 archivos cambiados, 283051 inserciones(+), 64902 supresiones(-)](https://github.com/ruby/ruby/compare/v2_3_0...v2_4_0_preview3)
desde Ruby 2.3.0!

## Descarga

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview3.tar.bz2>

      SIZE:   12615328 bytes
      SHA1:   fefe49f6a7d5b642936c324f3b05aaac827355db
      SHA256: 305a2b2c627990e54965393f6eb1c442eeddfa149128ccdd9f4334e2e00a2a52
      SHA512: 6602c65a7b1e3bc680acc48217108f4335e84fdd74a9cf06f2e2f9ad00a2fccacf9fa035a912bc9d5cc3f0c7a5e21475971dfac37b0364311ef3645f25c7ddf9

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview3.tar.gz>

      SIZE:   15758023 bytes
      SHA1:   f6a6ec9f7fedad0bf4efee2e42801cc963f60dca
      SHA256: c35fe752ccfabf69bf48e6aab5111c25a05938b428936f780638e2111934c9dd
      SHA512: 68556d5252b6813b4c8eeba32733e940207f80694b5c5d20e69bf01eb52929ed2466496b05a895a5ad4831d430695e17624eb35b728b2d4d7cf02df756ac48b4

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview3.tar.xz>

      SIZE:   9957596 bytes
      SHA1:   66592b1a52f985638d639e7c3dd6bdda4e0569d0
      SHA256: b14be2b5c80bff0d6894ae2b37afdb17a968413e70236ec860f3e2d670b4c317
      SHA512: 5be20f0b2609745790c2b22f2228e69a840f63c34a117a1f95fd5436af211f0a6db2758d513d3e095a2d97c53c80793579cb2a1e00e70cf72c487a88c4a40d33

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview3.zip>

      SIZE:   17579012 bytes
      SHA1:   15d08cff952da3844ae54887b7f74b12d47c9ee2
      SHA256: b95a8f67fb7d6e852db77c5660c8878c14d68eb72c5501dac164a7e640ecb06e
      SHA512: fa15e1b7ab0cab56c9a580e1b1e2fee250ee0b9c59546079675a1931a36e37131bd37d64033c75e05d8e9d9fcc33ce7850254d3acaca2136cf3bd08b070244f0

## Comentarios del lanzamiento

Mira también la agenda de lanzamientos y más información:

[ReleaseEngineering24](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering24)
