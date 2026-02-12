---
layout: news_post
title: "Ruby 1.9.2 liberada!"
author: "Manuel Ramos Caro"
lang: es
---

Ha sido liberada la versión 1.9.2 de Ruby. La versión más reciente de la
serie 1.9.

### Acerca de Ruby 1.9.2

Ruby 1.9.2 es compatible 1.9.1, si exceptuamos los siguientes cambios:

* Nuevos métodos.
* Nueva API de comunicaciones (soporte para IPv6).
* Nuevas codificaciones.
* Clase aleatoria que soporta múltiples generadores de números
  aleatorios.
* La clase Time es reemplazada. Se elimina el problema del año 2038.
* Algunos cambios en las expresiones regulares(regexp).
* $: no incluirá nunca más el directorio actual.
* dl ha sido reescrito sobre libffi.
* Nueva librería psych que contiene libyaml. Se puede usar esta librería
  en lugar de syck.

Ver los siguientes enlaces para más detalles. [NEWS][1] [ChangeLog][2]

Ruby 1.9.2 cumple el 99% de las especificaciones recopiladas en
[RubySpec][3].

### Plataformas soportadas

Ruby 1.9 incluye cuatro niveles de soporte.

Soportado.

Se verifica que Ruby 1.9.2 trabaja perfectamente en ella. Es posible
mantener 1.9.2 en esta.

* Debian GNU/Linux 5.0 sobre IA32.

Sin garantía de resultados.

Se verifica que Ruby 1.9.2 trabaja adecuadamente en ellos. Se observa la
posibilidad de mantener los mismos.

* mswin32, x64-mswin64, mingw32
* MacOS X 10.5 (Intel) y 10.6
* FreeBSD 6 y posteriores (amd64, IA32)
* Solaris 10
* Symbian OS

Probables.

Ruby 1.9.2 funciona correctamente en ellos con pequeñas modificaciones,
no han sido verificados. Se aceptan parches con objeto de mejorar la
integración en estos.

* Otras distribuciones Linux.
* Otras versiones de MacOS X.
* cygwin
* AIX 5
* Otros sistemas compatibles POSIX
* BeOS (Haiku)

No soportadas.

No se tienen garantías de que Ruby 1.9.2 funciones en estos. Se aceptan
migraciones.

* Cualquier sistema no listado anteriormente.

### FAQ

La librería estandar se instala en /usr/local/lib/ruby/1.9.1
: Este número de versión es “la librería de versión de compatibilidad”.
  Ruby 1.9.2 es altamente compatible con 1.9.1 por lo que esta librería
  se instala en el directorio indicado.

Causa LoadError
: `$:` no incluirá nunca mas el directorio actual . Por lo que algunos
  scripts necesitaran ser modificados para trabajar adecuadamente. En
  cualquier caso, tus scripts no deberían depender del directorio actual
  en la medida de lo posible.

### Descargas

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p0.tar.bz2&gt;][4]
  SIZE
  : 8495472 bytes

  MD5
  : d8a02cadf57d2571cd4250e248ea7e4b

  SHA256
  : e9710990ed8c2e794123aba509010471915fb13c27dae0118831d2001a9c8d3b

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p0.tar.gz&gt;][5]
  SIZE
  : 10787899 bytes

  MD5
  : 755aba44607c580fddc25e7c89260460

  SHA256
  : 8c0c4e261a921b5c406bf9e76ac23bf3c915651534e9d1b9e8c5d0bee4a7285c

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p0.zip&gt;][6]
  SIZE
  : 12159728 bytes

  MD5
  : e57a393ccd62ddece4c63bd549d8cf7f

  SHA256
  : e61521af06da71fde9f0c7c08baaf7415614d00c86ec5a7ab08b60a4f3185b2a



[1]: https://git.ruby-lang.org/ruby.git/plain/NEWS?id=refs/tags/v1_9_2_0
[2]: https://git.ruby-lang.org/ruby.git/plain/ChangeLog?id=refs/tags/v1_9_2_0
[3]: https://github.com/ruby/spec
[4]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p0.tar.bz2
[5]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p0.tar.gz
[6]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p0.zip
