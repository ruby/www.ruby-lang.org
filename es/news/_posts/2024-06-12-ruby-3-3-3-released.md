---
layout: news_post
title: "Publicado Ruby 3.3.3"
author: "k0kubun"
translator: vtamara
date: 2024-06-12 00:30:00 +0000
lang: es
---

Ruby 3.3.3 ha sido publicado.

Esta versión incluye:

* RubyGems 3.5.11
* Bundler 2.5.11
* REXML 3.2.8
* strscan 3.0.9
* se remplaza `--dump=prism_parsetree` por `--parser=prism --dump=parsetree`
* Los símbolos de codificación inválidos lanzan `SyntaxError` en lugar de
  `EncodingError`
* Corrección a fuga de memoria al analizar con Ripper
* Correcciones a fallas para YJIT, `**{}`, `Ripper.tokenize`, `RubyVM::InstructionSequence#to_binary`, `--with-gmp`, y algunos ambientes de compilación.

Por favor ver más detalles en la [publicación en GitHub](https://github.com/ruby/ruby/releases/tag/v3_3_3).

## Descargas

{% assign release = site.data.releases | where: "version", "3.3.3" | first %}

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

Muchos contribuidores, desarrolladores y usuarios que proveyeron reportes de
fallas nos ayudaron a hacer esta versión.

Gracias por sus contribuciones.
