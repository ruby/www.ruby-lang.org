---
layout: page
title: "Para Ruby a partir de Java"
lang: pt
---

Java é maduro. Está testado. E é rápido (contrariamente ao que todos os grupos anti-java possam dizer). Também é bastante palavroso. Ao passares de Java para Ruby, o programador poderá esperar que o tamanho do seu código diminua consideravelmente. Também poderá esperar demorar menos tempo a criar um prototipo aplicacional.

### Semelhanças

Tal como em Java, em Ruby…

* A memoria é gerida automaticamente através de um garbage collector.
* Os Objectos são fortemente tipados.
* Existem métodos públicos, privados e protegidos.
* Existem ferramentas de documentação embebidas (a de Ruby chama-se
  RDoc). A documentação gerada pelo RDoc tem um aspecto muito parecido
  aquela gerada pelo Javadoc.

### Diferenças

Ao contrário de Java, em Ruby…

* Não precisará de compilar código-fonte, pois este é executado
  directamente.
* Existem vários conjuntos de ferramentas de desenvolvimento com
  interface gráfica (GUI). Os utilizadores de Ruby podem experimentar
  [WxRuby][1], [FXRuby][2], [Ruby-GNOME2][3], [Qt][4],
  ou o biblioteca nativa Ruby Tk, por exemplo.
* Utiliza-se a palavra-chave `end` para terminar a definição de uma
  classe em vez de se colocar parentesis á volta de blocos de código.
* Utiliza-se o `require` em vez de `import`.
* Todas as variáveis de instância são privadas. Podem, no entanto, ser
  acedidas externamente através de métodos.
* Os parêntesis nas chamadas aos métodos são normalmente opcionais e
  muitas vezes omitidas.
* Tudo é um objecto, incluído numeros como 2 ou o 3.14159.
* Não existe validação estática de tipos de dados.
* Os nomes de variáveis são apenas etiquetas. Não têm qualquer tipo de
  dado associado a elas.
* Não existe declaração de tipo de dados, estes são associados a novos
  nomes de variáveis conforme se necessite (por exemplo `a = [1,2,3]` em
  vez de `int[] a = {1,2,3};`).
* Não existe transformação de tipos de dados (casting). Basta chamar os
  métodos. Os seus testes unitários deverão avisa-lo se existe uma
  excepção antes da execução do código.
* Escreve-se `foo = Foo.new("ola")` em vez de `Foo foo = new Foo("ola")`.
* O construtor é sempre chamado “initialize” em vez do nome da classe.
* Temos “mixins” em vez de interfaces.
* O uso de YAML é favorecido em relação ao XML.
* Utiliza-se `nil` em vez de `null`.



[1]: https://github.com/eumario/wxruby
[2]: https://github.com/larskanis/fxruby
[3]: https://ruby-gnome2.osdn.jp/
[4]: https://github.com/ryanmelt/qtbindings/
