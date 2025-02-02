---
layout: news_post
title: "Ruby 3.3.6 Lançado"
author: k0kubun
translator: nbluis
date: 2024-11-05 04:25:00 +0000
lang: pt
---

Ruby 3.3.6 foi lançado.

Esta é uma atualização de rotina que inclui correções de bugs menores.
Esta versão também para de notificar sobre a ausência de dependências de gems padrões que serão incorporadas no Ruby 3.5.
Para mais detalhes, por favor, consulte [as notas de lançamento no GitHub](https://github.com/ruby/ruby/releases/tag/v3_3_6).

## Cronograma de Lançamento

Conforme [anunciado](https://www.ruby-lang.org/en/news/2024/07/09/ruby-3-3-4-released/) anteriormente, pretendemos lançar a versão estável mais recente do Ruby (atualmente Ruby 3.3) a cada 2 meses após um lançamento `.1`.

Esperamos lançar o Ruby 3.3.7 em 7 de janeiro. Se surgirem mudanças significativas que impactem um grande número de usuários, podemos lançar uma nova versão antes do previsto.

## Download

{% assign release = site.data.releases | where: "version", "3.3.6" | first %}

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