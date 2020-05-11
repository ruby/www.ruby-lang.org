---
layout: news_post
title: "Publicado Ruby 2.7.0-preview1"
author: "naruse"
translator: vtamara
date: 2019-05-30 00:00:00 +0000
lang: es
---

Nos complace anunciar la publiación de Ruby 2.7.0-preview1.

Es una versión previa que se publica para obtener retroalimentación sobre la versión final planeada para Diciembre.
Introduce una serie de características nuevas y mejoras en desempeño, las más notables son:

* Compactar en el Recolector de Basura (GC)
* Reconocimiento de patrones
* Mejora en REPL

## Compactar en el recolector de basura (GC)

Esta versión introduce la posibilidad de compactar en el recolector de basura, que defragmenta un espacio de memoria fragmentado.

Algunos programas Ruby de múltiples hilos pueden causar fragmentación en la memoria, que conlleva a un alto uso
de memoria y a que se degrade la velocidad.

El método `GC.compact` se introduce para compactar el montón (heap). Esta función compacta los objetos vivos que hay en el montón de manera que usen menos páginas, y el montón resulta más amigable con la técnica de administración de recursos compartidos "Copiar ante Escritura" (Copy on Write o CoW). [#15626](https://bugs.ruby-lang.org/issues/15626)

## Reconocimiento de Patrones [Experimental]

El reconocimiento de patrones, es una característica ampliamente usada en lenguajes de programación funcional, se introduce como característica experimental.  [#14912](https://bugs.ruby-lang.org/issues/14912)
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

## Mejora en REPL

`irb`, el ambiente interactivo incluido con Ruby (REPL; Read-Eval-Print-Loop; Bucle-Leer-Evaluar-Presentar), ahora soporta edición
de múltiples líneas.  Es potenciado por `reline`, la implementación en puro Ruby de `readline`.
También provee integración con rdoc. En `irb` puede presentar el manual de referencia para una clase dada, para un modulo o para un método.  [#14683](https://bugs.ruby-lang.org/issues/14683), [#14787](https://bugs.ruby-lang.org/issues/14787), [#14918](https://bugs.ruby-lang.org/issues/14918)
Además, ahora se presentan con colores tanto el código fuente de su programa al iniciar una sesión IRB con `binding.irb` como los resultados de inspeccionar los objetos de las clases del núcleo de ruby.

<video autoplay="autoplay" controls="controls" muted="muted" width="576" height="259">
  <source src="https://cache.ruby-lang.org/pub/media/irb_improved_with_key_take2.mp4" type="video/mp4">
</video>

## Otras características notables

* Un operador para referenciar un método, <code>.:</code>, se introduce como característica experimental.  [#12125]( https://bugs.ruby-lang.org/issues/12125), [#13581]( https://bugs.ruby-lang.org/issues/13581)

* Como característica experimental se introducen paramétros numerados como párametros por omisión en bloques.  [#4475](https://bugs.ruby-lang.org/issues/4475)

* Un rango sin inicio se introduce de forma experimental.  Podría no ser tan útil como un rango sin terminación, pero es bueno para DSL. [#14799](https://bugs.ruby-lang.org/issues/14799)

      ary[..3]  # identico a ary[0..3]
      rel.where(ventas: ..100)

* Se añade `Enumerable#tally`.  Que cuenta las ocurrencias de cada elemento.

      ["a", "b", "c", "b"].tally
      #=> {"a"=>1, "b"=>2, "c"=>1}

## Mejoras en desempeño

* JIT [Experimental]

  * El código compilado con JIT es recompilado a uno menos optimizado cuando los supuestos de la optimización dejan de ser válidos.

  * Un método se puede ejecutar en línea (method inlining o inserción en lugar de llamado) cuando un método se considera puro.  Esta optimización aún es experimetnal y muchos métodos aún no se consideran puros.

  * El valor por omisión de `--jit-min-calls` cambió de 5 a 10,000

  * El valor por omisión de `--jit-max-cache` cambió de 1,000 a 100

## Otros cambios notables desde la versión 2.6

* `Proc.new` y `proc` sin bloque en un método llamado con un bloque produce una advertencia.

* `lambda` sin un bloque en un método llamado con un bloque produce un error.

* Actualizada la versión de Unicode y Emoji de 11.0.0 a 12.0.0.  [[Característica #15321]](https://bugs.ruby-lang.org/issues/15321)

* Actualizada la versión de Unicode a 12.1.0, añadiendo soporte para U+32FF SQUARE ERA NAME REIWA.  [[Característica #15195]](https://bugs.ruby-lang.org/issues/15195)

* `Date.jisx0301`, `Date#jisx0301`, y `Date.parse` de manera provisional y como extensión informal soportan la nueva era japonesa, hasta que se publique un nuevo estándar JIS X 0301.  [[Feature #15742]](https://bugs.ruby-lang.org/issues/15742)

* Requiere compiladores que soporten C99 [[Misc #15347]](https://bugs.ruby-lang.org/issues/15347)
  * Detalles de nuestro dialecto en: <https://bugs.ruby-lang.org/projects/ruby-master/wiki/C99>

Vea más detalles en el archivo [NEWS](https://github.com/ruby/ruby/blob/v2_7_0_preview1/NEWS) o en [la bitácora de cambios](https://github.com/ruby/ruby/compare/v2_6_0...v2_7_0_preview1).

¡Estos cambios constan de [1727 archivos cambiados, 76022 inserciones(+), 60286 eliminaciones(-)](https://github.com/ruby/ruby/compare/v2_6_0...v2_7_0_preview1) desde Ruby 2.6.0!

¡Disfrute programando con Ruby 2.7!

## Descargas

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview1.tar.gz>

      SIZE:   16021286 bytes
      SHA1:   2fbecf42b03a9d4391b81de42caec7fa497747cf
      SHA256: c44500af4a4a0c78a0b4d891272523f28e21176cf9bc1cc108977c5f270eaec2
      SHA512: f731bc9002edd3a61a4955e4cc46a75b5ab687a19c7964f02d3b5b07423d2360d25d7be5df340e884ca9945e3954e68e5eb11b209b65b3a687c71a1abc24b91f

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview1.zip>

      SIZE:   20283343 bytes
      SHA1:   7488346fa8e58203a38158752d03c8be6b1da65b
      SHA256: fdf25573e72e1769b51b8d541d0e1a894a5394dbfdf1b08215aa093079cca64c
      SHA512: b3b1f59dce94c242ef88a4e68381a4c3a6f90ba0af699083e5a1a00b0fb1dce580f057dad25571fe789ac9aa95aa6e9c071ebb330328dc822217ac9ea9fbeb3f

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview1.tar.bz2>

      SIZE:   14038296 bytes
      SHA1:   f7e70cbc2604c53a9e818a2fc59cd0e2d6c859fa
      SHA256: d45b4a1712ec5c03a35e85e33bcb57c7426b856d35e4f04f7975ae3944d09952
      SHA512: a36b241fc1eccba121bb7c2cc5675b11609e0153e25a3a8961b67270c05414b1aa669ce5d4a5ebe4c6b2328ea2b8f8635fbba046b70de103320b3fdcb3d51248

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview1.tar.xz>

      SIZE:   11442988 bytes
      SHA1:   45e467debc194847a9e3afefb20b11e6dc28ea31
      SHA256: 8c546df3345398b3edc9d0ab097846f033783d33762889fd0f3dc8bb465c3354
      SHA512: d416e90bfa3e49cc0675c4c13243c8ec319b7a0836add1bd16bd7662d09eaf46656d26e772ef3b097e10779896e643edd8a6e4f885147e3235257736adfdf3b5

## ¿Qué es Ruby?

Ruby fue desarrollado primero por Matz (Yukihiro Matsumoto) en 1993, y ahora es desarrollado como Código Abierto.
Corre en múltiples plataformas y se usa en todo el mundo especialmente para desarrollo web.
