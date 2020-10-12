---
layout: news_post
title: "Publicado Ruby 2.7.2"
author: "nagachika"
translator: vtamara
date: 2020-10-02 11:00:00 +0000
lang: es
---

Ruby 2.7.2 ha sido publicado.

Esta versión contiene incompatibilidades intencionales.  Las advertencias
de obsolescencia están apagadas por omisión en 2.7.2 y posteriores.
Puede encender las advertencias de obsolescencia especificando la opción
-w o -W:deprecated en la línea de ordenes.  Por favor revise detalles
en los temas siguientes.

* [Característica #17000 2.7.2 turns off deprecation warnings by default](https://bugs.ruby-lang.org/issues/17000)
* [Característica #16345 Don't emit deprecation warnings by default.](https://bugs.ruby-lang.org/issues/16345)

Esta versión contiene la nueva versión de webrick con una corrección
de seguridad descrita en el artículo

* [CVE-2020-25613: WEBrick potencialmente vulnerable a contrabando de solicitudes HTTP](/es/news/2020/09/29/http-request-smuggling-cve-2020-25613/)

Ver otros cambios en la [bitácora de contribuciones](https://github.com/ruby/ruby/compare/v2_7_1...v2_7_2).

## Descargas

{% assign release = site.data.releases | where: "version", "2.7.2" | first %}

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

Agradecemos a los muchos contribuyentes, desarrolladores y usuarios que
suministraron reportes de fallas y contribuciones que hicieron posible
esta versión.
