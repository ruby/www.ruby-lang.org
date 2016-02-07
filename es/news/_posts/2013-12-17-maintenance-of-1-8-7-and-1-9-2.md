---
layout: news_post
title: "Extensión de mantenimiento de seguridad de Ruby 1.8.7 y 1.9.2"
author: "zzak"
translator: "Fernando Perales"
date: 2013-12-17 20:49:03 +0000
lang: es
---

De manera inmediatamente efectiva, las versiones 1.8.7 y 1.9.2 serán
soportadas para parches de seguridad hasta Junio del 2014.

* Terence Lee ([@hone02](https://twitter.com/hone02))
  y Zachary Scott ([@_zzak](https://twitter.com/_zzak))
  estarán a cargo del mantenimiento.
* Después del periodo de mantenimiento de 6 meses, podremos agregar a más
  contribuidores para extender el periodo por otros 6 meses.

Esta extensión de mantenimiento es posible gracias a [Heroku][heroku],
lean su blog post titulado [A Patch in Time: Securing Ruby][securing-ruby]
para mayor información.

### Reporte de incidencias

Durante este periodo extendido _únicamente_ aplicaremos parches de
seguridad al repositorio del código fuente de las versiones
[1.8.7][source-187] y [1.9.2][source-192].

Tomamos la seguridad muy en serio, si encuentras alguna vulnerabilidad,
por favor repórtala inmediatamente al correo security@ruby-lang.org.
Esta lista de correo es privada y los problemas reportados serán
publicados después de que un parche haya sido lanzado.

Por favor dirígete a [ruby-lang.org/es/security][security-es]
para mayor información.

### Sobre el manejo de liberaciones

Como mencionamos antes, sólo aplicaremos parches de seguridad e
incrementaremos el nivel del parche.

No liberaremos una versión parchada de las versiones 1.8.7. o 1.9.2. a
ruby-lang.org. Sin embargo, siéntete libre de empaquetar binarios a
partir del código fuente.

Debido a esto no requerimos abrir tickets nuevos, ya que una entrega
oficial resultaría en la responsabilidad de seguir dando mantenimiento a
esa versión para el equipo de Ruby. Los recursos y el tiempo del equiposon
escasos y sólo queremos alentar actualizaciones, no dar soporte a
versiones viejas.

### ¿Por qué revivir la versión 1.8.7?

Quizá recuerdes un anuncio que hicimos hace aproximadamente 6 meses al
respecto [sunset 1.8.7][sunset-187-es].

Aunque el core de Ruby no continuará el soporte de las versiones 1.8.7 o
1.9.2, Terence y Zachary darán soporte a estas versiones por razones de
seguridad como parte de un patrocinio corporativo.

En el pasado hemos brindado apoyo a proveedores que desean mantener
versiones descontinuadas. En 2009 el mantenimiento de Ruby 1.8.6 fue
transferido a Engine Yard cuando se liberó 1.8.6-p369.

### Palabras de aliento

Nos gustaría tomar esta oportunidad para alentarte fuertemente a
actualizar a una versión de Ruby con soporte tan pronto como sea
posible. Algunos miembros del core de Ruby han dedicado horas incontables
para mejorar el rendimiento y las características de Ruby 2.0+
y desearíamos que tomaras ventaja de ello.

¡Gracias por tu apoyo continuo y sigamos haciendo de Ruby algo mejor!


[heroku]:        http://heroku.com/
[securing-ruby]: https://blog.heroku.com/archives/2013/12/5/a_patch_in_time_securing_ruby/
[source-187]:    https://bugs.ruby-lang.org/projects/ruby-187/repository
[source-192]:    https://bugs.ruby-lang.org/projects/ruby-192/repository
[security-es]:   https://www.ruby-lang.org/es/security/
[sunset-187-es]: https://www.ruby-lang.org/es/news/2013/06/30/we-retire-1-8-7/
