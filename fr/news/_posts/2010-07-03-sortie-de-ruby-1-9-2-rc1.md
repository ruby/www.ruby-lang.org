---
layout: news_post
title: "Sortie de Ruby 1.9.2 RC1"
author: "Jean-Denis Vauguet"
lang: fr
---

Ruby 1.9.2 RC1 vient de sortir. Il s\'agit de la première *release
candidate* pour la branche 1.9.2.

## À propos de Ruby 1.9.2

Ruby 1.9.2 sera globalement rétro-compatible avec la branche 1.9.1, à
l\'exception des points suivants :

* de nombreuses *nouvelles* méthodes ;
* une nouvelle API pour les sockets (avec support IPv6) ;
* toute [une partie encodage][1] ;
* une classe `Random` proposant plusieurs générateurs de nombres
  aléatoires ;
* une nouvelle implémentation de `Time` (bug de l\'an 2038 corrigé) ;
* des améliorations sur les expressions régulières ;
* `$:` n\'inclus plus le répertoire courant ;
* `dl` réimplémenté au-dessus de `libffi` ;
* une nouvelle librairie `psych` qui englobe `libyaml`, en remplacement
  natif de `syck`.

Voyez les fichiers [NEWS][2] et [ChangeLog][3] pour plus de détails.

Environ 130 bugs ont été corrigés depuis la version 1.9.2-preview3, dont
tous les majeurs connus, sauf [#3462][4].

Le calendrier actuel donne une sortie de Ruby 1.9.2 début août, ce qui
correspond à un petit retard lié à l\'effort d\'amener la branche 1.9.2
vers un support complet de RubySpec. À l\'heure actuelle, 99% de la
spécification est supportée. Nous vous invitons à tester cette RC et à
exprimer vos retours sur [le bug tracker][5].

## Téléchargement

* [ruby-1.9.2-rc1.tar.bz2][6]
  * SIZE: 8479087 bytes
  * MD5: 242dcfaed8359a6918941b55d0806bf0
  * SHA256: c2a680aa5472c8d04a71625afa2b0f75c030d3655a3063fe364cfda8b33c1480

* [ruby-1.9.2-rc1.tar.gz][7]
  * SIZE: 10779309 bytes
  * MD5: fdedd5b42ae89a9a46797823ad2d9acf
  * SHA256: 3e90036728342ce8463be00d42d4a36de70dabed96216c5f8a26ec9ba4b29537

* [ruby-1.9.2-rc1.zip][8]
  * SIZE: 12158992 bytes
  * MD5: 3da59c5d3567f6e1f1697abbef71f507
  * SHA256: 4f593a3d0873cea8f371a7fc7484cad7bc03acac0ada1970cb9f83a89bc27997



[1]: http://yehudakatz.com/2010/05/17/encodings-unabridged/
[2]: https://git.ruby-lang.org/ruby.git/plain/NEWS?id=refs/tags/v1_9_2_rc1
[3]: https://git.ruby-lang.org/ruby.git/plain/ChangeLog?id=refs/tags/v1_9_2_rc1
[4]: https://bugs.ruby-lang.org/issues/show/3462
[5]: https://bugs.ruby-lang.org/projects/show/ruby-19/
[6]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-rc1.tar.bz2
[7]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-rc1.tar.gz
[8]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-rc1.zip
