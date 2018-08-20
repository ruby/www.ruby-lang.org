---
layout: news_post
title: "Ruby 2.5.0 Publicado"
author: "naruse"
translator: "vtamara"
date: 2017-12-25 00:00:00 +0000
lang: es
---

Nos complace anunciar la publicación de Ruby 2.5.0.

Ruby 2.5.0 es la primera versión estable de la serie 2.5 de Ruby.
Introduce muchas características nuevas y mejoras en desempeño.
Los cambios más notables son los siguientes:

## Nuevas características

* El uso de `rescue`/`else`/`ensure` ahora es permitido directamente
  dentro de bloques `do`/`end`.
  [[Característica #12906]](https://bugs.ruby-lang.org/issues/12906)
* Agregada `yield_self` para ceder al bloque dado su contexto.
  A diferencia de `tap`, retorna el resultado del bloque.
  [[Característica #6721]](https://bugs.ruby-lang.org/issues/6721)
* Soporta medición de cobertura de ramas y de cobertura de métodos.
  La cobertura de ramas indica que ramas se ejecutan y cuales no.
  La cobertura de métodos indica que métodos son llamados y cuales no.
  Al ejecutar un conjunto de pruebas con estas nuevas características, sabrá
  que ramas y que métodos se ejecutan, y evaluará la cobertura total del
  conjunto de pruebas de manera más rigurosa.
  [[Característica #13901]](https://bugs.ruby-lang.org/issues/13901)
* Hash#slice [[Característica #8499]](https://bugs.ruby-lang.org/issues/8499)
  y Hash#transform_keys [[Característica #13583]](https://bugs.ruby-lang.org/issues/13583)
* Struct.new puede crear clases que aceptan argumentos con palabra clave.
  [[Característica #11925]](https://bugs.ruby-lang.org/issues/11925)
* Enumerable#any?, all?, none?, y one? aceptan un patrón como argumento.
  [[Característica #11286]](https://bugs.ruby-lang.org/issues/11286)
* Se ha eliminado la búsqueda de constantes en el nivel superior
  cuando no se encuentran en una clase.
  [[Característica #11547]](https://bugs.ruby-lang.org/issues/11547)
* Una de sus librerías más amadas, `pp.rb`, ahora se carga automaticamente.
  Ya no necesita escribir `require "pp"`.
  [[Característica #14123]](https://bugs.ruby-lang.org/issues/14123)
* Impresión de la trazas y del mensaje de error en orden inverso (las llamadas
  más antiguas primero, las más recientes al final).  Cuando aparece una
  traza larga en su terminal (TTY), puede encontrar facilmente la línea
  causante al final de la traza.  Note que el orden se invierte sólo cuando
  la traza se imprime directamente en la terminal.
  [[Característica #8661]](https://bugs.ruby-lang.org/issues/8661) [experimental]

## Mejoras en desempeño

* Mejora del 5 al 10% en desempeño al eliminar todas las instrucciones `trace`
  del bytecode general (secuencias de instrucciones).
  La instrucción `trace` se añadió para dar soporte a `TracePoint`.
  Sin embargo, en la mayoría de casos, `TracePoint` no se usa y las
  instrucciones `trace` son gasto puro.  En cambio, ahora usamos una técnica
  de instrumentación dinámica.
  Ver detalles en la [[Características #14104]](https://bugs.ruby-lang.org/issues/14104).
* Pasar un bloque por un parámetro de bloque (e.g. `def foo(&b); bar(&b); end`)
  es cerca de 3 veces más rápido que en Ruby 2.4 por la técnica de
  "localización diferida de Proc"
  [[Característica #14045]](https://bugs.ruby-lang.org/issues/14045)
* Se reescribió Mutex para disminuir su tamaño y aumentar su rapidez.
  [[Característica #13517]](https://bugs.ruby-lang.org/issues/13517)
* ERB ahora genera el código de una plantilla dos veces más rápido que
  en Ruby 2.4.
* Mejorado el desempeño de algunos métodos incorporados incluyendo
  `Array#concat`, `Enumerable#sort_by`, `String#concat`, `String#index`,
  `Time#+` y más.
* IO.copy_stream usa copy_file_range(2) para copiar con la opción offload
  en Linux (es decir sin leer ni escribir el contenido sino añadiendo
  una referencia cuando el sistema de archivos lo permite).
  [[Característica #13867]](https://bugs.ruby-lang.org/issues/13867)

## Otros cambios notables desde la versión 2.4

* SecureRandom ahora prefiere fuentes proveidas por el sistema operativo
  en lugar de OpenSSL.
  [[Falla #9569]](https://bugs.ruby-lang.org/issues/9569)
* Promovidas cmath, csv, date, dbm, etc, fcntl, fiddle, fileutils, gdbm, ipaddr,
  scanf, sdbm, stringio, strscan, webrick, zlib de la librería estándar
  a gemas por omisión.
* Actualización a [Onigmo](https://github.com/k-takata/Onigmo/) 6.1.3.
  * Añade el [operador ausente](https://github.com/k-takata/Onigmo/issues/87).
  * Note que [Ruby 2.4.1](https://www.ruby-lang.org/en/news/2017/03/22/ruby-2-4-1-released/) también incluye este cambio.
* Actualización a Psych 3.0.2.
* Actualización a RubyGems 2.7.3.
* Actualización a RDoc 6.0.1.
  * [Cambia el analizador léxico de IRB por uno basado en Ripper](https://github.com/ruby/rdoc/pull/512).
    Esto mejora considerablemente la velocidad de generación de la
    documentación.
  * Resueltas muchas fallas de los últimos diez años.
  * Soporta la nueva sintaxis de las versiones más recientes de Ruby.
* Actualizada versión soportada de Unicode a 10.0.0.
* `Thread.report_on_exception` ahora queda en `true` por omisión.
  Este cambio ayuda a depurar programas de multiples hilos.
  [[Característica #14143]](https://bugs.ruby-lang.org/issues/14143)
* IO#write ahora recibe múltiples argumentos.
  [[Característica #9323]](https://bugs.ruby-lang.org/issues/9323)

Ver detalles en [NEWS](https://github.com/ruby/ruby/blob/v2_5_0/NEWS)
o en la [bitácora de commits](https://github.com/ruby/ruby/compare/v2_4_0...v2_5_0).

Con esos cambios,
[6158 archivos cambiaron, 348484 inserciones (+), 82747 eliminaciones(-)](https://github.com/ruby/ruby/compare/v2_4_0...v2_5_0)
desde Ruby 2.4.0!

¡Feliz navidad, felices festividades y disfrute programando con Ruby 2.5!


## Descargas

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0.tar.gz>

      SIZE:   15834941 bytes
      SHA1:   58f77301c891c1c4a08f301861c26b1ea46509f6
      SHA256: 46e6f3630f1888eb653b15fa811d77b5b1df6fd7a3af436b343cfe4f4503f2ab
      SHA512: 0712fe68611f5d0cd6dd54b814f825478e64b6a62bdf67bce431f4dca2dc00b1a33f77bebfbcd0a151118a1152554ab457decde435b424aa1f004bc0aa40580d

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0.zip>

      SIZE:   19495617 bytes
      SHA1:   700b6f55d689a5c8051c8c292b9e77a1b50bf96e
      SHA256: 94559ea6e3c619423da604e503ce1dc1c465d6e0747a07fbdc5f294acaf14c24
      SHA512: e4324064cee8c65b80192e3eff287e915d2d40464d300744c36fb326ae4b1846911400a99d4332192d8a217009d3a5209b43eb5e8bc0b739035bef89cc493e84

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0.tar.bz2>

      SIZE:   13955820 bytes
      SHA1:   827b9a3bcffa86d1fc9ed96d403cb9dc37731688
      SHA256: d87eb3021f71d4f62e5a5329628ac9a6665902173296e551667edd94362325cc
      SHA512: 8f6fdf6708e7470f55bc009db2567cd8d4e633ad0678d83a015441ecf5b5d88bd7da8fb8533a42157ff83b74d00b6dc617d39bbb17fc2c6c12287a1d8eaa0f2c

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0.tar.xz>

      SIZE:   11292472 bytes
      SHA1:   9c7babcf9e299be3f197d9091024ae458f1a1273
      SHA256: 1da0afed833a0dab94075221a615c14487b05d0c407f991c8080d576d985b49b
      SHA512: 55714a33d7661fe8b432f73c34fd67b49699f8b79df1cbd680a74899124d31111ab0f444677672aac1ba725820182940d485efb2db0bf2bc96737c5d40c54578
