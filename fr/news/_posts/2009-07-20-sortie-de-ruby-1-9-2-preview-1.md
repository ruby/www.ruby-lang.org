---
layout: news_post
title: "Sortie de Ruby 1.9.2 preview 1"
author: "Jean-Denis Vauguet"
lang: fr
---

Ruby 1.9.2 preview 1 vient de sortir.

Il s\'agit d\'une pré-version pour la série 1.9.2, en somme un snapshot
de la branche de développement actuelle. À ce titre, il existe encore
des bugs qui rendent cette version instable. N\'hésitez pas à participer
à leur résolution. Au programme :

* L\'aspect objet de l\'API Socket a été renforcé.
* Le module Time a été réécrit et amélioré : les valeurs minimale et
  maximale ont disparues, et le problème de l\'an 2038 pour les dates
  (Unix Millennium bug) n\'en est plus un.
* Ajout d\'une nouvelle classe Random pour la génération de séquences
  aléatoires de nombres.
* Pour les utilisateurs de merb : Method#parameters fait son apparition.

Voyez le fichier [NEWS][1] et le [ChangeLog][2] pour plus de détails.

#### Télécharger

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-preview1.tar.bz2&gt;][3]
  TAILLE
  : 7487008 bytes

  MD5
  : 0b8f27ea78afcdc54d5d23e569aa0150

  SHA256
  : 0681204e52207153250da80b3cc46812f94107807458a7d64b17554b6df71120

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-preview1.tar.gz&gt;][4]
  TAILLE
  : 9422226 bytes

  MD5
  : e2b8cdbf300f53472be09699a5837fd1

  SHA256
  : 7f29ab3b1d5f0074bb82a6bf398f1cacd42fe508a17fc14844560c4d906786b6

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-preview1.zip&gt;][5]
  TAILLE
  : 10741739 bytes

  MD5
  : 253b5845e4b0f8250ae79c328b94e049

  SHA256
  : cb132277476856535ee31e85929a3041877b0912868b7f64d1cf911a79463cdf



[1]: https://git.ruby-lang.org/ruby.git/plain/NEWS?id=master
[2]: https://git.ruby-lang.org/ruby.git/plain/ChangeLog?id=master
[3]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-preview1.tar.bz2
[4]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-preview1.tar.gz
[5]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-preview1.zip
