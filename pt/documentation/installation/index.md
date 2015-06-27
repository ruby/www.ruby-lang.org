---
layout: page
title: "Instalando o Ruby"
lang: pt
---

Você pode usar diversas ferramentas para instalar o Ruby.
Esta página descreve como usar os principais sistemas de
gerenciamento de pacotes ou ferramentas de terceiros para
gerenciar e instalar o Ruby e como compilar o Ruby a
partir do código fonte.
{: .summary}


## Escolha o seu Método de Instalação

O resumo a seguir lista os métodos de instalação disponíveis
para cada uma das principais plataformas. Escolha o jeito
que seja mais confortável para você.

* OS X

  * [rbenv](#rbenv)
  * [RVM](#rvm)
  * [Homebrew](#homebrew)
  * [Compilando do código fonte](#building-from-source)

* Linux/UNIX

  * [rbenv](#rbenv)
  * [RVM](#rvm)
  * [Sistemas de gerenciamento de pacotes](#package-management-systems)
  * [Compilando do código fonte](#building-from-source)

* Windows

  * [RubyInstaller](#rubyinstaller)
  * [pik][pik]


## Ferramentas de Terceiros

Muitos programadores usam ferramentas de terceiros para
instalar o Ruby. Elas conferem várias vantagens, mas não são
suportadas oficialmente. No entanto, suas respectivas
comunidades são muito prestativas.


### rbenv
{: #rbenv}

O [rbenv][rbenv] permite que vocÊ gerencie múltiplas instalações
do Ruby. Ele não suporta a instalação do Ruby, mas existe um
plugin popular chamado ruby-build para isso. Ambas estas
ferramentas estão disponíveis para OS X, Linux ou outros
sistemas operacionais do tipo UNIX.


### RVM ("Ruby Version Manager")
{: #rvm}

O [RVM][rvm] permite que você instale e gerencie múltiplas
instalações do Ruby em seu sistema. Ele também permite
gerenciar diferentes gemsets. Também está disponível para
OS X, Linux ou outros sistemas operacionais do tipo UNIX.


### RubyInstaller
{: #rubyinstaller}

Se você está no Windows, existe um ótimo projeto para ajudá-lo
a instalar o Ruby: [RubyInstaller][rubyinstaller]. Ele te dá
tudo o que você precisa para configurar um ambiente de
desenvolvimento em Ruby completo no Windows.

Apenas baixe, rode e está pronto!


### RailsInstaller e Ruby Stack

Se você está instalando o Ruby para usar o Ruby on Rails,
você pode usar os seguintes instaladores:

* [RailsInstaller][railsinstaller],
  que usa o RubyInstaller, mas te dá ferramentas adicionais
  que ajudam no desenvolvimento com Rails. Suporta o OS X e o Windows.
* [Bitnami Ruby Stack][rubystack],
  que fornece um ambiente de desenvolviment completoo para Rails.
  Suporta OS X, Linux, Windows, máquinas virtuais e imagens na nuvem.


## Sistemas de Gerenciamento de Pacotes
{: #package-management-systems}

Se você não pode compilar o seu próprio Ruby e vocÊ não quer usar uma
ferramenta de terceiros, você pode usar o gerenciador de pacotes do
seu sistema para instalar o Ruby.

Alguns membros da comunidade Ruby sugerem fortemente que você nunca
deve usar um gerenciador de pacotes para instalar o Ruby e que você
deve usar ferramentas ao invés disso. Embora a lista completa de
prós e contras esteja fora do escopo desta página, o principal
motivo é que os gerenciadores de pacotes têm versões mais antigas
do Ruby em seus repositórios oficiais. Se você gostaria de usar
um Ruby mais recente, assegure-se de usar o nome do pacote correto,
ou de usar as ferramentas descritas acima ao invés disso.

Os seguintes gerenciadores de pacotes são descritos abaixo:

* [apt (Debian ou Ubuntu)](#apt)
* [yum (CentOS, Fedora ou RHEL)](#yum)
* [portage (Gentoo)](#gentoo)
* [pacman (Arch Linux)](#pacman)
* [Homebrew (OS X)](#homebrew)
* [Solaris, OpenIndiana](#solaris)


### apt (Debian ou Ubuntu)
{: #apt}

O Debian GNU/Linux e o Ubuntu usam o gerenciador de pacotes apt.
Você pode utilizá-lo da seguinte forma:

{% highlight sh %}
$ sudo apt-get install ruby
{% endhighlight %}

No momento em que foi escrita esta página, o pacote `ruby` fornecia
a versão 1.9.3 do Ruby, que é uma versão estável antiga, tanto no
Debian quanto no Ubuntu.


### yum (CentOS, Fedora ou RHEL)
{: #yum}

O CentOS, o Fedora e o RHEL usam o gerenciador de pacotes yum.
Você pode utilizá-lo da seguinte maneira:

{% highlight sh %}
$ sudo yum install ruby
{% endhighlight %}

A versão instalada geralmente é a versão do Ruby mais recente disponível
no momento do lançamento da versão específica da distribuição.


### portage (Gentoo)
{: #portage}

O Gentoo usa o gerenciador de pacotes portage.

{% highlight sh %}
$ sudo emerge dev-lang/ruby
{% endhighlight %}

Por padrão, ele tentará instalar todas as versões disponíveis (1.8, 1.9
e 2.0). Para instalar uma versão específica, configure `RUBY_TARGETS`
em seu `make.conf`. Consulte o [website do projeto Ruby do Gentoo][gentoo-ruby]
para mais detalhes.


### pacman (Arch Linux)
{: #pacman}

O Arch Linux usa um gerenciador de pacotes chamado pacman.
Para obter o Ruby, apenas faça isso:

{% highlight sh %}
$ sudo pacman -S ruby
{% endhighlight %}


### Homebrew (OS X)
{: #homebrew}

No OS X Mavericks, o Ruby 2.0 já está incluso. O OS X Mountain Lion,
Lion e Snow Leopard vêm com o Ruby 1.8.7.

Existem diversas opções para instalar versões mais novas do Ruby.
A maioria dos usuários de OS X na comunidade Ruby usam ferramentas
de terceiros para instalar o Ruby, mas existem alguns gerenciadores
de pacotes que o suportam.

Muitas pessoas no OS X usam o [Homebrew][homebrew] como um
gerenciador de pacotes. É muito fácil de obter o Ruby:

{% highlight sh %}
$ brew install ruby
{% endhighlight %}

Além disso, já que o OS X é baseado em Unix, baixar e instalar a partir
do código fonte é tão fácil e eficiente quanto as demais soluções.
Provavelmente é uma boa ideia usar ferramentas de terceiros para
ajudá-lo a instalar novas versões do Ruby no OS X.


### Ruby no Solaris e OpenIndiana
{: #solaris}

O Ruby 1.8.7 está disponível do Solaris 8 até o Solaris 10 no
[Sunfreeware][sunfreeware] e o Ruby 1.8.7 está disponível no
[Blastwave][blastwave]. O Ruby 1.9.2p0 também está disponível no
[Sunfreeware][sunfreeware], mas está desatualizado. Usar
ferramentas de terceiros te ajudará a obter as versões mais
recentes do Ruby.

Para instalar o Ruby no [OpenIndiana][openindiana], por favor use o
client do [Image Packaging System (IPS)][opensolaris-pkg]. Ele
instalará os binários mais recentes do Ruby e do RubyGems diretamente
a partir do repositório da rede OpenSolaris para o Ruby 1.9. É fácil:

{% highlight sh %}
$ pkg install runtime/ruby-18
{% endhighlight %}

Da mesma forma, as ferramentas de terceiros são uma excelente maneira
de obter as versões mais recentes do Ruby.


### Outras Distribuições

Em outros sistemas, você pode pesquisar por Ruby no repositório de
pacotes do gerenciador da sua distribuição de Linux, ou as
ferramentas de terceiros podem ser a sua escolha certa.


## Compilando a Partir do Código Fonte
{: #building-from-source}

É claro, você pode instalar o Ruby a partir do código fonte.
[Baixe](/en/downloads/) e descompacte o arquivo, e então apenas faça isso:

{% highlight sh %}
$ ./configure
$ make
$ sudo make install
{% endhighlight %}

Por padrão isso instalará o Ruby em `/usr/local`. Para alterar, informe
a opção `--prefix=DIR` para o script `./configure`.

No entanto, usar as ferramentas de terceiros ou os gerenciadores de pacotes
pode ser uma ideia melhor, porque o Ruby instalado não será gerenciado
por nenhuma ferramenta.


[rvm]: http://rvm.io/
[rbenv]: https://github.com/sstephenson/rbenv
[rubyinstaller]: http://rubyinstaller.org/
[railsinstaller]: http://railsinstaller.org/
[rubystack]: http://bitnami.com/stack/ruby/installer
[pik]: https://github.com/vertiginous/pik
[sunfreeware]: http://www.sunfreeware.com
[blastwave]: http://www.blastwave.org
[openindiana]: http://openindiana.org/
[opensolaris-pkg]: http://opensolaris.org/os/project/pkg/
[gentoo-ruby]: http://www.gentoo.org/proj/en/prog_lang/ruby/
[homebrew]: http://brew.sh/
