---
layout: page
title: "Para Ruby a partir de PHP"
lang: pt
---

O uso do PHP está generalizado para o desenvolvimento de aplicações web,
mas se desejar utilizar Ruby on Rails ou simplesmente desejar uma
linguagem talhada para um uso mais generalizado, vale a pena dar uma
vista de olhos ao Ruby.

### Semelhanças

Tal como no PHP, em Ruby …

* O Ruby é tipado dinamicamente, tal como o PHP, não é necessário
  declarar variavéis.
* Existem classes e é possível controlar o acesso a elas tal como em PHP
  5 (`public`, `protected` and `private`)
* Algumas variáveis começam com $, tal como o PHP (mas não todas)
* Também existe `eval`
* Pode ser utilizada a interpolação de strings. Em vez de `"$foo é um $bar"`,
  podemos escrever `"#{foo} é um #{bar}"`—tal como em PHP, isto
  não se aplica para strings entre ‘plicas’
* Existem heredocs
* Ruby tem excepções, tal como o PHP 5
* Existe uma biblioteca Standard bastante completa
* Os arrays e as tabelas de hash funcionam da forma esperada, se alterar
  `array()` por `{` e `}`\: `array('a' => 'b')` fica `{'a' => 'b'}`.
* `true` e `false` comportam-se tal como no PHP, mas `null` é chamado
  `nil` em ruby

### Diferenças

Diferente do PHP, em Ruby …

* Existe uma tipagem forte. Deverá utilizar os métodos `to_s`, `to_i`
  etc. para converter entre strings, inteiros e demais tipos, em vez de
  confiar na linguagem para o fazer.
* Strings, números, arrays, hashes, etc. são objectos. Em vez de
  invocarmos `abs(-1)` é `-1.abs`
* Os parêntesis são opcionais nas invocações dos métodos, excepto para
  clarificar que parâmetros são passados para que método.
* Em vez de convenções de nomes, tal como o uso de underscore (`_`), a
  biblioteca standard e as extensões estão organizadas em módulos e
  classes.
* A Reflexão é uma capacidade inerente dos objectos, não é necessário
  utilizar Classes `Reflection` tal como no PHP 5
* As variáveis são referências.
* Não existe uma classe `abstract` ou `interface`s
* Hashes e arrays são diferentes não se podem fazer passar uma pelo
  outro.
* Somente `false` e `nil` são falsos: `0`, `array()` e `""` são todos
  verdade em expressões condicionais.
* Quase tudo é uma invocação de um método, até `raise` (`throw` no PHP).
