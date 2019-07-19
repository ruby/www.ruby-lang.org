---
layout: news_post
title: "Repositório do Ruby movido para Git de Subversion"
author: "hsbt"
translator: "jcserracampos"
date: 2019-04-23 00:00:00 +0000
lang: pt
---

Hoje, o repositório canônico da linguagem de programação Ruby foi movido para Git de Subversion.

A interface web para o novo repositório é [https://git.ruby-lang.org](https://git.ruby-lang.org) e é provida por cgit. Nós podemos manter o hash de commit do contribuidor diretamente no repositório do Ruby.

## Política de desenvolvimento

* Nós não usamos um brach de tópico em cgit.
* O repositório GitHub permanecerá apenas um espelho. Nós não usamos a funcionalidade "Merge pull request".
* Os branchs ruby_2_4, ruby_2_5 e ruby_2_6 continuarão a usar SVN. Não empurraremos nada para esses branchs em cgit.
* Começando por ruby_2_7 nós usaremos cgit para desenvolver branchs estáveis.
* Nós não usamos merge commits.

## Agradecimentos especiais

* k0kubun

  k0kubun agressivamente desenvolveu cadeias de ferramentas relativas ao lançamento e fluxos de trabalhos de migração e também atualizou o script do hook para git.

* naruse

  naruse atualizou as mudanças de funcionalidade para Ruby CI e Redmine (bugs.ruby-lang.org).

* mame

  mame criou a notificação de commit para slack.

## Trabalho Futuro

Nós ainda temos que completar algumas tarefas. Se você encontrar um problema relacionado a migração para Git, por favor registre isso em [https://bugs.ruby-lang.org/issues/14632](https://bugs.ruby-lang.org/issues/14632).

Aproveite!
