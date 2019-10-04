---
layout: page
title: "Para Ruby a partir de Perl"
lang: pt
---

O Perl é espectacular. A documentação do Perl é espetaculares. A Comunidade de Perl é...
incrível.

### Semelhanças

Tal como em Perl, em Ruby...

- Existe um sistema de gestão de pacotes, semelhante ao CPAN (chamado
  [RubyGems][1])
- O Tratamento de Expressões Regulares (Regexes) está embutido na
  linguagem. Bon appétit!
- Existe um número bastante razoável de funcionalidades nativas de uso
  frequente.
- Os parênteses são frequentemente opcionais.
- As strings funcionam essencialmente da mesma forma.
- Existe uma sitaxe de delimitação de strings e expressões regulares
  geralmente utilizada semelhante a do Perl. Ele parece `%q{isto}` (single-quoted), or
  `%Q{isto}` (double-quoted) e `%w{esta é uma lista de palavras single-quoted}`.
  Você `%Q|pode|` `%Q(usar)` `%Q^outros^` delimitadores que você prefere.
- Em Ruby existe interpolação de váriaveis entre aspas, `"aplica-se #{desta} forma"` (o código ruby é colocado entre `#{}`).
- A execução de comandos de sistema através da Shell faz-se com
  `` `backticks` ``.
- O Ruby possui ferramenta de documentação embutida (Em Ruby é
  chamado RDoc).

### Diferenças

Ao contrario do Perl, no Ruby…

- Não existem as regras dependentes do contexto como no Perl.
- Uma variável não é o mesmo que o objeto ao qual se refere. Em vez
  disso é sempre um referencia para um objeto.
- Apesar de `$` e `@` serem utilizados por vezes como os
  primeiros caracteres nos nomes das variaveis, em vez de indicar o
  tipo, indicam o escopo `$` para variáveis globais, `@` para
  instâncias de objetos, e `@@` para atributos de classe).
- Os elementos de um Array são colocados entre colchetes em vez
  de parênteses.
- Criar listas de listas não as reduz a uma grande lista, em vez disso
  obtem-se um array de arrays.
- Utiliza-se `def` em vez de `sub`.
- Não são necessários ponto e vírgula (;) no final de cada linha. As
  definições de funções, classes e estruturas `case` terminam com a
  palavra `end`.
- Os objetos têm tipagem forte. É necessário invocar manualmente os
  métodos `foo.to_i`, `foo.to_s`, etc., se for necessário converter
  entre tipos.
- Não existem `eq`, `ne`, `lt`, `gt`, `ge`, nem `le`.
- Não existe ‘diamond operator’ (`<>`). Usualmente utiliza-se
  `IO.alguma_funçao`.
- O simbolo `=>` é utilizado somente para os elementos de uma tabelas
  de hash.
- Não existe `undef`. Em Ruby utiliza-se a expressão `nil`. `nil` é um
  objeto (tal como tudo o resto em Ruby). Não é o mesmo que uma
  variável indefinida. Toma sempre o valor `false` se for tratada como
  um booleano.
- Quando é feito um teste booleano, somente `false` e `nil` devolvem um
  valor falso. Tudo o resto é verdadeiro (incluindo `0`, `0.0` e
  `"0"`).
- Não há um [PerlMonks][2]. Embora a mailing list do ruby-talk seja um
  site muito amigável.

[1]: http://guides.rubygems.org
[2]: http://www.perlmonks.org/
