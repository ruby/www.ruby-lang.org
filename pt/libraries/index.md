---
layout: page
title: "Bibliotecas"
lang: pt
---

Como na maioria das linguagens de programação, Ruby utiliza um grande
conjunto de bibliotecas de terceiros.
{: .summary}

A maioria delas são disponibilizadas na forma de uma **gem**.
[**RubyGems**][1] é um sistema de pacotes Ruby que facilita a
criação, compartilhamento e instalação de bibliotecas (pode-se dizer
que é um sistema de distribuição de pacotes similar, por exemplo,
ao `apt-get`, porém voltado a software em Ruby). A partir da versão
1.9, o Ruby vem com o RubyGems instalado por padrão, enquanto nas
versões anteriores é necessário [instalá-lo manualmente][2].

Algumas outras bibliotecas são disponibilizadas como diretórios compactados
de **código fonte** (.zip ou .tar.gz). O processo de instalação pode variar,
geralmente há um arquivo `README` ou `INSTALL` com instruções sobre isso.

Vamos dar uma olhada em como você pode encontrar e instalar bibliotecas.

### Encontrando Bibliotecas

O principal lugar onde as bibliotecas estão hospedadas é o
[**RubyGems.org**][1], disponibilizando bibliotecas Ruby como gems.
Você pode acessar o website diretamente ou usar o comando `gem`.

Através do comando `gem search -r`, você pode inspecionar o repositório
do RubyGems. Por exemplo, `gem search -r rails` retornará uma lista de
gems relacionadas ao Rails. Com a opção `--local` (`-l`), você
executa uma busca local através das gems já instaladas. Para instalar
uma gem, use `gem install [gem]`. Para navegar através das gems
instaladas, use o comando `gem list`. Para mais informações sobre
o comando `gem`, leia abaixo ou acesse [a documentação do RubyGems][3].

No entanto, eixstem outras fontes de bibliotecas. O [RubyForge][4]
costumava ser um local popular para biblitoecas Ruby, mas nos últimos
anos vimos a ascenção do [**GitHub**][5] como um dos principais
repositórios de conteúdo relacionado a Ruby. Na maior parte dos casos,
o código-fonte de uma gem será hospedado no GitHub enquanto é publicado
como uma gem completa no RubyGems.org.

O [**The Ruby Toolbox**][6] é um projeto que facilita descobrir projetos Ruby
open source. Possui categorias para várias tarefas comuns do desenvolvimento,
reúne várias informações sobre os projetos tais como a data de lançamento
e a atividade de commits ou dependências, e dá uma nota para os projetos
baseada em sua popularidade no RubyGems.org e no GitHub. A busca torna
fácil descobrir o que você está procurando.

### Mais algumas palavras sobre RubyGems

Segue aqui um review rápido do comando `gem` para uso diário. Está disponível
uma [documentação mais detalhada][7], cobrindo todos os aspectos deste
sistema de pacotes.

#### Procurando por Gems

O comando de **search** pode ser usado para encontrar gems, baseado em uma
string. As gems cujo nome começa com a string especificada serão listadas.
Por exemplo, para pesquisar por gems relacionadas a “html”:

{% highlight sh %}
$ gem search -r html

*** REMOTE GEMS ***

html-sample (1.0, 1.1)
{% endhighlight %}

A flag `--remote` / `-r` indica que queremos pesquisar no repositório
oficial do RubyGems.org (comportamento padrão). Com a flag `--local` / `-l`
você pode pesquisar localmente nas gems instaladas.

#### Instalando uma Gem

Uma vez encontrada a gem que você deseja **instalar**, por exemplo o Rails:

{% highlight sh %}
$ gem install rails
{% endhighlight %}

Poderá também instalar uma determinada versão da biblioteca utilizando a
flag `--version` / `-v`.

{% highlight sh %}
$ gem install rails --version 5.0
{% endhighlight %}

#### Listando Todas as Gems

Para obter uma **lista** de todas as gems instaladas:

{% highlight sh %}
$ gem list
{% endhighlight %}

Para obter uma lista (muito longa) de todas as gems disponíveis
no RubyGems.org:

{% highlight sh %}
$ gem list -r
{% endhighlight %}

#### Ajuda!

A documentação está disponível diretamente no seu terminal:

{% highlight sh %}
$ gem help
{% endhighlight %}

Por exemplo, `gem help commands` é útil para listar todos os comandos
de `gem`.

#### Criando suas próprias gems

O RubyGems.org tem [vários guias][3] sobre esse assunto. Você também pode
querer investigar o [Bundler][9], uma ferramenta genérica que ajuda a
gerenciar as dependências de uma aplicação e que pode ser utilizada
junto com o RubyGems.



[1]: https://rubygems.org/
[2]: https://rubygems.org/pages/download/
[3]: http://guides.rubygems.org/
[4]: http://rubyforge.org/
[5]: https://github.com/
[6]: https://www.ruby-toolbox.com/
[7]: http://guides.rubygems.org/command-reference/
[9]: http://bundler.io/
