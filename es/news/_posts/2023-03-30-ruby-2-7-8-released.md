---
layout: news_post
title: "Publicado Ruby 2.7.8"
author: "usa"
translator: vtamara
date: 2023-03-30 12:00:00 +0000
lang: es
---

Se ha publicado Ruby 2.7.8.

Esta versión incluye correcciones de seguridad.
Por favor revise detalles en los siguientes temas.

* [CVE-2023-28755: Vulnerabilidad ReDoS en URI]({%link en/news/_posts/2023-03-28-redos-in-uri-cve-2023-28755.md %})
* [CVE-2023-28756: Vulnerabilidad ReDoS en Time]({%link en/news/_posts/2023-03-30-redos-in-time-cve-2023-28756.md %})

Esta versión también incluye correcciones a problemas de construcción.
Ver más detalles en la [publicación en GitHub](https://github.com/ruby/ruby/releases/tag/v2_7_8).

Después de esta versión, Ruby 2.7 llega a su EOL (Fin de vida).
En otras palabras, se espera que esta sea la última versión de la serie
Ruby 2.7.
No publicaremos Ruby 2.7.9 incluso si se encuentra una vulnerabilidad
de seguridad (pero podría publicarse si se encuentra una regresión severa).
Recomendamos a todos los usuarios de Ruby 2.7 que comiencen a migrar a
Ruby 3.2, 3.1, o 3.0 de inmediato.

## Descargas

{% assign release = site.data.releases | where: "version", "2.7.8" | first %}

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

## Notas de publicación

Muchos contribuyentes, desarrolladores, y usuarios que proveyeron
reportes de fallas nos ayudaron a hacer esta versión.
Gracias por sus contribuciones.
