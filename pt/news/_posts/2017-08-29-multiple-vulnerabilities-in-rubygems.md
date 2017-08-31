---
layout: news_post
title: "Múltiplas vulnerabilidades no RubyGems"
author: "usa"
translator: "fpgentil"
date: 2017-08-29 12:00:00 +0000
tags: security
lang: pt
---

Existem múltiplas vulnerabilidades no RubyGems, biblioteca do Ruby.
Foi reportado no [blog oficial do RubyGems](http://blog.rubygems.org/2017/08/27/2.6.13-released.html). _(em inglês)_

## Detalhes

As seguintes vulnerabilidades foram reportadas.

* vulnerabilidade de redirecionamento de DNS. (CVE-2017-0902)
* vulnerabilidade de código de escape ANSI. (CVE-2017-0899)
* vulnerabilidade de ataque DoS. (CVE-2017-0900)
* vulnerabilidade no instalador de _gems_ que permite uma _gem_ maliciosa sobrescrever arquivos
arbitrários. (CVE-2017-0901)

É altamente recomendado para os usuários do Ruby que sigam uma das soluções alternativas o mais
rápido possível.

## Versões Afetadas

* Série do Ruby 2.2: 2.2.7 e anteriores
* Série do Ruby 2.3: 2.3.4 e anteriores
* Série do Ruby 2.4: 2.4.1 e anteriores
* Anteriores ao _trunk revision_ 59672

## Soluções alternativas

Até o momento, não existem _releases_ do Ruby incluindo correções para o RubyGems.
Mas você pode atualizar o RubyGems para a última versão.
RubyGems 2.6.13 ou versões mais recentes incluem a correção das vulnerabilidades.

```
gem update --system
```

Se você não pode atualizar o RubyGems, você pode aplicar os seguintes _patches_ como soluções
alternativas.

* [para o Ruby 2.2.7](https://bugs.ruby-lang.org/attachments/download/6690/rubygems-2613-ruby22.patch)
* [para o Ruby 2.3.4](https://bugs.ruby-lang.org/attachments/download/6691/rubygems-2613-ruby23.patch)
* para o Ruby 2.4.1: são necessários 2 _patches_.  Aplique-os sequencialmente:
  1. [RubyGems 2.6.11 até 2.6.12](https://bugs.ruby-lang.org/attachments/download/6692/rubygems-2612-ruby24.patch)
  2. [RubyGems 2.6.12 até 2.6.13](https://bugs.ruby-lang.org/attachments/download/6693/rubygems-2613-ruby24.patch)

Quanto ao _trunk_, atualize para a última versão.

## Créditos

Baseado no relato do [blog oficial do RubyGems](http://blog.rubygems.org/2017/08/27/2.6.13-released.html). _(em inglês)_

## Histórico

* Originalmente publicado em 2017-08-29 12:00:00 UTC
* Adicionado números de vulnerabilidades e exposições comuns (CVE) em 2017-08-31 02:00:00 UTC
