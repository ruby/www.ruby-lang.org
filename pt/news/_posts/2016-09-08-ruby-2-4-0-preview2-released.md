---
layout: news_post
title: "Lançado o Ruby 2.4.0-preview2"
author: "naruse"
translator: "Filipe Rocha"
date: 2016-09-08 18:00:00 +0900
lang: pt
---

Temos o gosto de anunciar a versão 2.4.0-preview2 do Ruby.

A versão 2.4.0-preview2 do Ruby é a segunda *preview* do Ruby 2.4.0,
lançada com o fim de obter *feedback* da comunidade.
Poderão
[enviar *feedback*](https://bugs.ruby-lang.org/projects/ruby/wiki/HowToReport)
uma vez que ainda podem influenciar as funcionalidades.

## [Unificar as classes Fixnum e Bignum na classe Integer](https://bugs.ruby-lang.org/issues/12005)

Apesar do [ISO/IEC 30170:2012](http://www.iso.org/iso/iso_catalogue/catalogue_tc/catalogue_detail.htm?csnumber=59579)
não especificar os detalhes da classe Integer,
o Ruby teve duas classes Integer visíveis: Fixnum and Bignum.
O Ruby 2.4 unifica-as na classe Integer.
Todas as extensões C que utilizam a classe Fixnum ou Bignum necessitam de ser corrigidas.

Consulte também [o ticket](https://bugs.ruby-lang.org/issues/12005) e os [slides do akr](http://www.a-k-r.org/pub/2016-09-08-rubykaigi-unified-integer.pdf).

## [String suporta Unicode case mappings](https://bugs.ruby-lang.org/issues/10085)

`String/Symbol#upcase/downcase/swapcase/capitalize(!)` manipula, agora,
maiúsculas e minúsculas em Unicode em vez de o fazer somente em ASCII.

## Melhorias de desempenho

O Ruby 2.4 contém, também, as seguintes melhorias na performance incluindo melhorias na linguagem:

### [Array#max, Array#min](https://bugs.ruby-lang.org/issues/12172)

`[x, y].max` e `[x, y].min` estão otimizados para evitar a criação de um array temporário em certas condições.

### [Regexp#match?](https://bugs.ruby-lang.org/issues/8110)

Adicionado `Regexp#match?`, que executa um *regexp match* sem a criação
de um objeto de referência e alterando `$~` para reduzir a alocação de objetos.

### Outras melhorias de desempenho

* [acelerar o acesso às variáveis de instância](https://bugs.ruby-lang.org/issues/12274)

## Depuração

### [Thread#report_on_exception and Thread.report_on_exception](https://bugs.ruby-lang.org/issues/6647)

O Ruby ignora exceções nas *threads*, a não ser que outra *thread* se junte a elas.
Utilizando `report_on_exception = true`,
poderá verificar se uma *thread* terminou devido a uma exceção não tratada.

Enviem-nos *feedback* sobre qual deverá ser o valor pré-definido para `report_on_exception`
e sobre _report-on-GC_, que mostra um relatório quando uma *thread* é *garbage collected* sem se juntar.

### [Deteção de *deadlocks* em *threads* mostra todas as *threads* com o seu *backtrace* e dependencias](https://bugs.ruby-lang.org/issues/8214)

O Ruby tem deteção de *deadlocks* de *threads* em espera, mas o relatório não
inclui informação suficiente para depuração.
A deteção de *deadlocks* no Ruby 2.4 mostra *threads* com o seu *backtrace* e *threads* dependentes.

Experimente e desfrute a programação com o Ruby 2.4.0-preview3 e
[envie-nos o seu *feedback*](https://bugs.ruby-lang.org/projects/ruby/wiki/HowToReport)!

## Outras alterações importantes desde a versão 2.3

* Suporta OpenSSL 1.1.0
* ext/tk foi removido de stdlib [Feature #8539](https://bugs.ruby-lang.org/issues/8539)

Consulte as [Notícias](https://github.com/ruby/ruby/blob/v2_4_0_preview3/NEWS)
e o [ChangeLog](https://github.com/ruby/ruby/blob/v2_4_0_preview3/ChangeLog)
para detalhes.

Com todas as alterações,
[2353 ficheiros alterados, 289057 inserções(+), 73847 eliminações(-)](https://github.com/ruby/ruby/compare/v2_3_0...v2_4_0_preview2)
desde o Ruby 2.3.0!

## Download

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview2.tar.bz2>

  * SIZE:   12463225 bytes
  * SHA1:   95a501624f1cf4bb0785d3e17afd0ad099f66385
  * SHA256: 2224c55b2d87b5c0f08d23a4618e870027dbc1cffbfb4a05efd19eac4ff4cf1d
  * SHA512: 0c9a59a2f57a99c4ee8539a30f41da1de7547566203f89d856e1be9dbb44365754e6c470145dc9336eb324e0feb2f53d9fef18a1564968ac21f9ee528905949f

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview2.tar.gz>

  * SIZE:   15586514 bytes
  * SHA1:   492a13c4ddc1c0c218433acb00dcf7ddeef96fe0
  * SHA256: fec544836428aada2dc593a8cc42ce330798a805e49ecb807a0e21b386fd0b14
  * SHA512: 5a3de852a7611e79f38219ed7bb13772aaabb25538ca843d38743180a0cc939a4e34c008b61d578da785285196b6b8882270bddc17cbed481237db8afa4c54e4

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview2.tar.xz>

  * SIZE:   9886832 bytes
  * SHA1:   95d5fd7d54d86497194f69ec433755a517dcde8f
  * SHA256: 6c2d25bedc50c2f19b0e349f0ffd9b9a83000d9cb6a677bf5372fb493d33e16a
  * SHA512: b9bd898d17583103ee61b4764ac86eb62c9661fca1f41ff0d06a15965a0a1ba581491d4b8a342e527d63e102b6ddcb2acebdabe5b246409ce9711e13f9428d5b

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview2.zip>

  * SIZE:   17401564 bytes
  * SHA1:   5f3a5b2fd03f70d49e74ec36be3e0c110f6c17cc
  * SHA256: 4d0e466148283ad52208b1e1b70b018aefb7fa95b490fc862d5ea4ca284ecdd2
  * SHA512: 0ef2098d995238580245a4bcee843641199c1194189be13614611e2ffec329278072319a799d409eaf13b1cff45f05a0eae02d9ea8ccc69058fa49e03eca0130

## Comentários de Lançamento

Consulte também o calendário de lançamentos e outras informações:

[ReleaseEngineering24](https://bugs.ruby-lang.org/projects/ruby-trunk/wiki/ReleaseEngineering24)
