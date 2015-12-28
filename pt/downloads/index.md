---
layout: page
title: "Baixar o Ruby"
lang: pt
---

Aqui você poderá obter as distribuições mais recentes de Ruby em seus sabores
preferidos. A versão estável atual é a {{ site.downloads.stable.version }}.
Por favor certifique-se de ter lido a [Licença do Ruby][license].
{: .summary}

### Formas de instalar o Ruby

Existem diversas ferramentas para instalar o Ruby em cada grande plataforma:

* No Linux/UNIX, você pode usar o sistema de gerenciamento de pacotes da
  sua distribuição ou ferramentas de terceiros (rbenv e RVM).
* Em máquinas com OS X, você pode usar ferramentas de terceiros (rbenv e RVM).
* Em máquinas com Windows, você pode usar o RubyInstaller ou o pik.

Consulte a página [Instalação][installation] para mais detalhes sobre
como usar sistemas de gerenciamento de pacotes ou ferramentas de terceiros.

É claro, você também pode instalar Ruby a partir do código fonte em todas
as principais plataformas.

### Compilando Ruby — Código Fonte

Instalar a partir do código-fonte é uma grande solução para quando você
estiver confortável o suficiente com a sua plataforma e talvez precise
de configurações específicas para o seu ambiente. Também é uma boa solução
quando não houver outros pacotes pré-criados para a sua plataforma.

Consulte a página [Instalação][installation] para detalhes sobre
como compilar Ruby a partir dos fontes. Se você tiver algum problema
compilando Ruby, considere utilizar uma das ferramentas de terceiros
mencionadas acima. Elas podem te ajudar.

* **Versão estável atual:**
  [Ruby {{ site.downloads.stable.version }}][stable-gz]<br>
  sha256: {{ site.downloads.stable.sha256.gz }}

* **Versão estável anterior:**
  [Ruby {{ site.downloads.previous.version }}][previous-gz]<br>
  sha256: {{ site.downloads.previous.sha256.gz }}

* **Versão estável antiga:**
  [Ruby {{ site.downloads.old.version }}][old-gz]<br>
  sha256: {{ site.downloads.old.sha256.gz }}

* **Snapshots:**
  * [Snapshot Estável][stable-snapshot-gz]:
    Este é um arquivo compactado com o snapshot mais recente do branch estável.
  * [Nightly Snapshot][nightly-gz]:
    Este é um arquivo compactado do que está no SVN, criado todas as noites.
    Ele pode conter bugs ou outros problemas, use por sua própria conta e risco!

Para mais informações sobre os repositórios Subversion e Git do Ruby, consulte
a nossa página [Núcleo do Ruby](/pt/community/ruby-core/).

O código fonte do Ruby está disponível a partir de um conjunto de
[Sites de _Mirror_][mirrors] pelo mundo afora. Por favor tente
usar um _mirror_ que está próximo de você.



[license]: {{ site.license.url }}
[installation]: /pt/documentation/installation/
[stable-gz]: {{ site.downloads.stable.url.gz }}
[previous-gz]: {{ site.downloads.previous.url.gz }}
[old-gz]: {{ site.downloads.old.url.gz }}
[stable-snapshot-gz]: {{ site.downloads.stable_snapshot.url.gz }}
[nightly-gz]: {{ site.downloads.nightly_snapshot.url.gz }}
[mirrors]: /en/downloads/mirrors/
