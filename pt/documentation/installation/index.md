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

Existem diveras maneiras de instalar o Ruby:

* Quando você está em um sistema operacional baseado em UNIX, utilizar o
  **sistema de gerenciamento de pacotes** do seu sistema é a maneira mais fácil
  de começar. No entanto, geralmente a versão do empacotada do Ruby não é a mais
  recente.
* **Instaladores** podem ser utilizados para instalar uma versão específica do
  Ruby ou até mesmo várias delas. Também existe um instalador para o Windows.
* **Gerenciadores** te ajudam a alternar entre múltiplas instalações do Ruby em
  seu sistema.
* E, por fim, você também pode **compilar o Ruby a partir do código fonte**.

O resumo a seguir lista os métodos de instalação disponíveis
para diferentes necessidades e plataformas:

* [Sistemas de Gerenciamento de Pacotes](#package-management-systems)
  * [Debian, Ubuntu](#apt)
  * [CentOS, Fedora, RHEL](#yum)
  * [Gentoo](#portage)
  * [Arch Linux](#pacman)
  * [macOS](#homebrew)
  * [Solaris, OpenIndiana](#solaris)
  * [Outras Distribuições](#other-systems)
* [Instaladores](#installers)
  * [ruby-build](#ruby-build)
  * [ruby-install](#ruby-install)
  * [RubyInstaller](#rubyinstaller) (Windows)
  * [RailsInstaller e Ruby Stack](#railsinstaller)
* [Gerenciadores](#managers)
  * [chruby](#chruby)
  * [rbenv](#rbenv)
  * [RVM](#rvm)
  * [uru](#uru)
* [Compilando a partir do código fonte](#building-from-source)

## Sistemas de Gerenciamento de Pacotes
{: #package-management-systems}

Se você não pode compilar o seu próprio Ruby e você não quer usar uma
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

### apt (Debian ou Ubuntu)
{: #apt}

O Debian GNU/Linux e o Ubuntu usam o gerenciador de pacotes apt.
Você pode utilizá-lo da seguinte forma:

{% highlight sh %}
$ sudo apt-get install ruby-full
{% endhighlight %}

No momento em que foi escrita esta página, o pacote `ruby-full` fornecia
a versão 2.3.1 do Ruby, que é uma versão estável antiga, tanto no
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

Por padrão, ele tentará instalar as versões 1.9 e 2.0, mas mais versões estão
disponíveis. Para instalar uma versão específica, configure `RUBY_TARGETS`
em seu `make.conf`. Consulte o [website do projeto Ruby do Gentoo][gentoo-ruby]
para mais detalhes.


### pacman (Arch Linux)
{: #pacman}

O Arch Linux utiliza um gerenciador de pacotes chamado pacman.
Para obter o Ruby, apenas faça isso:

{% highlight sh %}
$ sudo pacman -S ruby
{% endhighlight %}


### Homebrew (macOS)
{: #homebrew}

No OS X Yosemite e Mavericks, o Ruby 2.0 já está incluso. O OS X Mountain Lion,
Lion e Snow Leopard vêm com o Ruby 1.8.7.

Muitas pessoas no macOS usam o [Homebrew][homebrew] como gerenciador de pacotes.
É muito fácil de obter uma versão mais nova do Ruby usando o Homebrew:

{% highlight sh %}
$ brew install ruby
{% endhighlight %}

Este comando deve instalar a versão mais recente do Ruby.

### Ruby no Solaris e OpenIndiana
{: #solaris}

O Ruby 1.8.7 está disponível do Solaris 8 até o Solaris 10 no
[Sunfreeware][sunfreeware] e o Ruby 1.8.7 está disponível no
Blastwave. O Ruby 1.9.2p0 também está disponível no
[Sunfreeware][sunfreeware], mas está desatualizado.

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
{: #other-systems}

Em outros sistemas, você pode pesquisar por Ruby no repositório de
pacotes do gerenciador da sua distribuição de Linux, ou as
ferramentas de terceiros podem ser a sua escolha certa.


## Instaladores
{: #installers}

Se a versão do Ruby fornecida com o seu sistema ou gerenciador de pacotes estiver
desatualizada, você pode instalar uma mais recentes através de um instalador de
terceiros. Alguns deles também permitem que você instale múltiplas versões no
mesmo sistema; os gerenciadores associados podem te ajudar a alternar entre
diferentes Rubies. Se você planeja utilizar o [RVM](#rvm) como um gerenciador de
versão, você não precisa de um instalador separado, ele vem com o seu próprio.


### ruby-build
{: #ruby-build}

O [ruby-build][ruby-build] é um plugin para o [rbenv](#rbenv) que permite que
você compile e instale diferentes versões do Ruby em diretórios arbitrários. O
ruby-build também pode ser usado como um programa por si só, sem o rbenv. Ele
está disponível para macOS, Linux e outros sistemas operacionais baseados em UNIX.


### ruby-install
{: #ruby-install}

O [ruby-install][ruby-install] permite que você compile e instale diferentes
versões do Ruby em diretórios arbitrários. Também tem um colega, que gerencia
a alternância entre versões do Ruby. Ele está disponível para macOS, Linux e
outros sistemas operacionais baseados em UNIX.


### RubyInstaller
{: #rubyinstaller}

Se você está no Windows, existe um ótimo projeto para ajudá-lo
a instalar o Ruby: [RubyInstaller][rubyinstaller]. Ele te dá
tudo o que você precisa para configurar um ambiente de
desenvolvimento em Ruby completo no Windows.

Apenas baixe, rode e está pronto!


### RailsInstaller e Ruby Stack
{: #railsinstaller}

Se você está instalando o Ruby para usar o Ruby on Rails,
você pode usar os seguintes instaladores:

* [RailsInstaller][railsinstaller],
  que usa o RubyInstaller, mas te dá ferramentas adicionais
  que ajudam no desenvolvimento com Rails. Suporta o OS X e o Windows.
* [Bitnami Ruby Stack][rubystack],
  que fornece um ambiente de desenvolvimento completo para Rails.
  Suporta macOS, Linux, Windows, máquinas virtuais e imagens na nuvem.


## Gerenciadores
{: #managers}

Muitos programadores Ruby utilizam gerenciadores para organizar múltiplas versões
do Ruby. Eles conferem várias vantagens, mas não são suportados oficialmente. No
entanto, suas comunidades são muito prestativas.


### chruby
{: #chruby}

O [chruby][chruby] permite que você alterne entre múltiplos Rubies. O chruby
pode gerenciar os Rubies instalados através do [ruby-install](#ruby-install) ou
até mesmo compilados a partir do código fonte.


### rbenv
{: #rbenv}

O [rbenv][rbenv] permite que você gerencie múltiplas instalações
do Ruby. Ele não suporta a instalação do Ruby, mas existe um
plugin popular chamado [ruby-build](#ruby-build) para isso. Ambas estas
ferramentas estão disponíveis para macOS, Linux ou outros
sistemas operacionais do tipo UNIX.


### RVM ("Ruby Version Manager")
{: #rvm}

O [RVM][rvm] permite que você instale e gerencie múltiplas
instalações do Ruby em seu sistema. Ele também permite
gerenciar diferentes gemsets. Também está disponível para
macOS, Linux ou outros sistemas operacionais do tipo UNIX.


### RVM 4 Windows
{: #rvm-windows}

O [RVM 4 Windows][rvm-windows] permite-lhe instalar e gerir múltiplas
instalações de Ruby no Windows. É um clone do RVM original e suporta
a linha de comando clássica, bem como o Powershell, fornecendo a mesma
interface de linha de comando que o RVM original.


### uru
{: #uru}

O [Uru][uru] é uma ferramenta de linha de comando leve e multi-plataforma, que
te ajuda a usar múltiplas versões do Ruby em sistemas macOS, Linux e Windows.


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
[rvm-windows]: https://github.com/magynhard/rvm-windows#readme
[rbenv]: https://github.com/rbenv/rbenv#readme
[ruby-build]: https://github.com/rbenv/ruby-build#readme
[ruby-install]: https://github.com/postmodern/ruby-install#readme
[chruby]: https://github.com/postmodern/chruby#readme
[uru]: https://bitbucket.org/jonforums/uru
[rubyinstaller]: https://rubyinstaller.org/
[railsinstaller]: http://railsinstaller.org/
[rubystack]: http://bitnami.com/stack/ruby/installer
[sunfreeware]: http://www.sunfreeware.com
[openindiana]: http://openindiana.org/
[opensolaris-pkg]: http://opensolaris.org/os/project/pkg/
[gentoo-ruby]: http://www.gentoo.org/proj/en/prog_lang/ruby/
[homebrew]: http://brew.sh/
