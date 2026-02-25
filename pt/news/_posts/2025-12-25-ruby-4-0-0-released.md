---
layout: news_post
title: "Ruby 4.0.0 Lançado"
author: "naruse"
translator: guicruzzs
date: 2025-12-25 00:00:00 +0000
lang: pt
---

{% assign release = site.data.releases | where: "version", "4.0.0" | first %}
Estamos felizes em anunciar o lançamento do Ruby {{ release.version }}.
Ruby 4.0 introduz o "Ruby Box" e o "ZJIT", além de muitas melhorias.

## Ruby Box

Ruby Box é um novo recurso (experimental) para fornecer separação de definições.
Ruby Box é habilitado quando a variável de ambiente `RUBY_BOX=1` é especificada.
A classe é `Ruby::Box`.

Definições carregadas em uma box são isoladas dentro dela.
Ruby Box pode isolar/separar monkey patches, alterações em variáveis globais/de classe,
definições de classes/módulos e bibliotecas nativas/Ruby carregadas de outras boxes.

Casos de uso esperados incluem:

* Executar casos de teste em uma box para proteger outros testes quando o caso de teste usa
  monkey patches para sobrescrever algo
* Executar boxes de aplicações web em paralelo para fazer blue‑green deployment
  em um servidor de aplicação dentro de um processo Ruby
* Executar boxes de aplicações web em paralelo para avaliar atualizações de dependências
  por um certo período de tempo, verificando o diff da resposta usando código Ruby
* Ser usada como a API de base (baixo nível) para implementar algum tipo de API de "pacotes"
  (alto nível) (ainda não foi projetada)

