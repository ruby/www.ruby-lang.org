---
layout: page
title: "Bibliotecas"
lang: pt
---

{% include out-of-date.html %}

Existe uma miríade útil e fascinante de bibliotecas para Ruby e muitas
delas disponíveis através dos cómodos ficheiros *gem*. Outras são
disponibilizadas como arquivos (.zip or .tar.gz) de código fonte.
Vejamos como encontrar e instalar bibliotecas para uso próprio.
{: .summary}

### Encontrar Bibliotecas

O [**RubyForge(RubyForge)**][1] é o famoso *lar* das bibliotecas de
Ruby. Um bom local para explorar é o seu [mapa de software][2], que
lista as bibliotecas por tópico. (Se acabar por criar as suas próprias
bibliotecas, poderá [registar][3] o seu projecto no *Rubyforge* para
obter um repositório em Subversion, espaço para alojamento do sítio do
projecto e listas de discussão.)

O [***Ruby Application Archive(Ruby Application Archive)***][4] (ou RAA)
é um directório de toda a conduta de software Ruby, categorizado por
função. Actualmente a categoria [*Database*][5] é que tem mais entradas
vencendo por 1 sobre [*Net*][6]. [HTML][7] e [XML][8] são também
populares. Existem até quatro entradas em [Physics][9].

### Utilizando a biblioteca *RubyGems*

Apesar do programa de instalação em Windows incluir *RubyGems*, muitos
sistemas operativos não as incluem. Se estes comandos não estiverem a
funcionar consigo, consulte por favor, [Instalando a biblioteca
*RubyGems*](#installing-rubygems).

#### Procurar por Gemas

O comando de **procura** pode ser usado para encontrar gemas com
determinado nome. Para procurar a palavra “html” no nome da gema:

{% highlight sh %}
$ gem search html --remote

*** REMOTE GEMS ***

html-sample (1.0, 1.1)
{% endhighlight %}

(*A flag `--remote` / `-r` indica que estamos a procurar nas gemas oficiais do
RubyForge*)

#### Instalando uma Gema

Uma vez encontrada a gema que se deseja, **instalar**\:

{% highlight sh %}
$ gem install html-sample
{% endhighlight %}

Poderá também instalar uma determinada versão da biblioteca utilizando a
flag `--version`.

{% highlight sh %}
$ gem install html-sample --version 1.0
{% endhighlight %}

#### Listando Todas as Gemas

Para uma **lista** completa de todas as gemas no *Rubyforge*\:

{% highlight sh %}
$ gem list --remote
{% endhighlight %}

Para listar somente as gemas que se instalaram, não use a flag.

{% highlight sh %}
$ gem list
{% endhighlight %}

Para mais informações acerca da utilização da biblioteca *RubyGems*,
veja [**o manual oficial**][10], que inclui exemplos para a gemas nas
suas scripts.

### Instalando a biblioteca *RubyGems*
{: #installing-rubygems}

Para instalar a biblioteca *RubyGems*, descarregue a sua versão 0.9.0 da
[página de downloads][11]. Descompacte o arquivo e execute `setup.rb`.
Em alguns sistemas operativos será necessário executar esta operação
como administrador.

Em Linux, por exemplo:

{% highlight sh %}
$ tar xzvf rubygems-0.9.0.tar.gz
$ cd rubygems-0.9.0
$ su -
$ ruby setup.rb
{% endhighlight %}

Se necessitar mais instruções sobre como o Ruby, veja o [**capítulo de
instalação**][12] no manual da biblioteca *RubyGems*.



[1]: http://rubyforge.org/
[2]: http://rubyforge.org/softwaremap/trove_list.php
[3]: http://rubyforge.org/register/
[4]: http://raa.ruby-lang.org/
[5]: http://raa.ruby-lang.org/cat.rhtml?category_major=Library;category_minor=Database
[6]: http://raa.ruby-lang.org/cat.rhtml?category_major=Library;category_minor=Net
[7]: http://raa.ruby-lang.org/cat.rhtml?category_major=Library;category_minor=HTML
[8]: http://raa.ruby-lang.org/cat.rhtml?category_major=Library;category_minor=XML
[9]: http://raa.ruby-lang.org/cat.rhtml?category_major=Library;category_minor=Physics
[10]: http://rubygems.org/read/chapter/1
[11]: http://rubyforge.org/frs/?group_id=126
[12]: http://rubygems.org/read/chapter/3
