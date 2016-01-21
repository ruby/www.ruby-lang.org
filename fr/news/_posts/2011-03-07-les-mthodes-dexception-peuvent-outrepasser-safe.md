---
layout: news_post
title: "Les méthodes d'exception peuvent outrepasser $SAFE"
author: "Jean-Denis Vauguet"
lang: fr
---

`Exception#to_s` peut être utilisée pour contourner les vérifications
liées à `$SAFE`, ce qui permet à de modifier toute chaîne de caractères.

### Description du problème

Ruby met à disposition un flag numérique `$SAFE`, dont le niveau 4
signifie l\'autorisation d\'exécuter du code tiers (par exemple, un
plugin). Les niveaux supérieurs font des vérifications supplémentaires
pour empêcher ce comportement et protéger les données internes.

`Exception#to_s` comporte une vulnérabilité qui permet de contourner ces
vérifications, ce qui rend possible la corruption de chaîne de
caractères pure. Un exemple du mécanisme serait le suivant :

    $secret_path = "foo"

    proc do
        $SAFE = 4
        Exception.new($secret_path).to_s
        $secret_path.replace "/etc/passwd"
    end.call

    open($secret_path) do
      ...
    end

### Versions touchées

Cette vulnérabilité ne touche pas les branches 1.9.x. Les versions
affectées sont :

* Ruby 1.8.6 patchlevel 420 et toutes les versions précédentes
* Ruby 1.8.7 patchlevel 330 et toutes les versions précédentes
* Les versions de développement de Ruby 1.8 (1.8.8dev)

### Solutions

Les utilisateurs concernés sont encouragés à mettre à jour leur
installation de Ruby.

### Mises-à-jour

* 1\.8.7-334 corrige cette faille. Les utilisateurs de la branche 1.8.7
  sont invités à l\'installer.
  * [https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p334.tar.gz][1]
  * [https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p334.tar.bz2][2]
  * [https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p334.zip][3]



[1]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p334.tar.gz
[2]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p334.tar.bz2
[3]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p334.zip
