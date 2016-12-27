---
layout: news_post
title:  "Problemas con los servicios de ruby-lang.org"
author: "hsbt"
translator: "David Padilla"
date:   2013-08-06 04:00:00 +0000
lang:   es
---

Algunos de los servicios que presta ruby-lang.org han sido detenidos porque
los servidores de ruby-lang.org están abajo.

El impacto es el siguiente:

 * Las listas de distribución provistas por ruby-lang.org no funcionan.
 * Los paquetes tar de Ruby distribuidos por ftp.ruby-lang.org no están disponibles.
 * Si buscas en caché de DNS antiguo no puedes acceder a www.ruby-lang.org.

En este momento estamos reparando estos servicios.

## Actualización (2013-08-06 9:33 UTC)

La causa de los problemas de hoy es una falla en el hardware.
Ya se repararon los siguientes problemas:

 * Todas las listas de distribución están de vuelta, pero aún hay problemas. Estamos trabajando en el.
 * ftp.ruby-lang.org ya está disponible via http y ftp.

Si encuentras otros problemas, por favor repórtalos a
[https://github.com/ruby/www.ruby-lang.org/issues](https://github.com/ruby/www.ruby-lang.org/issues).

## Actualización (2013-08-06 13:18 UTC)

Detuvimos ftp.ruby-lang.org via http y ftp porque algunos de los paquetes viejos
de Ruby son corruptos. Su firma MD5 no corresponde como debe ser.

Estamos investigando. El detalle del problema se encuentra en el siguiente reporte.
[https://github.com/ruby/www.ruby-lang.org/issues/259](https://github.com/ruby/www.ruby-lang.org/issues/259).

## Actualización (2013-08-07 05:08 UTC)

Hemos confirmado que los siguientes paquetes no sirven. Tenemos los mismos paquetes vía
[http://mirrorservice.org/sites/ftp.ruby-lang.org/pub/ruby/](http://mirrorservice.org/sites/ftp.ruby-lang.org/pub/ruby/).

<pre>
ruby-1.9.3-p426.tar.bz2
ruby-1.9.3-p426.tar.gz
ruby-1.9.3-p426.zip
ruby-1.9.3-p429.tar.bz2
ruby-1.9.3-p429.tar.gz
ruby-1.9.3-p429.zip
ruby-2.0.0-p0.tar.bz2
ruby-2.0.0-p0.tar.gz
ruby-2.0.0-p0.zip
ruby-2.0.0-p195.tar.bz2
ruby-2.0.0-p195.tar.gz
ruby-2.0.0-p195.zip
</pre>

Ya confirmamos que la firma MD5 de estos archivos sean los mismos de nuestros anuncios
de liberación. El sitio ftp.ruby-lang.org ya se encuentra disponible via http y ftp.

## Actualización (2013-08-09 10:30 UTC)

Algunos de los servicios que habían estado deshabilitados desde Agosto 6, 2013 por
el accidente en los servidores que habíamos reportado ya están de regreso.

  * Listas de Distribución: Cambiamos el software para proveer el servicio
    de FML a Mailman.
    * Para mas detalles, por favor revisa
      [http://lists.ruby-lang.org](http://lists.ruby-lang.org).
  * Distribución de Paquetes: Ya puedes descargara los paquetes de
    [ftp.ruby-lang.org](https://cache.ruby-lang.org) via http o ftp.
  * Imagenes diarias: Volvemos a comenzar con la compilación y empaque de los
    builds diarios.

Si encuentras algún problema con nuestros servicios, por favor avísanos por
medio de
[https://github.com/ruby/www.ruby-lang.org/issues](https://github.com/ruby/www.ruby-lang.org/issues).
