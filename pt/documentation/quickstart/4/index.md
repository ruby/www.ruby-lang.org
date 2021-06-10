---
layout: page
title: "Ruby em Vinte Minutos"
lang: pt

header: |
  <div class="multi-page">
    <a href="../" title="Parte 1">1</a>
    <span class="separator"> | </span>
    <a href="../2/" title="Parte 2">2</a>
    <span class="separator"> | </span>
    <a href="../3/" title="Parte 3">3</a>
    <span class="separator"> | </span>
    <strong>4</strong>
  </div>
  <h1>Ruby em Vinte Minutos</h1>

---

Vejamos então mais a fundo o nosso novo programa, perceba
que as linhas iniciais começam com um sinal de cerquilha (#). Em Ruby,
qualquer coisa após um sinal de cerquilha é considerado um comentário e
é ignorado pelo interpretador. A primeira linha do arquivo é um caso especial,
em um sistema operacional do tipo Unix, isto diz para o shell como executar
o arquivo. O restante dos comentários só se encontra ali para clarificação.

O nosso método `diz_ola` tornou-se um pouco mais complexo:

{% highlight ruby %}
# Dizer ola a todos
def diz_ola
  if @nomes.nil?
    puts "..."
  elsif @nomes.respond_to?("each")
    # @nomes é uma lista de algum tipo, iterar!
    @nomes.each do |nome|
      puts "Ola #{nome}!"
    end
  else
    puts "Ola #{@nomes}!"
  end
end
{% endhighlight %}

Agora ele verifica a variável de instância `@nomes` para tomar decisões.
Se for nil, só imprime três pontos. Não há razão para cumprimentar ninguém,
certo?

## Ciclos e Loops – as Iterações

Se o objeto `@nomes` responde a `each`, isto significa que é algo sobre
o qual se pode iterar, assim, fazemos iterações sobre o mesmo e saudamos
cada pessoa à sua vez. Finalmente, se `@nomes` é outra coisa qualquer,
deixamos que se transforme numa string automaticamente e fazemos a
saudação padrão.

Vejamos o iterador com mais profundidade:

{% highlight ruby %}
@nomes.each do |nome|
  puts "Ola #{nome}!"
end
{% endhighlight %}

`each` é um método que aceita um bloco de código e que depois o executa
para cada elemento numa lista, e o trecho entre `do` e `end` é
exatamente um desses blocos. Um bloco é como uma função anônima ou
`lambda`. A variável entre barras verticais é o parâmetro para este
bloco.

O que acontece aqui é que para cada entrada na lista, `nome` recebe
esse elemento da lista e depois a expressão `puts "Ola #{nome}!"` é
executada com esse nome.

A maioria das outras linguagens varrem uma lista usando o loop `for`,
que em C se assemelha a algo como:

{% highlight c %}
for (i=0; i<numero_de_elementos; i++)
{
  fazer_algo_com(elemento[i]);
}
{% endhighlight %}

Isso funciona, mas não é muito elegante. Precisamos de uma variável
descartável semelhante a `i`, temos que determinar previamente qual o
tamanho da lista e temos que explicar como percorrer a lista. O modo de
operar em Ruby é muito mais elegante, os pormenores ficam
escondidos dentro do método `each`, tudo o que precisamos fazer é dizer-lhe
o que fazer com cada elemento. Internamente, o método `each` irá
essencialmente chamar `yield "Albert"`, depois `yield "Brenda"` e depois
`yield "Charles"`, e assim sucessivamente.

## Blocos, o Grande Brilho das Faces do Ruby

O verdadeiro poder dos blocos é quando tratam de algo mais complexo do que
listas. Além de tratar dos detalhes simples dos pormenores dentro do método,
também pode tratar da instalação, da limpeza e dos erros – tudo
de maneira escondida das preocupações do usuário.

{% highlight ruby %}
# Diz adeus a todo mundo
def dizer_adeus
  if @nomes.nil?
    puts "..."
  elsif @nomes.respond_to?("join")
    # Juntar os elementos da lista com vírgulas
    puts "Adeus #{@nomes.join(", ")}.  Voltem em breve!"
  else
    puts "Adeus #{@nomes}.  Volta em breve!"
  end
end
{% endhighlight %}

O método `diz_adeus` não usa o método `each`, em vez disso verifica se
`@nomes` responde ao método `join` e se sim, usa-o. Caso contrário
limita-se a imprimir a variável como string. Este método não se preocupa
com o tipo da variável, só confiar em quais métodos suporta é conhecido como
“Duck Typing”, no sentido de que “se anda como um pato, e faz quá quá como
um pato então…”. A vantagem disto é não restringir desnecessariamente
os tipos de variáveis suportados. Se alguém aparecer com um novo tipo
de classe de lista, desde que essa lista implemente o método `join`
com a mesma semântica que as outras listas, então tudo funcionará
conforme o planejado.

## Executando o Script

Então, essa é a classe MegaAnfitrião, o resto do arquivo só
chama os métodos nessa classe. Existe um último truque para
verificarmos, que é a linha:

{% highlight ruby %}
if __FILE__ == $0
{% endhighlight %}

`__FILE__` é uma variável mágica que contém o nome do arquivo atual.
`$0` é o nome do arquivo usado para iniciar o programa. Esta
verificação diz: “Se este é o arquivo principal a ser usado, então…”,
isto permite que um arquivo seja usado como biblioteca e nesse contexto
não executar código, mas caso o arquivo seja usado como executável então
executa esse código.

## Considere-se Apresentado ao Ruby

Pronto, essa foi uma visita rápida ao mundo do Ruby. Existe muito mais para
explorar, as diferentes estruturas de controlo que o Ruby oferece; o uso
de blocos e de `yield`; módulos como _mixins_; e muito mais. Espero que
esta pequena amostra da linguagem Ruby tenha deixado o desejo de
aprender mais.

Se este for o caso, por favor visite a nossa seção de
[Documentação](/pt/documentation/) , que reune links para manuais e tutoriais,
todos disponíveis livremente online.
