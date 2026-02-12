---
layout: news_post
title: "Sortie de la version 2.1.0-preview2 de Ruby"
author: "nurse"
translator: "Bruno Michel"
date: 2013-11-22 22:00:00 +0000
lang: fr
---

Nous sommes heureux de vous annoncer la sortie de Ruby 2.1.0-preview2.
Vous êtes invités à tester les nouvelles fonctionnalités de cette seconde
preview, dans la perspective d'une version 2.1 finale !

## Changements notables depuis la preview 1

* correction d'[un dépassement du tas pour l'interprétation des nombres à virgule flottante (CVE-2013-4164)](https://www.ruby-lang.org/fr/news/2013/11/22/heap-overflow-in-floating-point-parsing-cve-2013-4164/)
* optimisation de "literal".freeze [#9042](https://bugs.ruby-lang.org/issues/9042)
* retrait du suffixe f pour les littéraux chaînes de caractères [#9042](https://bugs.ruby-lang.org/issues/9042)
* correction du problème de consommation mémoire avec RGenGC ([r43532](https://git.ruby-lang.org/ruby.git) et [r43755](https://git.ruby-lang.org/ruby.git))
* ajout de Exception#cause [#8257](https://bugs.ruby-lang.org/issues/8257)
* mise à jour de diverses bibliothèques, telles que json, nkf, rake, RubyGems ou encore RDoc.

## Téléchargement

* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview2.tar.bz2](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview2.tar.bz2)

      SIZE:   11432454 bytes
      MD5:    9d566a9b2d2e7e35ad6125e2a14ce672
      SHA256: 780fddf0e3c8a219057d578e83367ecfac5e945054b9f132b3b93ded4802d1ce

* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview2.tar.gz](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview2.tar.gz)

      SIZE:   14416029 bytes
      MD5:    ba2b95d174e156b417a4d580a452eaf5
      SHA256: a9b1dbc16090ddff8f6c6adbc1fd0473bcae8c69143cecabe65d55f95f6dbbfb

* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview2.zip](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview2.zip)

      SIZE:   16110720 bytes
      MD5:    2ad1aa3d89ae32607cf14fc73b192de1
      SHA256: cc2f7f8e05daed716489e5480e6365a711a13ed7747dbc59e989a41fe2805076

## Modifications depuis la version 2.0

Les modifications les plus notables sont :

* VM (method cache)
* RGenGC (regardez [la présentation de ko1 à RubyKaigi](http://rubykaigi.org/2013/talk/S73) et [sa présentation à RubyConf 2013](http://www.atdot.net/~ko1/activities/rubyconf2013-ko1_pub.pdf))
* Refinements [#8481](https://bugs.ruby-lang.org/issues/8481) [#8571](https://bugs.ruby-lang.org/issues/8571)
* changements de syntaxe
  * littéraux pour Rational/Complex [#8430](https://bugs.ruby-lang.org/issues/8430)
  * la valeur de retour pour def [#3753](https://bugs.ruby-lang.org/issues/3753)
* Bignum
  * utilisation d'entiers sur 128 bits [#8509](https://bugs.ruby-lang.org/issues/8509)
  * utilisation de GMP [#8796](https://bugs.ruby-lang.org/issues/8796)
* String#scrub [#8414](https://bugs.ruby-lang.org/issues/8414)
* Socket.getifaddrs [#8368](https://bugs.ruby-lang.org/issues/8368)
* RDoc 4.1.0.preview.2 et RubyGems 2.2.0.preview.2

Pour plus de détails sur les changements :
[NEWS dans le dépôt ruby (WIP)](https://github.com/ruby/ruby/blob/v2_1_0_preview2/NEWS).

ko1 a parlé des nouveautés de Ruby 2.1 à toruby : [All about Ruby 2.1](http://www.atdot.net/~ko1/activities/toruby05-ko1.pdf)

Konstantin Haase (@konstantinhaase) a produit un bon résumé dans ce billet de blog : [What's new in Ruby 2.1?](http://rkh.im/ruby-2.1).

## Commentaire sur cette version

Les problèmes connus sont listés sur :

[https://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=102](https://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=102)

Vous pouvez aussi suivre l'avancement du planning et d'autres informations sur :

[https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering210](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering210)
