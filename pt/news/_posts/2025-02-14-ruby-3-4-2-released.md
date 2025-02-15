---
layout: news_post
title: "Ruby 3.4.2 Lançado"
author: k0kubun
translator: nbluis
date: 2025-02-14 21:55:17 +0000
lang: pt
---

Ruby 3.4.2 foi lançado.

Esta é uma atualização de rotina que inclui correções de bugs. Por favor consulte as
[notas de lançamento no GitHub](https://github.com/ruby/ruby/releases/tag/v3_4_2) para maiores detalhes.

## Cronograma de Lançamento

Nosso objetivo é lançar a versão estável mais recente do Ruby (atualmente Ruby 3.4) a cada 2 meses.
O Ruby 3.4.3 será lançado em abril, 3.4.4 em junho, 3.4.5 em agosto, 3.4.6 em outubro e 3.4.7 em dezembro.

Caso haja alguma alteração que afete um número considerável de pessoas, essas versões podem ser lançadas antes do esperado.

## Download

{% assign release = site.data.releases | where: "version", "3.4.2" | first %}

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
Obrigado pelas contribuições.
