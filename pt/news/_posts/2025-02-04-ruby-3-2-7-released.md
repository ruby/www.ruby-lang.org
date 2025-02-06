---
layout: news_post
title: "Ruby 3.2.7 Lançado"
author: nagachika
translator: nbluis
date: 2025-02-04 12:00:00 +0000
lang: pt
---

Ruby 3.2.7 foi lançado.

Por favor, consulte os [lançamentos no GitHub](https://github.com/ruby/ruby/releases/tag/v3_2_7) para mais detalhes.

## Download

{% assign release = site.data.releases | where: "version", "3.2.7" | first %}

* <{{ release.url.gz }}>

      TAMANHO: {{ release.size.gz }}
      SHA1: {{ release.sha1.gz }}
      SHA256: {{ release.sha256.gz }}
      SHA512: {{ release.sha512.gz }}

* <{{ release.url.xz }}>

      TAMANHO: {{ release.size.xz }}
      SHA1: {{ release.sha1.xz }}
      SHA256: {{ release.sha256.xz }}
      SHA512: {{ release.sha512.xz }}

* <{{ release.url.zip }}>

      TAMANHO: {{ release.size.zip }}
      SHA1: {{ release.sha1.zip }}
      SHA256: {{ release.sha256.zip }}
      SHA512: {{ release.sha512.zip }}

## Comentário do Lançamento

Muitos committers, desenvolvedores e usuários que forneceram relatórios de bugs nos ajudaram a fazer este lançamento.
Obrigado pelas contribuições.
