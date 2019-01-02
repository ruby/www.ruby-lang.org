---
layout: news_post
title: "Lançado Ruby 2.5.0"
author: "naruse"
translator: "jcserracampos"
date: 2017-12-25 00:00:00 +0000
lang: pt
---

Temos o prazer de anunciar o lançamento de Ruby 2.5.0.

Ruby 2.5.0 é a primeira versão estável da série Ruby 2.5.
Esta versão introduz muitas novas funcionalidades e melhorias de performance.
As mudanças notáveis são as seguintes:

## Novas funcionalidades

* `rescue`/`else`/`ensure` passam a ser permitidos diretamente em
  blocos `do`/`end`.
  [[Funcionalidade #12906]](https://bugs.ruby-lang.org/issues/12906)
* Adiciona `yield_self` em um bloco yield no seu contexto.
  Ao contrário de `tap`, retorna o resultado do bloco.
  [[Funcionalidade #6721]](https://bugs.ruby-lang.org/issues/6721)
* Adiciona suporte a mensuração de cobertura de ramificação e cobertura de método.
  A cobertura de ramificação indica quais ramificações (_branches_) são executadas e quais não.
  A cobertura de método indica quais métodos são invocados e quais não.
  Ao executar uma suíte de testes com essas novas funcionalidades, você saberá quais
  ramificações e métodos são executados e mensurará a cobertura total da suíte de
  testes mais estritamente.
  [[Funcionalidade #13901]](https://bugs.ruby-lang.org/issues/13901)
* Hash#slice [[Funcionalidade #8499]](https://bugs.ruby-lang.org/issues/8499)
  e Hash#transform_keys [[Funcionalidade #13583]](https://bugs.ruby-lang.org/issues/13583)
* Struct.new pode criar classes que aceitam _keywords_ como argumento.
  [[Funcionalidade #11925]](https://bugs.ruby-lang.org/issues/11925)
* Enumerable#any?, all?, none? e one? passam a aceitar um _pattern_ como argumento.
  [[Funcionalidade #11286]](https://bugs.ruby-lang.org/issues/11286)
* Pesquisa de constante de alto nível foi removida.
  [[Funcionalidade #11547]](https://bugs.ruby-lang.org/issues/11547)
* Uma das mais amadas bibliotecas, pp.rb, agora é automaticamente carregada.
  Você não precisa mais escrever `require "pp"`.
  [[Funcionalidade #14123]](https://bugs.ruby-lang.org/issues/14123)
* Imprime _backtrace_ e mensagens de erro em ordem reversa (primeiro as chamadas mais antigas,
  chamadas mais recentes por último). Quando um _backtrace_ grande aparece no seu terminal (TTY),
  você pode facilmente achar a linha causadora no final do seu _backtrace_.
  Perceba que a ordem só é reversa quando o _backtrace_ é imprimido
  diretamente no terminal.
  [[Funcionalidade #8661]](https://bugs.ruby-lang.org/issues/8661) [experimental]

## Melhorias de performance

* Cerca de 5-10% de melhoria de performance ao remover todas as instruções `trace`
  do _bytecode_ geral (sequências de instrução).
  A instrução `trace` foi adicionada para suportar o `TracePoint`.
  Entretanto, na maioria dos casos, `TracePoint` não é utilizado e instruções `trace`
  são  sobrecargas puras. Ao invés, nós usamos uma técnica de instrumentação dinâmica.
  Veja [[Funcionalidade #14104]](https://bugs.ruby-lang.org/issues/14104) para mais detalhes.
* Passagem de bloco por um parâmetro de bloco (por exemplo `def foo(&b); bar(&b); end`)
  está cerca de 3 vezes mais rápida do que no Ruby 2.4 por causa da técnica "_Lazy Proc allocation_".
  [[Funcionalidade #14045]](https://bugs.ruby-lang.org/issues/14045)
* Mutex está reescrito para ser menor e mais rápido.
  [[Funcionalidade #13517]](https://bugs.ruby-lang.org/issues/13517)
* ERB agora gera código a partir de um template duas vezes mais rápido do que no Ruby 2.4.
* Melhora a performance de alguns métodos internos como `Array#concat`,
  `Enumerable#sort_by`, `String#concat`, `String#index`, `Time#+` e mais.
* IO.copy_stream usa copy_file_range(2) para copiar usando offloading.
  [[Funcionalidade #13867]](https://bugs.ruby-lang.org/issues/13867)

## Outras mudanças notáveis desde 2.4

* SecureRandom agora prefere fontes fornecidas pelo sistema operacional ao invés de OpenSSL.
  [[Bug #9569]](https://bugs.ruby-lang.org/issues/9569)
* Promove cmath, csv, date, dbm, etc, fcntl, fiddle, fileutils, gdbm, ipaddr,
  scanf, sdbm, stringio, strscan, webrick, zlib de bibliotecas padrões
  para gems padrões.
* Atualiza para [Onigmo](https://github.com/k-takata/Onigmo/) 6.1.3.
  * Adiciona [operador ausente](https://github.com/k-takata/Onigmo/issues/87).
  * Note que [Ruby 2.4.1](https://www.ruby-lang.org/en/news/2017/03/22/ruby-2-4-1-released/) também inclui esta mudança.
* Atualiza para Psych 3.0.2.
* Atualiza para RubyGems 2.7.3.
* Atualiza para RDoc 6.0.1.
  * [Altera o _lexer_ de um baseado em IRB para Ripper](https://github.com/ruby/rdoc/pull/512).
    Isto melhora consideravelmente a velocidade de geração de documentação.
  * Corrige uma quantidade significativa de bugs que existiam há 10 anos.
  * Adiciona suporte para a nova sintaxe de Ruby desde as últimas mudanças.
* Atualiza a versão suportads de Unicode para 10.0.0.
* `Thread.report_on_exception` agora é definido como `true` por padrão.
  Esta alteração ajuda a debugar programas multithreads.
  [[Funcionalidade #14143]](https://bugs.ruby-lang.org/issues/14143)
* IO#write agora recebe múltiplos argumentos.
  [[Funcionalidade #9323]](https://bugs.ruby-lang.org/issues/9323)

Veja as [novidades](https://github.com/ruby/ruby/blob/v2_5_0/NEWS)
ou [histórico de commits](https://github.com/ruby/ruby/compare/v2_4_0...v2_5_0)
para detalhes.

Com essas mudanças,
[6158 arquivos alterados, 348484 inserções(+), 82747 remoções(-)](https://github.com/ruby/ruby/compare/v2_4_0...v2_5_0)
desde Ruby 2.4.0!

Feliz natal, feliz ano novo e divirta-se programando com Ruby 2.5!

## Download

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0.tar.gz>

      SIZE:   15834941 bytes
      SHA1:   58f77301c891c1c4a08f301861c26b1ea46509f6
      SHA256: 46e6f3630f1888eb653b15fa811d77b5b1df6fd7a3af436b343cfe4f4503f2ab
      SHA512: 0712fe68611f5d0cd6dd54b814f825478e64b6a62bdf67bce431f4dca2dc00b1a33f77bebfbcd0a151118a1152554ab457decde435b424aa1f004bc0aa40580d

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0.zip>

      SIZE:   19495617 bytes
      SHA1:   700b6f55d689a5c8051c8c292b9e77a1b50bf96e
      SHA256: 94559ea6e3c619423da604e503ce1dc1c465d6e0747a07fbdc5f294acaf14c24
      SHA512: e4324064cee8c65b80192e3eff287e915d2d40464d300744c36fb326ae4b1846911400a99d4332192d8a217009d3a5209b43eb5e8bc0b739035bef89cc493e84

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0.tar.bz2>

      SIZE:   13955820 bytes
      SHA1:   827b9a3bcffa86d1fc9ed96d403cb9dc37731688
      SHA256: d87eb3021f71d4f62e5a5329628ac9a6665902173296e551667edd94362325cc
      SHA512: 8f6fdf6708e7470f55bc009db2567cd8d4e633ad0678d83a015441ecf5b5d88bd7da8fb8533a42157ff83b74d00b6dc617d39bbb17fc2c6c12287a1d8eaa0f2c

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0.tar.xz>

      SIZE:   11292472 bytes
      SHA1:   9c7babcf9e299be3f197d9091024ae458f1a1273
      SHA256: 1da0afed833a0dab94075221a615c14487b05d0c407f991c8080d576d985b49b
      SHA512: 55714a33d7661fe8b432f73c34fd67b49699f8b79df1cbd680a74899124d31111ab0f444677672aac1ba725820182940d485efb2db0bf2bc96737c5d40c54578
