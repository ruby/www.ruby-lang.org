---
layout: news_post
title: "Liberada la versión 2.4.0 de Ruby"
author: "naruse"
translator: ferperales
date: 2016-12-25 00:00:00 +0000
lang: es
---

Nos complace anunciar el lanzamiento de Ruby 2.4.0.

Ruby 2.4.0 es la primera versión estable de la serie 2.4 de Ruby.
Añade varias funcionalidades como:

## [Presentamos una mejora a las tablas de hash (por Vladimir Makarov)](https://bugs.ruby-lang.org/issues/12142)

Se mejora la estructura interna de las tablas de hash (st_table) al agregar direccionamiento
abierto y arreglos con orden de inclusión. Esta mejora ha sido discutida con varias personas,
especialmente con Yura Sokolov.

## Binding#irb: Inicia una sesión de REPL al igual que `binding.pry`

Cuando estás depurando código, quizá usas `p` frecuentemente para ver el valor de las variables.
Al usar [pry](https://github.com/pry/pry) y escribir `binding.pry` en tu aplicación, se inicia un
ciclo REPL (Lectura-Evaluación-Impresión) donde puedes correr código de Ruby.
[r56624](https://github.com/ruby/ruby/commit/493e48897421d176a8faf0f0820323d79ecdf94a) añade
`binding.irb` que se comporta de la misma manera con irb.

## [Unificación de Fixnum y Bignum en Integer](https://bugs.ruby-lang.org/issues/12005)

A pesar de que
[ISO/IEC 30170:2012](http://www.iso.org/iso/iso_catalogue/catalogue_tc/catalogue_detail.htm?csnumber=59579)
no especifica detalles sobre la clase Integer, Ruby tuvo dos clases visibles para Integer: Fixnum
y Bignum.
Ruby 2.4 las unifica en Integer.
Todas las extensiones que tocan las clases Fixnum o Bignum necesitan ser reparadas.

Ve también [el incidente](https://bugs.ruby-lang.org/issues/12005) y la
[presentación de akr](http://www.a-k-r.org/pub/2016-09-08-rubykaigi-unified-integer.pdf).

## [String soporta casos de mapeo en Unicode](https://bugs.ruby-lang.org/issues/10085)

`String/Symbol#upcase/downcase/swapcase/capitalize(!)` ahora manejan
los casos de mapeo de Unicode en vez de únicamente los casos de mapeo de ASCII.

## Mejoras de rendimiento

Ruby 2.4 también tiene las siguientes mejoras de rendimiento incluyendo cambios
en el lenguaje:

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

La detección de deadlock de Ruby 2.4 muestra hilos con su backtrace e hilos dependientes.

## Otros cambios notables desde 2.3

* Soporte para OpenSSL 1.1.0 (se elimina el soporte para 0.9.7 o anterior)
* ext/tk fue removido de stdlib [Funcionalidad #8539](https://bugs.ruby-lang.org/issues/8539)
* XMLRPC fue removido de stdlib [Funcionalidad #12160](https://bugs.ruby-lang.org/issues/12160)

Ve [NEWS](https://github.com/ruby/ruby/blob/v2_4_0/NEWS)
o el historial de cambios para más detalles.

¡Con estos cambios,
[2523 archivos cambiados, 289129 inserciones(+), 84670 supresiones(-)](https://github.com/ruby/ruby/compare/v2_3_0...v2_4_0)
desde Ruby 2.3.0!

¡Feliz Navidad, felices fiestas, y disfruta programando con Ruby 2.4!

## Descarga

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0.tar.bz2>

      SIZE:   12572424 bytes
      SHA1:   944d2588308391b20a89642472454d1dfe7b2360
      SHA256: 440bbbdc49d08d3650f340dccb35986d9399177ad69a204def56e5d3954600cf
      SHA512: bef7bb53f63fb74073d071cc125fb67b273ed0779ef43c2d2969089b9ca21fff1bd012281c5b748f7a3c24dd26e71730d7248c05a01cb23ab2089eb4d02115fe

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0.tar.gz>

      SIZE:   14104044 bytes
      SHA1:   d44a3c50a0e742341ed3033d5db79d865151a4f4
      SHA256: 152fd0bd15a90b4a18213448f485d4b53e9f7662e1508190aa5b702446b29e3d
      SHA512: 21c9f596b42dd9cba7a53963a59fed0c2e0c1eb960a4ac7087ea3eaa991ce9252d32639e1edcb75b1d709bc07c4820a6dc336ab427d0643c6e6498e0eacdbc8b

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0.tar.xz>

      SIZE:   9906880 bytes
      SHA1:   038804bbd0e77508dd2510b729a9f3b325489b2e
      SHA256: 3a87fef45cba48b9322236be60c455c13fd4220184ce7287600361319bb63690
      SHA512: 975a5388592adc038461e0acebb6c0efee242891b2ea8621476401458efe2bc0fdd317d3bf99beb745b0b3808410efdff33862da29c95c027f457943721e3ab6

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0.zip>

      SIZE:   15758757 bytes
      SHA1:   29e1bab11551011718c35a51827edcb55bd656fc
      SHA256: 5c2bbfa26fd6a15a2d70961874b0f3a386206fcc5f698e240dd8b0c9f0f18c5e
      SHA512: 31d932372ce490eeac0a70bc8dcf842909a90435422398d069c05cf01d994936064b8f4e60879e28a8655c1296eb8e180e348cb95e001ed6ca73cda0ff77de23