Para mais detalhes sobre o "Ruby Box", consulte
[`Ruby::Box`](https://docs.ruby-lang.org/en/master/Ruby/Box.html).
[[Feature #21311]] [[Misc #21385]]

## ZJIT

ZJIT é um novo compilador just‑in‑time (JIT), desenvolvido como a próxima geração do YJIT.
Você precisa do Rust 1.85.0 ou mais recente para construir o Ruby com suporte ao ZJIT, e
o ZJIT é habilitado quando `--zjit` é especificado.

Estamos construindo um novo compilador para Ruby porque queremos tanto elevar o teto de
desempenho (unidade de compilação maior e IR em SSA) quanto incentivar mais contribuições
externas (tornando‑se um compilador de métodos mais tradicional).
Veja [nosso post no blog](https://railsatscale.com/2025-12-24-launch-zjit/) para mais detalhes.
<!-- the blog post will be auto-published on 2025-12-24 9:00am UTC. -->

ZJIT é mais rápido que o interpretador, mas ainda não é tão rápido quanto o YJIT.
Incentivamos você a experimentar o ZJIT, mas talvez seja melhor adiar o uso em produção por enquanto.
Fique de olho no ZJIT do Ruby 4.1.

## Melhorias em Ractor

Ractor, o mecanismo de execução paralela do Ruby, recebeu várias melhorias.
Uma nova classe, `Ractor::Port`, foi introduzida para resolver problemas relacionados
ao envio e recebimento de mensagens (veja
[este post no blog](https://dev.to/ko1/ractorport-revamping-the-ractor-api-98)).
Além disso, `Ractor.shareable_proc` facilita compartilhar objetos `Proc` entre Ractors.

Do ponto de vista de desempenho, muitas estruturas de dados internas foram melhoradas
para reduzir significativamente a contenção em um lock global, liberando mais paralelismo.
Ractors também agora compartilham menos dados internos, resultando em menos contenção de
cache de CPU quando executados em paralelo.

Ractor foi introduzido pela primeira vez no Ruby 3.0 como um recurso experimental.
Nosso objetivo é remover o status de "experimental" no próximo ano.

## Mudanças na linguagem

* `*nil` não chama mais `nil.to_a`, de forma semelhante a como `**nil` não chama
  `nil.to_hash`. [[Feature #21047]]

* Operadores lógicos binários (`||`, `&&`, `and` e `or`) no início de uma linha
  continuam a linha anterior, assim como o encadeamento por ponto.
  Os exemplos de código a seguir são equivalentes:

    ```ruby
    if condition1
       && condition2
      ...
    end
    ```

    Anteriormente:

    ```ruby
    if condition1 && condition2
      ...
    end
    ```

    ```ruby
    if condition1 &&
       condition2
      ...
    end
    ```

    [[Feature #20925]]

## Atualizações de classes principais

Nota: Estamos listando apenas atualizações notáveis das classes principais.

* Array

    * `Array#rfind` foi adicionado como uma alternativa mais eficiente a
      `array.reverse_each.find`. [[Feature #21678]]
    * `Array#find` foi adicionado como uma sobrescrita mais eficiente de
      `Enumerable#find`. [[Feature #21678]]

* Binding

    * `Binding#local_variables` não inclui mais parâmetros numerados.
      Além disso, `Binding#local_variable_get`, `Binding#local_variable_set` e
      `Binding#local_variable_defined?` deixam de lidar com parâmetros numerados.
      [[Bug #21049]]

    * `Binding#implicit_parameters`, `Binding#implicit_parameter_get` e
      `Binding#implicit_parameter_defined?` foram adicionados para acessar
      parâmetros numerados e o parâmetro `it`. [[Bug #21049]]

* Enumerator

    * `Enumerator.produce` agora aceita um argumento de palavra‑chave opcional `size`
      para especificar o tamanho do enumerador. Pode ser um inteiro,
      `Float::INFINITY`, um objeto chamável (como uma lambda) ou `nil` para indicar
      tamanho desconhecido. Quando não especificado, o tamanho padrão é
      `Float::INFINITY`.

        ```ruby
        # Enumerador infinito
        enum = Enumerator.produce(1, size: Float::INFINITY, &:succ)
        enum.size  # => Float::INFINITY

        # Enumerador finito com tamanho conhecido/computável
        abs_dir = File.expand_path("./baz") # => "/foo/bar/baz"
        traverser = Enumerator.produce(abs_dir, size: -> { abs_dir.count("/") + 1 }) {
          raise StopIteration if it == "/"
          File.dirname(it)
        }
        traverser.size  # => 4
        ```

      [[Feature #21701]]

* ErrorHighlight

    * Quando um `ArgumentError` é levantado, agora são exibidos trechos de código
      tanto da chamada de método (caller) quanto da definição de método (callee).
      [[Feature #21543]]

      ```
      test.rb:1:in 'Object#add': wrong number of arguments (given 1, expected 2) (ArgumentError)

          caller: test.rb:3
          | add(1)
            ^^^
          callee: test.rb:1
          | def add(x, y) = x + y
                ^^^
              from test.rb:3:in '<main>'
      ```

* Fiber

    * Suporte ao argumento `Fiber#raise(cause:)` foi introduzido, semelhante a
      `Kernel#raise`. [[Feature #21360]]

* Fiber::Scheduler

    * Introduz `Fiber::Scheduler#fiber_interrupt` para interromper um fiber com
      uma exceção específica. O caso de uso inicial é interromper um fiber que
      está aguardando uma operação de IO bloqueante quando essa operação é
      encerrada. [[Feature #21166]]

    * Introduz `Fiber::Scheduler#yield` para permitir que o escalonador de fibers
      continue processando quando exceções de sinal estão desabilitadas.
      [[Bug #21633]]

    * Reintroduz o hook `Fiber::Scheduler#io_close` para `IO#close` assíncrono.

    * Invoca `Fiber::Scheduler#io_write` ao esvaziar o buffer de escrita de IO.
      [[Bug #21789]]

* File

    * `File::Stat#birthtime` agora está disponível no Linux via a chamada de
      sistema `statx`, quando suportada pelo kernel e pelo sistema de arquivos.
      [[Feature #21205]]

* IO

    * `IO.select` aceita `Float::INFINITY` como argumento de timeout.
      [[Feature #20610]]

    * Um comportamento obsoleto, criação de processos por métodos da classe `IO`
      com um `|` inicial, foi removido. [[Feature #19630]]

* Kernel

    * `Kernel#inspect` agora verifica a existência de um método
      `#instance_variables_to_inspect`, permitindo controlar quais variáveis de
      instância são exibidas na string de `#inspect`:

        ```ruby
        class DatabaseConfig
          def initialize(host, user, password)
            @host = host
            @user = user
            @password = password
          end

          private def instance_variables_to_inspect = [:@host, :@user]
        end

        conf = DatabaseConfig.new("localhost", "root", "hunter2")
        conf.inspect #=> #<DatabaseConfig:0x0000000104def350 @host="localhost", @user="root">
        ```

        [[Feature #21219]]

    * Um comportamento obsoleto, criação de processos por `Kernel#open` com um
      `|` inicial, foi removido. [[Feature #19630]]

* Math

    * `Math.log1p` e `Math.expm1` foram adicionados. [[Feature #21527]]

* Pathname

    * `Pathname` foi promovida de gem padrão para classe principal do Ruby.
      [[Feature #17473]]

* Proc

    * `Proc#parameters` agora mostra parâmetros opcionais anônimos como `[:opt]`
      em vez de `[:opt, nil]`, tornando a saída consistente com o caso em que
      o parâmetro anônimo é obrigatório. [[Bug #20974]]

* Ractor

    * A classe `Ractor::Port` foi adicionada como um novo mecanismo de
      sincronização para comunicação entre Ractors. [[Feature #21262]]

        ```ruby
        port1 = Ractor::Port.new
        port2 = Ractor::Port.new
        Ractor.new port1, port2 do |port1, port2|
          port1 << 1
          port2 << 11
          port1 << 2
          port2 << 12
        end
        2.times{ p port1.receive } #=> 1, 2
        2.times{ p port2.receive } #=> 11, 12
        ```

        `Ractor::Port` fornece os seguintes métodos:

        * `Ractor::Port#receive`
        * `Ractor::Port#send` (ou `Ractor::Port#<<`)
        * `Ractor::Port#close`
        * `Ractor::Port#closed?`

        Como resultado, `Ractor.yield` e `Ractor#take` foram removidos.

    * `Ractor#join` e `Ractor#value` foram adicionados para aguardar o término
      de um Ractor. São semelhantes a `Thread#join` e `Thread#value`.

    * `Ractor#monitor` e `Ractor#unmonitor` foram adicionados como interfaces
      de baixo nível usadas internamente para implementar `Ractor#join`.

    * `Ractor.select` agora aceita apenas Ractors e Ports. Se Ractors forem
      fornecidos, retorna quando um Ractor termina.

    * `Ractor#default_port` foi adicionado. Cada `Ractor` possui uma porta
      padrão, usada por `Ractor.send` e `Ractor.receive`.

    * `Ractor#close_incoming` e `Ractor#close_outgoing` foram removidos.

    * `Ractor.shareable_proc` e `Ractor.shareable_lambda` foram introduzidos
      para criar `Proc` ou lambda compartilháveis.
      [[Feature #21550]], [[Feature #21557]]

* Range

    * `Range#to_set` agora realiza verificações de tamanho para evitar problemas
      com ranges infinitos. [[Bug #21654]]

    * `Range#overlap?` agora lida corretamente com ranges infinitos (sem limites).
      [[Bug #21185]]

    * O comportamento de `Range#max` em ranges inteiros sem início foi corrigido.
      [[Bug #21174]] [[Bug #21175]]

* Ruby

    * Um novo módulo de nível superior `Ruby` foi definido, contendo constantes
      relacionadas ao Ruby. Este módulo foi reservado no Ruby 3.4 e agora é
      oficialmente definido. [[Feature #20884]]

* Ruby::Box

    * Um novo recurso (experimental) para fornecer separação de definições.
      Para mais detalhes sobre o "Ruby Box", veja
      [doc/language/box.md](https://docs.ruby-lang.org/en/4.0/language/box_md.html).
      [[Feature #21311]] [[Misc #21385]]

* Set

    * `Set` agora é uma classe principal, em vez de uma classe da biblioteca
      padrão carregada sob demanda. [[Feature #21216]]

    * `Set#inspect` agora usa uma forma de exibição mais simples, semelhante a
      arrays literais (por exemplo, `Set[1, 2, 3]` em vez de
      `#<Set: {1, 2, 3}>`). [[Feature #21389]]

    * Passar argumentos para `Set#to_set` e `Enumerable#to_set` agora é
      desencorajado (deprecated). [[Feature #21390]]

* Socket

    * `Socket.tcp` e `TCPSocket.new` aceitam um argumento de palavra‑chave
      `open_timeout` para especificar o timeout da conexão inicial.
      [[Feature #21347]]

    * Quando um timeout especificado pelo usuário ocorria em `TCPSocket.new`,
      anteriormente podiam ser levantadas `Errno::ETIMEDOUT` ou `IO::TimeoutError`,
      dependendo da situação. Esse comportamento foi unificado para que agora
      `IO::TimeoutError` seja sempre levantado.
      (Observe que, em `Socket.tcp`, ainda podem existir casos em que
      `Errno::ETIMEDOUT` seja levantada em situações semelhantes, e que, em ambos
      os casos, `Errno::ETIMEDOUT` pode ser levantada quando o timeout ocorre no
      nível do sistema operacional.)

* String

    * Atualização do Unicode para a versão 17.0.0 e do Emoji para a versão 17.0.
      [[Feature #19908]][[Feature #20724]][[Feature #21275]] (também se aplica a `Regexp`)

    * `String#strip`, `strip!`, `lstrip`, `lstrip!`, `rstrip` e `rstrip!`
       foram estendidos para aceitar argumentos `*selectors`.
       [[Feature #21552]]

* Thread

    * Suporte ao argumento `Thread#raise(cause:)` foi introduzido, semelhante a
      `Kernel#raise`. [[Feature #21360]]

## Atualizações da Biblioteca Padrão

Listamos aqui apenas mudanças na biblioteca padrão que são alterações de recurso notáveis.

Outras mudanças estão listadas nas seções seguintes. Também listamos o histórico de
lançamentos desde a versão anterior empacotada, Ruby 3.4.0, quando há releases no GitHub.

As seguintes gems empacotadas foram promovidas de gems padrão:

* ostruct 0.6.3
  * 0.6.1 até [v0.6.2][ostruct-v0.6.2], [v0.6.3][ostruct-v0.6.3]
* pstore 0.2.0
  * 0.1.4 até [v0.2.0][pstore-v0.2.0]
* benchmark 0.5.0
  * 0.4.0 até [v0.4.1][benchmark-v0.4.1], [v0.5.0][benchmark-v0.5.0]
* logger 1.7.0
  * 1.6.4 até [v1.6.5][logger-v1.6.5], [v1.6.6][logger-v1.6.6], [v1.7.0][logger-v1.7.0]
* rdoc 7.0.2
  * 6.14.0 até [v6.14.1][rdoc-v6.14.1], [v6.14.2][rdoc-v6.14.2], [v6.15.0][rdoc-v6.15.0],
    [v6.15.1][rdoc-v6.15.1], [v6.16.0][rdoc-v6.16.0], [v6.16.1][rdoc-v6.16.1],
    [v6.17.0][rdoc-v6.17.0], [v7.0.0][rdoc-v7.0.0], [v7.0.1][rdoc-v7.0.1],
    [v7.0.2][rdoc-v7.0.2], [v7.0.3][rdoc-v7.0.3]
* win32ole 1.9.2
  * 1.9.1 até [v1.9.2][win32ole-v1.9.2]
* irb 1.16.0
  * 1.14.3 até [v1.15.0][irb-v1.15.0], [v1.15.1][irb-v1.15.1], [v1.15.2][irb-v1.15.2],
    [v1.15.3][irb-v1.15.3], [v1.16.0][irb-v1.16.0]
* reline 0.6.3
  * 0.6.0 até [v0.6.1][reline-v0.6.1], [v0.6.2][reline-v0.6.2], [v0.6.3][reline-v0.6.3]
* readline 0.0.4
* fiddle 1.1.8
  * 1.1.6 até [v1.1.7][fiddle-v1.1.7], [v1.1.8][fiddle-v1.1.8]

As seguintes gems padrão foram adicionadas:

* win32-registry 0.1.2

As seguintes gems padrão foram atualizadas:

* RubyGems 4.0.3
* bundler 4.0.3
* date 3.5.1
  * 3.4.1 até [v3.5.0][date-v3.5.0], [v3.5.1][date-v3.5.1]
* delegate 0.6.1
  * 0.4.0 até [v0.5.0][delegate-v0.5.0], [v0.6.0][delegate-v0.6.0],
    [v0.6.1][delegate-v0.6.1]
* digest 3.2.1
  * 3.2.0 até [v3.2.1][digest-v3.2.1]
* english 0.8.1
  * 0.8.0 até [v0.8.1][english-v0.8.1]
* erb 6.0.1
  * 4.0.4 até [v5.1.2][erb-v5.1.2], [v5.1.3][erb-v5.1.3], [v6.0.0][erb-v6.0.0],
    [v6.0.1][erb-v6.0.1]
* error_highlight 0.7.1
* etc 1.4.6
* fcntl 1.3.0
  * 1.2.0 até [v1.3.0][fcntl-v1.3.0]
* fileutils 1.8.0
  * 1.7.3 até [v1.8.0][fileutils-v1.8.0]
* forwardable 1.4.0
  * 1.3.3 até [v1.4.0][forwardable-v1.4.0]
* io-console 0.8.2
  * 0.8.1 até [v0.8.2][io-console-v0.8.2]
* io-nonblock 0.3.2
* io-wait 0.4.0
  * 0.3.2 até [v0.3.3][io-wait-v0.3.3], [v0.3.5.test1][io-wait-v0.3.5.test1],
    [v0.3.5][io-wait-v0.3.5], [v0.3.6][io-wait-v0.3.6], [v0.4.0][io-wait-v0.4.0]
* ipaddr 1.2.8
* json 2.18.0
  * 2.9.1 até [v2.10.0][json-v2.10.0], [v2.10.1][json-v2.10.1],
    [v2.10.2][json-v2.10.2], [v2.11.0][json-v2.11.0], [v2.11.1][json-v2.11.1],
    [v2.11.2][json-v2.11.2], [v2.11.3][json-v2.11.3], [v2.12.0][json-v2.12.0],
    [v2.12.1][json-v2.12.1], [v2.12.2][json-v2.12.2], [v2.13.0][json-v2.13.0],
    [v2.13.1][json-v2.13.1], [v2.13.2][json-v2.13.2], [v2.14.0][json-v2.14.0],
    [v2.14.1][json-v2.14.1], [v2.15.0][json-v2.15.0], [v2.15.1][json-v2.15.1],
    [v2.15.2][json-v2.15.2], [v2.16.0][json-v2.16.0], [v2.17.0][json-v2.17.0],
    [v2.17.1][json-v2.17.1], [v2.18.0][json-v2.18.0]
* net-http 0.9.1
  * 0.6.0 até [v0.7.0][net-http-v0.7.0], [v0.8.0][net-http-v0.8.0],
    [v0.9.0][net-http-v0.9.0], [v0.9.1][net-http-v0.9.1]
* openssl 4.0.0
  * 3.3.1 até [v3.3.2][openssl-v3.3.2], [v4.0.0][openssl-v4.0.0]
* optparse 0.8.1
  * 0.6.0 até [v0.7.0][optparse-v0.7.0], [v0.8.0][optparse-v0.8.0],
    [v0.8.1][optparse-v0.8.1]
* pp 0.6.3
  * 0.6.2 até [v0.6.3][pp-v0.6.3]
* prism 1.7.0
  * 1.5.2 até [v1.6.0][prism-v1.6.0], [v1.7.0][prism-v1.7.0]
* psych 5.3.1
  * 5.2.2 até [v5.2.3][psych-v5.2.3], [v5.2.4][psych-v5.2.4],
    [v5.2.5][psych-v5.2.5], [v5.2.6][psych-v5.2.6], [v5.3.0][psych-v5.3.0],
    [v5.3.1][psych-v5.3.1]
* resolv 0.7.0
  * 0.6.2 até [v0.6.3][resolv-v0.6.3], [v0.7.0][resolv-v0.7.0]
* stringio 3.2.0
  * 3.1.2 até [v3.1.3][stringio-v3.1.3], [v3.1.4][stringio-v3.1.4],
    [v3.1.5][stringio-v3.1.5], [v3.1.6][stringio-v3.1.6], [v3.1.7][stringio-v3.1.7],
    [v3.1.8][stringio-v3.1.8], [v3.1.9][stringio-v3.1.9], [v3.2.0][stringio-v3.2.0]
* strscan 3.1.6
  * 3.1.2 até [v3.1.3][strscan-v3.1.3], [v3.1.4][strscan-v3.1.4],
    [v3.1.5][strscan-v3.1.5], [v3.1.6][strscan-v3.1.6]
* time 0.4.2
  * 0.4.1 até [v0.4.2][time-v0.4.2]
* timeout 0.6.0
  * 0.4.3 até [v0.4.4][timeout-v0.4.4], [v0.5.0][timeout-v0.5.0],
    [v0.6.0][timeout-v0.6.0]
* uri 1.1.1
  * 1.0.4 até [v1.1.0][uri-v1.1.0], [v1.1.1][uri-v1.1.1]
* weakref 0.1.4
  * 0.1.3 até [v0.1.4][weakref-v0.1.4]
* zlib 3.2.2
  * 3.2.1 até [v3.2.2][zlib-v3.2.2]

As seguintes gems empacotadas foram atualizadas:

* minitest 6.0.0
* power_assert 3.0.1
  * 2.0.5 até [v3.0.0][power_assert-v3.0.0], [v3.0.1][power_assert-v3.0.1]
* rake 13.3.1
  * 13.2.1 até [v13.3.0][rake-v13.3.0], [v13.3.1][rake-v13.3.1]
* test-unit 3.7.5
  * 3.6.7 até [3.6.8][test-unit-3.6.8], [3.6.9][test-unit-3.6.9],
    [3.7.0][test-unit-3.7.0], [3.7.1][test-unit-3.7.1], [3.7.2][test-unit-3.7.2],
    [3.7.3][test-unit-3.7.3], [3.7.4][test-unit-3.7.4], [3.7.5][test-unit-3.7.5]
* rexml 3.4.4
* rss 0.3.2
  * 0.3.1 até [0.3.2][rss-0.3.2]
* net-ftp 0.3.9
  * 0.3.8 até [v0.3.9][net-ftp-v0.3.9]
* net-imap 0.6.2
  * 0.5.8 até [v0.5.9][net-imap-v0.5.9], [v0.5.10][net-imap-v0.5.10],
    [v0.5.11][net-imap-v0.5.11], [v0.5.12][net-imap-v0.5.12],
    [v0.5.13][net-imap-v0.5.13], [v0.6.0][net-imap-v0.6.0],
    [v0.6.1][net-imap-v0.6.1], [v0.6.2][net-imap-v0.6.2]
* net-smtp 0.5.1
  * 0.5.0 até [v0.5.1][net-smtp-v0.5.1]
* matrix 0.4.3
  * 0.4.2 até [v0.4.3][matrix-v0.4.3]
* prime 0.1.4
  * 0.1.3 até [v0.1.4][prime-v0.1.4]
* rbs 3.10.0
  * 3.8.0 até [v3.8.1][rbs-v3.8.1], [v3.9.0.dev.1][rbs-v3.9.0.dev.1],
    [v3.9.0.pre.1][rbs-v3.9.0.pre.1], [v3.9.0.pre.2][rbs-v3.9.0.pre.2],
    [v3.9.0][rbs-v3.9.0], [v3.9.1][rbs-v3.9.1], [v3.9.2][rbs-v3.9.2],
    [v3.9.3][rbs-v3.9.3], [v3.9.4][rbs-v3.9.4], [v3.9.5][rbs-v3.9.5],
    [v3.10.0.pre.1][rbs-v3.10.0.pre.1], [v3.10.0.pre.2][rbs-v3.10.0.pre.2],
    [v3.10.0][rbs-v3.10.0]
* typeprof 0.31.1
* debug 1.11.1
  * 1.11.0 até [v1.11.1][debug-v1.11.1]
* base64 0.3.0
  * 0.2.0 até [v0.3.0][base64-v0.3.0]
* bigdecimal 4.0.1
  * 3.1.8 até [v3.2.0][bigdecimal-v3.2.0], [v3.2.1][bigdecimal-v3.2.1],
    [v3.2.2][bigdecimal-v3.2.2], [v3.2.3][bigdecimal-v3.2.3],
    [v3.3.0][bigdecimal-v3.3.0], [v3.3.1][bigdecimal-v3.3.1],
    [v4.0.0][bigdecimal-v4.0.0], [v4.0.1][bigdecimal-v4.0.1]
* drb 2.2.3
  * 2.2.1 até [v2.2.3][drb-v2.2.3]
* syslog 0.3.0
  * 0.2.0 até [v0.3.0][syslog-v0.3.0]
* csv 3.3.5
  * 3.3.2 até [v3.3.3][csv-v3.3.3], [v3.3.4][csv-v3.3.4],
    [v3.3.5][csv-v3.3.5]
* repl_type_completor 0.1.12

### RubyGems e Bundler

Ruby 4.0 empacota RubyGems e Bundler versão 4. Veja os links a seguir para mais detalhes.

* [Upgrading to RubyGems/Bundler 4 - RubyGems Blog](https://blog.rubygems.org/2025/12/03/upgrade-to-rubygems-bundler-4.html)
* [4.0.0 Released - RubyGems Blog](https://blog.rubygems.org/2025/12/03/4.0.0-released.html)
* [4.0.1 Released - RubyGems Blog](https://blog.rubygems.org/2025/12/09/4.0.1-released.html)
* [4.0.2 Released - RubyGems Blog](https://blog.rubygems.org/2025/12/17/4.0.2-released.html)
* [4.0.3 Released - RubyGems Blog](https://blog.rubygems.org/2025/12/23/4.0.3-released.html)

## Plataformas suportadas

* Windows

    * Suporte a versões do MSVC anteriores a 14.0 (_MSC_VER 1900) foi removido.
      Isso significa que o Visual Studio 2015 ou mais recente agora é obrigatório.

## Problemas de compatibilidade

* Os seguintes métodos foram removidos de `Ractor` devido à adição de `Ractor::Port`:

    * `Ractor.yield`
    * `Ractor#take`
    * `Ractor#close_incoming`
    * `Ractor#close_outgoing`

    [[Feature #21262]]

* `ObjectSpace._id2ref` está obsoleto. [[Feature #15408]]

* `Process::Status#&` e `Process::Status#>>` foram removidos.
  Eles foram marcados como obsoletos no Ruby 3.3. [[Bug #19868]]

* `rb_path_check` foi removida. Essa função era usada para verificação de caminhos
  com `$SAFE`, que foi removida no Ruby 2.7, e já estava obsoleta.
  [[Feature #20971]]

* Um backtrace para `ArgumentError` de "wrong number of arguments" agora inclui
  o nome da classe ou módulo do receiver (por exemplo, em `Foo#bar` em vez de
  apenas `bar`). [[Bug #21698]]

* Backtraces não exibem mais frames `internal`.
  Esses métodos agora aparecem como se estivessem no arquivo de código Ruby,
  consistente com outros métodos implementados em C. [[Bug #20968]]

  Antes:
  ```
  ruby -e '[1].fetch_values(42)'
  <internal:array>:211:in 'Array#fetch': index 42 outside of array bounds: -1...1 (IndexError)
          from <internal:array>:211:in 'block in Array#fetch_values'
          from <internal:array>:211:in 'Array#map!'
          from <internal:array>:211:in 'Array#fetch_values'
          from -e:1:in '<main>'
  ```

  Depois:
  ```
  $ ruby -e '[1].fetch_values(42)'
  -e:1:in 'Array#fetch_values': index 42 outside of array bounds: -1...1 (IndexError)
          from -e:1:in '<main>'
  ```

## Problemas de compatibilidade da biblioteca padrão

* A biblioteca `CGI` foi removida das gems padrão. Agora fornecemos apenas `cgi/escape`
  para os seguintes métodos:

    * `CGI.escape` e `CGI.unescape`
    * `CGI.escapeHTML` e `CGI.unescapeHTML`
    * `CGI.escapeURIComponent` e `CGI.unescapeURIComponent`
    * `CGI.escapeElement` e `CGI.unescapeElement`

    [[Feature #21258]]

* Com a mudança de `Set` da biblioteca padrão para classe principal,
  `set/sorted_set.rb` foi removido e `SortedSet` não é mais uma constante carregada
  sob demanda. Por favor, instale a gem `sorted_set` e faça
  `require 'sorted_set'` para usar `SortedSet`. [[Feature #21287]]

* Net::HTTP

    * O comportamento padrão de configurar automaticamente o cabeçalho
      `Content-Type` como `application/x-www-form-urlencoded` para requisições
      com corpo (por exemplo, `POST`, `PUT`) quando o cabeçalho não era definido
      explicitamente foi removido. Se sua aplicação dependia desse padrão
      automático, agora as requisições serão enviadas sem um cabeçalho
      `Content-Type`, o que pode quebrar compatibilidade com alguns servidores.
      [[GH-net-http #205]]

## Atualizações da C API

* IO

    * `rb_thread_fd_close` está obsoleta e agora é um no‑op. Se você precisar
      expor descritores de arquivo de extensões C para código Ruby, crie uma
      instância de `IO` usando `RUBY_IO_MODE_EXTERNAL` e use `rb_io_close(io)` para
      fechá‑la (isso também interrompe e aguarda todas as operações pendentes na
      instância de `IO`). Fechar descritores de arquivo diretamente não interrompe
      operações pendentes e pode levar a comportamento indefinido. Em outras
      palavras, se dois objetos `IO` compartilham o mesmo descritor de arquivo,
      fechar um não afeta o outro. [[Feature #18455]]

* GVL

    * `rb_thread_call_with_gvl` agora funciona com ou sem o GVL.
      Isso permite que gems evitem verificar `ruby_thread_has_gvl_p`.
      Ainda assim, é importante ser cuidadoso com o GVL. [[Feature #20750]]

* Set

    * Uma API em C para `Set` foi adicionada. Os seguintes métodos são suportados:
      [[Feature #21459]]

        * `rb_set_foreach`
        * `rb_set_new`
        * `rb_set_new_capa`
        * `rb_set_lookup`
        * `rb_set_add`
        * `rb_set_clear`
        * `rb_set_delete`
        * `rb_set_size`

## Melhorias na implementação

* `Class#new` (por exemplo, `Object.new`) está mais rápido em todos os casos, mas
  especialmente ao passar argumentos de palavra‑chave. Isso também foi integrado
  ao YJIT e ao ZJIT. [[Feature #21254]]
* Heaps do GC de pools de tamanhos diferentes agora crescem de forma independente,
  reduzindo o uso de memória quando apenas alguns pools contêm objetos de vida longa.
* A varredura (sweeping) do GC está mais rápida em páginas de objetos grandes.
* Objetos de "generic ivar" (String, Array, `TypedData`, etc.) agora usam um novo
  objeto interno de "fields" para acesso mais rápido a variáveis de instância.
* O GC evita manter uma tabela interna `id2ref` até que seja usada pela primeira vez,
  tornando a alocação de `object_id` e a varredura do GC mais rápidas.
* `object_id` e `hash` estão mais rápidos em objetos `Class` e `Module`.
* Inteiros bignum maiores agora podem permanecer embutidos usando alocação de
  largura variável.
* `Random`, `Enumerator::Product`, `Enumerator::Chain`, `Addrinfo`,
  `StringScanner` e alguns objetos internos agora são protegidos por write‑barrier,
  o que reduz a sobrecarga do GC.

### Ractor

Muito trabalho foi feito para tornar Ractors mais estáveis, performáticos e utilizáveis.
Essas melhorias aproximam a implementação de Ractor de deixar o status experimental.

* Melhorias de desempenho
    * Strings congeladas e a tabela de símbolos usam internamente um hash set
      lock‑free. [[Feature #21268]]
    * A busca no cache de métodos evita bloqueios na maioria dos casos.
    * O acesso a variáveis de instância de classes (e generic ivar) está mais
      rápido e evita bloqueios.
    * A contenção de cache de CPU é evitada na alocação de objetos usando um
      contador por Ractor.
    * A contenção de cache de CPU é evitada em `xmalloc`/`xfree` usando um
      contador local à thread.
    * `object_id` evita bloqueios na maioria dos casos.
* Correções de bugs e estabilidade
    * Correções de deadlocks potenciais ao combinar Ractors e Threads.
    * Correções em problemas com `require` e `autoload` em Ractor.
    * Correções em problemas de codificação/transcodificação entre Ractors.
    * Correções em condições de corrida em operações do GC e invalidação de métodos.
    * Correções em problemas com processos que fazem fork após iniciar um Ractor.
    * Contagens de alocação do GC agora são precisas sob Ractors.
    * Correção de TracePoints que não funcionavam após o GC. [[Bug #19112]]

## JIT

* ZJIT
    * Introduz um [compilador JIT baseado em métodos](https://docs.ruby-lang.org/en/master/jit/zjit_md.html)
      experimental. Onde disponível, o ZJIT pode ser habilitado em tempo de execução
      com a opção `--zjit` ou chamando `RubyVM::ZJIT.enable`.
      Ao compilar o Ruby, é necessário Rust 1.85.0 ou mais recente para incluir
      suporte ao ZJIT.
    * A partir do Ruby 4.0.0, o ZJIT é mais rápido que o interpretador, mas ainda
      não é tão rápido quanto o YJIT. Incentivamos a experimentação com o ZJIT,
      mas recomendamos não usá‑lo em produção por enquanto.
    * Nosso objetivo é tornar o ZJIT mais rápido que o YJIT e pronto para produção
      no Ruby 4.1.
* YJIT
    * `RubyVM::YJIT.runtime_stats`
        * `ratio_in_yjit` não funciona mais na build padrão.
          Use `--enable-yjit=stats` em `configure` para habilitá‑lo com
          `--yjit-stats`.
        * Adiciona `invalidate_everything` às estatísticas padrão, que é
          incrementada quando todo o código é invalidado por TracePoint.
    * Adiciona opções `mem_size:` e `call_threshold:` a `RubyVM::YJIT.enable`.
* RJIT
    * `--rjit` foi removido. A implementação da API de JIT de terceiros será
      movida para o repositório
      [ruby/rjit](https://github.com/ruby/rjit).

Veja [NEWS](https://docs.ruby-lang.org/en/{{ release.tag }}/NEWS_md.html)
ou [logs de commits](https://github.com/ruby/ruby/compare/v3_4_0...{{ release.tag }})
para mais detalhes.

Com essas mudanças,
[{{ release.stats.files_changed }} arquivos alterados, {{ release.stats.insertions }} inserções(+), {{ release.stats.deletions }} deleções(-)](https://github.com/ruby/ruby/compare/v3_4_0...{{ release.tag }}#file_bucket)
desde Ruby 3.4.0!

Feliz Natal, um Próspero Ano Novo e aproveite a programação com Ruby 4.0!

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

[Feature #15408]: https://bugs.ruby-lang.org/issues/15408
[Feature #17473]: https://bugs.ruby-lang.org/issues/17473
[Feature #18455]: https://bugs.ruby-lang.org/issues/18455
[Bug #19112]:     https://bugs.ruby-lang.org/issues/19112
[Feature #19630]: https://bugs.ruby-lang.org/issues/19630
[Bug #19868]:     https://bugs.ruby-lang.org/issues/19868
[Feature #19908]: https://bugs.ruby-lang.org/issues/19908
[Feature #20610]: https://bugs.ruby-lang.org/issues/20610
[Feature #20724]: https://bugs.ruby-lang.org/issues/20724
[Feature #20750]: https://bugs.ruby-lang.org/issues/20750
[Feature #20884]: https://bugs.ruby-lang.org/issues/20884
[Feature #20925]: https://bugs.ruby-lang.org/issues/20925
[Bug #20968]:     https://bugs.ruby-lang.org/issues/20968
[Feature #20971]: https://bugs.ruby-lang.org/issues/20971
[Bug #20974]:     https://bugs.ruby-lang.org/issues/20974
[Feature #21047]: https://bugs.ruby-lang.org/issues/21047
[Bug #21049]:     https://bugs.ruby-lang.org/issues/21049
[Feature #21166]: https://bugs.ruby-lang.org/issues/21166
[Bug #21174]:     https://bugs.ruby-lang.org/issues/21174
[Bug #21175]:     https://bugs.ruby-lang.org/issues/21175
[Bug #21185]:     https://bugs.ruby-lang.org/issues/21185
[Feature #21205]: https://bugs.ruby-lang.org/issues/21205
[Feature #21216]: https://bugs.ruby-lang.org/issues/21216
[Feature #21219]: https://bugs.ruby-lang.org/issues/21219
[Feature #21254]: https://bugs.ruby-lang.org/issues/21254
[Feature #21258]: https://bugs.ruby-lang.org/issues/21258
[Feature #21268]: https://bugs.ruby-lang.org/issues/21268
[Feature #21262]: https://bugs.ruby-lang.org/issues/21262
[Feature #21275]: https://bugs.ruby-lang.org/issues/21275
[Feature #21287]: https://bugs.ruby-lang.org/issues/21287
[Feature #21311]: https://bugs.ruby-lang.org/issues/21311
[Feature #21347]: https://bugs.ruby-lang.org/issues/21347
[Feature #21360]: https://bugs.ruby-lang.org/issues/21360
[Misc #21385]:    https://bugs.ruby-lang.org/issues/21385
[Feature #21389]: https://bugs.ruby-lang.org/issues/21389
[Feature #21390]: https://bugs.ruby-lang.org/issues/21390
[Feature #21459]: https://bugs.ruby-lang.org/issues/21459
[Feature #21527]: https://bugs.ruby-lang.org/issues/21527
[Feature #21543]: https://bugs.ruby-lang.org/issues/21543
[Feature #21550]: https://bugs.ruby-lang.org/issues/21550
[Feature #21552]: https://bugs.ruby-lang.org/issues/21552
[Feature #21557]: https://bugs.ruby-lang.org/issues/21557
[Bug #21633]:     https://bugs.ruby-lang.org/issues/21633
[Bug #21654]:     https://bugs.ruby-lang.org/issues/21654
[Feature #21678]: https://bugs.ruby-lang.org/issues/21678
[Bug #21698]:     https://bugs.ruby-lang.org/issues/21698
[Feature #21701]: https://bugs.ruby-lang.org/issues/21701
[Bug #21789]:     https://bugs.ruby-lang.org/issues/21789
[GH-net-http #205]: https://github.com/ruby/net-http/issues/205
[ostruct-v0.6.2]: https://github.com/ruby/ostruct/releases/tag/v0.6.2
[ostruct-v0.6.3]: https://github.com/ruby/ostruct/releases/tag/v0.6.3
[pstore-v0.2.0]: https://github.com/ruby/pstore/releases/tag/v0.2.0
[benchmark-v0.4.1]: https://github.com/ruby/benchmark/releases/tag/v0.4.1
[benchmark-v0.5.0]: https://github.com/ruby/benchmark/releases/tag/v0.5.0
[logger-v1.6.5]: https://github.com/ruby/logger/releases/tag/v1.6.5
[logger-v1.6.6]: https://github.com/ruby/logger/releases/tag/v1.6.6
[logger-v1.7.0]: https://github.com/ruby/logger/releases/tag/v1.7.0
[rdoc-v6.14.1]: https://github.com/ruby/rdoc/releases/tag/v6.14.1
[rdoc-v6.14.2]: https://github.com/ruby/rdoc/releases/tag/v6.14.2
[rdoc-v6.15.0]: https://github.com/ruby/rdoc/releases/tag/v6.15.0
[rdoc-v6.15.1]: https://github.com/ruby/rdoc/releases/tag/v6.15.1
[rdoc-v6.16.0]: https://github.com/ruby/rdoc/releases/tag/v6.16.0
[rdoc-v6.16.1]: https://github.com/ruby/rdoc/releases/tag/v6.16.1
[rdoc-v6.17.0]: https://github.com/ruby/rdoc/releases/tag/v6.17.0
[rdoc-v7.0.0]: https://github.com/ruby/rdoc/releases/tag/v7.0.0
[rdoc-v7.0.1]: https://github.com/ruby/rdoc/releases/tag/v7.0.1
[rdoc-v7.0.2]: https://github.com/ruby/rdoc/releases/tag/v7.0.2
[rdoc-v7.0.3]: https://github.com/ruby/rdoc/releases/tag/v7.0.3
[win32ole-v1.9.2]: https://github.com/ruby/win32ole/releases/tag/v1.9.2
[irb-v1.15.0]: https://github.com/ruby/irb/releases/tag/v1.15.0
[irb-v1.15.1]: https://github.com/ruby/irb/releases/tag/v1.15.1
[irb-v1.15.2]: https://github.com/ruby/irb/releases/tag/v1.15.2
[irb-v1.15.3]: https://github.com/ruby/irb/releases/tag/v1.15.3
[irb-v1.16.0]: https://github.com/ruby/irb/releases/tag/v1.16.0
[reline-v0.6.1]: https://github.com/ruby/reline/releases/tag/v0.6.1
[reline-v0.6.2]: https://github.com/ruby/reline/releases/tag/v0.6.2
[reline-v0.6.3]: https://github.com/ruby/reline/releases/tag/v0.6.3
[fiddle-v1.1.7]: https://github.com/ruby/fiddle/releases/tag/v1.1.7
[fiddle-v1.1.8]: https://github.com/ruby/fiddle/releases/tag/v1.1.8
[date-v3.5.0]: https://github.com/ruby/date/releases/tag/v3.5.0
[date-v3.5.1]: https://github.com/ruby/date/releases/tag/v3.5.1
[delegate-v0.5.0]: https://github.com/ruby/delegate/releases/tag/v0.5.0
[delegate-v0.6.0]: https://github.com/ruby/delegate/releases/tag/v0.6.0
[delegate-v0.6.1]: https://github.com/ruby/delegate/releases/tag/v0.6.1
[digest-v3.2.1]: https://github.com/ruby/digest/releases/tag/v3.2.1
[english-v0.8.1]: https://github.com/ruby/english/releases/tag/v0.8.1
[erb-v5.1.2]: https://github.com/ruby/erb/releases/tag/v5.1.2
[erb-v5.1.3]: https://github.com/ruby/erb/releases/tag/v5.1.3
[erb-v6.0.0]: https://github.com/ruby/erb/releases/tag/v6.0.0
[erb-v6.0.1]: https://github.com/ruby/erb/releases/tag/v6.0.1
[fcntl-v1.3.0]: https://github.com/ruby/fcntl/releases/tag/v1.3.0
[fileutils-v1.8.0]: https://github.com/ruby/fileutils/releases/tag/v1.8.0
[forwardable-v1.4.0]: https://github.com/ruby/forwardable/releases/tag/v1.4.0
[io-console-v0.8.2]: https://github.com/ruby/io-console/releases/tag/v0.8.2
[io-wait-v0.3.3]: https://github.com/ruby/io-wait/releases/tag/v0.3.3
[io-wait-v0.3.5.test1]: https://github.com/ruby/io-wait/releases/tag/v0.3.5.test1
[io-wait-v0.3.5]: https://github.com/ruby/io-wait/releases/tag/v0.3.5
[io-wait-v0.3.6]: https://github.com/ruby/io-wait/releases/tag/v0.3.6
[io-wait-v0.4.0]: https://github.com/ruby/io-wait/releases/tag/v0.4.0
[json-v2.10.0]: https://github.com/ruby/json/releases/tag/v2.10.0
[json-v2.10.1]: https://github.com/ruby/json/releases/tag/v2.10.1
[json-v2.10.2]: https://github.com/ruby/json/releases/tag/v2.10.2
[json-v2.11.0]: https://github.com/ruby/json/releases/tag/v2.11.0
[json-v2.11.1]: https://github.com/ruby/json/releases/tag/v2.11.1
[json-v2.11.2]: https://github.com/ruby/json/releases/tag/v2.11.2
[json-v2.11.3]: https://github.com/ruby/json/releases/tag/v2.11.3
[json-v2.12.0]: https://github.com/ruby/json/releases/tag/v2.12.0
[json-v2.12.1]: https://github.com/ruby/json/releases/tag/v2.12.1
[json-v2.12.2]: https://github.com/ruby/json/releases/tag/v2.12.2
[json-v2.13.0]: https://github.com/ruby/json/releases/tag/v2.13.0
[json-v2.13.1]: https://github.com/ruby/json/releases/tag/v2.13.1
[json-v2.13.2]: https://github.com/ruby/json/releases/tag/v2.13.2
[json-v2.14.0]: https://github.com/ruby/json/releases/tag/v2.14.0
[json-v2.14.1]: https://github.com/ruby/json/releases/tag/v2.14.1
[json-v2.15.0]: https://github.com/ruby/json/releases/tag/v2.15.0
[json-v2.15.1]: https://github.com/ruby/json/releases/tag/v2.15.1
[json-v2.15.2]: https://github.com/ruby/json/releases/tag/v2.15.2
[json-v2.16.0]: https://github.com/ruby/json/releases/tag/v2.16.0
[json-v2.17.0]: https://github.com/ruby/json/releases/tag/v2.17.0
[json-v2.17.1]: https://github.com/ruby/json/releases/tag/v2.17.1
[json-v2.18.0]: https://github.com/ruby/json/releases/tag/v2.18.0
[net-http-v0.7.0]: https://github.com/ruby/net-http/releases/tag/v0.7.0
[net-http-v0.8.0]: https://github.com/ruby/net-http/releases/tag/v0.8.0
[net-http-v0.9.0]: https://github.com/ruby/net-http/releases/tag/v0.9.0
[net-http-v0.9.1]: https://github.com/ruby/net-http/releases/tag/v0.9.1
[openssl-v3.3.2]: https://github.com/ruby/openssl/releases/tag/v3.3.2
[openssl-v4.0.0]: https://github.com/ruby/openssl/releases/tag/v4.0.0
[optparse-v0.7.0]: https://github.com/ruby/optparse/releases/tag/v0.7.0
[optparse-v0.8.0]: https://github.com/ruby/optparse/releases/tag/v0.8.0
[optparse-v0.8.1]: https://github.com/ruby/optparse/releases/tag/v0.8.1
[pp-v0.6.3]: https://github.com/ruby/pp/releases/tag/v0.6.3
[prism-v1.6.0]: https://github.com/ruby/prism/releases/tag/v1.6.0
[prism-v1.7.0]: https://github.com/ruby/prism/releases/tag/v1.7.0
[psych-v5.2.3]: https://github.com/ruby/psych/releases/tag/v5.2.3
[psych-v5.2.4]: https://github.com/ruby/psych/releases/tag/v5.2.4
[psych-v5.2.5]: https://github.com/ruby/psych/releases/tag/v5.2.5
[psych-v5.2.6]: https://github.com/ruby/psych/releases/tag/v5.2.6
[psych-v5.3.0]: https://github.com/ruby/psych/releases/tag/v5.3.0
[psych-v5.3.1]: https://github.com/ruby/psych/releases/tag/v5.3.1
[resolv-v0.6.3]: https://github.com/ruby/resolv/releases/tag/v0.6.3
[resolv-v0.7.0]: https://github.com/ruby/resolv/releases/tag/v0.7.0
[stringio-v3.1.3]: https://github.com/ruby/stringio/releases/tag/v3.1.3
[stringio-v3.1.4]: https://github.com/ruby/stringio/releases/tag/v3.1.4
[stringio-v3.1.5]: https://github.com/ruby/stringio/releases/tag/v3.1.5
[stringio-v3.1.6]: https://github.com/ruby/stringio/releases/tag/v3.1.6
[stringio-v3.1.7]: https://github.com/ruby/stringio/releases/tag/v3.1.7
[stringio-v3.1.8]: https://github.com/ruby/stringio/releases/tag/v3.1.8
[stringio-v3.1.9]: https://github.com/ruby/stringio/releases/tag/v3.1.9
[stringio-v3.2.0]: https://github.com/ruby/stringio/releases/tag/v3.2.0
[strscan-v3.1.3]: https://github.com/ruby/strscan/releases/tag/v3.1.3
[strscan-v3.1.4]: https://github.com/ruby/strscan/releases/tag/v3.1.4
[strscan-v3.1.5]: https://github.com/ruby/strscan/releases/tag/v3.1.5
[strscan-v3.1.6]: https://github.com/ruby/strscan/releases/tag/v3.1.6
[time-v0.4.2]: https://github.com/ruby/time/releases/tag/v0.4.2
[timeout-v0.4.4]: https://github.com/ruby/timeout/releases/tag/v0.4.4
[timeout-v0.5.0]: https://github.com/ruby/timeout/releases/tag/v0.5.0
[timeout-v0.6.0]: https://github.com/ruby/timeout/releases/tag/v0.6.0
[uri-v1.1.0]: https://github.com/ruby/uri/releases/tag/v1.1.0
[uri-v1.1.1]: https://github.com/ruby/uri/releases/tag/v1.1.1
[weakref-v0.1.4]: https://github.com/ruby/weakref/releases/tag/v0.1.4
[zlib-v3.2.2]: https://github.com/ruby/zlib/releases/tag/v3.2.2
[power_assert-v3.0.0]: https://github.com/ruby/power_assert/releases/tag/v3.0.0
[power_assert-v3.0.1]: https://github.com/ruby/power_assert/releases/tag/v3.0.1
[rake-v13.3.0]: https://github.com/ruby/rake/releases/tag/v13.3.0
[rake-v13.3.1]: https://github.com/ruby/rake/releases/tag/v13.3.1
[test-unit-3.6.8]: https://github.com/test-unit/test-unit/releases/tag/3.6.8
[test-unit-3.6.9]: https://github.com/test-unit/test-unit/releases/tag/3.6.9
[test-unit-3.7.0]: https://github.com/test-unit/test-unit/releases/tag/3.7.0
[test-unit-3.7.1]: https://github.com/test-unit/test-unit/releases/tag/3.7.1
[test-unit-3.7.2]: https://github.com/test-unit/test-unit/releases/tag/3.7.2
[test-unit-3.7.3]: https://github.com/test-unit/test-unit/releases/tag/3.7.3
[test-unit-3.7.4]: https://github.com/test-unit/test-unit/releases/tag/3.7.4
[test-unit-3.7.5]: https://github.com/test-unit/test-unit/releases/tag/3.7.5
[rss-0.3.2]: https://github.com/ruby/rss/releases/tag/0.3.2
[net-ftp-v0.3.9]: https://github.com/ruby/net-ftp/releases/tag/v0.3.9
[net-imap-v0.5.9]: https://github.com/ruby/net-imap/releases/tag/v0.5.9
[net-imap-v0.5.10]: https://github.com/ruby/net-imap/releases/tag/v0.5.10
[net-imap-v0.5.11]: https://github.com/ruby/net-imap/releases/tag/v0.5.11
[net-imap-v0.5.12]: https://github.com/ruby/net-imap/releases/tag/v0.5.12
[net-imap-v0.5.13]: https://github.com/ruby/net-imap/releases/tag/v0.5.13
[net-imap-v0.6.0]: https://github.com/ruby/net-imap/releases/tag/v0.6.0
[net-imap-v0.6.1]: https://github.com/ruby/net-imap/releases/tag/v0.6.1
[net-imap-v0.6.2]: https://github.com/ruby/net-imap/releases/tag/v0.6.2
[net-smtp-v0.5.1]: https://github.com/ruby/net-smtp/releases/tag/v0.5.1
[matrix-v0.4.3]: https://github.com/ruby/matrix/releases/tag/v0.4.3
[prime-v0.1.4]: https://github.com/ruby/prime/releases/tag/v0.1.4
[rbs-v3.8.1]: https://github.com/ruby/rbs/releases/tag/v3.8.1
[rbs-v3.9.0.dev.1]: https://github.com/ruby/rbs/releases/tag/v3.9.0.dev.1
[rbs-v3.9.0.pre.1]: https://github.com/ruby/rbs/releases/tag/v3.9.0.pre.1
[rbs-v3.9.0.pre.2]: https://github.com/ruby/rbs/releases/tag/v3.9.0.pre.2
[rbs-v3.9.0]: https://github.com/ruby/rbs/releases/tag/v3.9.0
[rbs-v3.9.1]: https://github.com/ruby/rbs/releases/tag/v3.9.1
[rbs-v3.9.2]: https://github.com/ruby/rbs/releases/tag/v3.9.2
[rbs-v3.9.3]: https://github.com/ruby/rbs/releases/tag/v3.9.3
[rbs-v3.9.4]: https://github.com/ruby/rbs/releases/tag/v3.9.4
[rbs-v3.9.5]: https://github.com/ruby/rbs/releases/tag/v3.9.5
[rbs-v3.10.0.pre.1]: https://github.com/ruby/rbs/releases/tag/v3.10.0.pre.1
[rbs-v3.10.0.pre.2]: https://github.com/ruby/rbs/releases/tag/v3.10.0.pre.2
[rbs-v3.10.0]: https://github.com/ruby/rbs/releases/tag/v3.10.0
[debug-v1.11.1]: https://github.com/ruby/debug/releases/tag/v1.11.1
[base64-v0.3.0]: https://github.com/ruby/base64/releases/tag/v0.3.0
[bigdecimal-v3.2.0]: https://github.com/ruby/bigdecimal/releases/tag/v3.2.0
[bigdecimal-v3.2.1]: https://github.com/ruby/bigdecimal/releases/tag/v3.2.1
[bigdecimal-v3.2.2]: https://github.com/ruby/bigdecimal/releases/tag/v3.2.2
[bigdecimal-v3.2.3]: https://github.com/ruby/bigdecimal/releases/tag/v3.2.3
[bigdecimal-v3.3.0]: https://github.com/ruby/bigdecimal/releases/tag/v3.3.0
[bigdecimal-v3.3.1]: https://github.com/ruby/bigdecimal/releases/tag/v3.3.1
[bigdecimal-v4.0.0]: https://github.com/ruby/bigdecimal/releases/tag/v4.0.0
[bigdecimal-v4.0.1]: https://github.com/ruby/bigdecimal/releases/tag/v4.0.1
[drb-v2.2.3]: https://github.com/ruby/drb/releases/tag/v2.2.3
[syslog-v0.3.0]: https://github.com/ruby/syslog/releases/tag/v0.3.0
[csv-v3.3.3]: https://github.com/ruby/csv/releases/tag/v3.3.3
[csv-v3.3.4]: https://github.com/ruby/csv/releases/tag/v3.3.4
[csv-v3.3.5]: https://github.com/ruby/csv/releases/tag/v3.3.5
