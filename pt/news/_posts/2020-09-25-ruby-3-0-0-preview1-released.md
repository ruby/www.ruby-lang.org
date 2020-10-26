---
layout: news_post
title: "Lançado Ruby 3.0.0 Preview 1"
author: "naruse"
translator: "jcserracampos"
date: 2020-09-25 00:00:00 +0000
lang: pt
---

Temos o prazer de anunciar o lançamento do Ruby 3.0.0-preview1.

Ele apresenta uma série de novos recursos e melhorias de desempenho.

## RBS

RBS é uma linguagem para descrever os tipos de programas Ruby.
Os verificadores de tipo, incluindo criador de perfil de tipos e outras ferramentas de suporte ao RBS, compreenderão os programas Ruby muito melhor com as definições do RBS.

Você pode escrever a definição de classes e módulos: métodos definidos na classe, variáveis de instância e seus tipos e relações de herança / mix-in.
O objetivo do RBS é oferecer suporte a padrões comumente vistos em programas Ruby e permite escrever tipos avançados, incluindo tipos de união, sobrecarga de método e genéricos. Ele também oferece suporte à _duck typing_ com _tipos de interface_.

Ruby 3.0 vem com gem `rbs`, que permite analisar e processar definições de tipo escritas em RBS.

A seguir está um pequeno exemplo de RBS.

``` rbs
module ChatApp
  VERSION: String

  class Channel
    attr_reader name: String
    attr_reader messages: Array[Message]
    attr_reader users: Array[User | Bot]              # `|` significa união de tipos, `User` ou `Bot`.

    def initialize: (String) -> void

    def post: (String, from: User | Bot) -> Message   # Sobrecarga de método é suportada.
            | (File, from: User | Bot) -> Message
  end
end
```

