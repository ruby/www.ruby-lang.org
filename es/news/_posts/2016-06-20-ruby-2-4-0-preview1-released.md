---
layout: news_post
title: "Liberada la versión 2.4.0-preview1 de Ruby"
author: "naruse"
translator: "David Padilla"
date: 2016-06-20 09:00:00 +0000
lang: es
---

Nos complace anunciar la entrega de Ruby 2.4.0-preview1.

Esta versión es la primera vista previa a Ruby 2.4.0 y ha sido liberada antes
de lo usual porque incluye muchas mejoras y características nuevas.
Por favor no olvides enviar
[tus comentarios](https://github.com/ruby/ruby/wiki/How-To-Report)
ya que aún estamos a buen tiempo de hacer cambios.

## [Integrar Fixnum y Bignum en Integer](https://bugs.ruby-lang.org/issues/12005)

A pesar de que en [ISO/IEC 30170:2012](http://www.iso.org/iso/iso_catalogue/catalogue_tc/catalogue_detail.htm?csnumber=59579)
no se especifican los detalles de la clase Integer,
CRuby tiene dos clases de Integer visibles: Fixnum y Bignum.
Ruby 2.4 unifica ambas en la clase Integer.

## [Soporte en String de el empate de mayúsculas y minúsculas en caracteres Unicode](https://bugs.ruby-lang.org/issues/10085)

La función `String/Symbol#upcase/downcase/swapcase/capitalize(!)` ahora puede
empatar mayúsculas y minúsculas de caracteres Unicode y no solo de caracteres ASCII.

## Mejoras en el desempeño

Ruby 2.4 también incluye las siguientes mejoras en el desempeño que incluye
algunos cambios en el lenguaje:

### [Array#max, Array#min](https://bugs.ruby-lang.org/issues/12172)

`[x, y].max` y `[x, y].min` han sido optimizados para no crear arreglos temporales
bajo ciertas circunstancias.

### [Regexp#match?](https://bugs.ruby-lang.org/issues/8110)

Se agregó `Regexp#match?`, que ejecuta la expresión regular sin crear una
referencia al objeto y mejora `$~` para reducir la creación de objetos innecesarios.

### Otras mejoras en el desempeño

* [acelerar el acceso a variables de instancia](https://bugs.ruby-lang.org/issues/12274)

## Depuración

### [Thread#report_on_exception y Thread.report_on_exception](https://bugs.ruby-lang.org/issues/6647)

Ruby ignora las excepciones en threads a menos que otro thread se una explicitamente
a ese thread.
Con `report_on_exception = true`, puedes darte cuenta si un thread se murió
debido a alguna excepción que no fue manejada adecuadamente.

Por favor envía tu opinión acerca de cual debería ser el valor por defecto de
`report_on_exception` y de `report-on-GC`.

### [La detección de puntos muertos en Thread ahora muestra los threads con sus dependencias y su traza inversa](https://bugs.ruby-lang.org/issues/8214)

Ruby tiene detección de puntos muertos en threads, pero el reporte no incluye
suficiente información para depurar el error.
La detección de puntos muertos en Ruby 2.4 ahora muestra los threads con su
traza inversa y los threads dependientes.

Esperamos que disfrutes programar con Ruby 2.4.0-preview1 y no olvides
[enviar tus comentarios](https://github.com/ruby/ruby/wiki/How-To-Report)!

## Cambios significantes desde 2.3

Puedes ver [NOTICIAS](https://github.com/ruby/ruby/blob/v2_4_0_preview1/NEWS)
y la [Bitácora de cambios](https://github.com/ruby/ruby/blob/v2_4_0_preview1/ChangeLog)
para más detalles.

Con estos cambios,
[1140 archivos cambiaron, 33126 inserciones(+), 50993 supresiones(-)](https://github.com/ruby/ruby/compare/v2_3_0...v2_4_0_preview1)
desde Ruby 2.3.0!

## Descarga

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview1.tar.bz2>

  * SIZE:   14108114 bytes
  * SHA1:   7dcc42548d0724d83b6589ab98f34282845d7bcd
  * SHA256: 17570f0b84215ca82252f10c167ee50bc075383c018420c6b2601ae1cade0649
  * SHA512: c9873e8686eb54dbde61d6e23cd5197beebccd6cb31fd12c82763ebe1fde17095d7514d9d93c2c82b238032c98691df5479dc2d666a8a590e0fc54450ec29cb5

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview1.tar.gz>

  * SIZE:   17605452 bytes
  * SHA1:   1003a1e57547d81f4bb979c0f40f242afc284cd5
  * SHA256: 80d02f49f40e7ce07b70bee7efda751b0595a349a017306e9fe8caad5da13e64
  * SHA512: 4b603ab4ff9ea7e8bb8053aa4b638839d534241466d7f0e4d5bca3f2ea416694c2ea391790f1ffdc07fa538918d27707621741eb0ddc7bd00eb9d7628622787a

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview1.tar.xz>

  * SIZE:   11155800 bytes
  * SHA1:   bc33085277266f5a09a143bf6817affcb77f8e7f
  * SHA256: 62942c7300727469fe3d2b43e5a5c772d4836cf624a1d644bdece2afaca472c8
  * SHA512: dfc2c6642d49fa95383817a6dc82c416b3218ddfdaf882d6d2e5a7da22d0a5ac142e516a57aa96214070f3c7551d275044233ac052c82d67189b01c39847aad4

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview1.zip>

  * SIZE:   19904781 bytes
  * SHA1:   25c16ee91bbcb0224f80e20d938f5c08832973f7
  * SHA256: fd588aea1558b1171f87a3dd342ee207b8995a2c0a8241d7aa15bcfa16036854
  * SHA512: f2fff35ff9157a4b31177b3d6b91bdaad04c22b3c626c3a5e5ec9a31b103f9607b31c909ef27880065cfdbcfa5d6901a6db89d22e0c645666d069c5b6dd1818b

## Comentarios de la entrega

Puedes ver la agenda de las entregas y otra información en:

[ReleaseEngineering24](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering24)
