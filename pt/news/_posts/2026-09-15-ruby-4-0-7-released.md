---
layout: news_post
title: "Ruby 4.0.7 foi lançado"
author: k0kubun
translator: Gabriel Lidenor
date: 2026-09-15 00:25:58 +0000
lang: pt
---

Ruby 4.0.7 foi lançado.

Essa atualização de rotina inclui correções de bugs.
Consulte os [lançamentos no GitHub](https://github.com/ruby/ruby/releases/tag/v4.0.7) para mais detalhes.

## Calendário de lançamento

Pretendemos lançar a versão estável mais recente do Ruby (atualmente Ruby 4.0) a cada dois meses.
Ruby 4.0.8 será lançado em novembro.

Caso surja uma alteração que afete significativamente os usuários, um lançamento poderá ocorrer antes do planejado.

## Download

{% assign release = site.data.releases | where: "version", "4.0.7" | first %}

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

## Notas de lançamento

Muitos committers, desenvolvedores e usuários que enviaram relatórios de bugs ajudaram a tornar este lançamento possível. Obrigado pelas contribuições de todos.
