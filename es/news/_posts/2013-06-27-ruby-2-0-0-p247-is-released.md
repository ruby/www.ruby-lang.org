---
layout: news_post
title: "Liberado Ruby 2.0.0-p247"
author: "nagachika"
translator: "David Padilla"
date: 2013-06-27 11:00:03 +0000
lang: es
---

Ha sido liberada la versión de Ruby 2.0.0-p247.

Esta entrega incluye una corrección de seguridad con respecto a OpenSSL.

* [Vulnerabilidad por evasión de validación del nombre de cliente de SSL
  (CVE-2013-4073)](/es/news/2013/06/27/hostname-check-bypassing-vulnerability-in-openssl-client-cve-2013-4073/)

También incluye otras correcciones.

## Descargas

* [https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p247.tar.bz2](https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p247.tar.bz2)

      SIZE:   10804581 bytes
      MD5:    60913f3eec0c4071f44df42600be2604
      SHA256: 08e3d4b85b8a1118a8e81261f59dd8b4ddcfd70b6ae554e0ec5ceb99c3185e8a

* [https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p247.tar.gz](https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p247.tar.gz)

      SIZE:   13652782 bytes
      MD5:    c351450a0bed670e0f5ca07da3458a5b
      SHA256: 3e71042872c77726409460e8647a2f304083a15ae0defe90d8000a69917e20d3

* [https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p247.zip](https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p247.zip)

      SIZE:   15100206 bytes
      MD5:    7548f781d868456e84afcd0327c7f894
      SHA256: 40c938238075b1e7e8df5d7ebfd069a45b93066318d91da9024d81b20a1c5a8a

## Cambios

Para mas detalles ver [Tickets](https://bugs.ruby-lang.org/projects/ruby-200/issues?set_filter=1&amp;status_id=5) y
[ChangeLog](https://git.ruby-lang.org/ruby.git/plain/ChangeLog?id=refs/tags/v2_0_0_247) correspondientes.

Los cambios principales son:

### Argumentos nombrados

* [#8040](https://bugs.ruby-lang.org/issues/8040) Cambio en la prioridad entre argumentos nombrados y argumentos obligatiorios
* [#8416](https://bugs.ruby-lang.org/issues/8416) super no reenvía `**` nombrado o anónimo
* [#8463](https://bugs.ruby-lang.org/issues/8463) Problema con el auto-splat de un Proc cuando se utilizan argumentos nombrados

### VM/Procesamiento del Lenguaje

* [#8424](https://bugs.ruby-lang.org/issues/8424) corregir un ciclo infinito cuando hay un desbordamiento de pila con TH_PUSH_TAG()
* [#8436](https://bugs.ruby-lang.org/issues/8436) \__dir__ no funciona en eval con binding
* [#8489](https://bugs.ruby-lang.org/issues/8489) Tracepoint API: B_RETURN_EVENT no está siendo llamado cuando se utiliza "next"
* [#8341](https://bugs.ruby-lang.org/issues/8341) block_given? (y el bloque actual) persiste entre llamadas a un proc creado desde un método (utilizando method().to_proc()).
* [#8531](https://bugs.ruby-lang.org/issues/8531) block_given? (y el bloque actual) persiste entre llamadas a un proc creado por Symbol#to_proc.

### RubyGems

La versión incluida de RubyGems ha sido actualizada a 2.0.3

### Codificado

* [#8516](https://bugs.ruby-lang.org/issues/8516) IO#readchar regresa codepoints incorrectos cuando se convierte el codificado.

### Windows

* [#8431](https://bugs.ruby-lang.org/issues/8431) File.read() falla en Win32SP3 32bit

### Bibliotecas

* [#8467](https://bugs.ruby-lang.org/issues/8467) Rebobinar e iterar en un IO comprimido con gzip lleva a una falla de segmento
* [#8415](https://bugs.ruby-lang.org/issues/8415) Net::IMAP#capability_response produce la excepción "Net::IMAP::ResponseParseError: unexpected token CRLF" para CAPABILITY común

## Comentarios de la versión

Muchas gracias a todos los committers, personas que probaron y usuarios que reportaron
bugs. Su apoyo ayudó mucho a liberar esta versión.
