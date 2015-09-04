---
layout: news_post
title: "Vulnerabilidad en el algoritmo Hash de Ruby."
author: "Manuel Ramos Caro"
lang: es
---

Un atacante podría construir una serie de cadenas que intencionadamente
coincidieran en el valor de su Hash. Utilizando estas secuencias se
podría realizar un ataque de denegación de servicio que podría por
ejemplo afectar a un servidor que utilizara Rails.

La versión 1.8.7-p352 y todas sus predecesoras están afectadas.

Adicionalmente se ha verificado que el problema no puede afectar a la
serie de versiones de Ruby 1.9. Ya que no se comparte la implementación
de dicho algoritmo.

Para mitigar el problema se podrán añadir bits adicionales a la cadena a
evaluar por este algoritmo de forma que “String#hash” detecte un valor
diferente en cada ocasión. No obstante se recomienda la actualización
del intérprete a la última versión. Que se ha liberado en estas fechas
navideñas como viene siendo habitual y contempla la corrección de
pequeños errores y vulnerabilidades.

## Descargas

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p357.tar.gz&gt;][1]

SIZE:

4895136 bytes

MD5:

b2b8248ff5097cfd629f5b9768d1df82

SHA256:

2fdcac4eb37b2eba1a4eef392a2922e07a9222fc86d781d92154d716434b962c

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p357.tar.bz2&gt;][2]

SIZE:

4208157 bytes

MD5:

3abd9e2a29f756a0d30c7bfca578cdeb

SHA256:

5c64b63a597b4cb545887364e1fd1e0601a7aeb545e576e74a6d8e88a2765a37

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p357.zip&gt;][3]

SIZE:

5994841 bytes

MD5:

23efe7ba50458f8df691c7fa07ce0578

SHA256:

b7672524ecac77e7f4bdbbfa5521109a0ef514d22bc726bad073d83b6044d445

## JRuby

La implementación Java de Ruby ha anunciado también una nueva versión
especial para mitigar el problema, JRuby 1.6.5.1. Se recomienda a todos
los usuarios de versiones anteriores que se actualicen a esta
dirigiéndose a la página de descarga del producto.

[&lt;URL:http://www.jruby.org/download&gt;][4]



[1]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p357.tar.gz
[2]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p357.tar.bz2
[3]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p357.zip
[4]: http://www.jruby.org/download
