---
layout: news_post
title: "Publicado Ruby 3.0.7"
author: "hsbt"
translator: vtamara
date: 2024-04-23 10:00:00 +0000
lang: es
---

Se ha publicado Ruby 3.0.7.

Esta versión incluye correcciones de seguridad. Por favor
revise detalles en los temas siguientes.

* [CVE-2024-27282: Lectura de direcciones de memoria arbitrarias al buscar Regex]({%link es/news/_posts/2024-04-23-arbitrary-memory-address-read-regexp-cve-2024-27282.md %})
* [CVE-2024-27281: Vulnerabilidad RCE con .rdoc_options en RDoc](https://www.ruby-lang.org/es/news/2024/03/21/rce-rdoc-cve-2024-27281/)
* [CVE-2024-27280: Vulnerabilidad de sobre-lectura de buffer en StringIO](https://www.ruby-lang.org/es/news/2024/03/21/buffer-overread-cve-2024-27280/)

Ver más detalles en la [publicación en Github](https://github.com/ruby/ruby/releases/tag/v3_0_7).

Tras esta versión, Ruby 3.0 llega a su Fin de Vida. En otras palabras,
se espera que esta sea la última versión de la serie Ruby 3.0.
No publicaremos Ruby 3.0.8 incluso si se encuentra una vulnerabilidad
de seguridad (aunque se podría publicar si se encontrara una
regresión mayor).
Recomendamos a todos los usuarios de Ruby 3.0 comenzar de inmediato
la migración hacía Ruby 3.3, 3.2, o 3.1.

## Descargas

{% assign release = site.data.releases | where: "version", "3.0.7" | first %}

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

## Notas de la publicación

Muchos contribuyentes, desarrolladores, y usuarios que proveyeron reportes de
fallas nos ayudaron a hacer esta versión. Gracias por sus contribuciones.
