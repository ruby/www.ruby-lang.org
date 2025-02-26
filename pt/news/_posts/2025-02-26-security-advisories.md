---
layout: news_post
title: "Avisos de segurança: CVE-2025-27219, CVE-2025-27220 e CVE-2025-27221"
author: "hsbt"
translator: nbluis
date: 2025-02-26 07:00:00 +0000
tags: security
lang: pt
---

Publicamos avisos de segurança para CVE-2025-27219, CVE-2025-27220 e CVE-2025-27221. Por favor, leia os detalhes abaixo.

## CVE-2025-27219: Negação de Serviço em `CGI::Cookie.parse`.

Há uma possibilidade de DoS na gem cgi. Esta vulnerabilidade foi identificada com o CVE [CVE-2025-27219](https://www.cve.org/CVERecord?id=CVE-2025-27219). Recomendamos atualizar a gem cgi.

### Detalhes

`CGI::Cookie.parse` levava tempo super-linear para analisar uma string de cookie em alguns casos. Alimentar uma string de cookie maliciosamente criada no método poderia levar a uma Negação de Serviço.

Por favor, atualize a gem CGI para a versão 0.3.5.1, 0.3.7, 0.4.2 ou posterior.

### Versões afetadas

* Versões da gem cgi <= 0.3.5, 0.3.6, 0.4.0 e 0.4.1.

### Créditos

Obrigado a [lio346](https://hackerone.com/lio346) por descobrir este problema. Também agradecemos a [mame](https://github.com/mame) por corrigir esta vulnerabilidade.

## CVE-2025-27220: ReDoS em `CGI::Util#escapeElement`.

Há uma possibilidade de Negação de Serviço por expressão regular (ReDoS) na gem cgi. Esta vulnerabilidade foi identificada com o CVE [CVE-2025-27220](https://www.cve.org/CVERecord?id=CVE-2025-27220). Recomendamos atualizar a gem cgi.

### Detalhes

A expressão regular usada em `CGI::Util#escapeElement` é vulnerável a ReDoS. A entrada criada poderia levar a um alto consumo de CPU.

Esta vulnerabilidade afeta apenas Ruby 3.1 e 3.2. Se você estiver usando essas versões, por favor, atualize a gem CGI para a versão 0.3.5.1, 0.3.7, 0.4.2 ou posterior.

### Versões afetadas

* Versões da gem cgi <= 0.3.5, 0.3.6, 0.4.0 e 0.4.1.

### Créditos

Obrigado a [svalkanov](https://hackerone.com/svalkanov) por descobrir este problema. Também agradecemos a [nobu](https://github.com/nobu) por corrigir esta vulnerabilidade.

## CVE-2025-27221: vazamento de informações de usuário em `URI#join`, `URI#merge` e `URI#+`.

Há uma possibilidade de vazamento de informações de usuário na gem uri. Esta vulnerabilidade foi identificada com o CVE [CVE-2025-27221](https://www.cve.org/CVERecord?id=CVE-2025-27221). Recomendamos atualizar a gem uri.

### Detalhes

Os métodos `URI#join`, `URI#merge` e `URI#+` mantinham informações de usuário, como `user:password`, mesmo após o host ser substituído. Ao gerar uma URL para um host malicioso a partir de uma URL contendo informações de usuário secretas usando esses métodos, e fazer alguém acessar essa URL, poderia ocorrer um vazamento não intencional de informações de usuário.

Por favor, atualize a gem URI para a versão 0.11.3, 0.12.4, 0.13.2, 1.0.3 ou posterior.

### Versões afetadas

* Versões da gem uri < 0.11.3, 0.12.0 a 0.12.3, 0.13.0, 0.13.1 e 1.0.0 a 1.0.2.

### Créditos

Obrigado a [Tsubasa Irisawa (lambdasawa)](https://hackerone.com/lambdasawa) por descobrir este problema. Também agradecemos a [nobu](https://github.com/nobu) por correções adicionais desta vulnerabilidade.

## Histórico

* Publicado originalmente em 2025-02-26 7:00:00 (UTC)
