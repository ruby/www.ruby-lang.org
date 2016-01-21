---
layout: news_post
title: "Vulnérabilité  du type symlink race dans FileUtils"
author: "Jean-Denis Vauguet"
lang: fr
---

Une faille de sécurité lié à une vulnérabilité du type *symlink race* a
été découverte dans `FileUtils.remove_entry_secure`. Elle permet à des
utilisateurs locaux de détruire des dossiers et fichiers.

### Versions touchées

* Ruby 1.8.6 patchlevel 420 et toutes les versions précédentes
* Ruby 1.8.7 patchlevel 330 et toutes les versions précédentes
* Versions de développement de Ruby 1.8 (1.8.8dev)
* Ruby 1.9.1 patchlevel 430 et toutes les versions précédentes
* Ruby 1.9.2 patchlevel 136 et toutes les versions précédentes
* Versions de développement de Ruby 1.9 (1.9.3dev)

### Solutions

Le problème a été corrigé. Tous les utilisateurs concernés sont
encouragés à mettre à jour leur installation de Ruby.

Il faut toutefois noter que ce type de vulnérabilité ne peut être évité
dans le cas où un dossier parent du dossier courant est détenu par
quelqu\'un en qui vous ne pouvez avoir confiance. Pour rester dans un
cas totalement sécurisé, il faut vous assurer qu\'*aucun* des dossiers
parents ne peut être déplacé/modifié par quelqu\'un de suspect.

### Mises-à-jour

* 1\.8.7-334 corrige cette faille. Les utilisateurs de la branche 1.8.7
  sont invités à installer cette version.
  * [https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p334.tar.gz][1]
  * [https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p334.tar.bz2][2]
  * [https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p334.zip][3]

* 1\.9.1-p431 corrige cette faille. Les utilisateur de la branche 1.9.1
  sont invités à installer cette version.
  * [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p431.tar.gz][4]
  * [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p431.tar.bz2][5]
  * [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p431.zip][6]

* 1\.9.2-p180 corrige cette faille. Les utilisateurs de la branche 1.9.2
  sont invités à installer cette version.
  * [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p180.tar.gz][7]
  * [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p180.tar.bz2][8]
  * [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p180.zip][9]



[1]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p334.tar.gz
[2]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p334.tar.bz2
[3]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p334.zip
[4]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p431.tar.gz
[5]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p431.tar.bz2
[6]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p431.zip
[7]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p180.tar.gz
[8]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p180.tar.bz2
[9]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p180.zip
