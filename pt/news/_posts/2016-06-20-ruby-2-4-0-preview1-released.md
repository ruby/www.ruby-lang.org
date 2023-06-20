---
layout: news_post
title: "Lançado Ruby 2.4.0-preview1"
author: "naruse"
translator: "jcserracampos"
date: 2016-06-20 09:00:00 +0000
lang: pt
---

Estamos satisfeitos em anunciar o lançamento do Ruby 2.4.0-preview1.

Ruby 2.4.0-preview1 é o primeiro *preview* do Ruby 2.4.0.
Este preview1 está sendo lançado antes do usual porque ele inclui várias
funcionalidades novas e melhorias.
Sinta-se a vontade para
[enviar comentários](https://github.com/ruby/ruby/wiki/How-To-Report)
já que você ainda pode mudar as funcionalidades.


## [Unificação de Fixnum e Bignum em Integer](https://bugs.ruby-lang.org/issues/12005)

Embora a [ISO/IEC 30170:2012](http://www.iso.org/iso/iso_catalogue/catalogue_tc/catalogue_detail.htm?csnumber=59579)
não especifique detalhes da classe Integer,
CRuby tem duas classes visíveis de Integer: Fixnum e Bignum.
Ruby 2.4 as unifica em Integer.

## [String suporta mapeamento de caixa Unicode](https://bugs.ruby-lang.org/issues/10085)

`String/Symbol#upcase/downcase/swapcase/capitalize(!)` agora lida
com mapeamento de caixa Unicode ao invés de apenas mapeamento de caixa ASCII.

## Melhorias de perfomance

Ruby 2.4 também contém as seguintes melhorias de performance incluindo
mudanças na linguagem:

### [Array#max, Array#min](https://bugs.ruby-lang.org/issues/12172)

`[x, y].max` e `[x, y].min` estão otimizadas para não criarem um *array* temporário
dentro de certas condições.

### [Regexp#match?](https://bugs.ruby-lang.org/issues/8110)

Adicionada `Regexp#match?`, que executa uma combinação de expressão regular sem criar
um objeto de referência de volta e mudando '$~' para reduzir a alocação de objeto.

### Outras melhorias de perfomance

* [acelerada o acesso a variável de instância](https://bugs.ruby-lang.org/issues/12274)

## Debugando

### [Thread#report_on_exception e Thread.report_on_exception](https://bugs.ruby-lang.org/issues/6647)

Ruby ignora exceções em *threads* a não ser que outra *thread* se junte explicitamente a ela.
Com `report_on_exception = true`,
você pode notar se uma *thread* morreu devido a uma exceção não processada.

Envie-nos comentários sobre qual deve ser o padrão para `report_on_exception`
e sobre *report-on-GC*.

### [Detecção de *thread deadlock* agora mostra *threads* com seu histórico e dependências](https://bugs.ruby-lang.org/issues/8214)

Ruby tem deteção de *deadlock* para *threads* em espera, mas seu relatório não
inclue informações suficientes para debugar.
A detecção de *deadlock* no Ruby 2.4 mostrar *threads* com seu histórico e
*threads* dependentes.

Experimente e aproveite programando com Ruby 2.4.0-preview1, e
[nos envie comentários](https://github.com/ruby/ruby/wiki/How-To-Report)!

## Mudanças notáveis desde 2.3

Veja [NOTÍCIAS](https://github.com/ruby/ruby/blob/v2_4_0_preview1/NEWS)
e [ChangeLog](https://github.com/ruby/ruby/blob/v2_4_0_preview1/ChangeLog)
para detalhes.

Com essas mudanças,
[1140 arquivos mudaram, 33126 inserções(+), 50993 remoções(-)](https://github.com/ruby/ruby/compare/v2_3_0...v2_4_0_preview1)
desde Ruby 2.3.0!

## Download

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview1.tar.bz2>

  * SIZE:   14108114 bytes
  * SHA1:   7dcc42548d0724d83b6589ab98f34282845d7bcd
  * SHA256: 17570f0b84215ca82252f10c167ee50bc075383c018420c6b2601ae1cade0649
  * SHA512: c9873e8686eb54dbde61d6e23cd5197beebccd6cb31fd12c82763ebe1fde17095d7514d9d93c2c82b238032c98691df5479dc2d666a8a590e0fc54450ec29cb5

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview1.tar.gz>

  * SIZE:   17605452 bytes
  * SHA1:   1003a1e57547d81f4bb979c0f40f242afc284cd5
  * SHA256: 80d02f49f40e7ce07b70bee7efda751b0595a349a017306e9fe8caad5da13e64
  * SHA512: 4b603ab4ff9ea7e8bb8053aa4b638839d534241466d7f0e4d5bca3f2ea416694c2ea391790f1ffdc07fa538918d27707621741eb0ddc7bd00eb9d7628622787a

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview1.tar.xz>

  * SIZE:   11155800 bytes
  * SHA1:   bc33085277266f5a09a143bf6817affcb77f8e7f
  * SHA256: 62942c7300727469fe3d2b43e5a5c772d4836cf624a1d644bdece2afaca472c8
  * SHA512: dfc2c6642d49fa95383817a6dc82c416b3218ddfdaf882d6d2e5a7da22d0a5ac142e516a57aa96214070f3c7551d275044233ac052c82d67189b01c39847aad4

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview1.zip>

  * SIZE:   19904781 bytes
  * SHA1:   25c16ee91bbcb0224f80e20d938f5c08832973f7
  * SHA256: fd588aea1558b1171f87a3dd342ee207b8995a2c0a8241d7aa15bcfa16036854
  * SHA512: f2fff35ff9157a4b31177b3d6b91bdaad04c22b3c626c3a5e5ec9a31b103f9607b31c909ef27880065cfdbcfa5d6901a6db89d22e0c645666d069c5b6dd1818b

## Comentário de lançamento

Veja também o calendário de lançamento e outras informações:

[ReleaseEngineering24](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering24)
