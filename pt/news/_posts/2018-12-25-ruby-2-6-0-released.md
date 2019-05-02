---
layout: news_post
title: "Ruby 2.6.0 Released"
author: "naruse"
translator: "vnbrs (Vinicius Brasil)"
date: 2018-12-25 00:00:00 +0000
lang: pt
---

Nós temos o prazer de anunciar o lançamento do Ruby 2.6.0.

Ele introduz múltiplas novas funcionalidades e melhorias de performance, sendo as mais notáveis:

 * Um novo compilador JIT.
 * O módulo `RubyVM::AbstractSyntaxTree`.

## JIT [Experimental]

O Ruby 2.6 introduz uma implementação inicial de um compilador JIT (Just-In-Time).

O compilador JIT foca em melhorar a performance das aplicações Ruby. Diferente dos compiladores JIT tradicionais, que operam no processo, o compilador JIT do Ruby escreve código C no disco e invoca um compilador comum C para gerar código nativo. Para mais detalhes sobre isso, acesse a [organização MJIT por Vladimir Makarov](https://bugs.ruby-lang.org/projects/ruby/wiki/MJIT#MJIT-organization).

Para habilitar o compilador JIT, especifique `--jit` na linha de comando ou na variável de ambiente `$RUBYOPT`. Especificando `--jit-verbose=1` irá fazer com o que compilador JIT imprima informações adicionais. Leia a saída de `ruby --help` ou [a documentação](https://bugs.ruby-lang.org/projects/ruby/wiki/MJIT#Basic-usage) para outras opções.

O compilador JIT é compatível quando o Ruby é compilado pelo GCC, Clang, ou Microsoft VC++, que precisa estar disponível em tempo de execução.

Com o Ruby 2.6.0, conseguimos atingir [1.7x faster performance](https://gist.github.com/k0kubun/d7f54d96f8e501bbbc78b927640f4208) se comparado ao Ruby 2.5 em um teste de benchmark de CPU não-trivial, chamado [Optcarrot](https://github.com/mame/optcarrot). De qualquer forma, ainda está em fase experimental e muitas outras aplicações de memória intensiva, como o Rails, podem não se beneficiar no momento. Para mais detalhes, veja [Ruby 2.6 JIT - Progresso e Futuro](https://medium.com/@k0kubun/ruby-2-6-jit-progress-and-future-84e0a830ecbf).

Fique ligado na nova era de performance do Ruby.

## `RubyVM::AbstractSyntaxTree` [Experimental]

O Ruby 2.6 introduz o módulo`RubyVM::AbstractSyntaxTree`. **A compatibilidade futura desse módulo não é garantida.**.

Esse módulo possui um método de `parse`, o qual traduz um dada string para código Ruby e retorna os nodos AST (Abstract Syntax Tree) desse código. O método `parse_file` abre e traduz um dado arquivo em código Ruby e retorna os nodos AST.

A classe `RubyVM::AbstractSyntaxTree::Node` também foi adicionada. Você pode obter a localização do código-fonte e os nodos filhos de objetos `Node`. Essa funcionalidade é experimental.

## Outras funcionalidades notáveis

* Adiciona um alias de `Kernel#yield_self` chamado `#then`. [[Feature #14594]](https://bugs.ruby-lang.org/issues/14594)

* Nomes de constantes podem iniciar com letras maiúsculas não-ASCII. [[Feature #13770]](https://bugs.ruby-lang.org/issues/13770)

* Introduz ranges infinitos. [[Feature #12912]](https://bugs.ruby-lang.org/issues/12912)

  Um range infinito, `(1..)`, funciona como se não tivesse fim. Aqui estão alguns casos de uso:

      ary[1..]                          # idêntico ao ary[1..-1] porém sem a magia do -1
      (1..).each {|index| ... }         # enumera valores começando no índice 1
      ary.zip(1..) {|elem, index| ... } # ary.each.with_index(1) { ... }

* Adiciona `Enumerable#chain` e `Enumerator#+` [[Feature #15144]](https://bugs.ruby-lang.org/issues/15144)

* Adiciona operadores de composição de função `<<` e `>>` ao `Proc` e `Method`. [[Feature #6284]](https://bugs.ruby-lang.org/issues/6284)

      f = proc{|x| x + 2}
      g = proc{|x| x * 3}
      (f << g).call(3) # -> 11; identical to f(g(3))
      (f >> g).call(3) # -> 15; identical to g(f(3))

* Adiciona `Binding#source_location`.  [[Feature #14230]](https://bugs.ruby-lang.org/issues/14230)

  Esse método retorna a localização do código-fonte do binding, um vetor de dois elementos composto de `__FILE__` e `__LINE__`.  Tecnicamente falando, é idêntico ao `eval("[__FILE__, __LINE__]", binding)`. De qualquer forma, estamos planejando mudar esse comportamento para que `Kernel#eval` ignore a localização do código-fonte do binding [[Bug #4352]](https://bugs.ruby-lang.org/issues/4352). Assim sendo, é recomendado utilizar `Binding#source_location` ao invés de `Kernel#eval`.

* Adiciona uma `exception:` alternativa ao `Kernel#system` que causa uma exceção quando há uma falha, ao invés de retornar `false`. [[Feature #14386]](https://bugs.ruby-lang.org/issues/14386)

* Adiciona o modo oneshot ao `Coverage` [[Feature#15022]](https://bugs.ruby-lang.org/issues/15022)

  * Esse modo verifica "quando uma linha de código foi executado ao menos uma vez ou não", ao invés de "quantas vezes uma linha de código foi executada". Um gatilho por linha é disparado apenas uma vez, e uma vez que é disparado, a flag será removida, i.e., roda sem desperídicos.
  * Adiciona `oneshot_lines:` keyword argument do Coverage.start.
  * Adiciona `stop:` and `clear:` keyword arguments do Coverage.result. Se `clear` é verdadeiro, limpa os contadores para zero.  Se `stop` é verdadeiro, desabilita a metrificação de coverage.
  * Coverage.line_stub é uma simples função de helper que cria o "stub" da cobertura da linha de um dado código-fonte.

* Adiciona `FileUtils#cp_lr`.  Funciona como o cp_r mas cria links ao invés de cópias.  [[Feature #4189]](https://bugs.ruby-lang.org/issues/4189)

## Melhorias de performance

* Acelera o `Proc#call` por remover a alocação temporária para `$SAFE`.
  [[Feature #14318]](https://bugs.ruby-lang.org/issues/14318)

  Nós observamos uma melhoria de 1.4x na performance no teste de benchmark `lc_fizzbuzz`, que chama `Proc#call` diversas vezes. [[Bug #10212]](https://bugs.ruby-lang.org/issues/10212)

*  Melhora a performance de `block.call` quando `block` é passado como o parâmetro de bloco. [[Feature #14330]](https://bugs.ruby-lang.org/issues/14330)

  Combinado com melhorias nas operações com blocos do Ruby 2.5, a evaluação de blocos agora performa 2.6x mais rápido no teste de micro-benchmark com o Ruby 2.6. [[Feature #14045]](https://bugs.ruby-lang.org/issues/14045)

*  Heap Transitente (`theap`) é introduzida. [[Bug #14858]](https://bugs.ruby-lang.org/issues/14858) [[Feature #14989]](https://bugs.ruby-lang.org/issues/14989)

  `theap` é heap gerenciada para objetos de curta vida em memória, apontados para classes específicas (`Array`, `Hash`, `Object`, and `Struct`). Criando objetos Hash pequenos e de vida curta é 2x mais rápido. Com o teste de benchmark do rdoc, estatamos uma melhoria de 6-7% na performance.

* Implementações nativas (`arm32`, `arm64`, `ppc64le`, `win32`, `win64`, `x86`, `amd64`) de co-rotinas para melhorar a troca de contextos com Fiber de forma significativa. [[Feature #14739]](https://bugs.ruby-lang.org/issues/14739)

  `Fiber.yield` e `Fiber#resume` é até 5x mais rápido em Linux 64-bit. Programas que utilizam bastante do Fiber podem notar melhorias de performance maiores de 5% em geral.

## Outras alterações notáveis desde a versão 2.5

* `$SAFE` agora é um processo de estado global e pode ser setado para `0` novamente.  [[Feature #14250]](https://bugs.ruby-lang.org/issues/14250)

* Passar `safe_level` para `ERB.new` está depreciado. Os argumentos `trim_mode` e `eoutvar` foram alterados para keyword arguments. [[Feature #14256]](https://bugs.ruby-lang.org/issues/14256)

* Suporte à Unicode está atualizado para versão 11. Temos planos de adicionar suporte à versão 12 e 12.1 em um pequeno próximo release do Ruby 2.6. Isso adicionará suporte à [nova era Japonesa](http://blog.unicode.org/2018/09/new-japanese-era.html).

* Merge RubyGems 3.0.1. As opções `--ri` e `--rdoc` foram removidas. Use `--document` e `--no-document` ao invés.

* [Bundler](https://github.com/bundler/bundler) agora é instalado como uma gem padrão.

* Em blocos de tratamento de exceção, `else` sem `rescue` agora causa um erro de sintaxe. [EXPERIMENTAL][[Feature #14606]](https://bugs.ruby-lang.org/issues/14606)

Veja [NOTÍCIAS](https://github.com/ruby/ruby/blob/v2_6_0/NEWS) ou [logs de commit](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0) para mais detalhes.

Com essas alterações, [6437 arquivos alterados, 231471 inserções(+), 98498 remoções(-)](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0) desde o Ruby 2.5.0!

Um Feliz Natal, Boas Festas, e aproveitem programar com o Ruby 2.6!

## Download

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0.tar.gz>

      SIZE:   16687800 bytes
      SHA1:   c95f4e86e21390270dad3ebb94491fd42ee2ce69
      SHA256: f3c35b924a11c88ff111f0956ded3cdc12c90c04b72b266ac61076d3697fc072
      SHA512: 01f886b0c0782a06315c4a46414e9f2b66ee634ba4349c8e0697f511793ae3c56d2ad3cad6563f2b0fdced
f0ff3eba51b9afab907e7e1ac243475772f8688382
* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0.zip>

      SIZE:   20582054 bytes
      SHA1:   a804e63d18da12107e1d101918a3d8f4c5462a27
      SHA256: 8a4fb6ca58202495c9682cb88effd804398bd0ef023e3e36f001ca88d8b5855a
      SHA512: 16d66ec4a2c6a2e928d5b50e094a5efa481ac6e4d5ed77459d351ef19fe692aa59b68307e3e25229eec5f3
0ae2f9adae2663bafe9c9d44bfb45d3833d77839d4
* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0.tar.bz2>

      SIZE:   14585856 bytes
      SHA1:   b8638eb806efbf7b6af87b24ccc6ad915f262318
      SHA256: c89ca663ad9a6238f4b1ec4d04c7dff630560c6e6eca6d30857c4d394f01a599
      SHA512: ca3daf9acf11d3db2900af21b66231bd1f025427a9d2212b35f6137ca03f77f57171ddfdb99022c8c8bcd730ff92a7a4af54e8a2a770a67d8e16c5807aa391f1
* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0.tar.xz>

      SIZE:   11918536 bytes
      SHA1:   9ddaeba3505d2855460c8c653159fc0ac8928c0f
      SHA256: acb00f04374899ba8ee74bbbcb9b35c5c6b1fd229f1876554ee76f0f1710ff5f
      SHA512: c56eaf85ef7b79deb34ee4590b143c07f4fc83eb79775290761aee5a7c63374659613538a41f25706ed6e19e49d5c67a1014c24d17f29948294c7abd0b0fcea8
