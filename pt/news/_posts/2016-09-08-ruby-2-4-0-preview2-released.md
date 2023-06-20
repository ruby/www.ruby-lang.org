---
layout: news_post
title: "Lançado Ruby 2.4.0-preview2"
author: "naruse"
translator: "jcserracampos"
date: 2016-09-08 09:00:00 +0000
lang: pt
---

Estamos satisfeitos em anunciar o lançamento do Ruby 2.4.0-preview2.

Ruby 2.4.0-preview2 é o segundo *preview* do Ruby 2.4.0.
Este preview2 está sendo lançado para receber comentários da comunidade.
Sinta-se a vontade para
[enviar comentários](https://github.com/ruby/ruby/wiki/How-To-Report)
sendo que você ainda pode mudar as funcionalidades.

## [Unificação de Fixnum e Bignum em Integer](https://bugs.ruby-lang.org/issues/12005)

Embora a [ISO/IEC 30170:2012](http://www.iso.org/iso/iso_catalogue/catalogue_tc/catalogue_detail.htm?csnumber=59579)
não especifique detalhes da classe Integer,
CRuby tem duas classes visíveis de Integer: Fixnum e Bignum.
Ruby 2.4 as unifica em Integer.
Todas as extensões em C que envolvem as classes Fixnum ou Bignum precisam ser corrigidas.

Veja também [o ticket](https://bugs.ruby-lang.org/issues/12005) e [slides do akr](http://www.a-k-r.org/pub/2016-09-08-rubykaigi-unified-integer.pdf).

## [String suporta mapeamento de código Unicode](https://bugs.ruby-lang.org/issues/10085)

`String/Symbol#upcase/downcase/swapcase/capitalize(!)` agora lida
com mapeamento de código Unicode ao invés de apenas mapeamento de código ASCII.

## Aperfeiçoamento de perfomance

Ruby 2.4 também contém os seguintes aprimoramentos de performance incluindo
mudanças na linguagem

### [Array#max, Array#min](https://bugs.ruby-lang.org/issues/12172)

`[x, y].max` e `[x, y].min` estão otimizadas para não criarem um *array* temporário
dentro de certas condições.

### [Regexp#match?](https://bugs.ruby-lang.org/issues/8110)

Adicionada `Regexp#match?`, que executa uma combinação de expressão regular sem criar
um objeto de referência de volta e mudando '$~' para reduzir a alocação de objeto.

### Outras melhorias de perfomance

* [acelerado o acesso a variável de instância](https://bugs.ruby-lang.org/issues/12274)

## Debugging

### [Thread#report_on_exception e Thread.report_on_exception](https://bugs.ruby-lang.org/issues/6647)

Ruby ignora exceções em *threads* a não ser que outra *thread* se junte explicitamente a ela.
Com `report_on_exception = true`,
você pode notar se uma *thread* morreu devido a uma exceção não processada.

Envie-nos comentários sobre qual deve ser o padrão para `report_on_exception`
e sobre report-on-GC, o qual mostrar um relatório quando uma *thread* é
coletada como lixo sem se juntar.

### [Detecção de *thread deadlock* agora mostra *threads* com seu histórico e dependências](https://bugs.ruby-lang.org/issues/8214)

Ruby tem deteção de *deadlock* para *threads* em espera, mas seu relatório não
inclue informações suficientes para debugar.
A detecção de *deadlock* no Ruby 2.4 mostrar *threads* com seu histórico e
*threads* dependentes.

Experimente e aproveite programando com Ruby 2.4.0-preview2, e
[nos envie comentários](https://github.com/ruby/ruby/wiki/How-To-Report)!

## Mudanças notáveis desde de 2.3

* Suporte a OpenSSL 1.1.0
* ext/tk foi removido de stdlib [Feature #1490]

Veja [NOTÍCIAS](https://github.com/ruby/ruby/blob/v2_4_0_preview1/NEWS)
e [ChangeLog](https://github.com/ruby/ruby/blob/v2_4_0_preview1/ChangeLog)
para detalhes.

With those changes,
[2353 arquvidos alterados, 289057 inserções(+), 73847 remoções(-)](https://github.com/ruby/ruby/compare/v2_3_0...v2_4_0_preview2)
desde Ruby 2.3.0!

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

## Comentário de Lançamento

Veja também o cronograma de lançamento e outras informações:

[ReleaseEngineering24](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering24)
