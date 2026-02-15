---
layout: news_post
title: "Sortie de Ruby 1.9.2 RC2"
author: "Jean-Denis Vauguet"
lang: fr
---

Ruby 1.9.2 RC2 vient de sortir. Il s\'agit de la seconde *release
candidate* pour la branche 1.9.2 de Ruby, la future version stable.

La librairie psych s\'est vue apporter des corrections. Quelques bugs
mineurs ont par ailleurs été fixés.

Voyez les fichiers [NEWS][1] et [ChangeLog][2] pour plus de détails.

## À propos de Ruby 1.9.2

Ruby 1.9.2 sera globalement rétro-compatible avec la branche 1.9.1, à
l\'exception des points suivants :

* de nombreuses *nouvelles* méthodes ;
* une nouvelle API pour les sockets (avec support IPv6) ;
* toute [une partie encodage][3] ;
* une classe `Random` proposant plusieurs générateurs de nombres
  aléatoires ;
* une nouvelle implémentation de `Time` (bug de l\'an 2038 corrigé) ;
* des améliorations sur les expressions régulières ;
* `$:` n\'inclus plus le répertoire courant ;
* `dl` réimplémenté au-dessus de `libffi` ;
* une nouvelle librairie `psych` qui englobe `libyaml`, en remplacement
  natif de `syck`.

Ruby 1.9.2 est maintenant rendue au niveau de stabilité que nous
souhaitions.Le calendrier actuel donne une sortie de Ruby 1.9.2 début
août, ce qui correspond à un petit retard lié à l\'effort d\'amener la
branche 1.9.2 vers un support complet de RubySpec. À l\'heure actuelle,
99% de la spécification est supportée. Nous vous invitons à tester cette
RC et à exprimer vos retours sur [le bug tracker][4].

## Téléchargement

* [ruby-1.9.2-rc2.tar.bz2][5]
  * SIZE: 8480974 bytes
  * MD5: 4e4906d0aab711286b31f5a834860cc3
  * SHA256: 692ebae991b104482dc9f0d220c1afb6b690a338b3b815aaa4f62954d2fa1b4a

* [ruby-1.9.2-rc2.tar.gz][6]
  * SIZE: 10781884 bytes
  * MD5: d12cd39eee4d99bc54b52aba5a0ba4e1
  * SHA256: 5d523d99f928705ac1de84ade03283c468415c00f8b6755a8dd7a140828869b4

* [ruby-1.9.2-rc2.zip][7]
  * SIZE: 12161233 bytes
  * MD5: 05229b43981e4e5ce58b5fb2e98eee52
  * SHA256: 33f7f4cdd8444c2594728f70ac07477575a7cba5e7756bd3645f23e52605618c



[1]: https://github.com/ruby/ruby/blob//v1_9_2_rc2/NEWS
[2]: https://github.com/ruby/ruby/blob//v1_9_2_rc2/ChangeLog
[3]: http://yehudakatz.com/2010/05/17/encodings-unabridged/
[4]: https://bugs.ruby-lang.org/projects/show/ruby-19/
[5]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-rc2.tar.bz2
[6]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-rc2.tar.gz
[7]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-rc2.zip
