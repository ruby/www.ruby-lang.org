---
layout: news_post
title: "Múltiplas vulnerabilidades de jQuery em RDoc"
author: "aycabta"
translator: "jcserracampos"
date: 2019-08-28 09:00:00 +0000
tags: security
lang: pt
---

Existem múltiplas vulnerabilidades de Cross-Site Scripting (XSS) no jQuery inserido no RDoc que é embutido em Ruby.
Todas as pessoas usuárias de Ruby são orientadas a atualizar Ruby para a última versão que inclui a versão corrigida de RDoc.

## Detalhes

As seguintes vulnerabilidades foram reportadas.

- [CVE-2012-6708](https://www.cve.org/CVERecord?id=CVE-2012-6708)
- [CVE-2015-9251](https://www.cve.org/CVERecord?id=CVE-2015-9251)

É fortemente recomendado para todas as pessoas usuárias de Ruby que atualizem sua instalação de Ruby ou tome uma das seguintes soluções alternativas assim que possível.
Você também deve regerar toda documentação existente de RDoc para mitigar completamente as vulnerabilidades.

## Versões afetadas

- Ruby 2.3 series: todas
- Ruby 2.4 series: 2.4.6 e mais recentes
- Ruby 2.5 series: 2.5.5 e mais recentes
- Ruby 2.6 series: 2.6.3 e mais recentes
- anterior a master commit f308ab2131ee675000926540cbb8c13c91dc3be5

## Ações requeridas

RDoc é uma ferramenta de geração de documentação estática.
Atualizando a ferramenta em si é insuficiente para mitigar essas vulnerabilidades.

Então, Documentações RDoc geradas com versões anteriores devem ser regeradas com RDoc mais novo.

## Soluções alternativas

Em princípio, você deve atualizar sua versão de Ruby para a última versão.
RDoc 6.1.2 e superiores incluem a correção para essas vulnerabilidade, então atualize RDoc para a última versão se você não pode atualizar o Ruby em si.

Note que conforme mencionado anteriormente, você deve regerar documentação RDoc existente.

```
gem install rdoc -f
```

_Atualização:_ A versão inicial desta notícia mencionava rdoc-6.1.1.gem, a qual ainda é vulnerável. Por favor, tenha certeza que você instalou rdoc-6.1.2 ou superior.

Sobre a versão de desenvolvimento, atualize para a última HEAD da branch master.

## Créditos

Obrigado a [Chris Seaton](https://hackerone.com/chrisseaton) por reportar este erro.

## Histórico

- Originalmente publicado em 2019-08-28 09:00:00 UTC
- Versão de RDoc corrigida em 2019-08-28 11:50:00 UTC
- Pequenas correções em 2019-08-28 12:30:00 UTC
- Tradução para Português em 2019-09-03 12:00:00 UTC
