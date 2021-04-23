---
layout: news_post
title: "Publicado Ruby 2.5.9"
author: "usa"
translator: vtamara
date: 2021-04-05 12:00:00 +0000
lang: es
---

Ruby 2.5.9 ha sido publicado.

Esta versión incluye arreglos a fallas de seguridad. Por favor revise
detalles en los los siguientes enlaces.

* [CVE-2020-25613: WEBrick potencialmente vulnerable a contrabando de solicitudes HTTP]({%link es/news/_posts/2020-09-29-http-request-smuggling-cve-2020-25613.md %})
* [CVE-2021-28965: Vulnerabilidad de XML de ida y vuelta en REXML]({% link es/news/_posts/2021-04-05-xml-round-trip-vulnerability-in-rexml-cve-2021-28965.md %})

Ver detalles en [la bitácora de contribuciones](https://github.com/ruby/ruby/compare/v2_5_8...v2_5_9).

Tras esta versión, Ruby 2.5 llega al FDV (Fin de Vida, del inglés EOL -
End Of life). Es decir, que esta es la última versión de la serie 2.5 de Ruby.
No publicaremos Ruby 2.5.10 aún cuando se encuentren fallas de seguridad.
Recomendamos a todos los usuarios de Ruby 2.5 actualizar a Ruby 3.0, 2.7 o
2.6 de inmediato.

## Descargas

{% assign release = site.data.releases | where: "version", "2.5.9" | first %}

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

## Comentarios de la versión

Agradecemos a todos los que ayudaron con esta versión, especialmente
a quienes reportaron las vulnerabilidades.
