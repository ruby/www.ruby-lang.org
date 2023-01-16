---
layout: page
title: "Núcleo do Ruby"
lang: pt
---

Agora é um momento fantástico para seguir o desenvolvimento do Ruby. Com a
atenção cada vez maior que o Ruby tem recebido nos últimos anos, existe uma
necessidade crescente de bom talento para ajudar a melhorar o Ruby e
documentá-lo. Então, por onde começar?
{: .summary}

Os tópicos relacionados com o desenvolvimento do Ruby cobertos aqui são:

* [Utilizando Subversion para Seguir o Desenvolvimento do Ruby](#following-ruby)
* [Como Usar o Git com o Repositório Principal do Ruby](#git-ruby)
* [Melhorando o Ruby, *Patch* a *Patch*](#patching-ruby)
* [Regras para os _Core Developers_](#coding-standards)

### Utilizando Subversion para Seguir o Desenvolvimento do Ruby
{: #following-ruby}

Obter a versão mais recente do código fonte do Ruby é uma questão de fazer um
_checkout_ anônimo do repositório [Subversion][1]. Na sua linha de comando:

{% highlight sh %}
$ svn co https://svn.ruby-lang.org/repos/ruby/trunk ruby
{% endhighlight %}

O diretório `ruby` conterá o código fonte mais recente da versão de
desenvolvimento do Ruby (ruby-trunk). Os _patches_ atualmente aplicados ao
_trunk_ são portados para os _branches_ estáveis {{ site.svn.stable.version }},
{{ site.svn.previous.version }} e {{ site.svn.old.version }} (veja abaixo).

Se você gostaria de seguir os _patches_  aplicados ao Ruby
{{ site.svn.stable.version }}, você deve usar o _branch_
`{{ site.svn.stable.branch }}` ao fazer o _check out_:

{% highlight sh %}
$ svn co https://svn.ruby-lang.org/repos/ruby/branches/{{ site.svn.stable.branch }}
{% endhighlight %}

A mesma coisa para o Ruby {{ site.svn.previous.version }}:

{% highlight sh %}
$ svn co https://svn.ruby-lang.org/repos/ruby/branches/{{ site.svn.previous.branch }}
{% endhighlight %}

Isto fará o *check out* da árvore de desenvolvimento em um
diretório `{{ site.svn.stable.branch }}` ou `{{ site.svn.previous.branch }}`.
Espera-se que os programadores que trabalham nos _branches_ de
manutenção migrem as suas alterações para o _trunk_ do Ruby, tão regularmente
que os dois _branches_ estejam muito similares, com a exceção das melhorias
feitas diretamente à linguagem por Matz e Nobu.

Se você preferir, você pode navegar pelo
[repositório Subversion do Ruby pela web][2].

Para mais informações sobre o Subversion, por favor consulte o
[FAQ do Subversion][3] e o [livro do Subversion][4]. Alternativamente,
você pode achar útil o livro introdutório
[_Pragmatic Version Control with Subversion_][5].

### Como usar o Git com o Repositório Principal do Ruby
{: #git-ruby}

Aqueles que preferem usar o [Git][6] ao invés do Subversion, podem encontrar
as instruções no [_mirror_ no GitHub][7], tanto para
[quem tem permissão de _commit_][8]
quanto [todos os demais][9].

### Melhorando o Ruby, *Patch* a *Patch*
{: #patching-ruby}

A equipe do _core_ mantém um [_issue tracker_][10] para submeter _patches_
e reportar bugs para Matz e os demais. Essas informações também são enviadas
para a [lista de e-mails do _core_ do Ruby][mailing-lists]
para discussão, então você pode ter certeza de que o seu pedido não passará
despercebido. Você também pode enviar os seus patches diretamente para
a lista de e-mails. De qualquer forma, você é encorajado a participar na
discussão que segue.

Por favor dê uma olhada no [_Patch Writer’s Guide_][11] para ver algumas
dicas, diretamente do Matz, sobre como fazer com que seus _patches_
sejam considerados.

Para resumir, os passos para criar um *patch* são:

1.  Faça o _check out_ de uma cópia do código fonte do Ruby a partir do
    Subversion. Geralmente os _patches_ para correções de bugs ou novas
    funcionalidades devem ser enviados para o _trunk_ do código do Ruby.
    Mesmo que você queira adicionar uma funcionalidade ao Ruby 1.9.3,
    ele deve ser provado no _trunk_ primeiro.

        $ svn co https://svn.ruby-lang.org/repos/ruby/trunk ruby

    Se você estiver corrigindo um bug que é específico de um _branch_ de
    manutenção, faça o _check out_ do respectivo _branch_, por exemplo
    `{{ site.svn.previous.branch }}`.

        $ svn co https://svn.ruby-lang.org/repos/ruby/branches/{{ site.svn.previous.branch }}

2.  Faça as suas melhorias no código.

3.  Crie um _patch_.

        $ svn diff > ruby-changes.patch

4.  Crie um _ticket_ no [_issue tracker_][10] ou envie seu _patch_ por
    e-mail para a [lista de e-maisl do core do Ruby][mailing-lists]
    com uma entrada no _ChangeLog_ descrevendo o _patch_.

5.  Se não forem levantados quaisquer problemas sobre o _patch_,
    quem fez o _commit_ receberá a permissão para aplicá-lo.

**Nota:** os *patches* devem ser enviados como um [_unified diff_][12].
Para saber mais sobre como os patches são fundidos, consulte o [manual do
diffutils][13].

A discussão do desenvolvimento do Ruby converge na
[lista de e-mails Ruby-Core][mailing-lists]. Por isso, se está curioso
se o seu *patch* vale a pena ou deseja animar uma discussão sobre o
futuro do Ruby, não hesite e entre a bordo. Esteja avisado desde já
que as conversas fora do contexto não são toleradas nesta lista. Os
níveis de ruído deverão ser muito baixos, os tópicos deverão ser
mencionados, bem concebidos e bem escritos. Já que nos dirigimos ao
criador do Ruby, sejamos reverentes.

Lembre-se de que os programadores do núcleo do Ruby vivem no Japão e,
enquanto muitos falam muito bem o inglês, existe uma diferença
significativa no fuso horário. Também existe um corpo inteiro de listas
de e-mail em japonês que existem em paralelo às contrapartes em inglês.
Seja paciente, e se o seu pedido não for atendido, seja persistente
– tente outra vez alguns dias mais tarde.

### Regras para os Programadores do _Core_
{: #coding-standards}

Em geral, os programadores de Ruby deverão estar familiarizados com o
código fonte e o estilo de programação utilizado pela equipe. Para ficar
mais claro, as seguintes diretrizes deverão ser respeitadas
quando submeter código no repositório Subversion:

* Todas as submissões deverão ser descritas no `ChangeLog`, seguindo as
  [convenções GNU][14]. (Muitos programadores de Ruby usam o modo
  `add-log` no Emacs, que poderá ser ativado como o commando `C-x 4 a`.)
* Datas de submissão deverão ser dadas na Fuso Horário Japonês (UTC+9).
* Os tópicos listados no seu ChangeLog também deverão ser colocados na
  mensagem de submissão do Subversion. Esta mensagem será automaticamente
  enviada para a lista Ruby-CVS depois da sua submissão.
* Protótipos de funções são utilizadas por todo o código fonte Ruby
  e em todos as suas extensões embutidas.
* Por favor, não use comentários no estilo do C++ (`//`). Os
  programadores do Ruby preferem os comentários de múltiplas linhas
  do C (`/* .. */`).

Veja também as informações no [_issue tracker_ do Ruby][10].



[mailing-lists]: /pt/community/mailing-lists/
[1]: http://subversion.apache.org/
[2]: https://svn.ruby-lang.org/cgi-bin/viewvc.cgi/
[3]: http://subversion.apache.org/faq.html
[4]: http://svnbook.org
[5]: http://www.pragmaticprogrammer.com/titles/svn/
[6]: http://git-scm.com/
[7]: https://github.com/ruby/ruby
[8]: https://github.com/shyouhei/ruby/wiki/committerhowto
[9]: https://github.com/shyouhei/ruby/wiki/noncommitterhowto
[10]: https://bugs.ruby-lang.org/
[11]: https://blade.ruby-lang.org/ruby-core/25139
[12]: http://www.gnu.org/software/diffutils/manual/html_node/Unified-Format.html
[13]: http://www.gnu.org/software/diffutils/manual/html_node/Merging-with-patch.html#Merging%20with%20patch
[14]: http://www.gnu.org/prep/standards/standards.html#Change-Logs
