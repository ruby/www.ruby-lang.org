---
layout: page
title: "Núcleo de Ruby"
lang: pt
---

Agora é o momento mais fantástico para seguir o Ruby, porque o
desenvolvimento do Ruby 2.0 está a decorrer. Com a atenção acrescida que
o Ruby tem recebido nos últimos anos, existe uma necessidade crescente
de bom talento para ajudar a melhorar o Ruby e documentá-lo. Então, por
onde começar?

Os tópicos relacionados com o desenvolvimento do Ruby cobertos aqui são:

* [Utilizando CVS para Seguir o Desenvolvimento do
  Ruby](#seguindo-o-ruby "Utilizando CVS para Seguir o Desenvolvimento
  do Ruby")
* [Seguindo o Ruby 2.0, a criação da YARV](#seguindo-a-yarv "Seguindo o
  Ruby 2.0, a criação da YARV")
* [Melhorando o Ruby, *Patch* a *Patch*](#melhorando-o-ruby "Melhorando
  o Ruby, Patch a Patch")
* e, [Regras de conduta para Programadores do Núcleo](#regras-de-conduta
  "Regras de conduta para Programadores do Núcleo")

### Utilizando CVS para Seguir o Desenvolvimento do Ruby
{: #seguindo-o-ruby}

Para fazer o *check out* da última versão do código fonte basta fazer
login na conta *anonymous* do repositório CVS. Da sua linha de comandos:


     $ cvs -d :pserver:anonymous@cvs.ruby-lang.org:/src login
     (Logging in to anonymous@cvs.ruby-lang.org)
     CVS password: 
     $ cvs -z4 -d :pserver:anonymous@cvs.ruby-lang.org:/src co ruby

Da directoria `ruby` irá agora fazer parte a última versão do código
fonte para o Ruby 1.9 (Ruby HEAD), que é a versão de desenvolvimento do
Ruby, a ser distribuída como versão 2.0 mais tarde.

Se desejar seguir a última versão do Ruby 1.8, deverá utilizar a
etiqueta `ruby_1_8` quando fizer *check out*\:


     $ cvs -z4 -d :pserver:anonymous@cvs.ruby-lang.org:/src \
         co -r ruby_1_8 -d ruby-1.8 ruby

Isto irá fazer *check out* da árvore de desenvolvimento do Ruby 1.8 numa
directoria `ruby-1.8`. É esperado que os programadores a trabalhar no
Ruby 1.8 migrem as suas alterações para o Ruby HEAD, tão regularmente
que os dois ramos são similares, com a excepção dos melhoramentos feitos
directamente para linguagem pelo Matz e o Nobu.

Se preferir, poderá explorar [O repositório CVS do Ruby via web][1].

Para informações acerca do CVS, veja, por favor o [Manual de CVS][2] e o
[CVS wiki][3]. Em Alternativa, poderá considerar útil o livro
introdutório [Pragmatic Version Control with CVS][4] .

### Seguindo o Ruby 2.0, a Criação da YARV
{: #seguindo-a-yarv}

Um dos ingredientes essenciais do desenvolvimento do Ruby 2.0 é o
[Projecto YARV][5]. Um trabalho de Sasada Koichi, que adiciona um
máquina virtual para acelerar execução e para oferecer um formato
bytecode para compilar *scripts* de Ruby.

Poderá fazer *check out* da YARV utilizando Subversion para testes
pessoais:


     $ svn co http://www.atdot.net/svn/yarv/trunk yarv

Para instruções de instalação ver o ficheiro README. O programador
principal, Koichi Sasada, também oferece listas de correio, *bug
tracking* e declarações no [sítio da YARV][5].

### Melhorando o Ruby, *Patch* a *Patch* 
{: #melhorando-o-ruby}

Rubyforge mantem um [*bug tracker*][6] para submissão de *patches* e
*bug reports* para o Matz e a malta. Estes relatórios são também
submetidos para a lista de correio Ruby-Core para discussão, para que
esteja seguro que o seu pedido não passe despercebido.

Para resumir, os passos para criar um *patch* são:

1.  Fazer *check out* de uma cópia do Ruby 1.8 do repositório CVS,
    utilizando a etiqueta `ruby_1_8`.

         $ cvs -z4 -d :pserver:anonymous@cvs.ruby-lang.org:/src \
             co -r ruby_1_8 -d ruby-1.8 ruby

2.  Adicione os seus melhoramentos ao código (agora na directoria
    `ruby-1.8`.)
3.  Criar um *patch*.

         $ cvs diff > ruby-1.8-changes.patch

4.  [Enviar][7] o seu novo\_patch\_.

**Nota:** os *patches* devem ser enviados como um [unified diff][8].
Para saber mais sobre como os patches são fundidos ver o [manual do
diffutils][9].

A discussão do desenvolvimento do Ruby converge na lista de correio
“Ruby-Core:/pt/communidade/listas-de-correio/. Por isso, se está curioso
se o seu *patch* vale a pena ou deseja animar uma discussão sobre o
futuro do Ruby, não se faça de hesite e entre a bordo. Avisa-se desde já
que que conversas fora do contexto não são toleradas nesta lista. Os
níveis de barulho deverão ser muito baixos, os tópicos deverão ser
mencionados, bem concebidos e bem escritos. Já que nos dirigimos ao
criador do Ruby, sejamos reverentes.

Lembre-se que os programadores do núcleo do Ruby vivem no Japão e,
enquanto muitos falam muito bem Inglês, existe uma diferença
significativa no fuso horário. Também têm uma estrutura de listas de de
correio sobre o desenvolvimento para além daquelas existentes em Inglês.
Seja paciente e se o seu pedido não fôr atendido, seja persistente—tente
outra vez uns dias mais tarde.

### Regras de conduta para Programadores do Núcleo
{: #regras-de-conduta}

Em geral, os programadores de Ruby deverão estar familiarizados com o
código fonte e o estilo de programação utilizado pela equipa. Para ficar
clarificado, as seguintes linhas de conduta deverão ser respeitadas
quando submeter código no repositório CVS:

* Todas as submissões deverão ser descritas no `ChangeLog`, seguindo as
  [convenções GNU][10]. (Muitos programadores de Ruby usam o modo
  `add-log` no Emacs, que poderá ser activado como o commando `C-x 4
  a`.)
* Datas de submissão deverão ser dadas na Fuso Horário Japonês (UTC+9).
* Os pontos listados do seu ChangeLog também deverão ser colocados na
  mensagem de submissão do CVS. Esta mensagem ser automaticamente
  enviada para a lista Ruby-CVS depois da sua submissão.
* Declarações de funções no estilo K&amp;R são utilizadas por todo o
  código fonte Ruby e em todos as suas extensões.
* Por favor, não use comentários ao estilo do C++ (`//`). Os
  programadores de Ruby preferem os comentários multi-linha do C (`/* ..
  */`).



[1]: /cgi-bin/cvsweb.cgi/ "repositório CVS do Ruby via web"
[2]: http://www.nongnu.org/cvs/cvs.html
[3]: http://ximbiot.com/cvs/wiki/index.php?title=Main_Page
[4]: http://www.pragmaticprogrammer.com/starter_kit/vcc/index.html
[5]: http://atdot.net/yarv/
[6]: http://rubyforge.org/tracker/?func=browse&amp;group_id=426&amp;atid=1698
[7]: http://rubyforge.org/tracker/?func=add&amp;group_id=426&amp;atid=1700 "Enviar patch"
[8]: http://www.gnu.org/software/diffutils/manual/html_node/Unified-Format.html "diff no formato unificado"
[9]: http://www.gnu.org/software/diffutils/manual/html_node/Merging-with-patch.html#Merging%20with%20patch
[10]: http://www.gnu.org/prep/standards/standards.html#Change-Logs
