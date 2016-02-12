---
layout: page
title: "Télécharger Ruby"
lang: fr
---

Vous pouvez obtenir sur cette page les dernières versions de Ruby. La
version stable actuelle est la {{ site.downloads.stable[0].version }}.
N’oubliez pas de consulter la [licence Ruby][license].
{: .summary}

### Comment installer Ruby ?

Pour installer Ruby, les principales plateformes proposent un ensemble
d'outils spécifiques :

* Sur Linux/UNIX, vous pouvez utiliser le système de gestion des
  paquets de votre distribution ou des outils tiers (rbenv et RVM).
* Sur les machines OS X, vous pouvez utiliser des outils tiers (rbenv et RVM).
* Sur les machines Windows, vous pouvez utiliser RubyInstaller.

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
  [Ruby {{ site.downloads.stable[0].version }}]({{ site.downloads.stable[0].url.gz }})<br>
  sha256: {{ site.downloads.stable[0].sha256.gz }}

* **Version stable précédente :**
  [Ruby {{ site.downloads.stable[1].version }}]({{ site.downloads.stable[1].url.gz }})<br>
  sha256: {{ site.downloads.stable[1].sha256.gz }}

* **Anciennes versions stables:**
  [Ruby {{ site.downloads.stable[2].version }}]({{ site.downloads.stable[2].url.gz }})<br>
  sha256: {{ site.downloads.stable[2].sha256.gz }}

* **Snapshots :**
  * [Stable Snapshot]({{ site.downloads.stable_snapshot.url.gz }}):
    Archive de la dernière version publiée à partir de la branche stable courante.
  * [Nightly Snapshot]({{ site.downloads.nightly_snapshot.url.gz }}):
    Archive construite chaque nuit à partir du code le plus récent présent sur SVN.
    Comporte probablement des bugs ou d'autres problèmes, utilisez-la en connaissance de cause !

Pour plus d’information sur le dépôt Subversion de Ruby, voyez la page
[Ruby Core](/fr/community/ruby-core/).

Les sources de Ruby sont disponibles depuis des [miroirs][mirrors] répartis dans le monde.
Utilisez s'il-vous-plaît un miroir proche de vous.



[license]: {{ site.license.url }}
[installation]: /fr/documentation/installation/
[mirrors]: /en/downloads/mirrors/
