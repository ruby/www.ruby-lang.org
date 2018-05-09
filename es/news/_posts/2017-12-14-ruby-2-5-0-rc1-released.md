---
layout: news_post
title: "Ruby 2.5.0-rc1 Publicado"
author: "naruse"
translator: "vtamara"
date: 2017-12-14 00:00:00 +0000
lang: es
---

Nos complace anunciar la publicación de Ruby 2.5.0-rc1.

Ruby 2.5.0-rc1 es el primer candidato de publicación de Ruby 2.5.0.
Introduce algunas características nuevas y mejoras al desempeño, por ejemplo:

## Nuevas características

* Imprimir trazas y mensajes de error en orden inverso si no se ha
  cambiado STDERR y es un tty.  [Feature #8661] [experimental]

* Se ha eliminado la búsqueda de constantes en el nivel superior
  cuando no se encuentran en una clase.  [Feature #11547]

* rescue/else/ensure se permiten al interior de bloques do/end.  [Feature #12906]

* Agregado yield\_self.  [Feature #6721]

## Mejoras en desempeño

* Instrumentación dinámica para ganchos TracePoint en lugar de usar
  la instrucción "trace" para evitar costos. [Feature #14104]

* El desempeño al pasar bloques usando parámetros de bloque se ha
  mejorado empleando localización de Proc retardada.  [Feature #14045]

* Se ha vuelto a escribir mutex para que sea más pequeño y
  veloz. [Feature #13517]

* SecureRandom ahora prefiere fuentes proveidas por el sistema operativo
  en lugar de OpenSSL. [Bug #9569]

## Otros cambios notables desde la versión 2.4

* Actualizado a Onigmo 6.1.3.
  Añade el [operado ausente](https://github.com/k-takata/Onigmo/issues/87).
  Note que Ruby 2.4.1 también incluía este cambio.
* Bundler agregado a las librerías estándar.
* Actualización a RubyGems 2.7.0.
* Actualización a RDoc 6.0.0.
  * Cambiado el analizador léxico de IRB por uno basado en Ripper;
    esto mejora considerablemente la velocidad de generación de la
    documentación.  [https://github.com/ruby/rdoc/pull/512]
  * Resuletas muchas fallas de la última docena de años aproximadamente.
  * Soporta las nuevas sintaxis de Ruby de los últimos años.
* Actualizada versión soportada de Unicode a 10.0.0.

Ver detalles en [NEWS](https://github.com/ruby/ruby/blob/v2_5_0_rc1/NEWS)
o en la bitácora de commits.

Con esos cambios,
[6162 archivos cambiados, 339744 inserciones(+), 28699 eliminaciones(-)](https://github.com/ruby/ruby/compare/v2_4_0...v2_5_0_rc1)
desde Ruby 2.4.0!

Disfrute Ruby 2.5.0-rc1!

## Descargas

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0-rc1.tar.gz>

      SIZE:   31049529 bytes
      SHA1:   15df7e8ff99f360a14f7747a07a3021447d65594
      SHA256: 46c11b347522de174566503d35d2b46e1529b979d292b1f7f7019cfedcd4b07f
      SHA512: 41cd298e99d7a25fe5f2ec42946ae5dbc4421bb18f39350ba8a1b02e999541ec1b21b5f6ce0489b3a159f47e37d409178ba7c21c00e177b0fdb410ca6e9d6142

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0-rc1.zip>

      SIZE:   35579788 bytes
      SHA1:   b7ae42eb733d4a0e3a2d135c9f8d4af043daa728
      SHA256: 9858e39fd2e7bf207cc9f8846197b11ada5f4424f433ff4df149fe3d48be8e36
      SHA512: 86c93791d312fd2175909020e448a44892740feb809a532ed706c6d850cb92722fb7ca02ecbdf7a1fbeb5b4f42f1338ce9a15b7c0a41055937bd1fdfb4be6f11

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0-rc1.tar.bz2>

      SIZE:   29238901 bytes
      SHA1:   6aad74ed3d30de63c6ff22048cd0fcbcbe123586
      SHA256: 862a8e9e52432ba383660a23d3e87af11dbc18c863a19ef6367eb8259fc47c09
      SHA512: bf0eb114097f9e505ff846f25e7556a2fb393573b4e8b773f94cf5b47998e221f3962a291db15a3cdbdf4ced5a523812937f80d95f4ee3f7b13c4e37f178d7a7

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0-rc1.tar.xz>

      SIZE:   26096412 bytes
      SHA1:   05cacd0341b7a23cc68239c2061640643a30da38
      SHA256: a479a1bce69b2cf656821f10104dcb8b426922b56d3d6cbdf48318842fae752c
      SHA512: 9f9040abf69337439a3f31b80d440d97736555b0df6533d9d34c141ce52226bc40c3f4f7e596e74b080c879e933649c17a073c893be1a304d9a883bab02e9494
