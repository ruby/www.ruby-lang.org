---
layout: page
title: "Para Ruby a partir de C e C++"
lang: pt
---

É difícil escrever uma lista balizada demonstrando como o seu código
será diferente em Ruby por comparação a C e C++ pois a diferença é
tremenda. Uma das razões, é que o Ruby runtime faz muito do trabalho
pelo programador.

O Ruby parece estar tão longe quanto possível do principio de “sem
mecanismos escondidos” do C — o objectivo principal do Ruby é
tornar o trabalho humano mais fácil ás custas de entregar ao runtime um
maior volume de trabalho. A menos que, ou até que, se dedique a
optimizar o seu código, não terá de se preocupar minimamente em “manter
o seu compilador feliz” quando usa o Ruby.

Dito isto, e para começar, deverá esperar que o seu código Ruby seja
executado muito mais lentamente do que código “equivalente” em C ou C++.
Ao mesmo tempo, ficará espantado com a rapidez com a qual poderá pôr um
programa em Ruby a correr, bem como com a quantidade diminuta de linhas
de código necessárias para o escrever. O Ruby é muito, muito mais
simples que o C++—irá estraga-lo com mimos!

O Ruby é tipado dinamicamente e não estaticamente—o runtime faz tanto
trabalho quanto possível em tempo de execução. Por exemplo, o
programador não precisará de saber a que módulos o seu programa em Ruby
irá “ligar-se” (isto é, carregar e usar) ou saber de antemão que métodos
irá chamar.

Felizmente, acontece que o Ruby e o C mantêm uma saudável relação
simbiótica. O Ruby suporta os chamados “módulos de expansão”. Estes são
um tipo de módulo que se pode usar a partir da sua aplicação em Ruby (e
que, vistos do exterior parecem ser e agem como qualquer outro módulo de
Ruby), mas que no entanto são escritos em C. Deste modo, poderá dividir
as partes do seu projecto em Ruby e utilizar C puro onde a performance é
mais critica.

E, claro, o Ruby em si é escrito em C.

### Semelhanças com o C

Como em C, no Ruby…

* Poderá programar processualmente (no entanto o código será orientado a
  objectos por detrás de cena)
* Os operadores são, na sua maioria, os mesmos (inclusive os operadores
  de atribuição composta (exe.: a \*= b + c) e também os operadores de
  lógica binária). No entanto o Ruby não tem os operadores `++` e `--`.
* Tem o `__FILE__` e o `__LINE__`.
* Pode usar constantes, no entanto não existe a palavra reservada
  `const`. A “constância” é garantida por uma convenção de nomenclatura
  – todos os nomes começados com letra maiúscula são reservados para
  constantes.
* As strings (cadeias de caracteres em C) são delimitadas por aspas.
* As strings são mutáveis.
* Tal como as man pages, poderá ler a maioria da documentação no
  terminal – usando para isso o comando `ri`
* Tem o mesmo tipo de depuradores em linha de comandos.

### Semelhanças com o C++

Como com o C++, em Ruby…

* A maioria dos operadores são os mesmos (inclusive o `::`). É comum
  utilizar `<<` para acrescentar elementos a uma lista. No entanto
  atenção: em Ruby nunca se usa `->`—é sempre `.`.
* As palavras reservadas `public`, `private` e `protected` têm
  comportamentos semelhantes.
* A sintaxe de herança é ainda apenas um caracter, mas é o `<` em vez de
  `:` .
* Pode colocar o seu código em “módulos”, semelhantes ao modo como o
  `namespace` é usado em C++.
* As excepções têm um funcionamento semelhante, no entanto a
  nomenclatura das palavras reservadas foi mudada para proteger os
  inocentes!

### Diferenças do C

Ao contrario do C, em Ruby…

* Os objectos são fortemente tipados (e as próprias variáveis não têm
  qualquer tipo).
* Não existem macros ou pre-processador. Não existem casts. Não existem
  ponteiros (nem aritmética de ponteiros). Não existem typedefs, sizeof
  ou enums.
* Não existem ficheiros header. Basta definir funções (normalmente
  chamados de “métodos”) e classes nos ficheiros de código fonte.
