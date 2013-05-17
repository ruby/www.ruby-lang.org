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

Vejamos então o nosso novo programa de modo mais aprofundado, de notar
que as linhas iniciais começam com um sinal de cardinal(#). Em Ruby,
algo após um sinal de cardinal é considerado um comentário e ignorado
pelo interpretador. A primeira linha do ficheiro é um caso especial, sob
um sistema operativo do tipo Unix, isto indica á shell como executar o
ficheiro. Os restantes comentários só se encontram ali para
clarificação.

O nosso método `dizer_ola` tornou-se um pouco mais complexo:

{% highlight ruby %}
# Dizer ola a todos
def dizer_ola
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

Agora toma o parâmetro `@nomes` e toma decisões. Se for nil, só imprime
três pontinhos. Não há razão para cumprimentar ninguém, certo?

## Ciclos e Voltas—ou seja Iterações

Se o objecto `@nomes` responde a `each`, isto significa que é algo sobre
o qual se pode iterar, assim, fazemos iterações sobre o mesmo e saudamos
cada pessoa à sua vez. Finalmente, se `@nomes` é outra coisa qualquer,
deixamos que se transforme numa string automaticamente e fazemos a
saudação por omissão.

Vejamos o iterador com mais profundidade:

{% highlight ruby %}
@nomes.each do |nome|
  puts "Ola #{nome}!"
end
{% endhighlight %}

`each` é um método que aceita um bloco de código e que depois o executa
para cada elemento numa lista, e a parte entre `do` e `end` é
exactamente um bloco desses. Um bloco é como uma função anónima ou
`lambda`. A variável entre barras verticais é o parâmetro para este
bloco.

O que sucede aqui é que para cada entrada na lista se associa `nome` a
esse elemento da lista e depois a expressão `puts "Ola #{nome}!"` é
executada com esse nome.

A generalidade das outras linguagens tratar de passar por uma lista
usando o ciclo `for`, que em C se assemelha a algo como:

{% highlight c %}
for (i=0; i<numero_de_elementos; i++)
{
  fazer_algo_com(elemento[i]);
}
{% endhighlight %}

Isto funciona mas não é muito elegante. Necessitamos de uma variável
descartável semelhante a `i`, temos que determinar previamente qual o
tamanho da lista e temos que explicar como percorrer a lista. O modo de
operar em Ruby é muito mais elegante, os trabalhos domésticos são
escondidos dentro do método `each`, tudo o que necessitamos de lhe dizer
é o que fazer com cada elemento. Internamente, o método `each` irá
essencialmente chamar `yield "Albert"`, depois `yield "Brenda"` e depois
`yield "Charles"`, e assim sucessivamente.

## Blocos, Uma das funcionalidades mais poderosas da Ruby

O poder real dos blocos é quando tratam de algo mais complexo que
listas. Para além de tratar dos detalhes simples de trabalhos domésticos
dentro do método, também pode tratar da instalação, limpeza e erros—tudo
de forma escondida das preocupações do utilizador.

{% highlight ruby %}
# Dizer adeus a toda a gente
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

O método `dizer_adeus` não usa o método `each`, em vez disso verifica se
`@nomes` responde ao método `join` e se sim, usa-o. Caso contrário
limita-se a imprimir a variável como string. Este método não se preocupa
com o verdadeiro tipo da variável, está só a limitar-se a tirar partido
de algo conhecido por “Duck Typing”, no sentido de que “se anda como um
pato, e faz quá quá como um pato então…”. A vantagem disto é não
restringir desnecessariamente os tipos de variáveis suportados. Se
alguém aparecer com um novo género de classe de lista, desde que essa
lista tenha implementado método `join` com a mesma semântica que as
outras listas, então tudo irá funcionar como planeado.

## Executar o Script

Está pois apresentada a classe MegaAnfitrião, o resto do ficheiro só
chama os métodos nessa classe. Existe um último truque a tomar nota, é a
linha:

{% highlight ruby %}
if __FILE__ == $0
{% endhighlight %}

`__FILE__` é uma variável mágica que contém o nome do ficheiro actual.
`$0` é o nome do ficheiro usado para iniciar o programa. Esta
verificação diz: “Se este é o ficheiro principal a ser usado então…”,
isto permite que um ficheiro seja usado como biblioteca e nesse contexto
não executar código mas caso o ficheiro seja usado como executável então
executa esse código.

## Foi um prazer

Pronto, isto foi uma visita rápida ao mundo do Ruby. Existe muito para
explorar, as diferentes estruturas de controlo que Ruby oferece, o uso
de blocos e de `yield`, módulos como mixins e muito mais. Espero que
esta pequena amostra da linguagem Ruby tenha deixado o desejo de
aprender mais.

Se sim, por favor visite a nossa secção de
[Documentação](/pt/documentation/) , onde encontraram ligações para
manuais e guias, todos disponíveis em formato digital.

Ou, se desejar ler mesmo um livro, veja a nossa [biblioteca de
livros][1] (ligação ao exterior) para títulos disponíveis à venda online
ou numa livraria aí perto.



[1]: http://www.ruby-doc.org/bookstore
