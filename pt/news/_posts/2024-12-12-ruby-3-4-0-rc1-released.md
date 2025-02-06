---
layout: news_post
title: "Ruby 3.4.0 rc1 Lançado"
author: "naruse"
translator: nbluis
date: 2024-12-12 00:00:00 +0000
lang: pt
---

{% assign release = site.data.releases | where: "version", "3.4.0-rc1" | first %}
Estamos felizes em anunciar o lançamento do Ruby {{ release.version }}.

## Prism

Alterado o parser padrão de parse.y para Prism. [[Feature #20564]]

## GC Modular

* Implementações alternativas de garbage collector (GC) podem ser carregadas dinamicamente
  através do recurso de garbage collector modular. Para habilitar este recurso,
  configure o Ruby com `--with-modular-gc` no momento da compilação. Bibliotecas de GC podem ser
  carregadas em tempo de execução usando a variável de ambiente `RUBY_GC_LIBRARY`.
  [[Feature #20351]]

* O garbage collector embutido do Ruby foi dividido em um arquivo separado em
  `gc/default/default.c` e interage com o Ruby usando uma API definida em
  `gc/gc_impl.h`. O garbage collector embutido agora também pode ser compilado como uma
  biblioteca usando `make modular-gc MODULAR_GC=default` e habilitado usando a
  variável de ambiente `RUBY_GC_LIBRARY=default`. [[Feature #20470]]

* Uma biblioteca experimental de GC é fornecida com base no [MMTk](https://www.mmtk.io/).
  Esta biblioteca de GC pode ser compilada usando `make modular-gc MODULAR_GC=mmtk` e
  habilitada usando a variável de ambiente `RUBY_GC_LIBRARY=mmtk`. Isso requer
  a ferramenta Rust na máquina de compilação. [[Feature #20860]]

## Mudanças na linguagem

* Literais de string em arquivos sem um comentário `frozen_string_literal` agora emitem um aviso de descontinuação
  quando são mutados.
  Esses avisos podem ser habilitados com `-W:deprecated` ou configurando `Warning[:deprecated] = true`.
  Para desativar essa mudança, você pode executar o Ruby com o argumento de linha de comando `--disable-frozen-string-literal`. [[Feature #20205]]

* `it` foi adicionado para referenciar um parâmetro de bloco. [[Feature #18980]]

* O splatting de palavra-chave `nil` ao chamar métodos agora é suportado.
  `**nil` é tratado de maneira semelhante a `**{}`, não passando palavras-chave,
  e não chamando nenhum método de conversão. [[Bug #20064]]

* Passagem de bloco não é mais permitida em índice. [[Bug #19918]]

* Argumentos de palavra-chave não são mais permitidos em índice. [[Bug #20218]]

## YJIT

TL;DR:
* Melhor desempenho na maioria dos benchmarks em plataformas x86-64 e arm64.
* Uso reduzido de memória de metadados de compilação
* Várias correções de bugs. YJIT agora é ainda mais robusto e melhor testado.

Novos recursos:
* Adiciona limite de memória unificado via opção de linha de comando `--yjit-mem-size` (padrão 128MiB)
  que rastreia o uso total de memória do YJIT e é mais intuitivo do que o
  antigo `--yjit-exec-mem-size`.
* Mais estatísticas agora sempre disponíveis via `RubyVM::YJIT.runtime_stats`
* Adiciona log de compilação para rastrear o que é compilado via `--yjit-log`
  * Final do log também disponível em tempo de execução via `RubyVM::YJIT.log`
* Adiciona suporte para constantes compartilháveis em modo multi-ractor
* Agora pode rastrear saídas contadas com `--yjit-trace-exits=COUNTER`

Novas otimizações:
* Contexto comprimido reduz a memória necessária para armazenar metadados do YJIT
* Alocador aprimorado com capacidade de alocar registradores para variáveis locais
* Quando o YJIT está habilitado, use mais primitivas Core escritas em Ruby:
  * `Array#each`, `Array#select`, `Array#map` reescritos em Ruby para melhor desempenho [[Feature #20182]].
* Capacidade de inline de métodos pequenos/triviais, como:
  * Métodos vazios
  * Métodos que retornam uma constante
  * Métodos que retornam `self`
  * Métodos que retornam diretamente um argumento
* Geração de código especializada para muitos mais métodos em tempo de execução
* Otimiza `String#getbyte`, `String#setbyte` e outros métodos de string
* Otimiza operações bitwise para acelerar a manipulação de bits/bytes de baixo nível
* Várias outras otimizações incrementais

## Atualizações das classes principais

Nota: Estamos listando apenas atualizações notáveis das classes principais.

* Exception

  * `Exception#set_backtrace` agora aceita um array de `Thread::Backtrace::Location`.
    `Kernel#raise`, `Thread#raise` e `Fiber#raise` também aceitam este novo formato. [[Feature #13557]]

* Range

  * `Range#size` agora levanta `TypeError` se o intervalo não for iterável. [[Misc #18984]]

## Problemas de compatibilidade

Nota: Excluindo correções de bugs.

* As mensagens de erro e exibições de backtrace foram alteradas.
  * Usa uma aspa simples em vez de um acento grave como uma aspa de abertura. [[Feature #16495]]
  * Exibe o nome de classe antes de um nome de método (somente quando a classe tiver um nome permanente). [[Feature #19117]]
  * `Kernel#caller`, métodos de `Thread::Backtrace::Location`, etc. também foram alterados de acordo.

  ```
  Antes:
  test.rb:1:in `foo': undefined method `time' for an instance of Integer
          from test.rb:2:in `<main>'

  Agora:
  test.rb:1:in 'Object#foo': undefined method 'time' for an instance of Integer
          from test.rb:2:in '<main>'
  ```

## Atualizações da C API

* `rb_newobj` e `rb_newobj_of` (e macros correspondentes `RB_NEWOBJ`, `RB_NEWOBJ_OF`, `NEWOBJ`, `NEWOBJ_OF`) foram removidos. [[Feature #20265]]
* Removida a função obsoleta `rb_gc_force_recycle`. [[Feature #18290]]

## Mudanças diversas

* Passar um bloco para um método que não usa o bloco passado mostrará
  um aviso no modo verbose (`-w`).
  [[Feature #15554]]

* Redefinir alguns métodos principais que são especialmente otimizados pelo interpretador
  e JIT como `String.freeze` ou `Integer#+` agora emite um aviso de classe de desempenho
  (`-W:performance` ou `Warning[:performance] = true`).
  [[Feature #20429]]

Veja lançamentos no GitHub como [Logger](https://github.com/ruby/logger/releases) ou
changelog para detalhes das gems padrão ou gems incluídas.

Veja [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
ou [logs de commits](https://github.com/ruby/ruby/compare/v3_3_0...{{ release.tag }})
para mais detalhes.

Com essas mudanças, [{{ release.stats.files_changed }} arquivos alterados, {{ release.stats.insertions }} inserções(+), {{ release.stats.deletions }} deleções(-)](https://github.com/ruby/ruby/compare/v3_3_0...{{ release.tag }}#file_bucket)
desde  Ruby 3.3.0!

## Download

* <{{ release.url.gz }}>

      TAMANHO: {{ release.size.gz }}
      SHA1: {{ release.sha1.gz }}
      SHA256: {{ release.sha256.gz }}
      SHA512: {{ release.sha512.gz }}

* <{{ release.url.xz }}>

      TAMANHO: {{ release.size.xz }}
      SHA1: {{ release.sha1.xz }}
      SHA256: {{ release.sha256.xz }}
      SHA512: {{ release.sha512.xz }}

* <{{ release.url.zip }}>

      TAMANHO: {{ release.size.zip }}
      SHA1: {{ release.sha1.zip }}
      SHA256: {{ release.sha256.zip }}
      SHA512: {{ release.sha512.zip }}

## O que é Ruby

Ruby foi desenvolvido pela primeira vez por Matz (Yukihiro Matsumoto) em 1993,
e agora é desenvolvido como Open Source. Ele roda em várias plataformas
e é usado em todo o mundo, especialmente para desenvolvimento web.

[Feature #13557]: https://bugs.ruby-lang.org/issues/13557
[Feature #15554]: https://bugs.ruby-lang.org/issues/15554
[Feature #16495]: https://bugs.ruby-lang.org/issues/16495
[Feature #18290]: https://bugs.ruby-lang.org/issues/18290
[Feature #18980]: https://bugs.ruby-lang.org/issues/18980
[Misc #18984]:    https://bugs.ruby-lang.org/issues/18984
[Feature #19117]: https://bugs.ruby-lang.org/issues/19117
[Bug #19918]:     https://bugs.ruby-lang.org/issues/19918
[Bug #20064]:     https://bugs.ruby-lang.org/issues/20064
[Feature #20182]: https://bugs.ruby-lang.org/issues/20182
[Feature #20205]: https://bugs.ruby-lang.org/issues/20205
[Bug #20218]:     https://bugs.ruby-lang.org/issues/20218
[Feature #20265]: https://bugs.ruby-lang.org/issues/20265
[Feature #20351]: https://bugs.ruby-lang.org/issues/20351
[Feature #20429]: https://bugs.ruby-lang.org/issues/20429
[Feature #20470]: https://bugs.ruby-lang.org/issues/20470
[Feature #20564]: https://bugs.ruby-lang.org/issues/20564
[Feature #20860]: https://bugs.ruby-lang.org/issues/20860
