---
layout: news_post
title: "Otra vulnerabilidad DoS en la biblioteca CGI"
author: "Diego Algorta Casamayou"
lang: es
---

Otra vulnerabilidad ha sido descubierta en la biblioteca CGI (cgi.rb)
que viene incluída con Ruby y podría ser usada por un usuario malicioso
para crear un ataque de denegación de servicio (DoS).

Esta vulnerabilidad está abierta al público como [JVN#84798830][1].

Tener en cuenta que el [parche previo][2] no corrige este problema.

#### Impacto

Una solicitud HTTP específica para cualquier aplicación web que use
cgi.rb causa el consumo de CPU en la máquina en la que se ejecuta la
aplicación web. Muchas de estas solicitudes tienen como resultado la
denegación de servicio.

#### Versiones vulnerables

series 1.8
: 1\.8.5 y todas las versiones anteriores

Versión de desarrollo (series 1.9)
: Todas las versiones anteriores al 2006-12-04

#### Solución

series 1.8

: Por favor actualízate a la versión 1.8.5-p2.

  [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.5-p2.tar.gz&gt;][3]
  (4519151 bytes, md5sum: a3517a224716f79b14196adda3e88057)

  Recuerda que puede ya estar disponible un paquete que corrige esta
  debilidad a través de tu software de administración de paquetes.

Versión de desarrollo (series 1.9)
: Por favor actualiza tu Ruby a una versión posterior al 2006-12-04.



[1]: http://jvn.jp/jp/JVN%2384798830/index.html
[2]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.5-cgi-dos-1.patch
[3]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.5-p2.tar.gz