Veja [README da gem rbs](https://github.com/ruby/rbs) para mais detalhes.

## Ractor (experimental)

Ractor é uma abstração concorrente semelhante a um modelo de ator, projetada para fornecer um recurso de execução paralela sem preocupações com a segurança do thread.

Você pode fazer vários ractores e executá-los em paralelo. Ractor permite fazer programas paralelos thread-safe porque ractors não podem compartilhar objetos normais. A comunicação entre os ractores é apoiada pela troca de mensagens.

Para limitar o compartilhamento de objetos, o Ractor apresenta várias restrições à sintaxe do Ruby (sem vários Ractors, não há mudanças).

A especificação e implementação não estão amadurecidas e serão alteradas no futuro, portanto, esse recurso é marcado como experimental e mostra o aviso de recurso experimental se um Ractor for criado.

O pequeno programa a seguir calcula `prime?` em paralelo com dois ractores e cerca de x2 vezes mais rápido com dois ou mais núcleos do que o programa sequencial.

``` ruby
require 'prime'

# n.prime? com inteiros r1 e r2 enviados rodando em parelelo
r1, r2 = *(1..2).map do
  Ractor.new do
    n = Ractor.recv
    n.prime?
  end
end

# envio de parâmetros
r1.send 2**61 - 1
r2.send 2**61 + 15

# aguardando os resultados de expr1, expr2
p r1.take #=> true
p r2.take #=> true
```

Veja [doc/ractor.md](https://github.com/ruby/ruby/blob/master/doc/ractor.md) para mais detalhes.

## Scheduler (Experimental)

`Thread#scheduler` é introduzido para interceptar operações bloqueantes. Isso permite concorrência leve sem alterar o código existente.

Classes/métodos atualmente suportados:

- `Mutex#lock`, `Mutex#unlock`e `Mutex#sleep`
- `ConditionVariable#wait`
- `Queue#pop` e `SizedQueue#push`
- `Thread#join`
- `Kernel#sleep`
- `IO#wait`, `IO#read`, `IO#write` e métodos correlatos (ex.: `#wait_readable`, `#gets`, `#puts` etc.).
- `IO#select` *não é suportado*.

O ponto de entrada atual para concorrência é `Fiber.schedule {...}` no entanto, está sujeito a alterações no momento em que o Ruby 3 for lançado.

Atualmente, existe um agendador de teste disponível em [`Async::Scheduler`](https://github.com/socketry/async/pull/56). Veja [`doc/scheduler.md`](https://github.com/ruby/ruby/blob/master/doc/scheduler.md) para mais detalhes. [Feature #16786]

**cuidado**: Este recurso é fortemente experimental. O nome e o recurso serão alterados na próxima versão de prévia.

## Outros novos recursos notáveis

* A instrução de atribuição para a direita foi adicionada.

  ``` ruby
  fib(10) => x
  p x #=> 55
  ```

* A definição de método sem a keyword _end_ foi adicionada.

  ``` ruby
  def square(x) = x * x
  ```

* Find pattern foi adicionada.

  ``` ruby
  case ["a", 1, "b", "c", 2, "d", "e", "f", 3]
  in [*pre, String => x, String => y, *post]
    p pre  #=> ["a", 1]
    p x    #=> "b"
    p y    #=> "c"
    p post #=> [2, "d", "e", "f", 3]
  end
  ```

* `Hash#except` agora é nativo.

  ``` ruby
  h = { a: 1, b: 2, c: 3 }
  p h.except(:a) #=> {:b=>2, :c=>3}
  ```

* A visualização da memória é adicionada como um recurso experimental

    * Este é um novo conjunto C-API para trocar uma área de memória bruta, como uma matriz numérica e uma imagem de bitmap, entre bibliotecas de extensão. As bibliotecas de extensão também podem compartilhar os metadados da área de memória que consiste na forma, no formato do elemento e assim por diante. Usando esses tipos de metadados, as bibliotecas de extensão podem compartilhar até mesmo uma matriz multidimensional de forma adequada. Este recurso é projetado com referência ao protocolo de buffer do Python.

## Melhorias de desempenho

* Muitas melhorias foram implementadas no MJIT. Veja NEWS em detalhes.

## Outras mudanças notáveis desde 2.7

* Os argumentos de palavra-chave são separados de outros argumentos.
  * Em princípio, códigos que imprimem um aviso no Ruby 2.7 não funciona. Veja o [documento](https://www.ruby-lang.org/en/news/2019/12/12/separation-of-positional-and-keyword-arguments-in-ruby-3-0/) em detalhe.
  * A propósito, o encaminhamento de argumentos agora suporta argumentos principais.

    ``` ruby
    def method_missing(meth, ...)
      send(:"do_#{ meth }", ...)
    end
    ```

* O recurso de `$SAFE` foi completamente removido; agora é uma variável global normal.

* A ordem de backtrace foi revertida em Ruby 2.5, mas foi cancelada. Agora ele se comporta como Ruby 2.4; uma mensagem de erro e o número da linha onde ocorre a exceção são impressos primeiro e seus chamadores são impressos posteriormente.

* Algumas bibliotecas padrão são atualizadas.
  * RubyGems 3.2.0.rc.1
  * Bundler 2.2.0.rc.1
  * IRB 1.2.6
  * Reline 0.1.5

* As seguintes bibliotecas não são mais gem padrão.
  Instale as gems correspondentes para usar esses recursos.
  * net-telnet
  * xmlrpc

* Promove gems padrão para gems nativas.
  * rexml
  * rss

* Promova stdlib para gem padrão. As seguintes gems padrão foram publicadas em rubygems.org
  * abbrev
  * base64
  * English
  * erb
  * find
  * io-nonblock
  * io-wait
  * net-ftp
  * net-http
  * net-imap
  * net-protocol
  * nkf
  * open-uri
  * optparse
  * resolv
  * resolv-replace
  * rinda
  * securerandom
  * set
  * shellwords
  * tempfile
  * time
  * tmpdir
  * tsort
  * weakref

Veja [NEWS](https://github.com/ruby/ruby/blob/v3_0_0_preview1/NEWS.md)
ou [commit logs](https://github.com/ruby/ruby/compare/v2_7_0...v3_0_0_preview1)
para mais detalhes.

{% assign release = site.data.releases | where: "version", "3.0.0-preview1" | first %}

Com essas mudanças, [{{ release.stats.files_changed }} arquivos alterados, {{ release.stats.insertions }} inserções(+), {{ release.stats.deletions }} deleções(-)](https://github.com/ruby/ruby/compare/v2_7_0...v3_0_0_preview1)
desde Ruby 2.7.0!

Por favor, experimente Ruby 3.0.0-preview1 e nos dê qualquer feedback!

## Download

* <{{ release.url.bz2 }}>

      SIZE: {{ release.size.bz2 }}
      SHA1: {{ release.sha1.bz2 }}
      SHA256: {{ release.sha256.bz2 }}
      SHA512: {{ release.sha512.bz2 }}

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

## Trailer de 3.0.0-preview2

Planejamos incluir ["type-profiler"](https://github.com/mame/ruby-type-profiler) que é um recurso de análise de tipo estático. Fique ligado!

## O que é Ruby

Ruby foi desenvolvido pela primeira vez por Matz (Yukihiro Matsumoto) em 1993,
e agora é desenvolvido como Open Source. Ele roda em várias plataformas
e é usado em todo o mundo, especialmente para desenvolvimento web.
