---
layout: news_post
title: "Lançado Ruby 2.7.7
"author: "usa"
translator: "guicruzzs"
date: 2022-11-24 12:00:00 +0000
lang: pt
---

Ruby 2.7.7 foi lançado.

Essa release inclui uma correção de segurança
Por favor verifique os tópicos abaixo para maiores detalhes.

* [CVE-2021-33621: HTTP response splitting na CGI]({%link en/news/_posts/2022-11-22-http-response-splitting-in-cgi-cve-2021-33621.md %})

Essa release também inclui algumas correções de problemas do build. Elas não devem afetar a compatibilidade com versões anteriores.
Veja os [logs de commit](https://github.com/ruby/ruby/compare/v2_7_6...v2_7_7) para mais detalhes.

## Download

{% assign release = site.data.releases | where: "version", "2.7.7" | first %}

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

## Comentário da Release

Muitos committers, desenvolvedores e usuários que forneceram bug reports ajudaram-nos a fazer esta release.
Obrigado por suas contribuições.
