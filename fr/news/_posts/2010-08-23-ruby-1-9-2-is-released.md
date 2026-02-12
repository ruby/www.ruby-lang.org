---
layout: news_post
title: "Sortie de Ruby 1.9.2"
author: "Bruno Michel"
lang: fr
---

Ruby 1.9.2 vient de sortir. Il s\'agit de la dernière version de la branche Ruby 1.9.

### À propos de Ruby 1.9.2

Ruby 1.9.2 est compatible avec Ruby 1.9.1, à l\'exception de changements
suivants :

* De nombreuses nouvelles méthodes
* Une nouvelle API pour la classe Socket (avec une prise en charge
  améliorée pour IPv6)
* De nouveaux encodages
* Une classe Random, avec plusieurs générateurs de nombres aléatoires
* La classe Time a été réimplémentée. Cela corrige le bug de l’an 2038.
* Quelques améliorations pour les expressions rationnelles
* $: n’inclut plus le répertoire courant.
* dl a été réécrit par dessus libffi.
* Nouvelle bibliothèque psych, qui encapsule la libyaml. Vous pouvez
  l’utiliser à la place de syck.

Voyez les fichiers [NEWS][1] et [ChangeLog][2] pour plus de détails.

Ruby 1.9.2 passe avec succès plus de 99% de [RubySpec][3].

### Les plateformes supportées

Ruby 1.9 a 4 niveaux de support.

Supporté
: Nous avons vérifié que Ruby 1.9.2 fonctionne correctement dessus. Et
  nous continuerons de maintenir Ruby 1.9.2 dessus.

  * Debian GNU/Linux 5.0 sur IA32.

Best Effort
: Nous avons vérifié que Ruby 1.9.2 fonctionne généralement correctement
  dessus. Et nous croyons pouvoir maintenir Ruby 1.9.2 dessus.

  * mswin32, x64-mswin64, mingw32
  * MacOS X 10.5 (Intel) et 10.6
  * FreeBSD version 6 et suivantes (amd64, IA32)
  * Solaris 10
  * Symbian OS

Peut-être
: Ruby 1.9.2 fonctionne probablement bien dessus, mais ce n\'est pas
  vérifié. Les patchs sont la bienvenue.

  * Les autres distributions Linux
  * Les autres versions de MacOS X.
  * cygwin
  * AIX 5
  * Les autres systèmes compatibles POSIX
  * BeOS (Haiku)

Pas supporté
: Ruby 1.9.2 ne fonctionne probablement pas dessus. Un portage est le
  bienvenu.

  * N\'importe quel autre système

### FAQ

La bibliothèque standard est installée dans /usr/local/lib/ruby/1.9.1
: Ce numéro de version correspond à la \"version de comptabilité de la
  bibliothèque\". Ruby 1.9.2 est quasiment compatible avec Ruby 1.9.1,
  sa bibliothèque est donc installée dans ce répertoire.

J\'obtiens une erreur de type LoadError
: `$:` n\'inclut plus le répertoire coutant. Certains scripts
  nécessitent donc d\'être modifiées pour fonctionner correctement. De
  toute façon, votre script devrait dépendre le moins possible du
  répertoire courant.

### Téléchargement

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p0.tar.bz2&gt;][4]
  SIZE
  : 8495472 bytes

  MD5
  : d8a02cadf57d2571cd4250e248ea7e4b

  SHA256
  : e9710990ed8c2e794123aba509010471915fb13c27dae0118831d2001a9c8d3b

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p0.tar.gz&gt;][5]
  SIZE
  : 10787899 bytes

  MD5
  : 755aba44607c580fddc25e7c89260460

  SHA256
  : 8c0c4e261a921b5c406bf9e76ac23bf3c915651534e9d1b9e8c5d0bee4a7285c

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p0.zip&gt;][6]
  SIZE
  : 12159728 bytes

  MD5
  : e57a393ccd62ddece4c63bd549d8cf7f

  SHA256
  : e61521af06da71fde9f0c7c08baaf7415614d00c86ec5a7ab08b60a4f3185b2a



[1]: https://git.ruby-lang.org/ruby.git/plain/NEWS?id=refs/tags/v1_9_2_0
[2]: https://git.ruby-lang.org/ruby.git/plain/ChangeLog?id=refs/tags/v1_9_2_0
[3]: https://github.com/ruby/spec
[4]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p0.tar.bz2
[5]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p0.tar.gz
[6]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p0.zip
