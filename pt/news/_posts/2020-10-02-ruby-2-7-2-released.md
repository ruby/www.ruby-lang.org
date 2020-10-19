---
layout: news_post
title: "Lançado Ruby 2.7.2"
author: "nagachika"
translator: "jcserracampos"
date: 2020-10-02 11:00:00 +0000
lang: pt
---

Ruby 2.7.2 foi lançado.

Esta versão contém incompatibilidade intencional. Alertas de depreciação estão desativadas por padrão no 2.7.2 em diante.
Você pode ativar esses alertas de depreciação especificando as opções -w ou -W:deprecated na linha de comando.
Por favor, veja os tópicos abaixo para detalhes.

* [Feature #17000 2.7.2 turns off deprecation warnings by default](https://bugs.ruby-lang.org/issues/17000)
* [Feature #16345 Don't emit deprecation warnings by default.](https://bugs.ruby-lang.org/issues/16345)

Esta versão contém a nova versão de webrick com uma correção de seguração descrita neste artigo.

* [CVE-2020-25613: Potencial Vulnerabilidade de Smuggling de Requisições HTTP no WEBrick](/pt/news/2020/09/29/http-request-smuggling-cve-2020-25613/)

Veja [commit logs](https://github.com/ruby/ruby/compare/v2_7_1...v2_7_2) para outras alterações.

## Download

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

## Comentário de Versão

Obrigado às várias pessoas que fizeram commits, pessoas desenvolvedoras e usuárias que informaram bugs e contribuíram para que esta versão fosse possível.
