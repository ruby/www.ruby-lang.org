---
layout: news_post
title: "Ruby 1.9.2 liberada!"
lang: es
---

Ha sido liberada la versión 1.9.2 de Ruby. La versión más reciente de la
serie 1.9.

### 

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

### 

Ruby 1.9 incluye cuatro niveles de soporte.



Se verifica que Ruby 1.9.2 trabaja perfectamente en ella. Es posible
mantener 1.9.2 en esta.

* Debian GNU/Linux 5.0 sobre IA32.



Se verifica que Ruby 1.9.2 trabaja adecuadamente en ellos. Se observa la
posibilidad de mantener los mismos.

* mswin32, x64-mswin64, mingw32
* MacOS X 10.5 (Intel) y 10.6
* FreeBSD 6 y posteriores (amd64, IA32)
* Solaris 10
* Symbian OS



Ruby 1.9.2 funciona correctamente en ellos con pequeñas modificaciones,
no han sido verificados. Se aceptan parches con objeto de mejorar la
integración en estos.

* Otras distribuciones Linux.
* Otras versiones de MacOS X.
* cygwin
* AIX 5
* Otros sistemas compatibles POSIX
* BeOS (Haiku)



No se tienen garantías de que Ruby 1.9.2 funciones en estos. Se aceptan
migraciones.

* Cualquier sistema no listado anteriormente.

### 


: Este número de versión es “la librería de versión de compatibilidad”.
  Ruby 1.9.2 es altamente compatible con 1.9.1 por lo que esta librería
  se instala en el directorio indicado.


: `$:` no incluirá nunca mas el directorio actual . Por lo que algunos
  scripts necesitaran ser modificados para trabajar adecuadamente. En
  cualquier caso, tus scripts no deberían depender del directorio actual
  en la medida de lo posible.

### 

* [&lt;URL:http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p0.tar.bz2&gt;][4]
  
  : 8495472 bytes
  
  
  : d8a02cadf57d2571cd4250e248ea7e4b
  
  
  : e9710990ed8c2e794123aba509010471915fb13c27dae0118831d2001a9c8d3b

* [&lt;URL:http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p0.tar.gz&gt;][5]
  
  : 10787899 bytes
  
  
  : 755aba44607c580fddc25e7c89260460
  
  
  : 8c0c4e261a921b5c406bf9e76ac23bf3c915651534e9d1b9e8c5d0bee4a7285c

* [&lt;URL:http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p0.zip&gt;][6]
  
  : 12159728 bytes
  
  
  : e57a393ccd62ddece4c63bd549d8cf7f
  
  
  : e61521af06da71fde9f0c7c08baaf7415614d00c86ec5a7ab08b60a4f3185b2a



[1]: http://svn.ruby-lang.org/repos/ruby/tags/v1_9_2_0/NEWS 
[2]: http://svn.ruby-lang.org/repos/ruby/tags/v1_9_2_0/ChangeLog 
[3]: http://www.rubyspec.org 
[4]: http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p0.tar.bz2 
[5]: http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p0.tar.gz 
[6]: http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p0.zip 
