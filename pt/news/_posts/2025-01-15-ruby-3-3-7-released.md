---
layout: news_post
title: "Ruby 3.3.7 Lançado"
author: k0kubun
translator: nbluis
date: 2025-01-15 07:51:59 +0000
lang: pt
---

Ruby 3.3.7 foi lançado.

Esta é uma atualização de rotina que inclui correções de bugs menores.
Por favor, consulte [as notas de lançamento no GitHub](https://github.com/ruby/ruby/releases/tag/v3_3_7) para mais detalhes.

## Download

{% assign release = site.data.releases | where: "version", "3.3.7" | first %}

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

## Comentário sobre o Lançamento

Muitos committers, desenvolvedores e usuários que forneceram relatórios de bugs nos ajudaram a fazer este lançamento.
Obrigado pelas suas contribuições.
