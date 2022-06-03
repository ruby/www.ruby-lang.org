---
layout: news_post
title: "Publicado Ruby 3.1.1"
author: "naruse"
translator: vtamara
date: 2022-02-18 12:00:00 +0000
lang: es
---

Ruby 3.1.1 ha sido publicado.

Esta es la primera versión MINIATURA de la serie 3.1.

Ver detalles en la [bitácora de cambios](https://github.com/ruby/ruby/compare/v3_1_0...v3_1_1).

## Descargas

{% assign release = site.data.releases | where: "version", "3.1.1" | first %}

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

## Comentario de la Versión

Muchos contribuidores, desarrolladores y usuarios han proveido reportes
de fallas ayudandonos a hacer esta versión.
Gracias por sus contribuciones.
