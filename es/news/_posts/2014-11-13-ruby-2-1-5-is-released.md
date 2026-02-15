---
layout: news_post
title: "Liberada la versión de Ruby 2.1.5"
author: "nagachika"
translator: "David Padilla"
date: 2014-11-13 12:00:00 +0000
lang: es
---

Hemos liberado la versión de Ruby 2.1.5.

Esta entrega contiene una corrección de seguridad de una vulnerabilidad
por negación de servicio en REXML.
Es muy similar a la
[vulnerabilidad corregida](https://www.ruby-lang.org/es/news/2014/10/27/rexml-dos-cve-2014-8080/)
en [la entrega anterior](https://www.ruby-lang.org/es/news/2014/10/27/ruby-2-1-4-released/)
pero en este caso manejamos un caso distinto de la expansión de entidades.
Por favor continua leyendo para obtener más detalles.

* [CVE-2014-8090: Otro ataque por negación de servicio en la expansión de XML](https://www.ruby-lang.org/es/news/2014/11/13/rexml-dos-cve-2014-8090/)

También se incluyen otras correcciones.
Puedes ver los [tickets](https://bugs.ruby-lang.org/projects/ruby-21/issues?set_filter=1&amp;status_id=5)
y el [ChangeLog](https://github.com/ruby/ruby/blob//v2_1_5/ChangeLog)
para obtener una lista completa de los cambios incluidos en la versión.

## Descargas

* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.5.tar.bz2](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.5.tar.bz2)

      SIZE:   11994454 bytes
      MD5:    a7c3e5fec47eff23091b566e9e1dac1b
      SHA256: 0241b40f1c731cb177994a50b854fb7f18d4ad04dcefc18acc60af73046fb0a9
      SHA512: d4b1e3c2b6a0dc79846cce056043c48a2a2a97599c76e9a07af21a77fd10e04c8a34f3a60b6975181bff17b2c452af874fa073ad029549f3203e59095ab70196

* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.5.tar.gz](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.5.tar.gz)

      SIZE:   15127433 bytes
      MD5:    df4c1b23f624a50513c7a78cb51a13dc
      SHA256: 4305cc6ceb094df55210d83548dcbeb5117d74eea25196a9b14fa268d354b100
      SHA512: a7da8dc755e5c013f42269d5e376906947239b41ece189294d4355494a0225590ca73b85261ddd60292934a8c432231c2308ecfa137ed9e347e68a2c1fc866c8

* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.5.tar.xz](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.5.tar.xz)

      SIZE:   9371780 bytes
      MD5:    8a30ed4b022a24acbb461976c9c70789
      SHA256: 22ba1eb8d475c9ed7e0541418d86044c1ea4c093ab79c300c38fc0f721afe9a3
      SHA512: 8a257da64158d49bc2810695baf4b5849ef83e3dde452bf1e4823e52e8261225427d729fce2fb4e9b53d6d17ca9c96d491f242535c2f963738b74f90944e2a0b

* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.5.zip](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.5.zip)

      SIZE:   16657694 bytes
      MD5:    810cd05eb03c00f89b0b03b10e9a3606
      SHA256: 69c517a6d3ea65264455a9316719ffdec49cf6a613a24fd89b3f6da7146a8aa7
      SHA512: a55cf5970203904e7bc8cef2b6fbf7b8d5067a160289a1a49d13c4dfef8c95002bcdf697f5d04d420ef663efad5ee80d5a9e4e7445c4db9a02f9cbc9e4b8444e

## Comentarios de la entrega

Nos disculpamos por la inconveniencia que pueda causar liberar versiones tan
frecuentemente.
Agradecemos a todos los que ayudaron con esta entrega.
