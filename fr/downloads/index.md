---
layout: page
title: "Télécharger Ruby"
lang: fr
---

{% include out-of-date.html %}

Vous pouvez obtenir sur cette page les dernières versions de Ruby. La
version stable actuelle est la {{ site.data.downloads.stable[0] }}.
N’oubliez pas de consulter la [licence Ruby][license].
{: .summary}

### Comment installer Ruby ?

Pour installer Ruby, les principales plateformes proposent un ensemble
d'outils spécifiques :

* Sur Linux/UNIX, vous pouvez utiliser le système de gestion des
  paquets de votre distribution ou des outils tiers ([rbenv][rbenv] et [RVM][rvm]).
* Sur les machines macOS, vous pouvez utiliser des outils tiers ([rbenv][rbenv] et [RVM][rvm]).
* Sur les machines Windows, vous pouvez utiliser [RubyInstaller][rubyinstaller].

Voir la page d'[Installation][installation] pour les détails sur l'usage des
systèmes de gestion de paquets ou outils tiers.

Bien sûr, vous pouvez aussi installer Ruby à partir des sources pour toutes
les plateformes majeures.

### Compiler Ruby — Code source

Installer Ruby à partir des sources est une bonne solution pour celles et ceux
qui sont suffisamment à l’aise avec leur plateforme et qui souhaitent peut-être
une configuration spécifique pour leur environnement. C’est également une bonne
solution dans le cas où aucun autre paquet « tout compris » n’existe pour
votre plateforme.

Voir la page d'[Installation][installation] pour les détails de compilation de
Ruby à partir des sources. Si vous rencontrez des difficultés en compilant Ruby,
envisagez d'utiliser l'un des outils tiers mentionnés plus haut. Ils pourront
peut-être vous aider.

* **Dernière version stable :**
  Ruby {{ site.data.downloads.stable[0] }}

* **Snapshots :**
  * [Stable Snapshot]({{ site.data.downloads.stable_snapshot.url.gz }}):
    Archive de la dernière version publiée à partir de la branche stable courante.
  * [Nightly Snapshot]({{ site.data.downloads.nightly_snapshot.url.gz }}):
    Archive construite chaque nuit à partir du code le plus récent présent sur SVN.
    Comporte probablement des bugs ou d'autres problèmes, utilisez-la en connaissance de cause !

Pour plus d’information sur le dépôt Subversion de Ruby, voyez la page
[Ruby Core](/fr/community/ruby-core/).

Les sources de Ruby sont disponibles depuis des [miroirs][mirrors] répartis dans le monde.
Utilisez s'il-vous-plaît un miroir proche de vous.



[license]: {{ site.license.url }}
[installation]: /fr/documentation/installation/
[mirrors]: /en/downloads/mirrors/
[rvm]: http://rvm.io/
[rbenv]: https://github.com/rbenv/rbenv
[rubyinstaller]: https://rubyinstaller.org/
