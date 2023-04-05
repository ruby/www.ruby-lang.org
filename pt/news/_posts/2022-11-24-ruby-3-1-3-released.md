---
layout: news_post
title: "Lançado Ruby 3.1.3"
author: "nagachika"
translator: "guicruzzs"
date: 2022-11-24 12:00:00 +0000
lang: pt
---

Ruby 3.1.3 foi lançado.

Essa release inclui correções de segurança.
Por favor, verifique os tópicos abaixo para maiores detalhes.

* [CVE-2021-33621: HTTP response splitting na CGI]({% link en/news/_posts/2022-11-22-http-response-splitting-in-cgi-cve-2021-33621.md %})

Essa release também inclui uma correção para falhas no build com Xcode 14 e macOS 13 (Ventura).
Veja [o ticket relacionado](https://bugs.ruby-lang.org/issues/18912) para mais detalhes.

Veja os [logs de commit](https://github.com/ruby/ruby/compare/v3_1_2...v3_1_3) para maiores detalhes.

## Download

{% assign release = site.data.releases | where: "version", "3.1.3" | first %}

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

## Comentário da Release

Muitos committers, desenvolvedores, e usuários que forneceram bug reports ajudaram-nos a fazer esta release.
Obrigado por suas contribuições.
