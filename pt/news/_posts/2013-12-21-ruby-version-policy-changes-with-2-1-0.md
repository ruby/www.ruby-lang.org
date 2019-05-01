---
layout: news_post
title: "Versionamento Semântico após o Ruby 2.1.0"
author: "zzak"
translator: "diogoandre"
date: 2013-12-21 2:00:00 +0000
lang: pt
---

Decidimos mover para uma política de [Versionamento Semântico](http://semver.org/)
após a liberação do Ruby 2.1.0.

Para prover um esquema de versionamento melhor definido e propriamente utilizado
para o Ruby, nós decidimos por gradualmente mudar para as seguintes políticas.

## Mudanças de Política

Esta política é baseada em uma proposta do administrador de sistemas de ruby-lang.org
Hiroshi Shibata ([@hsbt](https://twitter.com/hsbt)).

### Esquema de Versionamento

* `MAJOR`: acrescido quando mudanças com incompatibilidade que não pode ser lançada em MINOR
  * Reservado para eventos especiais
* `MINOR`: acrecido a cada natal, pode ser incompatível a API
* `TEENY`: correção de segurança ou bug que mantém compatibilidade a API
  * Pode ser acrescido em mais de 10 (como `2.1.11`), e será lançado a cada 2-3 meses.
* `PATCH`: número de commits desde a última versão `MINOR` (será reiniciado para 0 quando lançado uma `MINOR`)

### Esquema de ramificações

Manteremos as seguintes ramificações(branches):

* trunk
* `ruby_{MAJOR}_{MINOR}`

O branch `ruby_{MAJOR}_{MINOR}` será mantido através de lançamentos `TEENY`.
Nós usaremos tags para cada lançamento.

### Compatibilidade de API

As seguintes peculiaridades podem ser marcadas como uma mudança incompatível, requerendo um
acréscimo na versão `MINOR`:

* Remoção de recursos da api no nível C
* Mudanças ou adições incompatíveis com versões anteriores

### Compatibilidade de ABI

ABI será compatível com o seguinte esquema: `{MAJOR}.{MINOR}.0`

Faremos nosso melhor para manter compatibilidade de ABI dentro da mesma versão
de nível `MINOR`, então `TEENY` será corrigida em 0.

## Referências

Para ler mais sobre esta proposta por favor siga os links abaixo:

* [Introducing a semantic versioning scheme and branching policy](https://bugs.ruby-lang.org/issues/8835)
* [Proposta aceita em Inglês](https://gist.github.com/sorah/7803201)
* [Proposta aceita em Japonês](https://gist.github.com/hsbt/7719305)

## Obrigado!

Eu gostaria de pessoalmente agradecer a todos que contribuiram com essa discussão. Cada
passo que tomamos nos deixa mais perto de um Ruby mais estável e efetivo.
