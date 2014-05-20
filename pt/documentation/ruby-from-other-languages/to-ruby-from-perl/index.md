---
layout: page
title: "Para Ruby a partir de Perl"
lang: pt
---

O Perl é espectacular. ? Os Perl docs ? são espetaculares. A Comunidade
de Perl é ... espectacular. Contudo, a linguagem é bastante extensa e
questionavelmente complexa. Para aqueles programadores de Perl que
anseiam por tempos mais simples, por uma linguagem mais ortogonal e
elegante com orientação aos objectos nativa, então o Ruby pode ser a
solução.

### Semelhanças

Tal como no Perl, em Ruby,...

* Existe um sistema de gestão de pacotes, semelhante ao CPAN (chamado
  [RubyGems][1])
* O Tratamento de Expressões Regulares (Regexes) está embebido na
  linguagem. Bon appétit!
* Existe um número bastante razoável de funcionalidades nativas de uso
  frequente.
* Os Parênteses são frequentemente opcionais.
* As Strings funcionam essencialmente da mesma forma.
* Existe uma sitaxe de delimitação de strings e expressões regulares
  geralmente utilizada semelhante a do Perl (com o formato `%q{este}`
  (pelicas), ou `%Q{este}` (aspas), e `%w{este para uma lista de
  palavras com pelicas}`. Podem `%Q|ser |` `%Q(utilizados)` `%Q^outros^`
  delimitadores).
* Em Ruby existe interpolação de váriaveis entre aspas, `"aplica-se
  #{desta} forma"` (o código ruby é colocado entre `#{}`).
* A execução de comandos de sistema através da Shell faz-se com
  `` `backticks` ``.
* O Ruby possui ferramentas de documentação embebidas (No Ruby’s é
  chamdo Rdoc).

### Diferenças

Ao contrario do Perl, no Ruby…

* Não existem as regras dependentes do contexto como no Perl.
* Uma variável não é o mesmo que o objecto ao qual se refere. Em vez
  disso é sempre um referencia para um objecto.
* Apesar de `$` e `@` serem utilizados por vezes como os
  primeiros caracteres nos nomes das variaveis, em vez de indicar o
  tipo, indicam o ambito `$` para variáveis globais, `@` para
  instancias de objectos, e `@@` para atributos de classe).
* Os elementos de um Array são colocados entre parênteses rectos em vez
  de parênteses curvos.
* Criar listas de listas não as reduz a uma grande lista, em vez disso
  obtem-se um array de arrays.
* Utiliza-se `def` em vez de `sub`.
* Não são necessários ponto e vírgula (;) no final de cada linha. As
  definições de funçoes, classes e estruturas case terminam com a
  palavra `end`
* Os objectos têm tipagem forte. É necessário invocar manualmente os
  métodos `foo.to_i`, `foo.to_s`, etc., se for necessário converter
  entre tipos.
* Não existem `eq`, `ne`, `lt`, `gt`, `ge`, nem `le`.
* Não existe ‘diamond operator’ (`<>`). Usualmente utiliza-se
  `IO.alguma_funçao`.
* O simbolo `=>` é utilizado somente para os elementos de uma tabelas
  de hash.
* Não existe `undef`. Em Ruby utiliza-se a expressão `nil`. `nil` é um
  objecto (tal como tudo o resto em Ruby). Não é o mesmo que uma
  variavel indefinida. Toma sempre o valor `false` se for tratada como
  um booleano.
* Quando é feito um teste booleano, somente `false` e `nil` devolvem um
  valor falso. Tudo o resto é verdadeiro (incluindo `0`, `0.0`, and
  `"0"`).
* Não há um [PerlMonks][2]. Embora a mailing list do ruby-talk seja um
  sitio muito amigável.



[1]: http://guides.rubygems.org
[2]: http://www.perlmonks.org/
