---
layout: news_post
title: "Lançado Ruby 2.7.0-preview1"
author: "naruse"
translator: "jcserracampos"
date: 2019-05-30 00:00:00 +0000
lang: pt
---

Temos o prazer de anunciar o lançamento da versão de Ruby 2.7.0-preview1.

Uma versão de pré-visualização (preview) é lançada para coletar opiniões para a versão final planejada para ser lançada em dezembro.
Ela introduz várias novas funcionalidades e melhorias de performance, mais notavelmente:

* Compactação no coletor de lixo
* Pattern Matching
* Melhoria do REPL

## Compactação no coletor de lixo (Compaction GC)

Esta versão introduz compactação na coleta de lixo (Compaction GC) que pode desfragmentar um espaço de memória fragmentado.

Alguns programas multithread Ruby podem causar fragmentação de memória, conduzindo a alto uso de memória e velocidade degradada.

O método `GC.compact` é introduzido para compactar a heap. Esta funcionalidade compacta objetos ativos na heap para que menos
páginas possam ser usadas e a heap possa ser mais _CoW friendly_. [#15626](https://bugs.ruby-lang.org/issues/15626)

## Pattern Matching [Experimental]

Pattern matching, funcionalidade amplamenta utilizada em linguagens para programação funcional, é introduzida como uma funcionalidade experimental. [#14912](https://bugs.ruby-lang.org/issues/14912)
Ela pode examinar um dado objeto e definir seu valor se um padrão for.

```ruby
json ='{
  "nombre": "Alice",
  "edad": 30,
  "hijos": [
    {
      "nombre": "Bob",
      "edad": 2
    }
  ]
}'
case JSON.parse('{...}', symbolize_names: true)
in {name: "Alice", children: [{name: "Bob", age: age}]}
  p age
  ...
end
```

Para mais detalhes, por favor, veja [Pattern matching - New feature in Ruby 2.7](https://speakerdeck.com/k_tsj/pattern-matching-new-feature-in-ruby-2-dot-7).

## Aprimoramento de REPL

`irb`, ambiente interativo empacotado (REPL; Read-Eval-Print-Loop), agora suporta edição em múltiplas linhas. É fomentado por `reline`, implementação pura em Ruby compatível de `readline`.
Também prove integração com rdoc. Em `irb` você pode exibir a referência para uma dada classe, módulo ou método.  [#14683](https://bugs.ruby-lang.org/issues/14683), [#14787](https://bugs.ruby-lang.org/issues/14787), [#14918](https://bugs.ruby-lang.org/issues/14918)
Além de, linhas de código mostradas em `binding.irb` e resultados de inspeções para objetos de classes principais agora são colorizados.

<video autoplay="autoplay" controls="controls" muted="muted" width="576" height="259">
  <source src="https://cache.ruby-lang.org/pub/media/irb_improved_with_key_take2.mp4" type="video/mp4">
</video>

## Outras novas funcionalidades notáveis

* Um operador de referência de método, <code>.:</code>, é introduzido como uma característica experimental.  [#12125](https://bugs.ruby-lang.org/issues/12125), [#13581](https://bugs.ruby-lang.org/issues/13581)

* Parâmetro numerado como o parâmetro de bloco padrão é introduzida como uma característica experimental.  [#4475](https://bugs.ruby-lang.org/issues/4475)

* Um intervalo sem começo é introduzido experimentalmente. Pode não ser tão útil
  como um intervalo sem fim, mas seria bom para o propósito do DSL. [#14799](https://bugs.ruby-lang.org/issues/14799)

      ary[..3]  # indêntico a ary[0..3]
      rel.where(sales: ..100)

* `Enumerable#tally` é adicionado. Ele conta a ocorrência de cada elemento.

      ["a", "b", "c", "b"].tally
      #=> {"a"=>1, "b"=>2, "c"=>1}

## Melhorias de desempenho

* JIT [Experimental]

  * Código em JIT é recompilado para código menos otimizado quando uma suposição de otimização é invalidada.

  * _Inlining_ de método é executado quando um método é considerado puro. Essa otimização ainda é experimental e muitos métodos NÃO são considerados puros ainda

  * Valor padrão de `--jit-min-calls` é alterado de 5 para 10,000

  * Valor padrão `--jit-max-cache` é alterado de 1,000 para 100

## Outras mudanças notáveis desde 2.6

* `Proc.new` e `proc` sem bloco em um método invocado com um bloco é alertado agora.

* `lambda` sem bloco em um método invocado com um bloco produz um erro.

* Atualiza versão do Unicode e Emoji de 11.0.0 para 12.0.0.  [[Feature #15321]](https://bugs.ruby-lang.org/issues/15321)

* Atualiza versão do Unicode para 12.1.0, adicionando suporte para U+32FF SQUARE ERA NAME REIWA.  [[Feature #15195]](https://bugs.ruby-lang.org/issues/15195)

* `Date.jisx0301`, `Date#jisx0301` e `Date.parse` provisoriamente suportam a nova era Japonesa como uma extensão informal, até o novo JIS X 0301 seja emitido.  [[Feature #15742]](https://bugs.ruby-lang.org/issues/15742)

* Requere compiladores para suportar C99 [[Misc #15347]](https://bugs.ruby-lang.org/issues/15347)
  * Detalhes do nosso dialeto: <https://bugs.ruby-lang.org/projects/ruby-master/wiki/C99>

Veja [NEWS](https://github.com/ruby/ruby/blob/v2_7_0_preview1/NEWS) ou [commit logs](https://github.com/ruby/ruby/compare/v2_6_0...v2_7_0_preview1) para mais detalhes.

Com essas mudanças, [1727 arquivos modificados, 76022 inserções(+), 60286 remoções(-)](https://github.com/ruby/ruby/compare/v2_6_0...v2_7_0_preview1) desde Ruby 2.6.0!

Aproveite programando com Ruby 2.7!

## Download

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview1.tar.gz>

      SIZE:   16021286 bytes
      SHA1:   2fbecf42b03a9d4391b81de42caec7fa497747cf
      SHA256: c44500af4a4a0c78a0b4d891272523f28e21176cf9bc1cc108977c5f270eaec2
      SHA512: f731bc9002edd3a61a4955e4cc46a75b5ab687a19c7964f02d3b5b07423d2360d25d7be5df340e884ca9945e3954e68e5eb11b209b65b3a687c71a1abc24b91f

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview1.zip>

      SIZE:   20283343 bytes
      SHA1:   7488346fa8e58203a38158752d03c8be6b1da65b
      SHA256: fdf25573e72e1769b51b8d541d0e1a894a5394dbfdf1b08215aa093079cca64c
      SHA512: b3b1f59dce94c242ef88a4e68381a4c3a6f90ba0af699083e5a1a00b0fb1dce580f057dad25571fe789ac9aa95aa6e9c071ebb330328dc822217ac9ea9fbeb3f

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview1.tar.bz2>

      SIZE:   14038296 bytes
      SHA1:   f7e70cbc2604c53a9e818a2fc59cd0e2d6c859fa
      SHA256: d45b4a1712ec5c03a35e85e33bcb57c7426b856d35e4f04f7975ae3944d09952
      SHA512: a36b241fc1eccba121bb7c2cc5675b11609e0153e25a3a8961b67270c05414b1aa669ce5d4a5ebe4c6b2328ea2b8f8635fbba046b70de103320b3fdcb3d51248

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview1.tar.xz>

      SIZE:   11442988 bytes
      SHA1:   45e467debc194847a9e3afefb20b11e6dc28ea31
      SHA256: 8c546df3345398b3edc9d0ab097846f033783d33762889fd0f3dc8bb465c3354
      SHA512: d416e90bfa3e49cc0675c4c13243c8ec319b7a0836add1bd16bd7662d09eaf46656d26e772ef3b097e10779896e643edd8a6e4f885147e3235257736adfdf3b5

## O que é Ruby?

Ruby foi primeiramente desenvolvido por Matz (Yukihiro Matsumoto) em 1993 e agora é desenvolvido como Open Source. Ele é executado em múltiplas plataformas e é usado em todo o mundo, especialmente para desenvolvimento web.
