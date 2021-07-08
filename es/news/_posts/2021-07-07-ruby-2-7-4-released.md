---
layout: news_post
title: "Publicado Ruby 2.7.4"
author: "usa"
translator: "vtamara"
date: 2021-07-07 09:00:00 +0000
lang: es
---

Ruby 2.7.4 ha sido publicado.

Esta versión incluye correcciones de seguridad.
Por favor vea detalles en los siguientes tópicos.

* [CVE-2021-31810: Vulnerabilidad al confiar en respuestas FTP PASV en Net::FTP]({%link es/news/_posts/2021-07-07-trusting-pasv-responses-in-net-ftp.md %})
* [CVE-2021-32066: Vulnerabilidad de recortado de StartTLS en Net::IMAP]({%link es/news/_posts/2021-07-07-starttls-stripping-in-net-imap.md %})
* [CVE-2021-31799: Vulnerabilidad de inyección de ordenes en RDoc]({%link es/news/_posts/2021-05-02-os-command-injection-in-rdoc.md %})

Vea detalles en la [bitacora de contribuciones](https://github.com/ruby/ruby/compare/v2_7_3...v2_7_4).

## Descargas

{% assign release = site.data.releases | where: "version", "2.7.4" | first %}

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

Muchos contribuyentes, desarrolladores y usuarios que reportaron fallas
nos ayudaron a hacer esta versión.
Gracias por sus contribuciones.

El mantenimiento de Ruby 2.7, incluyendo esta versión, se basan en el
"Acuerdo sobre la versión estable de Ruby" de la Asociación Ruby.
