---
layout: news_post
title: "Ruby 4.0.1 Lançado"
author: k0kubun
translator: guicruzzs
date: 2026-01-13 02:28:48 +0000
lang: pt
---

Ruby 4.0.1 foi lançado.

Esta versão inclui uma correção de bug para despertares espúrios de `Kernel#sleep` quando um subprocesso é finalizado em outra thread,
além de outras correções de bugs. Consulte os [lançamentos no GitHub](https://github.com/ruby/ruby/releases/tag/v4.0.1) para mais detalhes.

## Calendário de Lançamentos

Pretendemos lançar a versão estável mais recente do Ruby (atualmente Ruby 4.0) a cada dois meses após o lançamento mais recente.
Ruby 4.0.2 será lançado em março, 4.0.3 em maio, 4.0.4 em julho, 4.0.5 em setembro e 4.0.6 em novembro.

Se surgir alguma alteração que afete significativamente as pessoas usuárias, um lançamento poderá ocorrer antes do planejado
e o cronograma subsequente poderá ser ajustado de acordo.

## Download

{% assign release = site.data.releases | where: "version", "4.0.1" | first %}

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
