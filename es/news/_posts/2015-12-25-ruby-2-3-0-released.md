---
layout: news_post
title: "Liberada la versión 2.3.0 de Ruby"
author: "naruse"
translator: "gfvcastro"
date: 2015-12-25 17:00:00 +0000
lang: es
---

Nos complace anunciar la entrega de Ruby 2.3.0.

Ruby 2.3.0 es la primera versión estable de la serie 2.3.

Esta entrega contiene nuevas características, por ejemplo:

[Frozen String Literal Pragma](https://bugs.ruby-lang.org/issues/11473) ha sido introducido.

En Ruby 2.1, `"str".freeze` ha sido optimizado para reducir la asignación de objeto.
Ruby 2.3 introduce un nuevo comentario mágico y una opción de línea de comando para especificar todas las literales de cadena.
Además para depurar, tu puedes obtener donde fue creado el objeto cuando sucede el error
`"can't modify frozen String"` con `--debug=frozen-string-literal`.

[safe navigation operator](https://bugs.ruby-lang.org/issues/11537)
([so-called lonely operator](https://instagram.com/p/-M9l6mRPLR/)) `&.`,
el cual existe en C#, Groovy, y Swift. Se introduce para facilitar el manejo de
`nil` utilizado `obj&.foo`. También se añaden `Array#dig` y `Hash#dig`.
Toma en cuenta que este se comporta como [try! of Active Support](http://api.rubyonrails.org/v4.2.5/classes/Object.html#method-i-try-21),
que especialmente sólo utiliza nil.

[did_you_mean gem is bundled](https://bugs.ruby-lang.org/issues/11252).
did_you_mean muestra candidatos en las excepciones `NameError` y `NoMethodError` para facilitar la depuración.

[RubyVM::InstructionSequence#to_binary and .load_from_binary](https://bugs.ruby-lang.org/issues/11788) ha sido introducido como característica experimental. Con estas características, podemos hacer un sistema ISeq (bytecode) de pre-compilación.

También incluye muchas mejoras de rendimiento, por ejemplo,
[reconsider method entry data structure](https://bugs.ruby-lang.org/issues/11278),
[introducing new table data structure](https://bugs.ruby-lang.org/issues/11420),
[optimize Proc#call](https://bugs.ruby-lang.org/issues/11569),
se perfeccionó a nivel de código máquina la asignación de objeto y llamada a método
[smarter instance variable data structure](https://bugs.ruby-lang.org/issues/11170),
[`exception: false` keyword argument support on Socket#*_nonblock methods](https://bugs.ruby-lang.org/issues/11229).
Compruebe la sección "Implementation improvements" en el archivo NEWS.

Para obtener una lista completa de las nuevas características y las notas de compatibilidad, puedes ver el
[NEWS](https://github.com/ruby/ruby/blob/v2_3_0/NEWS) y
[ChangeLog](https://github.com/ruby/ruby/blob/v2_3_0/ChangeLog).

Con estos cambios, [2946 archivos se modificaron, 104057 inserciones(+), 59478 eliminaciones(-)](https://github.com/ruby/ruby/compare/v2_2_0...v2_3_0) desde Ruby 2.2.0.

¡Feliz Navidad, Felices Fiestas, y disfruta de la programación con Ruby 2.3!

## Descarga

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0.tar.bz2>

      SIZE:   14185617 bytes
      SHA1:   6c8a832d49d22755ea8c45b6d53faf2ccc6d6ac9
      SHA256: ec7579eaba2e4c402a089dbc86c98e5f1f62507880fd800b9b34ca30166bfa5e
      SHA512: 77b707359e754c3616699d21697752741497c719dc3d6fdfb55ed639e76d52560d293ae54cbe5c63be78dc73fbe60f1b8615d704d017bdfe1994aa9747d26a6c

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0.tar.gz>

      SIZE:   17648682 bytes
      SHA1:   2dfcf7f33bda4078efca30ae28cb89cd0e36ddc4
      SHA256: ba5ba60e5f1aa21b4ef8e9bf35b9ddb57286cb546aac4b5a28c71f459467e507
      SHA512: 914d0201ecefaeb67aca0531146d2e89900833d8d2a597ec8a19be94529ab6b4be367f9b0cee2868b407288896cc14b64d96150223cac0aef8aafc46fc3dd7cc

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0.tar.xz>

      SIZE:   11294412 bytes
      SHA1:   96e620e38af351c8da63e40cfe217ec79f912ba1
      SHA256: 70125af0cfd7048e813a5eecab3676249582bfb65cfd57b868c3595f966e4097
      SHA512: d893c5e6db5a0533e0da48d899c619964388852ef90e7d1b92a4363d5f189cd2dba32a009581f62b9f42a8e6027975fc3c18b64faf356f5e3ac43a8d69ec5327

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0.zip>

      SIZE:   19840511 bytes
      SHA1:   3f88617568d9a4f491e8b32dca532363f73eaa71
      SHA256: 8270bdcbc6b62a18fdf1b75bd28d5d6fc0fc26b9bd778d422393a1b98006020a
      SHA512: a3f397bb3c9c19d9b797552c5d60bb01c82db884cfa966df84881125bea35713cffd99f88fb86b271bae72d9cfb09ad9b33838cffcf6365c091459479914fdef
