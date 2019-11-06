---
layout: news_post
title: "Ruby 2.6.5 Publicado"
author: "nagachika"
translator: vtamara
date: 2019-10-01 11:00:00 +0000
lang: es
---

Ruby 2.6.5 ha sido publicado.

Esta versión incluye correcciones de seguridad.
Por favor revise detalles en los temas siguientes.

* [CVE-2019-16255: Una vulnerabilidad de inyeccion de código en Shell#[] y Shell#test]({% link es/news/_posts/2019-10-01-code-injection-shell-test-cve-2019-16255.md %})
* [CVE-2019-16254: Separación de respuesta HTTP en WEBrick (Corrección adicional]({% link es/news/_posts/2019-10-01-http-response-splitting-in-webrick-cve-2019-16254.md %})
* [CVE-2019-15845: Una vulnerabilidad de inyección de NUL en File.fnmatch y File.fnmatch?]({% link es/news/_posts/2019-10-01-nul-injection-file-fnmatch-cve-2019-15845.md %})
* [CVE-2019-16201: Vulnerabilidad de Denegación de Servicio en expresiones regulares de la 'autenticación de acceso con resumen' de WEBrick]({% link es/news/_posts/2019-10-01-webrick-regexp-digestauth-dos-cve-2019-16201.md %})

Vea los cambios en detalle en la [bitacora de cambios](https://github.com/ruby/ruby/compare/v2_6_4...v2_6_5).

## Descargas

{% assign release = site.data.releases | where: "version", "2.6.5" | first %}

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

## Release Comment

Muchos contribuyentes, desarrolladores y usuarios han proveido reportes
de fallas que nos han ayudado a hacer esta versión.

Gracias por sus contribuciones.
