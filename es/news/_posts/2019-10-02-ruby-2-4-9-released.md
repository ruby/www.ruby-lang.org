---
layout: news_post
title: "Ruby 2.4.9 Publicado"
author: "usa"
translator: vtamara
date: 2019-10-02 09:00:00 +0000
lang: es
---

Ruby 2.4.9 ha sido publicado

Esta versión vuelve a empaquetar la versión 2.4.8 porque el archivo .tar de
Ruby 2.4.8 no instala.

(Ver [[Falla #16197]](https://bugs.ruby-lang.org/issues/16197) en detalle.)
No hay cambios escenciales excepto el número de versión que pasa de 2.4.8
a 2.4.9.

Ruby 2.4 ahora está en fase de mantenimiento de seguridad, hasta el final
de Marzo de 2020.  Después de esa fecha, cesará el mantenimiento de Ruby 2.4.
Le recomendamos comenzar a planear la migración a versiones de Ruby más
reciente, tales como 2.6 o 2.5.

## Descargas

{% assign release = site.data.releases | where: "version", "2.4.9" | first %}

* <{{ release.url.bz2 }}>

      SIZE: {{ release.size.bz2 }}
      SHA1: {{ release.sha1.bz2 }}
      SHA256: {{ release.sha256.bz2 }}
      SHA512: {{ release.sha512.bz2 }}

* <{{ release.url.gz }}>

      SIZE: {{ release.size.gz }}
      SHA1: {{ release.sha1.gz }}
      SHA256: {{ release.sha256.gz }}
      SHA512: {{ release.sha512.gz }}

* <{{ release.url.xz }}>

      SIZE: {{ release.size.xz }}
      SHA1: {{ release.sha1.xz }}
      SHA256: {{ release.sha256.xz }}
      SHA512: {{ release.sha512.xz }}

* <{{ release.url.zip }}>

      SIZE: {{ release.size.zip }}
      SHA1: {{ release.sha1.zip }}
      SHA256: {{ release.sha256.zip }}
      SHA512: {{ release.sha512.zip }}

## Comentario de la versión

Gracias a todos los que ayudaron con esta versión.
