---
layout: news_post
title: "Lançado Ruby 3.2.0"
author: "naruse"
translator: "guicruzzs"
date: 2022-12-25 00:00:00 +0000
lang: pt
---

{% assign release = site.data.releases | where: "version", "3.2.0" | first %}

Estamos contentes em anunciar o lançamento do Ruby. Ruby 3.2 adiciona muitas funcionalidades e melhorias de desempenho.

## Suporte a WebAssembly com WASI

Esse é um port inicial de suporte a WebAssembly com WASI. Isso permite um binário CRuby ficar disponível num navegador Web, num ambiente Serverless Edge, ou em outros tipos de WebAssembly/WASI embedders. Atualmente esse port passa suítes de teste básica e bootstrap não utilizando a Thread API.

![](https://i.imgur.com/opCgKy2.png)

### Contexto

[WebAssembly (Wasm)](https://webassembly.org/) foi originalmente introduzido para rodar programas seguramente e rápido em navegadores web. Mas seu objetivo - rodar programas eficientemente com segurança em ambiente variado - é desejado há muito tempo não somente para web, mas também para aplicações em geral.

[WASI (The WebAssembly System Interface)](https://wasi.dev/) é projetado para tais casos de uso. Embora tais aplicações precisem  se comunicar com os sistemas operacionais, WebAssembly roda numa máquina virtual que não possui uma interface com o sistema. WASI padroniza isso.

O suporte a WebAssembly/WASI em Ruby pretende alavancar esses projetos. Isso permite aos desenvolvedores Ruby a escreverem aplicações que rodam em tais plataformas.

### Caso de uso

Esse suporte encoraja desenvolvedores a utilizarem CRuby em um ambiente WebAssembly. Um exemplo de caso de uso é o suporte a CRuby do [TryRuby playground](https://try.ruby-lang.org/playground/). Agora você pode testar o CRuby original no seu navegador web.

### Questões técnicas

O WASI e o WebAssembly de hoje estão com algumas funcionalidades faltando para implementar Fiber, exceção, e GC porque ainda estão evoluindo, e também por questões de segurança. Então o CRuby preenche essa lacuna através do Asyncify, que é uma técnica de transformação binária para controlar a execução na userland.

Além disso, nós construímos [um VFS(sistema de arquivo virtual) em cima do WASI](https://github.com/kateinoigakukun/wasi-vfs/wiki/Getting-Started-with-CRuby) assim nós podemos facilmente empacotar aplicações Ruby em um único arquivo .wasm. Isso torna a distribuição de aplicações Ruby um pouco mais fácil.

### Links relacionados

* [Add WASI based WebAssembly support #5407](https://github.com/ruby/ruby/pull/5407)
* [An Update on WebAssembly/WASI Support in Ruby](https://itnext.io/final-report-webassembly-wasi-support-in-ruby-4aface7d90c9)


## YJIT em Produção

![](https://i.imgur.com/X9ulfac.png)

* YJIT não é mais experimental
    * Foi testado em cargas de produção por um ano e provou ser bastante estável.
* YJIT agora suporta x86-64 e arm64/aarch64 CPUs no Linux, MacOS, BSD e outras plataformas UNIX.
    * Essa release traz suporte para Apple M1/M2, AWS Graviton, Raspberry Pi 4 e mais.
* O build do YJIT agora requer Rust 1.58.0+. [[Feature #18481]]
    * Para garantir que CRuby seja buildado com YJIT, por favor instale `rustc` >= 1.58.0
      antes de rodar o script `./configure`.
    * Por favor entre em contato com o time do YJITP caso tenha qualquer problema.
* A release 3.2 do YJIT é mais rápida que a 3.1, e tem cerca de 1/3 de sobrecarga de memória.
  * No geral, YJIT é 41% mais rápido (média geométrica) que o interpretador Ruby em [yjit-bench](https://github.com/Shopify/yjit-bench).
  * Memória física para o código JIT é alocada de forma lazy. Diferente do Ruby 3.1,
    o RSS de um processo Ruby é minimizado por conta das páginas de memória virtual
    alocadas por `--yjit-exec-mem-size` que não serão mapeadas para páginas de memória
    física até que sejam utilizadas pelo código JIT.
  * Introduz GC(Garbage collector) que libera todas as páginas de código quando o
    consumo de memória do código JIT atinge `--yjit-exec-mem-size`.
  * `RubyVM::YJIT.runtime_stats` retorna métricas do GC além das chaves existentes
    em `inline_code_size` e `outlined_code_size`:
    `code_gc_count`, `live_page_count`, `freed_page_count`, e `freed_code_size`.
* A maioria das estastísticas produzidas por `RubyVM::YJIT.runtime_stats` estão agora disponíveis nas release builds.
    * Simplesmente rode ruby com `--yjit-stats` para calcular e obter estatísticas
    (fica sujeito a sobrecarga de tempo de execução).
* YJIT agora está otimizado para tirar vantagem de formatos de objetos. [[Feature #18776]]
* Tira vantagem de invalidação de constantes de forma mais granular para invalidar menos código ao definir novas constantes. [[Feature #18589]]
* O valor padrão de `--yjit-exec-mem-size` é alterado para 64 (MiB).
* O valor padrão de `--yjit-call-threshold` é alterado para 30.

## Melhorias em Regexp contra ReDoS

Se sabe que o tempo de verificação de uma Regexp pode ser inesperadamente longo. Se seu código tenta verificar uma Regexp possivelmente ineficiente contra um input não confiável, um invasor pode explorar isso para uma eficiente Denial of Service (então chamada Regular expression DoS, ou ReDoS).

Nós introduzimos duas melhoria que significantemente mitigam ReDoS.

### Algoritmo de verificação de Regexp melhorado

Desde o Ruby 3.2, o algoritmo de verificação de Regexp tem sido grandemente melhorado usando a técnica de memoization.

```
# Isso leva 10 seg. no Ruby 3.1, e 0.003 seg. no Ruby 3.2

/^a*b?a*$/ =~ "a" * 50000 + "x"
```

![](https://cache.ruby-lang.org/pub/media/ruby320_regex_1.png)
![](https://cache.ruby-lang.org/pub/media/ruby320_regex_2.png)

O algoritmo melhorado de verificação permite que a maioria das verificações de Regexp (cerca de 90% em nossos experimentos) sejam completadas em tempo linear.

Essa otimização pode consumir memória proporcionalmente à entrada pra cada verificação. Nós esperamos que nenhum problema prático surja porque essa alocação de memória é normalmente atrasada, e uma Regexp normalmente deveria consumir no máximo 10 vezes mais que o comprimento do input. Se você ficar sem memória ao realizar verificações de Regexps numa aplicação do mundo real, por favor nos relate.

A proposta original é <https://bugs.ruby-lang.org/issues/19104>

### Timeout de Regexp

A otimização acima não pode ser aplicada a alguns tipos de expressões regulares, tais como aquelas que incluem funcionalidades avançadas (e.g., back-references ou look-around), ou com um grande número fixado de repetições. Como medida de fallback, uma funcionalidade de timeout na verificação de Regexp também é introduzida.

```ruby
Regexp.timeout = 1.0

/^a*b?a*()\1$/ =~ "a" * 50000 + "x"
#=> Regexp::TimeoutError é devolvido em um segundo
```

Perceba que `Regexp.timeout` é uma configuração global. Se deseja usar uma configuração diferente de timeout pra alguma Regexp em especial, você pode usar a chave `timeout` no `Regexp.new`.

```ruby
Regexp.timeout = 1.0

# Essa regexp não possui timeout
long_time_re = Regexp.new('^a*b?a*()\1$', timeout: Float::INFINITY)

long_time_re =~ "a" * 50000 + "x" # nunca é interrompida
```

A proposta original é <https://bugs.ruby-lang.org/issues/17837>.

## Outras Novas Funcionalidades Notórias

### SyntaxSuggest

* A funcionalidade de `syntax_suggest` (anteriormente `dead_end`) está integrada ao Ruby. Isso ajuda você a encontrar a posição dos erros tais como `end`s faltantes ou supérfluos, pra te trazer de volta ao seu caminho mais rapidamente, assim com o exemplo a seguir:

  ```
  Unmatched `end', missing keyword (`do', `def`, `if`, etc.) ?

    1  class Dog
  > 2    defbark
  > 3    end
    4  end
  ```

  [[Feature #18159]]


### ErrorHighlight

* Agora ele aponta aos argumentos relevantes para TypeError e ArgumentError

```
test.rb:2:in `+': nil can't be coerced into Integer (TypeError)

sum = ary[0] + ary[1]
               ^^^^^^
```

### Linguagem

* Argumentos rest anônimos e palavra-chave rest agora podem ser passados como
  argumentos, em vez de serem usados apenas em parâmetros do método.
  [[Feature #18351]]

    ```ruby
    def foo(*)
      bar(*)
    end
    def baz(**)
      quux(**)
    end
    ```

* Uma proc que aceita um único argumento posicional e palavras-chave não
  irá mais autosplat. [[Bug #18633]]

  ```ruby
  proc{|a, **k| a}.call([1, 2])
  # Ruby 3.1 e antes
  # => 1
  # Ruby 3.2 e depois
  # => [1, 2]
  ```

* A ordem de avaliação de atribuição da constante para constantes
  definidas em objetos explícitos tornou-se consistente com a ordem de avaliação
  de atribuição de atributo único. Com esse código:

    ```ruby
    foo::BAR = baz
    ```

  `foo` agora é chamado antes de `baz`. Similarmente, para múltiplas atribuições
  para constantes a ordem esquerda-para-direita é usada. Com esse código:

    ```ruby
      foo1::BAR1, foo2::BAR2 = baz1, baz2
    ```

  A seguinte ordem de avaliação agora é utilizada:

  1. `foo1`
  2. `foo2`
  3. `baz1`
  4. `baz2`

  [[Bug #15928]]

* O find pattern não é mais experimental.
  [[Feature #18585]]

* Métodos recebendo um parâmetro rest (como `*args`) e desejando delegar argumentos
  de palavra-chave através de `foo(*args)` devem agora serem marcados com `ruby2_keywords`
  (se ainda não for o caso). Em outras palavras, todos métodos que desejam delegar
  argumentos de palavras-chave através do `*args` devem agora serem marcados com
  `ruby2_keywords`, sem exceção. Isso fará mais fácil a transição para outras formas
  de delegação uma vez que uma biblioteca requira Ruby 3+. Anteriormente, a flag
  `ruby2_keywords` foi mantida se o método recebedor levava `*args`, mas isso era
  um bug de inconsistência. Uma boa técnica pra encontrar potenciais `ruby2_keywords`
  faltantes é rodar a suíte de testes, encontrar o último método que deve receber
  argumentos para cada lugar onte a suíte de teste falha, e usar `puts nil, caller, nil`
  lá. Então verifique que cada método/bloco da cadeia de chamada que deve delegar
  palavras-chave está corretamente marcado com `ruby2_keywords`. [[Bug #18625]] [[Bug #16466]]

    ```ruby
    def target(**kw)
    end

    # Acidentalmente funcionou sem ruby2_keywords no Ruby 2.7-3.1, ruby2_keywords
    # é necessário em 3.2+. Assim como (*args, **kwargs) ou (...) seriam necessários
    # em #foo e #bar quando migrar de ruby2_keywords.
    ruby2_keywords def bar(*args)
      target(*args)
    end

    ruby2_keywords def foo(*args)
      bar(*args)
    end

    foo(k: 1)
    ```

## Melhorias de desempenho

### MJIT

* O compilador MJIT está reimplementado em Ruby como `ruby_vm/mjit/compiler`.
* O compilador MJIT é executado sob um processo fork ao invés de
  fazer isso em uma thread nativa chamada worker MJIT. [[Feature #18968]]
    * Como resultado, Microsoft Visual Studio (MSWIN) não é mais suportado.
* MinGW não é mais suportado. [[Feature #18824]]
* Renomeado `--mjit-min-calls` para `--mjit-call-threshold`.
* Mudado valor padrão `--mjit-max-cache` de 10000 para 100.

### PubGrub

* Bundler 2.4 agora utiliza o resolvedor de versão [PubGrub](https://github.com/jhawthorn/pub_grub) ao invés de [Molinillo](https://github.com/CocoaPods/Molinillo).

  * PubGrub é a próxima geração de algoritmo resolvedor utilizado pelo gerenciador de pacote `pub` da linguagem de programação Dart.
  * Você pode obter um resultado de resolução de versões diferentes depois dessa mudança. Por favor relate tais casos para [RubyGems/Bundler issues](https://github.com/rubygems/rubygems/issues)

* RubyGems ainda utiliza o resolvedor Molinillo no Ruby 3.2. Nós planejamos trocá-lo pelo PubGrub no futuro.

## Outras mudanças notórias desde 3.1

* Data
    * Nova classe core para representar objetos de valor imutável simples. A classe
      é similar à Struct e parcialmente compartilha uma implementação, mas tem API
      mais estrita e enxuta. [[Feature #16122]]

        ```ruby
        Measure = Data.define(:amount, :unit)
        distance = Measure.new(100, 'km')            #=> #<data Measure amount=100, unit="km">
        weight = Measure.new(amount: 50, unit: 'kg') #=> #<data Measure amount=50, unit="kg">
        weight.with(amount: 40)                      #=> #<data Measure amount=40, unit="kg">
        weight.amount                                #=> 50
        weight.amount = 40                           #=> NoMethodError: undefined method `amount='
        ```

* Hash
    * `Hash#shift` agora sempre retorna nil se o hash está
      vazio, ao invés de retornar o valor padrão ou chamar
      a proc padrão. [[Bug #16908]]

* MatchData
    * `MatchData#byteoffset` foi adicionado. [[Feature #13110]]

* Module
    * `Module.used_refinements` foi adicionado. [[Feature #14332]]
    * `Module#refinements` foi adicionado. [[Feature #12737]]
    * `Module#const_added` foi adicionado. [[Feature #17881]]

* Proc
    * `Proc#dup` retorna uma instância da subclasse. [[Bug #17545]]
    * `Proc#parameters` agora aceita a palavra-chave lambda. [[Feature #15357]]

* Refinement
    * `Refinement#refined_class` foi adicionado. [[Feature #12737]]

* RubyVM::AbstractSyntaxTree
    * Adicionada opção `error_tolerant` para `parse`, `parse_file` e `of`. [[Feature #19013]]
      Com essa opção
        1. SyntaxError é suprimido
        2. AST é retornada por input inválido
        3. `end` é complementado quando um parser alcança o fim do input, mas o `end` é insuficiente
        4. `end` é tratado como palavra-chave baseado na indentação

        ```ruby
        # Sem opção error_tolerant
        root = RubyVM::AbstractSyntaxTree.parse(<<~RUBY)
        def m
          a = 10
          if
        end
        RUBY
        # => <internal:ast>:33:in `parse': syntax error, unexpected `end' (SyntaxError)

        # Com opção error_tolerant
        root = RubyVM::AbstractSyntaxTree.parse(<<~RUBY, error_tolerant: true)
        def m
          a = 10
          if
        end
        RUBY
        p root # => #<RubyVM::AbstractSyntaxTree::Node:SCOPE@1:0-4:3>

        # `end` é tratado como palavra-chave baseado na indentação
        root = RubyVM::AbstractSyntaxTree.parse(<<~RUBY, error_tolerant: true)
        module Z
          class Foo
            foo.
          end

          def bar
          end
        end
        RUBY
        p root.children[-1].children[-1].children[-1].children[-2..-1]
        # => [#<RubyVM::AbstractSyntaxTree::Node:CLASS@2:2-4:5>, #<RubyVM::AbstractSyntaxTree::Node:DEFN@6:2-7:5>]
        ```

    * Adiciona opção `keep_tokens` para `parse`, `parse_file` e `of`. [[Feature #19070]]

        ```ruby
        root = RubyVM::AbstractSyntaxTree.parse("x = 1 + 2", keep_tokens: true)
        root.tokens # => [[0, :tIDENTIFIER, "x", [1, 0, 1, 1]], [1, :tSP, " ", [1, 1, 1, 2]], ...]
        root.tokens.map{_1[2]}.join # => "x = 1 + 2"
        ```

* Set
    * Set agora está disponível como uma classe builtin sem necessidade de `require "set"`. [[Feature #16989]]
      Ela está atualmente autoloaded via constante `Set` ou chamada em `Enumerable#to_set`.

* String
    * `String#byteindex` e `String#byterindex` foram adicionados. [[Feature #13110]]
    * Atualizado Unicode para Versão 15.0.0 e Emoji Versão 15.0. [[Feature #18639]]
      (também aplicado para Regexp)
    * `String#bytesplice` foi adicionado. [[Feature #18598]]

* Struct
    * Uma classe Struct pode também ser inicializada com argumentos de palavras-chave
      sem `keyword_init: true` em `Struct.new` [[Feature #16806]]

        ```ruby
        Post = Struct.new(:id, :name)
        Post.new(1, "hello") #=> #<struct Post id=1, name="hello">
        # Do Ruby 3.2, o seguinte código também funciona sem keyword_init: true.
        Post.new(id: 1, name: "hello") #=> #<struct Post id=1, name="hello">
        ```

## Issues de compatibilidade

Nota: Excluindo correção de bugs de funcionalidades.

### Constantes removidas

As seguintes constantes obsoletas foram removidas.

* `Fixnum` e `Bignum` [[Feature #12005]]
* `Random::DEFAULT` [[Feature #17351]]
* `Struct::Group`
* `Struct::Passwd`

### Métodos removidos

Os seguintes métodos obsoletos foram removidos.

* `Dir.exists?` [[Feature #17391]]
* `File.exists?` [[Feature #17391]]
* `Kernel#=~` [[Feature #15231]]
* `Kernel#taint`, `Kernel#untaint`, `Kernel#tainted?`
  [[Feature #16131]]
* `Kernel#trust`, `Kernel#untrust`, `Kernel#untrusted?`
  [[Feature #16131]]

## Issues de compatibilidade na Stdlib

### Não empacota mais código fonte de terceiros

* Nós não empacotamos mais código fonte de terceiro como `libyaml`, `libffi`.

    * O código fonte do libyaml foi removido do psych. Você pode precisar instalar
    `libyaml-dev` na plataforma Ubuntu/Debian. O nome do pacote é diferente pra cada
    plataforma.

    * O código fonte empacotado do libffi também foi removido do `fiddle`

* Psych e fiddle suportaram builds estáticos com versões específicas dos fontes de libyaml e libffi. Você pode rodar o build do psych com libyaml-0.2.5 assim:

    ```bash
    $ ./configure --with-libyaml-source-dir=/path/to/libyaml-0.2.5
    ```

    E você pode rodar o build do fiddle com libffi-3.4.4 assim:

    ```bash
    $ ./configure --with-libffi-source-dir=/path/to/libffi-3.4.4
    ```

  [[Feature #18571]]

## Atualizações da API de C

### APIs de C atualizadas

As seguintes APIs foram atualizadas.

* Atualização do PRNG
  * `rb_random_interface_t` atualizado e versionado.
    Bibliotecas de extensão que usam essa interface e buildadas para versões antigas.
    E também a função `init_int32` precisa ser definida.

### APIs de C removidas

As seguintes APIs se tornaram obsoletas e foram removidas.

* Variável `rb_cData`.
* Funções "taintedness" e "trustedness". [[Feature #16131]]

## Atualizações da biblioteca padrão

* Bundler

    * Adiciona suporte a --ext=rust para empacotar gem e criar gems simples com extensões de Rust.
      [[GH-rubygems-6149]]
    * Clonar repositórios git mais rápido [[GH-rubygems-4475]]

* RubyGems

    * Adiciona suporte a mswin para builder cargo. [[GH-rubygems-6167]]

* ERB

    * `ERB::Util.html_escape` mais rápido que `CGI.escapeHTML`.
        * Não aloca um objeto String quando não há caracteres para escapar.
        * Pula a chamada do método `#to_s` quando o argumento já é uma String.
        * `ERB::Escape.html_escape` é adicionado como alias para `ERB::Util.html_escape`,
          que não é monkey-patched pelo Rails.

* IRB

    * Comandos de integração do debug.gem foram adicionado: `debug`, `break`, `catch`,
      `next`, `delete`, `step`, `continue`, `finish`, `backtrace`, `info`
        * Eles funcionam mesmo se você não possuir `gem "debug"` no seu Gemfile.
        * Veja também: [What's new in Ruby 3.2's IRB?](https://st0012.dev/whats-new-in-ruby-3-2-irb)
    * Mais comandos e funcionalidades Pry-like foram adicionados.
        * `edit` e `show_cmds` (como o `help` do Pry) foram adicionados.
        * `ls` leva a opção `-g` ou `-G` para filtrar outputs.
        * `show_source` é alias de `$` e aceita inputs sem aspas.
        * `whereami` é alias de `@`.

*   As seguintes gems padrão foram atualizadas.

    * RubyGems 3.4.1
    * abbrev 0.1.1
    * benchmark 0.2.1
    * bigdecimal 3.1.3
    * bundler 2.4.1
    * cgi 0.3.6
    * csv 3.2.6
    * date 3.3.3
    * delegate 0.3.0
    * did_you_mean 1.6.3
    * digest 3.1.1
    * drb 2.1.1
    * english 0.7.2
    * erb 4.0.2
    * error_highlight 0.5.1
    * etc 1.4.2
    * fcntl 1.0.2
    * fiddle 1.1.1
    * fileutils 1.7.0
    * forwardable 1.3.3
    * getoptlong 0.2.0
    * io-console 0.6.0
    * io-nonblock 0.2.0
    * io-wait 0.3.0
    * ipaddr 1.2.5
    * irb 1.6.2
    * json 2.6.3
    * logger 1.5.3
    * mutex_m 0.1.2
    * net-http 0.3.2
    * net-protocol 0.2.1
    * nkf 0.1.2
    * open-uri 0.3.0
    * open3 0.1.2
    * openssl 3.1.0
    * optparse 0.3.1
    * ostruct 0.5.5
    * pathname 0.2.1
    * pp 0.4.0
    * pstore 0.1.2
    * psych 5.0.1
    * racc 1.6.2
    * rdoc 6.5.0
    * readline-ext 0.1.5
    * reline 0.3.2
    * resolv 0.2.2
    * resolv-replace 0.1.1
    * securerandom 0.2.2
    * set 1.0.3
    * stringio 3.0.4
    * strscan 3.0.5
    * syntax_suggest 1.0.2
    * syslog 0.1.1
    * tempfile 0.1.3
    * time 0.2.1
    * timeout 0.3.1
    * tmpdir 0.1.3
    * tsort 0.1.1
    * un 0.2.1
    * uri 0.12.0
    * weakref 0.1.2
    * win32ole 1.8.9
    * yaml 0.2.1
    * zlib 3.0.0

*   As seguintes gems empacotadas foram atualizadas.

    * minitest 5.16.3
    * power_assert 2.0.3
    * test-unit 3.5.7
    * net-ftp 0.2.0
    * net-imap 0.3.3
    * net-pop 0.1.2
    * net-smtp 0.3.3
    * rbs 2.8.2
    * typeprof 0.21.3
    * debug 1.7.1

Veja as releases do GitHub como [GitHub Releases of logger](https://github.com/ruby/logger/releases) ou changelog para detalhes das gems padrão ou gems empacotadas.

Veja [NOVIDADES](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
ou [commit logs](https://github.com/ruby/ruby/compare/v3_1_0...{{ release.tag }})
para mais detalhes.

Com estas mudanças, [{{ release.stats.files_changed }} arquivos mudados, {{ release.stats.insertions }} inserções(+), {{ release.stats.deletions }} remoções(-)](https://github.com/ruby/ruby/compare/v3_1_0...{{ release.tag }}#file_bucket)
desde o Ruby 3.1.0!

Feliz Natal, Boas Festas, e aproveite programando com Ruby 3.2!

## Download

* <{{ release.url.gz }}>

      SIZE: {{ release.size.gz }}
      SHA1: {{ release.sha1.gz }}
      SHA256: {{ release.sha256.gz }}
      SHA512: {{ release.sha512.gz }}

* <{{ release.url.xz }}>

      SIZE: {{ release.size.xz }}
      SHA1: {{ release.sha1.xz }}
      SHA256: {{ release.sha256.xz }}
      SHA512: {{ release.sha512.xz }}

* <{{ release.url.zip }}>

      SIZE: {{ release.size.zip }}
      SHA1: {{ release.sha1.zip }}
      SHA256: {{ release.sha256.zip }}
      SHA512: {{ release.sha512.zip }}

## O que é Ruby

Ruby foi primeiramente desenvolvido por Matz (Yukihiro Matsumoto) em 1993
e agora é desenvolvido como Open Source. Ele roda em múltiplas plataformas
e é usado em todo o mundo, especialmente para desenvolvimento web.

[Feature #12005]:     https://bugs.ruby-lang.org/issues/12005
[Feature #12084]:     https://bugs.ruby-lang.org/issues/12084
[Feature #12655]:     https://bugs.ruby-lang.org/issues/12655
[Feature #12737]:     https://bugs.ruby-lang.org/issues/12737
[Feature #13110]:     https://bugs.ruby-lang.org/issues/13110
[Feature #14332]:     https://bugs.ruby-lang.org/issues/14332
[Feature #15231]:     https://bugs.ruby-lang.org/issues/15231
[Feature #15357]:     https://bugs.ruby-lang.org/issues/15357
[Bug #15928]:         https://bugs.ruby-lang.org/issues/15928
[Feature #16122]:     https://bugs.ruby-lang.org/issues/16122
[Feature #16131]:     https://bugs.ruby-lang.org/issues/16131
[Bug #16466]:         https://bugs.ruby-lang.org/issues/16466
[Feature #16663]:     https://bugs.ruby-lang.org/issues/16663
[Feature #16806]:     https://bugs.ruby-lang.org/issues/16806
[Bug #16889]:         https://bugs.ruby-lang.org/issues/16889
[Bug #16908]:         https://bugs.ruby-lang.org/issues/16908
[Feature #16989]:     https://bugs.ruby-lang.org/issues/16989
[Feature #17351]:     https://bugs.ruby-lang.org/issues/17351
[Feature #17391]:     https://bugs.ruby-lang.org/issues/17391
[Bug #17545]:         https://bugs.ruby-lang.org/issues/17545
[Bug #17767]:         https://bugs.ruby-lang.org/issues/17767
[Feature #17837]:     https://bugs.ruby-lang.org/issues/17837
[Feature #17881]:     https://bugs.ruby-lang.org/issues/17881
[Feature #18033]:     https://bugs.ruby-lang.org/issues/18033
[Feature #18159]:     https://bugs.ruby-lang.org/issues/18159
[Feature #18239]:     https://bugs.ruby-lang.org/issues/18239#note-17
[Feature #18351]:     https://bugs.ruby-lang.org/issues/18351
[Feature #18367]:     https://bugs.ruby-lang.org/issues/18367
[Bug #18435]:         https://bugs.ruby-lang.org/issues/18435
[Feature #18462]:     https://bugs.ruby-lang.org/issues/18462
[Feature #18481]:     https://bugs.ruby-lang.org/issues/18481
[Bug #18487]:         https://bugs.ruby-lang.org/issues/18487
[Feature #18564]:     https://bugs.ruby-lang.org/issues/18564
[Feature #18571]:     https://bugs.ruby-lang.org/issues/18571
[Feature #18585]:     https://bugs.ruby-lang.org/issues/18585
[Feature #18589]:     https://bugs.ruby-lang.org/issues/18589
[Feature #18595]:     https://bugs.ruby-lang.org/issues/18595
[Feature #18598]:     https://bugs.ruby-lang.org/issues/18598
[Bug #18625]:         https://bugs.ruby-lang.org/issues/18625
[Feature #18630]:     https://bugs.ruby-lang.org/issues/18630
[Bug #18633]:         https://bugs.ruby-lang.org/issues/18633
[Feature #18639]:     https://bugs.ruby-lang.org/issues/18639
[Feature #18685]:     https://bugs.ruby-lang.org/issues/18685
[Bug #18729]:         https://bugs.ruby-lang.org/issues/18729
[Bug #18751]:         https://bugs.ruby-lang.org/issues/18751
[Feature #18774]:     https://bugs.ruby-lang.org/issues/18774
[Feature #18776]:     https://bugs.ruby-lang.org/issues/18776
[Bug #18782]:         https://bugs.ruby-lang.org/issues/18782
[Feature #18788]:     https://bugs.ruby-lang.org/issues/18788
[Feature #18798]:     https://bugs.ruby-lang.org/issues/18798
[Feature #18809]:     https://bugs.ruby-lang.org/issues/18809
[Feature #18821]:     https://bugs.ruby-lang.org/issues/18821
[Feature #18822]:     https://bugs.ruby-lang.org/issues/18822
[Feature #18824]:     https://bugs.ruby-lang.org/issues/18824
[Feature #18832]:     https://bugs.ruby-lang.org/issues/18832
[Feature #18875]:     https://bugs.ruby-lang.org/issues/18875
[Feature #18925]:     https://bugs.ruby-lang.org/issues/18925
[Feature #18944]:     https://bugs.ruby-lang.org/issues/18944
[Feature #18949]:     https://bugs.ruby-lang.org/issues/18949
[Feature #18968]:     https://bugs.ruby-lang.org/issues/18968
[Feature #19008]:     https://bugs.ruby-lang.org/issues/19008
[Feature #19013]:     https://bugs.ruby-lang.org/issues/19013
[Feature #19026]:     https://bugs.ruby-lang.org/issues/19026
[Feature #19036]:     https://bugs.ruby-lang.org/issues/19036
[Feature #19060]:     https://bugs.ruby-lang.org/issues/19060
[Feature #19070]:     https://bugs.ruby-lang.org/issues/19070
[Feature #19071]:     https://bugs.ruby-lang.org/issues/19071
[Feature #19078]:     https://bugs.ruby-lang.org/issues/19078
[Bug #19087]:         https://bugs.ruby-lang.org/issues/19087
[Bug #19100]:         https://bugs.ruby-lang.org/issues/19100
[Feature #19104]:     https://bugs.ruby-lang.org/issues/19104
[Feature #19135]:     https://bugs.ruby-lang.org/issues/19135
[Feature #19138]:     https://bugs.ruby-lang.org/issues/19138
[Feature #19194]:     https://bugs.ruby-lang.org/issues/19194
[Molinillo]:          https://github.com/CocoaPods/Molinillo
[PubGrub]:            https://github.com/jhawthorn/pub_grub
[GH-net-protocol-14]: https://github.com/ruby/net-protocol/pull/14
[GH-pathname-20]:     https://github.com/ruby/pathname/pull/20
[GH-6791]:            https://github.com/ruby/ruby/pull/6791
[GH-6868]:            https://github.com/ruby/ruby/pull/6868
[GH-rubygems-4475]:   https://github.com/rubygems/rubygems/pull/4475
[GH-rubygems-6149]:   https://github.com/rubygems/rubygems/pull/6149
[GH-rubygems-6167]:   https://github.com/rubygems/rubygems/pull/6167
[sec-156615]:         https://hackerone.com/reports/156615
[CVE-2021-33621]:     https://www.ruby-lang.org/en/news/2022/11/22/http-response-splitting-in-cgi-cve-2021-33621/
[wasm/README.md]:     https://github.com/ruby/ruby/blob/master/wasm/README.md
[ruby.wasm]:          https://github.com/ruby/ruby.wasm
