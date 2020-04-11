---
layout: news_post
title: "Liberada la versión 2.2.0-rc1 de Ruby"
author: "naruse"
translator: "David Padilla"
date: 2014-12-18 09:00:00 +0000
lang: es
---

Estamos muy contentos de anunciar la entrega de Ruby 2.2.0-rc1.
Después de RC1, todos los cambios que se hagan a esta versión será solo para
corregir errores.
La entrega final de Ruby 2.2.0 está agendada para ser liberada en Diciembre 25
del 2014.

Ruby 2.2 incluye mucha funcionalidad nueva y mejoras para las necesidades modernas
de Ruby.

Por ejemplo, el Recolector de Basura ahora puede deshacerse de objetos de clase Symbol.
Esto reduce el uso de memoria de los objetos de esta clase; versiones anteriores a 2.2 no
eliminaban de memoria este tipo de objetos.

Uno de los requerimientos de Rails 5.0 es precisamente que este tipo de objetos
sean recolectados, por lo tanto solo podrá ser soportado en la versión Ruby 2.2
o superiores.
(Ver [el post de la entrega de Rails 4.2](http://weblog.rubyonrails.org/2014/12/19/Rails-4-2-final/) para más detalles.)

También se va a reducir el tiempo de espera gracias al nuevo Recolector de Basura
Incremental lo que será muy util para las aplicaciones de Rails. Algunos avances
recientes mencionados en el [blog de Rails](http://weblog.rubyonrails.org/)
sugieren que Rails 5.0 va a beneficiarse del Recolector de Basura Incremental así
como de la eliminación de objetos Symbol.

Otra característica nueva relacionada al manejo de memoria es una opción adicional
en `configure.in` para utilizar jemalloc [Característica #9113](https://bugs.ruby-lang.org/issues/9113).

Esta funcionalidad es experimental y se encuentra actualmente deshabilitada por defecto hasta
que podamos recolectar más datos del desempeño y casos de uso. Cuando estemos
convencidos de que es un beneficio, habilitaremos la opción por defecto.

También ha sido incorporado soporte experimental para utilizar vfork(2) con
system() y spawn(). Puedes leer más detalles en el [blog en japonés de tanaka-san](http://www.a-k-r.org/d/2014-09.html#a2014_09_06).
Esta característica podría potencialmente traer beneficios enormes de velocidad
cuando se ejecuten procesos muy grandes varias veces.

Aún así, vfork(2) no ha sido debidamente estudiado y podría generar llamadas
al sistema dañinas. Queremos experimentar más para saber que tanto beneficio
se puede obtener recolectando información de desempeño y otros casos de uso.

¡Disfruta programar con Ruby 2.2.0-rc1 y avísanos si encuentras algún problema!

## Cambios notables desde 2.1

* [Recolector de Basura Incremental](https://bugs.ruby-lang.org/issues/10137) ([YARV Maniacs No.12](http://magazine.rubyist.net/?0048-YARVManiacs))
* [Recolector de objetos de clase Symbol](https://bugs.ruby-lang.org/issues/9634) ([Presentación en RubyKaigi 2014](http://www.slideshare.net/authorNari/symbol-gc))
* configure --with-jemalloc [Feature #9113](https://bugs.ruby-lang.org/issues/9113)
* librerías:
  * Soporte para Unicode 7.0 [#9092](https://bugs.ruby-lang.org/issues/9092)
  * New methods:
    * Enumerable#slice_after [#9071](https://bugs.ruby-lang.org/issues/9071), Enumerable#slice_when [#9826](https://bugs.ruby-lang.org/issues/9826)
    * Float#next_float, Float#prev_float [#9834](https://bugs.ruby-lang.org/issues/9834)
    * File.birthtime, File#birthtime [#9647](https://bugs.ruby-lang.org/issues/9647)
    * String#unicode_normalize [#10084](https://bugs.ruby-lang.org/issues/10084)
* librerías incluídas:
  * Actualizacíon de Psych 2.0.8
  * Actualización de Rake 10.4.0
  * Actualización de RDoc 4.2.0.alpha (21b241a)
  * Actualización de RubyGems 2.4.5
  * Actualización de test-unit 3.0.8 (retirado del repositorio pero incluído en el tarball)
  * Actualización de minitest 5.4.3 (retirado del repositorio pero incluído en el tarball)
  * Deprecar mathn
* API de C
  * Retirar APIs deprecadas

Para más detalles pueden leer [NEWS en el repositorio de Ruby (WIP)](https://github.com/ruby/ruby/blob/v2_2_0_rc1/NEWS).

Con estos cambios, 1548 archivos cambiaron, 123658 inserciones(+), 74306 borrados(-) desde v2.1.0!

## Descarga

* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-rc1.tar.bz2>
  * SIZE:   12475612 bytes
  * MD5:    7144732d30dd4547c0a59862b3345d54
  * SHA256: e6a1f8d45ea749bdc92eb1269b77ec475bc600b66039ff90d77db8f50820a896
  * SHA512: 181201168360bee37dceeef3481a69e8a333a5d329680031fd9d371d30ac64460bbdf4db07546133024f541774e51301f1630cfd988c5e5bf2464834f3abe6bf
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-rc1.tar.gz>
  * SIZE:   15531233 bytes
  * MD5:    51f218fabc3ceb7bf3fe5f4f87ddebd3
  * SHA256: a59c8db71b967015ad7c259ba8ef638c7943ec78580412bb86e97791a9322b6b
  * SHA512: 4a35e78c4c0747f9c79e506e98acc117efb0be72fc103d6f9c13d5eb5efa5c6d6748f491526fc7ebb24397f25238f06d552f841e9e898be30aa7cd6c2df38494
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-rc1.tar.xz>
  * SIZE:   9675108 bytes
  * MD5:    3f482b88eda45c1bc6bab1921763ce52
  * SHA256: dcfad9bb6e0b513b03f08f86b195da6a6a7045559b558d3493decac0e0abb86c
  * SHA512: 3ec8955d8a269a1e5f28c3e0e6023bd613f244c83914a4a8c96d2761b11914c21ce67cfadb2bcebc480d9c0b9c7b54da6dfa67cdf4b4350db2a85d379265ffed
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-rc1.zip>
  * SIZE:   17219660 bytes
  * MD5:    49f5aae44c00f4d57be47576c29a53bd
  * SHA256: 1bd3e83d44b4e5879b4ecdc496d19905bc03637a8c88027c2dc98a369f1ebb83
  * SHA512: bf0e39e5add532ca338095ad6eaaafbe4f84cc9df1e8d4bad986c44e17614623430c2670d9751865e8d645cb483007d5473be82536b985ccab40a7dde72c4161

## Comentarios de la entrega

* [Problemas conocidos de 2.2.0](https://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=115)

Para más información de la agenda de entregas:

[ReleaseEngineering22](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering22)
