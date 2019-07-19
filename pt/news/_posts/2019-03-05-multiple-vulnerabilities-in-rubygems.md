---
layout: news_post
title: "Múltiplas vulnerabilidades em RubyGems"
author: "hsbt"
translator: "jcserracampos"
date: 2019-03-05 00:00:00 +0000
tags: security
lang: pt
---

Existem múltiplas vulnerabilidades no RubyGems empacotado com Ruby.
Isto foi [reportado no blog oficial do RubyGems](http://blog.rubygems.org/2019/03/05/security-advisories-2019-03.html).

## Detalhes

As seguintes vulnerabilidades foram reportadas:

* CVE-2019-8320: Exclui diretório usando symlink quando descomprimindo tar
* CVE-2019-8321: Vulnerabilidade de injeção de sequência de escape em `verbose`
* CVE-2019-8322: Vulnerabilidade de injeção de sequência de escape em `gem owner`
* CVE-2019-8323: Vulnerabilidade de injeção de sequência de escape em tratamento de respostas de API
* CVE-2019-8324: A instalação de uma gem maliciosa pode gerar execução arbitrária de código
* CVE-2019-8325: Vulnerabilidade de injeção de sequência de escape em erros

É fortemente recomendado que usuários de Ruby atualizem sua instalação de Ruby ou tomme uma das seguintes soluções alternativas assim que possível.

## Versões afetadas

* Série Ruby 2.3: todas
* Série Ruby 2.4: 2.4.5 e anteriores
* Série Ruby 2.5: 2.5.3 e anteriores
* Série Ruby 2.6: 2.6.1 e anteriores
* Antes da revisão de trunk 67168

## Soluções alternativas

Em princípio, você deve atualizar sua instalação do Ruby para a última versão.
RubyGems 3.0.3 ou posterior incluem a correção para essas vulnerabilidade, então atualize seu RubyGems para a última versão se você não pode atualizar o Ruby em si.

```
gem update --system
```

Se você não pode atualizar RubyGems, você pode aplicar os seguintes patches como uma solução alternativa.

* [para Ruby 2.4.5](https://bugs.ruby-lang.org/attachments/7669)
* [para Ruby 2.5.3](https://bugs.ruby-lang.org/attachments/7670)
* [para Ruby 2.6.1](https://bugs.ruby-lang.org/attachments/7671)

Em relação ao trunk do Ruby, atualize para a última revisão.

## Créditos

Este relatório é baseado no [blog oficial de RubyGems](http://blog.rubygems.org/2019/03/05/security-advisories-2019-03.html).

## Histórico

* Originalmente publicado em 2019-03-05 00:00:00 UTC
* Link para os patches atualizado em 2019-03-06 05:26:27 UTC
* Menção sobre atualizando Ruby em si em 2019-04-01 06:00:00 UTC
