---
layout: page
title: "Baixar Ruby"
lang: pt
---

Aqui você pode obter as últimas distribuições de Ruby em seu sabor favorito.
A versão estável atual é {{ site.downloads.stable.version }}.
Por favor certifique-se que leu a [Licença de Ruby][license].
{: .summary}

### Maneiras de instalar o Ruby

Temos várias ferramentas em cada plataforma principal para instalar Ruby:

* No Linux / UNIX, você pode usar o sistema de gerenciamento de pacotes seu
  de distribuição ou de terceiros ferramentas (rbenv e RVM).
* Em máquinas OS X, você pode usar ferramentas de terceiros (rbenv e RVM).
* Em máquinas Windows, você pode usar RubyInstaller.

Veja a página de [instalação][instalação] para detalhes sobre como usar
sistemas de gestão de pacotes ou ferramentas de terceiros.

É claro, você também pode instalar o Ruby partir do código fonte em todas as principais plataformas.

### Compilando Ruby - De Código-Fonte do Ruby

Instalando a partir do código-fonte é uma ótima solução para quando você estiver suficientemente confortável com a sua plataforma e talvez precisar de configurações específicas para o seu ambiente. É também uma boa solução para o caso de não há outros pacotes pré-construídos para a sua plataforma.

Veja a página de [Instalação][instalação] para obter detalhes sobre a construção Ruby a partir de fonte. Se você tiver um problema compilando Ruby, considere o uso de uma das ferramentas de terceiros mencionados acima. Eles podem ajudá-lo.

* ** Estável atual: **
  [Rubi {{site.downloads.stable.version}}][estável-gz] <br>
  sha256: {{}} site.downloads.stable.sha256.gz

* ** Estável Anterior: **
  [Rubi {{site.downloads.previous.version}}][previous-gz] <br>
  sha256: {{}} site.downloads.previous.sha256.gz

* ** Estável Velho (2.0.0 série): **
  [Rubi {{site.downloads.previous20.version}}][anterior20-gz] <br>
  sha256: {{}} site.downloads.previous20.sha256.gz

* ** Snapshots: **
  * [Snapshot Stable][estável-snapshot-gz]:
    Este é um pacote com o último snapshot do ramo estável atual.
  * [Nocturno Snapshot][nocturno-gz]:
    Este é um pacote com tudo o que está no SVN, feita todas as noites.
    Isto pode conter bugs ou outros problemas, use a seu próprio risco!

Para obter informações sobre os repositórios Rubi Subversion e Git, ver o nosso
(/ En / / ruby-core comunidade /) página [Núcleo de Ruby].

A fonte do Ruby está disponível a partir de um conjunto mundial de
[Espelho Sites][espelhos].
Por favor, tente usar um espelho que está perto de você.


[license]: {{ site.license.url }}
[instalação]: /en/documentation/installation/
[estável-gz]: {{ site.downloads.stable.url.gz }}
[previous-gz]: {{ site.downloads.previous.url.gz }}
[anterior20-gz]: {{ site.downloads.previous20.url.gz }}
[estável-snapshot-gz]: {{ site.downloads.stable_snapshot.url.gz }}
[nocturno-gz]: {{ site.downloads.nightly_snapshot.url.gz }}
[espelhos]: /en/downloads/mirrors/