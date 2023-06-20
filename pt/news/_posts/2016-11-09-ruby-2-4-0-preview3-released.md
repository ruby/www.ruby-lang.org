---
layout: news_post
title: "Lançado o Ruby 2.4.0-preview3"
author: "naruse"
translator: "Filipe Rocha"
date: 2016-11-09 09:00:00 +0000
lang: pt
---

Temos o gosto de anunciar a versão 2.4.0-preview3 do Ruby.

A versão 2.4.0-preview3 do Ruby é a terceira *preview* do Ruby 2.4.0,
lançada com o fim de obter *feedback* da comunidade.

Poderão
[enviar *feedback*](https://github.com/ruby/ruby/wiki/How-To-Report)
uma vez que ainda podem influenciar das funcionalidades.

## [Introdução de melhorias nas hash tables por Vladimir Makarov](https://bugs.ruby-lang.org/issues/12142)

Melhorar a estrutura interna da hash table (st_table) introduzindo o *open addressing*
e introdução de um *array* com a ordem de inclusão.

## Binding#irb: Iniciar uma sessão REPL como `binding.pry`

Enquanto está a fazer o *debug*, poderá utilizar `p` para listar o valor das variáveis.
Com o [pry](https://github.com/pry/pry) e incluindo `binding.pry` na sua aplicação,
será lançado este REPL para correr qualquer código ruby.
[r56624](https://github.com/ruby/ruby/commit/493e48897421d176a8faf0f0820323d79ecdf94a) introduz `binding.irb` com o mesmo comportamento para o irb.

## [Unificar as classes Fixnum e Bignum na classe Integer](https://bugs.ruby-lang.org/issues/12005)

Apesar do [ISO/IEC 30170:2012](http://www.iso.org/iso/iso_catalogue/catalogue_tc/catalogue_detail.htm?csnumber=59579)
não especificar os detalhes da classe Integer,
o Ruby teve duas classes Integer visíveis: Fixnum and Bignum.
O Ruby 2.4 unifica-as na classe Integer.
Todas as extensões C que utilizam a classe Fixnum ou Bignum necessitam de ser corrigidas.

Consultar também [o ticket](https://bugs.ruby-lang.org/issues/12005) e os [slides do akr](http://www.a-k-r.org/pub/2016-09-08-rubykaigi-unified-integer.pdf).

## [String suporta Unicode case mappings](https://bugs.ruby-lang.org/issues/10085)

`String/Symbol#upcase/downcase/swapcase/capitalize(!)` manipula, agora,
maiúsculas e minúsculas em Unicode em vez de o fazer somente em ASCII.

## Melhorias de desempenho

O Ruby 2.4 contém, também, as seguintes melhorias na performance incluindo melhorias na linguagem:

### [Array#max, Array#min](https://bugs.ruby-lang.org/issues/12172)

`[x, y].max` e `[x, y].min` estão optimizados para evitar a criação de um array temporário em certas condições.

### [Regexp#match?](https://bugs.ruby-lang.org/issues/8110)

Adicionado `Regexp#match?`, que executa um *regexp match* sem a criação
de um objecto de referência e alterando `$~` para reduzir a alocação de objectos.

### Outras melhorias de desempenho

* [acelerar o acesso às variáveis de instância](https://bugs.ruby-lang.org/issues/12274)

## Depuração

### [Thread#report_on_exception and Thread.report_on_exception](https://bugs.ruby-lang.org/issues/6647)

O Ruby ignora exceções nas *threads*, a não ser que outra *thread* se junte a elas.
Utilizando `report_on_exception = true`,
poderá verificar se uma *thread* terminou devido a uma exceção não tratada.

Enviem-nos *feedback* sobre qual deverá ser o valor pré-definido para `report_on_exception`
e sobre report-on-GC, que mostra um relatório quando uma *thread* é *garbage collected* sem se juntar.

### [Deteção de *deadlocks* em *threads* mostra todas as *threads* com o seu *backtrace* e dependencias](https://bugs.ruby-lang.org/issues/8214)

O Ruby tem deteção de *deadlocks* de *threads* em espera, mas relatório não
inclui informação suficiente para depuração.
A deteção de *deadlocks* no Ruby 2.4 mostra *threads* com o seu *backtrace* e *threads* dependentes.

Experimente e desfrute a programação com o Ruby 2.4.0-preview3 e
[envie-nos o seu *feedback*](https://github.com/ruby/ruby/wiki/How-To-Report)!

## Outras alterações importantes desde a versão 2.3

* Suporta OpenSSL 1.1.0
* ext/tk foi removido de stdlib [Feature #8539](https://bugs.ruby-lang.org/issues/8539)
* XMLRPC foi removido de stdlib [Feature #12160](https://bugs.ruby-lang.org/issues/12160)

Consultar as [Notícias](https://github.com/ruby/ruby/blob/v2_4_0_preview3/NEWS)
e o [ChangeLog](https://github.com/ruby/ruby/blob/v2_4_0_preview3/ChangeLog)
para detalhes.

Com todas as alterações,
[2470 ficheiros alterados, 283051 inserções(+), 64902 eliminações(-)](https://github.com/ruby/ruby/compare/v2_3_0...v2_4_0_preview3)
desde o Ruby 2.3.0!

## Download

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview3.tar.bz2>

      SIZE:   12615328 bytes
      SHA1:   fefe49f6a7d5b642936c324f3b05aaac827355db
      SHA256: 305a2b2c627990e54965393f6eb1c442eeddfa149128ccdd9f4334e2e00a2a52
      SHA512: 6602c65a7b1e3bc680acc48217108f4335e84fdd74a9cf06f2e2f9ad00a2fccacf9fa035a912bc9d5cc3f0c7a5e21475971dfac37b0364311ef3645f25c7ddf9

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview3.tar.gz>

      SIZE:   15758023 bytes
      SHA1:   f6a6ec9f7fedad0bf4efee2e42801cc963f60dca
      SHA256: c35fe752ccfabf69bf48e6aab5111c25a05938b428936f780638e2111934c9dd
      SHA512: 68556d5252b6813b4c8eeba32733e940207f80694b5c5d20e69bf01eb52929ed2466496b05a895a5ad4831d430695e17624eb35b728b2d4d7cf02df756ac48b4

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview3.tar.xz>

      SIZE:   9957596 bytes
      SHA1:   66592b1a52f985638d639e7c3dd6bdda4e0569d0
      SHA256: b14be2b5c80bff0d6894ae2b37afdb17a968413e70236ec860f3e2d670b4c317
      SHA512: 5be20f0b2609745790c2b22f2228e69a840f63c34a117a1f95fd5436af211f0a6db2758d513d3e095a2d97c53c80793579cb2a1e00e70cf72c487a88c4a40d33

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview3.zip>

      SIZE:   17579012 bytes
      SHA1:   15d08cff952da3844ae54887b7f74b12d47c9ee2
      SHA256: b95a8f67fb7d6e852db77c5660c8878c14d68eb72c5501dac164a7e640ecb06e
      SHA512: fa15e1b7ab0cab56c9a580e1b1e2fee250ee0b9c59546079675a1931a36e37131bd37d64033c75e05d8e9d9fcc33ce7850254d3acaca2136cf3bd08b070244f0

## Comentários de Lançamento

Consulte também o calendário de lançamentos e outras informações:

[ReleaseEngineering24](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering24)
