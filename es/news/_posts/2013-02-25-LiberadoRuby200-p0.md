---
layout: news_post
title: "Liberado Ruby 2.0.0-p0"
author: "Manuel Ramos Caro"
date: 2013-02-25 23:25:50 +0000
lang: es
---

Ruby 2.0.0 es la primera versión estable de la serie 2.0 de Ruby, en
ella encontraremos muchas mejoras y nuevas características en respuesta
a las nuevas necesidades y a la expansión de nuestro lenguaje.

## Que es Ruby 2.0.0

### Nuevas Funcionalidades

* Núcleo del Lenguaje
  * Nuevos tratamientos de argumentos.
  * Module#prepend, como nueva forma de extender una clase.
  * El nuevo literal %i, para simplificar la creación de listas de
    símbolos.
  * \_\_dir\_\_, que retorna el nombre de directorio del fichero en uso.
  * Codificación por defecto en UTF-8.

* Librerías incluidas
  * Enumerable#lazy y Enumerator::Lazy
  * Enumerator#size y Range#size
  * \#to\_h, como nueva convención para conversiones a Hash
  * Onigmo, como nuevo motor de expresiones regulares (una variante de
    Oniguruma)
  * API para el manejo asíncrono de excepciones.

* Soporte de depuración.
  * Soporte para DTrace , diagnostico en tiempo de ejecución en
    producción.
  * TracePoint, Una API para mejorar el trazado.

* Mejoras en rendimiento.
  * Mejora GC para el marcado de imágenes.
  * Optimización de Kernel#require haciendo que Rails empiece muy rápido
  * Mejoras en la VM para el manejo de métodos.
  * Mejoras en las operaciones con tipo Float

Adicionalmente, con carácter experimental se incluye los
\"Refinements\", con objeto de mejorar la modularidad

### Compatibilidad

Se ha tenido cuidado con el diseño de esta versión para que la rama 2.0
sea compatible con la 1.9. Será más sencillo migrar de una rama a otra.

Gracias al trabajo de terceros se ha verificado que aplicaciones
populares como Rails y tDiary son también compatibles.

### Documentación

Se ha realizado como muchos habían solicitado una mejora en la cantidad
de objetos documentados con rDoc. Mientras que la rama 1.9 tenia
aproximadamente el 60% de objetos recogidos en la documentación esta
nueva versión alcanza el 75%.

### Estabilidad

Se debe tener en cuenta que a diferencia de Ruby 1.9.0 la versión 2.0.0
es una versión estable incluso teniendo en cuenta su juventud. Se
recomienda pues a todos los autores su soporte dado que como se menciono
con anterioridad se ha tenido en cuenta en el desarrollo la facilidad
para migrar desde la rama anterior.

Se puede decir que Ruby 2.0.0 esta lista para el uso practico y traerá
mejoras a tu actividad como desarrollador.

### Incompatibilidades

Se ha tenido conocimientos de cinco grandes incompatibilidades a tener
en cuenta si se va a usar esta versión.

* La actual codificación por defecto para los scripts en ruby es UTF-8.
  Algunas personas han reportado que esto afecta a programas existentes,
  algunos analizadores de rendimiento se han vuelto muy lentos.
* Iconv ha sido eliminado. Utilice String#encode, etc. en su lugar.
* Inconsistencia en ABI. Pensamos que una solución es reinstalar las
  extensiones de terceros. Pero se debe ser cuidadoso y no usar ficheros
  .so o .bundle de la rama 1.9
* \#lines, #chars, #codepoints, #bytes retornan ahora un array en lugar
  de un enumerador. Este cambio permite evitar \"line.to\_a\". En lugar
  de esto se debe usar #each\_line, etc... para obtener un enumerador.
* Object#inspect retorna ahora siempre una cadena del estilo
  #&lt;ClassName:0x...&gt; en lugar de delegar la conversión a #to\_s.

### Descargas

Se puede obtener una copia de esta nueva versión desde las siguientes
fuentes de descarga.

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.tar.bz2&gt;][1]

      SIZE:
      10814890 bytes
      MD5:
      895c1c581f8d28e8b3bb02472b2ccf6a
      SHA256:
      c680d392ccc4901c32067576f5b474ee186def2fcd3fcbfa485739168093295f

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.tar.gz&gt;][2]

      SIZE:
      13608925 bytes
      MD5:
      50d307c4dc9297ae59952527be4e755d
      SHA256:
      aff85ba5ceb70303cb7fb616f5db8b95ec47a8820116198d1c866cc4fff151ed

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.zip&gt;][3]

      SIZE:
      15037340 bytes
      MD5:
      db5af5d6034646ad194cbdf6e50f49ee
      SHA256:
      0d0af6a9c8788537efd8d7d2358ce9468e6e2b7703dacba9ebd064d8b7da5f99

Me despido de vosotros transmitiendo las gracias que da el equipo de
desarrollo a todas las personas que han colaborado en esta versión. Dada
la cantidad de gente implicada se ha habilitado una pagina en ingles que
contiene estos [agradecimientos][4].



[1]: https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.tar.bz2
[2]: https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.tar.gz
[3]: https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.zip
[4]: https://bugs.ruby-lang.org/projects/ruby/wiki/200SpecialThanks
