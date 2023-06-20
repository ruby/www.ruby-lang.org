---
layout: news_post
title: "Liberada la versión 2.4.0-preview2 de Ruby"
author: "naruse"
translator: "Fernando Perales"
date: 2016-09-08 09:00:00 +0000
lang: es
---

Nos complace anunciar el lanzamiento de Ruby 2.4.0-preview2.

Ruby 2.4.0-preview2 es la segunda vista previa de Ruby 2.4.0.
Este preview2 es liberado para obtener retroalimentación de la comunidad.
Siéntete libre de
[enviar tus comentarios](https://github.com/ruby/ruby/wiki/How-To-Report)
ya que aún puedes influir en las funcionalidades.

## [Unificación de Fixnum y Bignum en Integer](https://bugs.ruby-lang.org/issues/12005)

A pesar de que [ISO/IEC 30170:2012](http://www.iso.org/iso/iso_catalogue/catalogue_tc/catalogue_detail.htm?csnumber=59579)
no especifica detalles sobre la clase Integer,
Ruby tenía dos clases visibles para enteros: Fixnum y Bignum.
Ruby 2.4 las unifica dentro de Integer.
Todas las extensiones de C que tocan las clases Fixnum o Bignum necesitan ser reparadas.

Ve también [el incidente](https://bugs.ruby-lang.org/issues/12005) y las [diapositivas de ark](http://www.a-k-r.org/pub/2016-09-08-rubykaigi-unified-integer.pdf).

## [String soporta casos de mapeo en Unicode](https://bugs.ruby-lang.org/issues/10085)

`String/Symbol#upcase/downcase/swapcase/capitalize(!)` ahora manejan los casos de mapeo de Unicode
en vez de únicamente los casos de mapeo de ASCII.

## Mejoras de rendimiento

Ruby 2.4 también contiene las siguientes mejoras de rendimiento incluyendo cambios al lenguaje:

### [Array#max, Array#min](https://bugs.ruby-lang.org/issues/12172)

`[x, y].max` y `[x, y].min` están optimizados para no crear un arreglo vacío temporal bajo ciertas condiciones

### [Regexp#match?](https://bugs.ruby-lang.org/issues/8110)

Se añade `Regexp#match?`, que ejecuta un emparejamiento regexp sin crear
un objeto de referencia y cambia `$~` para ejecutar asignación de memoria.

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

### [Detección de deadlocks en hilos ahora muestra los hilos con sus trazas y depencencia](https://bugs.ruby-lang.org/issues/8214)

Ruby tiene detección de deadlocks en los hilos que están a la espera, pero este reporte
no incluye suficiente información para depuración.

La detección de deadlocks en Ruby 2.4 muestra los hilos con sus respectivas trazas e hilos dependientes.

¡Prueba y disfruta programar con Ruby 2.4.0-preview2, y
[envíanos retroalimentación](https://github.com/ruby/ruby/wiki/How-To-Report)!

## Otros cambios notables desde 2.3

* Soporte para OpenSSL 1.1.0
* ext/tk fue removido de stdlib [Funcionalidad #8539](https://bugs.ruby-lang.org/issues/8539)

Ve [NEWS](https://github.com/ruby/ruby/blob/v2_4_0_preview2/NEWS)
y [ChangeLog](https://github.com/ruby/ruby/blob/v2_4_0_preview2/ChangeLog)
para todos los detalles.

¡Con estos cambios,
[2353 archivos cambiados, 289057 inserciones(+), 73847 supresiones(-)](https://github.com/ruby/ruby/compare/v2_3_0...v2_4_0_preview2)
desde Ruby 2.3.0!

## Descarga

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview2.tar.bz2>

  * SIZE:   12463225 bytes
  * SHA1:   95a501624f1cf4bb0785d3e17afd0ad099f66385
  * SHA256: 2224c55b2d87b5c0f08d23a4618e870027dbc1cffbfb4a05efd19eac4ff4cf1d
  * SHA512: 0c9a59a2f57a99c4ee8539a30f41da1de7547566203f89d856e1be9dbb44365754e6c470145dc9336eb324e0feb2f53d9fef18a1564968ac21f9ee528905949f

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview2.tar.gz>

  * SIZE:   15586514 bytes
  * SHA1:   492a13c4ddc1c0c218433acb00dcf7ddeef96fe0
  * SHA256: fec544836428aada2dc593a8cc42ce330798a805e49ecb807a0e21b386fd0b14
  * SHA512: 5a3de852a7611e79f38219ed7bb13772aaabb25538ca843d38743180a0cc939a4e34c008b61d578da785285196b6b8882270bddc17cbed481237db8afa4c54e4

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview2.tar.xz>

  * SIZE:   9886832 bytes
  * SHA1:   95d5fd7d54d86497194f69ec433755a517dcde8f
  * SHA256: 6c2d25bedc50c2f19b0e349f0ffd9b9a83000d9cb6a677bf5372fb493d33e16a
  * SHA512: b9bd898d17583103ee61b4764ac86eb62c9661fca1f41ff0d06a15965a0a1ba581491d4b8a342e527d63e102b6ddcb2acebdabe5b246409ce9711e13f9428d5b

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview2.zip>

  * SIZE:   17401564 bytes
  * SHA1:   5f3a5b2fd03f70d49e74ec36be3e0c110f6c17cc
  * SHA256: 4d0e466148283ad52208b1e1b70b018aefb7fa95b490fc862d5ea4ca284ecdd2
  * SHA512: 0ef2098d995238580245a4bcee843641199c1194189be13614611e2ffec329278072319a799d409eaf13b1cff45f05a0eae02d9ea8ccc69058fa49e03eca0130

## Comentarios del lanzamiento

Mira también la agenda de lanzamientos y más información:

[ReleaseEngineering24](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering24)
