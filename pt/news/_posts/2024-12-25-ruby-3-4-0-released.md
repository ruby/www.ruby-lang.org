---
layout: news_post
title: "Ruby 3.4.0 Lançado"
author: "naruse"
translator: nbluis
date: 2024-12-25 00:00:00 +0000
lang: pt
---

{% assign release = site.data.releases | where: "version", "3.4.0" | first %}
Estamos felizes em anunciar o lançamento do Ruby {{ release.version }}. Ruby 3.4 adiciona a referência de parâmetro de bloco `it`,
altera o Prism como parser padrão, adiciona suporte ao Happy Eyeballs Versão 2 na biblioteca de socket, melhora o YJIT,
adiciona GC Modular, e muito mais.

## `it` é introduzido

`it` foi adicionado para referenciar um parâmetro de bloco sem nome de variável. [[Feature #18980]]

```ruby
ary = ["foo", "bar", "baz"]

p ary.map { it.upcase } #=> ["FOO", "BAR", "BAZ"]
```

`it` se comporta de maneira muito semelhante a `_1`. Quando a intenção é usar apenas `_1` em um bloco, a possibilidade de outros parâmetros numerados como `_2` aparecer impõe uma carga cognitiva extra aos leitores. Então `it` foi introduzido como um alias prático. Use `it` em casos simples onde `it` representa itself, como em blocos de uma linha.

## Prism agora é o parser padrão

Alteração do parser padrão de parse.y para Prism. [[Feature #20564]]

Esta é uma melhoria interna e deve haver pouca mudança visível para o usuário. Se você notar algum problema de compatibilidade, por favor, reporte para nós.

Para usar o parser convencional, use o argumento de linha de comando `--parser=parse.y`.

## A biblioteca de socket agora possui Happy Eyeballs Versão 2 (RFC 8305)

A biblioteca de socket agora possui [Happy Eyeballs Version 2 (RFC 8305)](https://datatracker.ietf.org/doc/html/rfc8305), a versão padronizada mais recente de uma abordagem amplamente adotada para melhor conectividade em muitas linguagens de programação, em `TCPSocket.new` (`TCPSocket.open`) e `Socket.tcp`.
Esta melhoria permite que o Ruby forneça conexões de rede eficientes e confiáveis, adaptadas aos ambientes modernos da internet.

Até o Ruby 3.3, esses métodos realizavam a resolução de nomes e tentativas de conexão de forma serial. Com este algoritmo, eles agora operam da seguinte forma:

1. Realiza a resolução de nomes IPv6 e IPv4 simultaneamente
2. Tenta conexões com os endereços IP resolvidos, priorizando IPv6, com tentativas paralelas escalonadas em intervalos de 250ms
3. Retorna a primeira conexão bem-sucedida enquanto cancela quaisquer outras

Isso garante atrasos mínimos de conexão, mesmo se um protocolo específico ou endereço IP estiver atrasado ou indisponível.
Este recurso é habilitado por padrão, portanto, configuração adicional não é necessária para usá-lo. Para desativá-lo globalmente, defina a variável de ambiente `RUBY_TCP_NO_FAST_FALLBACK=1` ou chame `Socket.tcp_fast_fallback=false`. Ou para desativá-lo em um método específico, use o argumento `fast_fallback: false`.

## YJIT

### TL;DR

* Melhor desempenho na maioria dos benchmarks em plataformas x86-64 e arm64.
* Uso reduzido de memória através de metadados comprimidos e um limite de memória unificado.
* Várias correções de bugs: YJIT agora é mais robusto e testado exaustivamente.

### Novos recursos

* Opções de linha de comando
    * `--yjit-mem-size` introduz um limite de memória unificado (padrão 128MiB) para rastrear o uso total de memória do YJIT,
      fornecendo uma alternativa mais intuitiva à antiga opção `--yjit-exec-mem-size`.
    * `--yjit-log` habilita um log de compilação para rastrear o que é compilado.
* API Ruby
    * `RubyVM::YJIT.log` fornece acesso ao final do log de compilação em tempo de execução.
* Estatísticas do YJIT
    * `RubyVM::YJIT.runtime_stats` agora sempre fornece estatísticas adicionais sobre
       invalidação, inlining e codificação de metadados.

### Novas otimizações

* Contexto comprimido reduz a memória necessária para armazenar metadados do YJIT
* Alocar registradores para variáveis locais e argumentos de métodos Ruby
* Quando o YJIT está habilitado, usa mais primitivas Core escritas em Ruby:
    * `Array#each`, `Array#select`, `Array#map` reescritos em Ruby para melhor desempenho [[Feature #20182]].
* Capacidade de inline de métodos pequenos/triviais, como:
    * Métodos vazios
    * Métodos que retornam uma constante
    * Métodos que retornam `self`
    * Métodos que retornam diretamente um argumento
* Geração de código especializada para muitos mais métodos em tempo de execução
* Otimiza `String#getbyte`, `String#setbyte` e outros métodos de string
* Otimiza operações bitwise para acelerar a manipulação de bits/bytes de baixo nível
* Suporte a constantes compartilháveis em modo multi-ractor
* Várias outras otimizações incrementais

## Modular GC

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

* O splatting de palavra-chave `nil` ao chamar métodos agora é suportado.
  `**nil` é tratado de maneira semelhante a `**{}`, não passando palavras-chave,
  e não chamando nenhum método de conversão. [[Bug #20064]]

* Passagem de bloco não é mais permitida em índice. [[Bug #19918]]

* Argumentos de palavra-chave não são mais permitidos em índice. [[Bug #20218]]

* O nome de nível superior `::Ruby` agora está reservado, e a definição será avisada quando `Warning[:deprecated]`. [[Feature #20884]]

## Atualizações de classes principais

Nota: Estamos listando apenas atualizações notáveis das classes principais.

* Exception

  * `Exception#set_backtrace` agora aceita um array de `Thread::Backtrace::Location`.
    `Kernel#raise`, `Thread#raise` e `Fiber#raise` também aceitam este novo formato. [[Feature #13557]]

* GC

    * `GC.config` adicionado para permitir a configuração de variáveis no Garbage
      Collector. [[Feature #20443]]

    * Parâmetro de configuração do GC `rgengc_allow_full_mark` introduzido. Quando `false`
      o GC marcará apenas objetos jovens. O padrão é `true`. [[Feature #20443]]

* Ractor

    * `require` em Ractor é permitido. O processo de requisição será executado no
      Ractor principal.
      `Ractor._require(feature)` é adicionado para executar o processo de requisição no
      Ractor principal. [[Feature #20627]]

    * `Ractor.main?` é adicionado. [[Feature #20627]]

    * `Ractor.[]` e `Ractor.[]=` são adicionados para acessar o armazenamento local
       do Ractor atual. [[Feature #20715]]

    * `Ractor.store_if_absent(key){ init }` é adicionado para inicializar variáveis locais do ractor
      de forma segura para threads. [[Feature #20875]]

* Range

  * `Range#size` agora levanta `TypeError` se o intervalo não for iterável. [[Misc #18984]]

## Atualizações da Biblioteca Padrão

Nota: Estamos listando apenas atualizações notáveis das bibliotecas padrão.

* RubyGems
    * Adicionada a opção `--attestation` ao gem push. Ela permite armazenar a assinatura no [sigstore.dev]

* Bundler
    * Adicionada uma configuração `lockfile_checksums` para incluir checksums em novos arquivos lockfile.
    * Adicionado bundle lock `--add-checksums` para adicionar checksums a um arquivo lockfile existente

* JSON

    * Melhorias de desempenho do `JSON.parse` cerca de 1,5 vezes mais rápido que json-2.7.x.

* Tempfile

    * O argumento de palavra-chave `anonymous: true` foi implementado para Tempfile.create.
      `Tempfile.create(anonymous: true)` remove o arquivo temporário criado imediatamente.
      Assim, as aplicações não precisam remover o arquivo.
      [[Feature #20497]]

* win32/sspi.rb

    * Esta biblioteca agora foi extraída do repositório Ruby para [ruby/net-http-sspi].
      [[Feature #20775]]

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

* A renderização de Hash#inspect foi alterada. [[Bug #20433]]

  * Chaves de símbolo são exibidas usando a sintaxe moderna de chave de símbolo: `"{user: 1}"`
  * Outras chaves agora têm espaços ao redor de `=>`: `'{"user" => 1}'`, enquanto anteriormente não tinham: `'{"user"=>1}'`

* Kernel#Float() agora aceita uma string decimal com a parte decimal omitida. [[Feature #20705]]

  ```rb
  Float("1.")    #=> 1.0 (anteriormente, um ArgumentError era levantado)
  Float("1.E-1") #=> 0.1 (anteriormente, um ArgumentError era levantado)
  ```

* String#to_f agora aceita uma string decimal com a parte decimal omitida. Note que o resultado muda quando um expoente é especificado. [[Feature #20705]]

  ```rb
  "1.".to_f    #=> 1.0
  "1.E-1".to_f #=> 0.1 (anteriormente, 1.0 era retornado)
  ```

* Refinement#refined_class foi removido. [[Feature #19714]]

## Problemas de compatibilidade da biblioteca padrão

* DidYouMean

    * `DidYouMean::SPELL_CHECKERS[]=` e `DidYouMean::SPELL_CHECKERS.merge!` foram removidos.

* Net::HTTP

    * Removidas as seguintes constantes obsoletas:
        * `Net::HTTP::ProxyMod`
        * `Net::NetPrivate::HTTPRequest`
        * `Net::HTTPInformationCode`
        * `Net::HTTPSuccessCode`
        * `Net::HTTPRedirectionCode`
        * `Net::HTTPRetriableCode`
        * `Net::HTTPClientErrorCode`
        * `Net::HTTPFatalErrorCode`
        * `Net::HTTPServerErrorCode`
        * `Net::HTTPResponseReceiver`
        * `Net::HTTPResponceReceiver`

      Essas constantes foram obsoletas desde 2012.

* Timeout

    * Rejeita valores negativos para Timeout.timeout. [[Bug #20795]]

* URI

    * Alterado o parser padrão para compatível com RFC 3986 em vez de RFC 2396.
      [[Bug #19266]]

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

Veja [NEWS](https://docs.ruby-lang.org/en/3.4/NEWS_md.html)
ou [logs de commits](https://github.com/ruby/ruby/compare/v3_3_0...{{ release.tag }})
para mais detalhes.

Com essas mudanças, [{{ release.stats.files_changed }} arquivos alterados, {{ release.stats.insertions }} inserções(+), {{ release.stats.deletions }} deleções(-)](https://github.com/ruby/ruby/compare/v3_3_0...{{ release.tag }}#file_bucket)
desde Ruby 3.3.0!

Feliz Natal, Boas Festas e aproveite a programação com Ruby 3.4!

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
[Bug #19266]:     https://bugs.ruby-lang.org/issues/19266
[Feature #19714]: https://bugs.ruby-lang.org/issues/19714
[Bug #19918]:     https://bugs.ruby-lang.org/issues/19918
[Bug #20064]:     https://bugs.ruby-lang.org/issues/20064
[Feature #20182]: https://bugs.ruby-lang.org/issues/20182
[Feature #20205]: https://bugs.ruby-lang.org/issues/20205
[Bug #20218]:     https://bugs.ruby-lang.org/issues/20218
[Feature #20265]: https://bugs.ruby-lang.org/issues/20265
[Feature #20351]: https://bugs.ruby-lang.org/issues/20351
[Feature #20429]: https://bugs.ruby-lang.org/issues/20429
[Feature #20443]: https://bugs.ruby-lang.org/issues/20443
[Feature #20470]: https://bugs.ruby-lang.org/issues/20470
[Feature #20497]: https://bugs.ruby-lang.org/issues/20497
[Feature #20564]: https://bugs.ruby-lang.org/issues/20564
[Bug #20620]: https://bugs.ruby-lang.org/issues/20620
[Feature #20627]: https://bugs.ruby-lang.org/issues/20627
[Feature #20705]: https://bugs.ruby-lang.org/issues/20705
[Feature #20715]: https://bugs.ruby-lang.org/issues/20715
[Feature #20775]: https://bugs.ruby-lang.org/issues/20775
[Bug #20795]: https://bugs.ruby-lang.org/issues/20795
[Bug #20433]: https://bugs.ruby-lang.org/issues/20433
[Feature #20860]: https://bugs.ruby-lang.org/issues/20860
[Feature #20875]: https://bugs.ruby-lang.org/issues/20875
[Feature #20884]: https://bugs.ruby-lang.org/issues/20884
[sigstore.dev]: https://www.sigstore.dev
[ruby/net-http-sspi]: https://github.com/ruby/net-http-sspi