* Não se usa `#define`. Ao invés usam-se constantes.
* A partir da versão 1.8 de Ruby, o código é interpretado em tempo de
  execução em vês de ser compilado para qualquer tipo de código maquina
  ou binário.
* As variaveis residem em memoria. Mais ainda, não precisam de se
  preocupar em liberta-las—o `garbage collector` encarrega-se disso por
  si.
* Os argumentos são passados aos métodos (por exemplo: funções) por
  referência, não por valor.
* Usa-se `require 'foo'` em vez de `#include <foo>` ou `#include "foo"`.
* Não se pode baixar ao assembly.
* As linhas não acabam com ponto e virgula.
* Nas construções lógicas `if` e `while` não se usam parênteses.
* A utilização de parênteses na chamada a metodos (por exemplo: funções)
  é normalmente opcional.
* Normalmente não se usa chavetas – basta usar a palavra reservada end
  para terminar um bloco de código expandido por múltiplas linhas(por
  exemplo um ciclo `while`).
* A palavra reservada `do` é utilizada nos chamados “blocos”. Não existe
  a construção `do` como em C.
* O termo “bloco” é usado para algo completamente diferente. Usa-se para
  bloco de código que se associa a uma chamada de método para que o
  corpo do método possa fazer chamadas ao bloco enquanto é executado.
* Não existem declarações de variáveis. Simplesmente atribuem-se valores
  assim que surja a necessidade.
* Num teste lógico, apenas false e nil são avaliados como falso. Tudo o
  resto é verdadeiro (incluindo `0`, `0.0`, e `"0"`).
* Não existe o `char`—é apenas uma string de apenas uma letra.
* As strings não acabam com um byte nulo.
* Os arrays literais são colocados dentro de parênteses rectos em vez de
  chavetas.
* Os arrays crescem automaticamente quando se lhes acrescente elementos.
* Se somar dois arrays obterá um array novo e maior (alojado em memoria,
  é claro) em vez de fazer aritmética de ponteiros.
* Frequentemente tudo será considerado uma expressão (o que quer dizer
  que coisas como ciclos `while` serão avaliados com um `rvalue`).

### Diferenças do C++

Ao contrario do C++, no Ruby,...

* Não existem referências explícitas. O que quer dizer que em Ruby cada
  variável e apenas um nome automaticamente desreferenciado para algum
  objecto.
* Os objectos são fortemente mas dinamicamente tipados. O runtime
  descobre em tempo de execução se a chamada a método realmente
  funciona.
* O “construtor” é chamado `initialize` em vez de um nome de uma classe.
* Todos os métodos são sempre virtuais.
* Nomes de variáveis de classe (estáticas) começam sempre por
  `@` (por exemplo `@valor_total`).
* Não se pode aceder directamente a variáveis de membros todo o acesso a
  variáveis públicas de membros (chamadas em Ruby de atributos) é feito
  através de métodos.
* Usa-se `self` em vez de `this`.
* Alguns nomes de métodos terminam em ’?’ ou ’!’. E a terminação faz
  realmente parte do nome.
* Não existe múltipla herança por si só. Embora em Ruby possa haver
  “mixins” (por exe.: pode-se herdar todas as instancias de métodos de
  um modulo).
* Nas chamadas a métodos, os parênteses são opcionais.
* Pode-se reabrir uma classe a qualquer momento e adicionar novos
  métodos.
* Não há a necessidade de utilização de templates de C++ (uma vez que se
  pode atribuir qualquer tipo de objecto a qualquer variável e os tipos
  são descobertos em tempo de execução de qualquer modo). Também não
  existe casting.
* A iteração é feita de uma maneira algo diferente. Em Ruby não
  utilizará um objecto iterador separado (como por exemplo
  `vector<T>:const_iterator iter`) mas ao invés os objectos criados
  podem misturar o modulo `enumerator` e fazer uma chamada a um método
  como por exemplo `meu_obj.each`.
* Existem apenas dois tipos contentores: `Array` e `Hash`.
* Não existe conversão de tipo. No entanto provavelmente aperceber-se-á
  que tal não é necessário.
* As capacidades multithreading são nativas, mas a partir do Ruby 1.8,
  elas são “threads ecológicas” (implementadas apenas dentro do
  interpretador) por oposição a threads nativas.
* O Ruby vem complementado com uma biblioteca standard de testes
  unitários.
