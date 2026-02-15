---
layout: news_post
title: "Sortie de Ruby 1.9.3 preview1"
author: "Jean-Denis Vauguet"
lang: fr
---

Ruby 1.9.3 preview1 vient de sortir. Il s\'agit du premier aperçu de la
prochaine version de Ruby, il subsiste donc encore quelques problèmes
mineurs qui seront corrigés pour la prochaine release, Ruby 1.9.3-p0.

Voyez le [ChangeLog][1] et le fichier
[NEWS](URL:https://github.com/ruby/ruby/blob//v1_9_3_preview1/NEWS)
pour plus de détails.

Ruby Inside a publié une [revue de détail][2] de cette preview.

## Téléchargements

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-preview1.tar.bz2&gt;][3]
  SIZE: 9507455 bytes
  MD5: 7d93dc773c5824f05c6e6630d8c4bf9b
  SHA256: a15d7924d74a45ffe48d5421c5fc4ff83b7009676054fa5952b890711afef6fc

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-preview1.tar.gz&gt;][4]
  SIZE: 12186410 bytes
  MD5: 0f0220be4cc7c51a82c1bd8f6a0969f3
  SHA256: 75c2dd57cabd67d8078a61db4ae86b22dc6f262b84460e5b95a0d8a327b36642

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-preview1.zip&gt;][5]
  SIZE: 13696708 bytes
  MD5: 960e08b2dc866c9987f17d0480de63a1
  SHA256: 249483f88156b4ae65cd45742c6f6316660f793b78739657596c63b86f76aaeb

## Nouveautés

Les précédentes versions de Ruby étaient publiées sous une double
licence GPLv2 et Ruby License. Désormais, Ruby sera publié sous double
licence Ruby License et « 2-clause BSDL » (une version simplifiée de la
licence BSD).

### Encodage

SJIS changed to alias for Windows-31J, instead of Shift\_JIS.

### Librairie standard

* io/console: ajout de fonctionnalités IO sur les instances.
* openssl, réécriture
* test/unit: ajout du support des tests parallèles

### Autres changements

* Les modules Pathname et Date ont été réimplémentés.
* Modification relatives au VM locking.



[1]: https://github.com/ruby/ruby/blob//v1_9_3_preview1/ChangeLog
[2]: http://www.rubyinside.com/ruby-1-9-3-preview-1-released-5229.html
[3]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-preview1.tar.bz2
[4]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-preview1.tar.gz
[5]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-preview1.zip
