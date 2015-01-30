---
layout: page
title: "Download Ruby"
lang: pt
---

Aqui pode receber as últimas distribuições de Ruby nos seus sabores
preferidos. A versão actual e estável é a {{ site.downloads.stable.version }}.
Por favor certifique-se que leu a [Licença Ruby][license].
{: .summary}

### Código-Fonte do Ruby

Instalar pelo código fonte é uma boa solução para quando estiver
suficientemente confortável com a sua plataforma ou por ventura
necessite de configurações específicas para o seu ambiente. É
eventualmente também uma boa solução porque pode não haver pacotes
pré-construídos para a sua plataforma.

* [Ruby {{ site.downloads.stable.version }}][stable-gz]
  (sha256:&nbsp;{{ site.downloads.stable.sha256.gz }}) Stable (*recommended*)
* [Snapshot Estável][stable-snapshot-gz] Ficheiros compactados em tar e gzip do último
  CVS estável. Deverá ser melhor que o última distribuição estável.
* [Snapshot Nocturno][nightly-gz] Ficheiros compactados em tar e gzip do último
  CVS. Pode conter problemas por resolver.

Para informações sobre o repositório CVS de Ruby, veja a nossa página
[Ruby core](/pt/community/ruby-core/) .

### Ruby Em Windows

A plataforma Windows tem inúmeras opções para instalar o Ruby. A
primeira opção é simplesmente instalar o binário compilado. A segunda é
utilizar o “instalador rápido” (*one-click installer*). Se não tem a
certeza sobre como instalar o Ruby, o “instalador rápido” deverá ser a
melhor opção. ( Adicionalmente ao Ruby, o “instalador rápido” vem também
com um conjunto adicional de bibliotecas agregadas.)

* [Ruby 1.8.6-p398 RubyInstaller][5]
  (md5:&nbsp;233d6b3ddc4c61436b075b51254cd138) Versão Estável
* [Ruby 1.8.7-p334 RubyInstaller][6]
  (md5:&nbsp;64e30e63e16028282fcfe3ec57b561dc) Versão Estável (*recomendada*)
* [Ruby 1.9.1-p430 RubyInstaller][7]
  (md5:&nbsp;86ac589a955898c3163b161d81750a05) Versão Estável
* [Ruby 1.9.2-p180 RubyInstaller][8]
  (md5:&nbsp;2c94aef50987416d64c85a4ea0fa428b) Versão Estável (*recomendada*)
* [Ruby 1.8.7-p249 Binary][9]
  (md5:&nbsp;4fd37b0b4b21a042cae7f5f0a8daad16) Versão Estável
* [Ruby 1.9.1-p378 Binary][10]
  (md5:&nbsp;7d14a918cc8d243d3e2c409aff41f454) Versão Estável

Note que ao utilizar os binários acima indicados será necessário
descarregar e instalar manualmente componentes adicionais detalhados
nesta [página][11]. Por favor assegure-se que seguiu estes passos antes
de reportar um *bug*.

O [RubyInstaller][12] não precisa destas tarefas adicionais.

Investigue, também, a utilização do [pik][13] já que facilita o processo
de instalação e manutenção de versões concorrentes de ruby e gemas no
Windows.

### Ruby Em Linux

Dependendo da distribuição que está a utilizar, existem inúmeras
maneiras para instalar Ruby. A primeira opção é simplesmente fazer o
download do código fonte (em baixo) e compila-lo manualmente. No
entanto, em algumas plataformas, há gestores de pacotes que tornam a
instalação do Ruby extremamente fácil.

Por exemplo, o Debian ou Ubunto `apt-get` providenciam uma solução
simples e elegante:

{% highlight sh %}
$ sudo apt-get install ruby irb rdoc
{% endhighlight %}

Para o irb e rdoc vamos necessitar de activar o repositório universal.

### Ruby em Mac OS X

Existem várias opções na plataforma Macintosh OS X para instalar a
última versão do Ruby. [Locomotive][14] é uma boa escolha se está à
procura de algo que o coloque a programar Rails rapidamente. Usar o
[MacPorts][15] ou [Fink][16] pode ser um pouco melhor para os técnicos
mais experientes.

No DarwinPorts, pode instalar o Ruby com…

{% highlight sh %}
$ port install ruby
{% endhighlight %}

O Fink tem uma interface gráfica (utilizando o “Fink Commander”) para
instalar o Ruby.

Uma vez que o OS X é baseado em Unix, é possível também fazer download e
instalar pelo código-fonte, sendo assim uma solução simples e eficaz
como as outras.

Para uma vista detalhada sobre a instalação de Ruby (e Rails), Dan
Benjamin escreveu um excelente artigo – [*Building Ruby, Rails,
LightTPD, and MySQL on Tiger*][17] – e é ideal para começar a trabalhar
muito rapidamente.

\_Nota: Ruby 1.8.x juntamente com Rails deverá vir pré-instalado com a
seguinte distribuição do Mac OS X, Leopard (em beta neste momento).
([Mais informações aqui][18]) Felizmente, no momento em que o Leopard
arrancar, este irá “simplesmente funcionar” logo depois da instalação.\_

### RVM

Investigue, também, a utilização do [rvm][19], dado que agiliza o
processo de instalação e manutenção de versões concorrentes de ruby e
gemas. Este é o método preferido de muitos programadores de Ruby que
necessitam de testar as suas aplicações em ambientes diversos.



[license]: {{ site.license.url }}
[stable-gz]:   {{ site.downloads.stable.url.gz }}
[stable-snapshot-gz]: {{ site.downloads.stable_snapshot.url.gz }}
[nightly-gz]: {{ site.downloads.nightly_snapshot.url.gz }}
[5]: http://rubyforge.org/frs/download.php/71066/rubyinstaller-1.8.6-p398.exe
[6]: http://rubyforge.org/frs/download.php/74293/rubyinstaller-1.8.7-p334.exe
[7]: http://rubyforge.org/frs/download.php/72075/rubyinstaller-1.9.1-p430.exe
[8]: http://rubyforge.org/frs/download.php/74298/rubyinstaller-1.9.2-p180.exe
[9]: http://ftp.ruby-lang.org/pub/ruby/binaries/mswin32/ruby-1.8.7-p249-i386-mswin32.zip
[10]: http://ftp.ruby-lang.org/pub/ruby/binaries/mswin32/ruby-1.9.1-p378-i386-mswin32.zip
[11]: http://www.garbagecollect.jp/ruby/mswin32/en/documents/install.html
[12]: http://rubyinstaller.org/
[13]: http://github.com/vertiginous/pik
[14]: http://locomotive.raaum.org/
[15]: http://www.macports.org/
[16]: http://fink.sourceforge.net/
[17]: http://hivelogic.com/articles/ruby_rails_lighttpd_mysql_tiger
[18]: http://weblog.rubyonrails.org/2006/8/7/ruby-on-rails-will-ship-with-os-x-10-5-leopard
[19]: https://rvm.beginrescueend.com/rvm
