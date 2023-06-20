---
layout: news_post
title: "Liberado Ruby 2.4.0-rc1"
author: "naruse"
translator: "Fernando Perales"
date: 2016-12-12 09:00:00 +0000
lang: es
---

Nos complace anunciar el lanzamiento de Ruby 2.4.0-rc1.

Ruby 2.4.0-rc1 es el primer candidato a lanzamiento de Ruby 2.4.0.
Esta versión rc1 es liberada para obtener retroalimentación de la comunidad.
Siéntete libre de
[enviar tu retroalimentación](https://github.com/ruby/ruby/wiki/How-To-Report)
ya que aún puedes arreglar las funcionalidades.

## [Presentamos una mejora a las tablas de hash por Vladimir Makarov](https://bugs.ruby-lang.org/issues/12142)

Se mejora la estructura interna de las tablas de hash (st_table) al agregar
direccionamiento abierto y arreglos con orden de inclusión. Esta mejora ha
sido discutida con varias personas, especialmente con Yura Sokolov.

## Binding#irb: Inicia una sesión de REPL al igual que `binding.pry`

Cuando estás depurando código, quizá usas `p` frecuentemente para ver
el valor de las variables.
Al usar [pry](https://github.com/pry/pry) y escribir `binding.pry` en
tu aplicación, se inicia un ciclo REPL (Lectura-Evaluación-Impresión)
donde puedes correr código de Ruby.
[r56624](https://github.com/ruby/ruby/commit/493e48897421d176a8faf0f0820323d79ecdf94a)
añade `binding.irb` que se comporta de la misma manera con irb.

## [Unificación de Fixnum y Bignum en Integer](https://bugs.ruby-lang.org/issues/12005)

A pesar de que [ISO/IEC 30170:2012](http://www.iso.org/iso/iso_catalogue/catalogue_tc/catalogue_detail.htm?csnumber=59579)
no especifica detalles sobre la clase Integer,
Ruby tuvo dos clases visibles para Integer: Fixnum y Bignum.
Ruby 2.4 las unifica en Integer.
Todas las extensiones que tocan las clases Fixnum o Bignum necesitan
ser reparadas.

Ve también [el incidente](https://bugs.ruby-lang.org/issues/12005) y la [presentación de akr](http://www.a-k-r.org/pub/2016-09-08-rubykaigi-unified-integer.pdf).

## [String soporta casos de mapeo en Unicode](https://bugs.ruby-lang.org/issues/10085)

`String/Symbol#upcase/downcase/swapcase/capitalize(!)` ahora manejan
los casos de mapeo de Unicode en vez de únicamente los casos de mapeo de ASCII.

## Mejoras de rendimiento

Ruby 2.4 también tiene las siguientes mejores de rendimiento incluyendo cambios
en el lenguage:

### [Array#max, Array#min](https://bugs.ruby-lang.org/issues/12172)

`[x, y].max` y `[x, y].min` están optimizados para no crear un arreglo vacío
temporal bajo ciertas condiciones.

### [Regexp#match?](https://bugs.ruby-lang.org/issues/8110)

Se añade `Regexp#match?`, ejecuta una comparación con expresiones regulares
sin crear un objeto de referencia y cambia `$~` para ejecutar asignación de
memoria.

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

Ruby tiene detección de deadlocks en los hilos que están a la espera, pero
este reporte no incluye suficiente información para depuración. La detección
de deadlocks en Ruby 2.4 muestra los hilos con sus respectivas trazas e hilos
dependientes.

¡Prueba y disfruta programar con Ruby 2.4.0-rc1, y
[envíanos retroalimentación](https://github.com/ruby/ruby/wiki/How-To-Report)!

## Otros cambios notables desde 2.3

* Soporte para OpenSSL 1.1.0 (se elimina el soporte para 0.9.7 o anterior)
* ext/tk fue removido de stdlib [Funcionalidad #8539](https://bugs.ruby-lang.org/issues/8539)
* XMLRPC fue removido de stdlib [Funcionalidad #12160](https://bugs.ruby-lang.org/issues/12160)

Ve [NEWS](https://github.com/ruby/ruby/blob/v2_4_0_rc1/NEWS)
o el historial de cambios para más detalles.

¡Con estos cambios,
[2519 archivos cambiados, 288606 inserciones(+), 83896 supresiones(-)](https://github.com/ruby/ruby/compare/v2_3_0...v2_4_0_rc1)
desde Ruby 2.3.0!

## Descarga

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-rc1.tar.bz2>

      SIZE:   12512729 bytes
      SHA1:   a0439652a97a2406b691e8a1e586e2cf08c258ba
      SHA256: 3b156b20f9df0dd62cbeeb8e57e66ea872d2a5b55fabdef1889650122bcc2ea7
      SHA512: b43902ac7794487197df55a45256819d2e7540b77f1ed4eb68def3e0473ee98860a400862075bafadbde74f242e1dfe36a18cd6fe05ac42aae1ea6dddc9978ce

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-rc1.tar.gz>

      SIZE:   14098505 bytes
      SHA1:   6b242f9ec7b908c9aa26e497440684ba06d86927
      SHA256: e41ada7650eed2a5800534d1201ba7c88f1627085659df994f47ab4c5e327745
      SHA512: 26d3c60483ce2d6eaabd7077085102fad6633f18cf5d772bacf6f563670030cb7bba22d54d8b7dfa5eac8b52990371c4a6ad1c095dff6f6b3a7bbe1a8ffb3754

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-rc1.tar.xz>

      SIZE:   9930088 bytes
      SHA1:   7c404e8bec9859f708927f7203d4f42187e678b7
      SHA256: 3f014b3186d10676da6c512d14c65db23ccc4bf200fed9d7c6f9a58fd1e3295b
      SHA512: 22e209e28da1f2394f50c0a7dd5d0d4d4c0c5a6b5b0b02260fad0267a0940b98f0e2b0f36a44f87d1612555cb3022f43cd136a5186c7f87650aa20264408d415

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-rc1.zip>

      SIZE:   15785968 bytes
      SHA1:   7d82386434ccbb1701f2995286bf29c8b9179e01
      SHA256: 14e6910e36618cddffeb22bad5f1052f907dc31ec93d4aa945bca0905d8a52c4
      SHA512: 5dd89320d429e5bd5faf3709be7e5b70f7355304d6324d7ac13a69187e5f1446ad5988c8186bc33f4fea8934288294f9d16fea173f39b2b39967746c4b03d1d4

## Comentarios del lanzamiento

Mira también la agenda de lanzamientos y más información:

[ReleaseEngineering24](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering24)
