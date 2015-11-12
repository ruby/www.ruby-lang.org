---
layout: news_post
title: "Liberada la versión 2.3.0-preview1 de Ruby"
author: "naruse"
translator: "mariochavez"
date: 2015-11-11 16:00:00 +0000
lang: es
---

Nos complace anunciar la entrega de Ruby 2.3.0-preview1.

Ruby 2.3.0-preview1 es el primer preview de la serie 2.3.0.
Incluye muchas mejoras y nuevas características.

[Frozen String Literal Pragma](https://bugs.ruby-lang.org/issues/11473) 
ha sido introducida. En Ruby 2.1. "str".freeze está optimizado para reducir la
creación de nuevos objetos. Ruby 2.3 introduce un nuevo comentario _mágico_ y
una opción de línea de comando para especificar todas las literales de
cadena 
de texto.
Adicionalmente para depurado, usted puede obtener donde el objeto fue creado
cuando sucede el error `"can't modify frozen String"` con
--enable-frozen-string-literal-debug.

[Safe navigation operator](https://bugs.ruby-lang.org/issues/11537), el cuál
existe en C#, Groovy y Swift, es presentado en ésta versión, para hacer más
sencillo el manejo de `nil` de la forma `obj&.foo`. `Array#dig` y `Hash#dig`
también se agregaron.

[did_you_mean.gem is
bundled](https://bugs.ruby-lang.org/issues/11252). did_you_mean.gem muestra
candidatos en las excepciones `NameError` y `NoMethodError` con la finalidad
de simplificar el depurado.

Prueba y disfruta el programar con Ruby 2.3.0-preview1.

## Cambios notables desde la versión 2.2
* TBD

Visitar [Noticias](https://github.com/ruby/ruby/blob/v2_3_0_preview1/NEWS) y
[Bitácora de Cambios](https://github.com/ruby/ruby/blob/v2_3_0_preview1/ChangeLog)
para mayor detalle.

Con estos cambios, 1036 archivos se modificaron, 81312 inserciones(+), 51322
eliminaciones(-) desde Ruby 2.2.0.

## Descargas

* [http://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview1.tar.bz2](http://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview1.tar.bz2)

      SIZE:   14174035 bytes
      SHA1:   55ad4f04d7a33ab780458ee0999de9f6124217ea
      SHA256: b9c9e1740a5abe2855d11803524370bd95744c8dcb0068572ed5c969ac7f0f
      SHA512: ae6d46c87f59e1fd3703b76dfc45bfcf208625f95ab9f4559f0b9f7050e8681f1a6e419f5fa06b704c83e56879c3a9ff1337dba443bcfca76fadb49c97d97a93

* [http://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview1.tar.gz](http://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview1.tar.gz)

      SIZE:   17560800 bytes
      SHA1:   6249572e5dca27d8c73a0cbf036e24e5d88fe82f
      SHA256: 8f9d48392a2bb226df5f4b4fd2074d81af155cdf3f3799139a6e31e012aefe
      SHA512: 58384ef6e743dde20ea263692dab86ce9d6d22d722ef4c02a84396aa3128ce06d933d9b69078a3cd666d72320a8a6ffdc93296bc0d5338595b2a44c29d4db383

* [http://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview1.tar.xz](http://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview1.tar.xz)

      SIZE:   11225228 bytes
      SHA1:   85b4f631efa4b6435b2b41df6ce6c46da294c4d4
      SHA256: a88e19d9dc001db8f49ca3986a8a4e69980affff876854585725e40de0eedcd8
      SHA512: 3be0f3ed4de73509b2f6975fe3fbe28bb4d51df87db6e2c0019e8a107edf49be60b2127ba5b18bca91f9f5964b07f1adde3042dac6327017359eeb130760672b

* [http://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview1.zip](http://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview1.zip)

      SIZE:   19777010 bytes
      SHA1:   58666c250dd333ac4b537be25f1913dd311ea1
      SHA256: c1d4450e9141f541038a4433f8fb49fb929e43c7bf5985685a4fa7b213a811
      SHA512: f53653cf11d8dce1d627f7db3a15acca29c74c78735406a5d64bbbdc39fac232ef63110eb4d83521bef40c6f3006d55bbeaf54d1ddab1d4b6e5a13cee9247e85

## Comentarios de la versión

Refiérase también al calendario de entregas e información adicional:

[ReleaseEngineering23](http://bugs.ruby-lang.org/projects/ruby-trunk/wiki/ReleaseEngineering23)

