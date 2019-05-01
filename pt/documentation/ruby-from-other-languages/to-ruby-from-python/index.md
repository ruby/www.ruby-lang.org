---
layout: page
title: "Para Ruby a partir de Python"
lang: pt
---

Python é uma outra boa linguagem de programação. Ir de Python para ruby,
irá verificar que há um pouco mais de sintaxe a aprender do que em
Python.

### Similaridades

Assim com em Python, em Ruby…

* Há um prompt interactivo (chamado `irb`).
* Pode ler documentos na linha de comandos (com o comando `ri` em vez do
  `pydoc`).
* Não há terminadores de linha especiais (excepto a usual nova linha).
* Texto escrito literalmente pode ocupar várias linhas assim como o
  texto com triplas aspas em Python.
* Parênteses rectos são para as listas, e parênteses são para
  dicionários (que, em Ruby, são chamados “hashes”)
* Arrays funcionam da mesma maneira (adicionando-os entre sí, faz um
  array maior, mas compondo-os desta forma `a3 = [ a1, a2]` dá-nos um
  array de arrays).
* Os objectos são fortemente e dinâmicamente tipados.
* Tudo é um objecto, e variáveis são apenas referências a objectos.
* Contudo as palavras chave são um pouco diferentes, as excepções
  trabalham da mesma forma.
* Tem ainda ferramentas de documentação embebida (é chamado rdoc em
  Ruby).

### Diferenças

Em oposição ao Pyhton, no Ruby,...

* As strings são mutáveis.
* Pode criar constantes (variáveis as quais o valor não pretende mudar).
* Há algumas “case-conversions” forçadas (ex. nomes de classes começam
  com uma maiúsculas, variáveis começam com uma letra minúscula).
* Há apenas um tipo de “list container” (um Array), e é mutável.
* Texto em aspas permitem sequências de escape (tipo `\t`) e sintaxe
  especial “expressões de substituição” (as quais permitem inserir o
  resultado das expressões em Ruby directamente numa outra string sem
  ter de adicionar `"add " + "strings " + "together"`). Texto em pelicas
  são como `r"raw strings"` em Python.
* Não há algo como classes de “novo estilo” e “antigo estilo”. Só um
  tipo.
* Nunca há acessos directos aos atributos. Com Ruby, são tudo chamadas a
  métodos.
* Os parênteses são opcionais para as chamadas a métodos.
* Há o `public`, `private`, e `protected` para forçar o acesso, ao invés
  do Python `_voluntary_` underscore `__convention__`.
* “mixins” são utilizados ao invés das múltiplas heranças.
* Pode re-abrir classes em qualquer momento e adicionar mais métodos.
* Tem o `true` `false` em vez de `True` e `False` (e `nil` em vez de
  `None`).
* Assim que testado para verdadeiro, só o `false` e o `nil` avaliam para
  um valor falso. Tudo o resto é verdadeiro (incluindo `0`, `0.0`, `""`,
  e `[]`),
* É `elsif` em vez de `elif`.
* É `require` instead of `import`. Embora outras vezes, a sua utilização
  seja a mesma.
* O estilo comum de comentários nas linhas *acima* das coisas (ao invés
  de docstrings abaixo delas) são usadas para gerar documentos.
* Há um número de atalhos que, embora dão mais trabalho a lembrar, irá
  rapidamente aprender. Eles pretende fazer o Ruby divertido e muito
  produtivo
