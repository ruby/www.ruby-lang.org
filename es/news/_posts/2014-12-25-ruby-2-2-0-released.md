---
layout: news_post
title: "Liberada la versión 2.2.0 de Ruby"
author: "naruse"
translator: "David Padilla"
date: 2014-12-25 09:00:00 +0000
lang: es
---

Estamos muy contentos de anunciar la entrega final de Ruby 2.2.0.

Ruby 2.2 incluye mucha funcionalidad nueva y mejoras para las necesidades modernas
de Ruby.

Por ejemplo, el Recolector de Basura ahora puede deshacerse de objetos de clase Symbol.
Esto reduce el uso de memoria de los objectos de esta clase; versiones anteriores a 2.2 no
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

¡Disfruta programar con Ruby 2.2.0 y avísanos si encuentras algún problema!

## Cambios notables desde 2.1

* [Recolector de Basura Incremental](https://bugs.ruby-lang.org/issues/10137)
  ([presentación en RubyConf 2014: "Incremental GC for Ruby interpreter"](http://www.atdot.net/~ko1/activities/2014_rubyconf_pub.pdf))
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
  * Actualización de Rake 10.4.2
  * Actualización de RDoc 4.2.0
  * Actualización de RubyGems 2.4.5
  * Actualización de test-unit 3.0.8 (retirado del repositorio pero incluído en el tarball)
  * Actualización de minitest 5.4.3 (retirado del repositorio pero incluído en el tarball)
  * Deprecar mathn
* API de C
  * Retirar APIs deprecadas

Para más detalles pueden leer [NEWS en el repositorio de Ruby](https://github.com/ruby/ruby/blob/v2_2_0/NEWS).

Con estos cambios, 1557 archivos cambiaron, 125039 inserciones (+), 74376 borrados(-)
desde v2.1.0!

## Descarga

* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0.tar.bz2>
  * SIZE:   13304042 bytes
  * MD5:    d03cd4690fec1fff81d096d1c1255fde
  * SHA256: 1c031137999f832f86be366a71155113675b72420830ce432b777a0ff4942955
  * SHA512: 04edc53e8cd1732c3ca61ebeb1d6133614beb10f77f9abb80d8d36352fe8aa205112068e460bf600b2c7e81e0ddcc3b311e7e027c320366f1bd992b3e378a6ad
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0.tar.gz>
  * SIZE:   16494584 bytes
  * MD5:    cd03b28fd0b555970f5c4fd481700852
  * SHA256: 7671e394abfb5d262fbcd3b27a71bf78737c7e9347fa21c39e58b0bb9c4840fc
  * SHA512: 1ba0c68e1c8d2b60bbd1e218cf36463edbe34cf9418d7593702b631e68d02297465f752e71395f6cfa4104f4cd70a1eb44381ffb74bc7801758b830931fdcfc6
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0.tar.xz>
  * SIZE:   10304244 bytes
  * MD5:    54b43c6c6c9dd4c4b08ceb03ad0ded7a
  * SHA256: 848714e280fc5fb44dbac3b060b206e56c1947006324ee68a174d68b483ef8ca
  * SHA512: cd7e52faa464df8aca7ccfa23a5f06248e1ad82bc8c9f1829aa1b51ff37b15973b8caaa68e914d837325b8d59427fda4f3cad82c50925e1c84e688324a2a155d
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0.zip>
  * SIZE:   18441027 bytes
  * MD5:    f8e1d0cee4f2d9535a9529ed23ae3700
  * SHA256: e06c1e2b1248cf881749833084b2bec93f7612676009190ff9bc89b8fd07c29f
  * SHA512: 364dd927b496520d95a1b06c68e1a265015f4cab08bdf3efaa323d385e7bf075eae47f2e1db78a629db0f3c0c1ed24e086603ba21e2da02ac06dd3c8b716766e
