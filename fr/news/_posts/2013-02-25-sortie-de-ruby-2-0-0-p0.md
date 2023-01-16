---
layout: news_post
title: "Sortie de Ruby 2.0.0-p0"
author: "Jean-Denis Vauguet"
date: 2013-02-25 13:47:57 +0000
lang: fr
---

Nous sommes heureux d\'annoncer la sortie de Ruby 2.0.0-p0 !

Cette version est la première release stable de la branche 2.0. Elle
intègre de nombreuses nouvelles fonctionnalités et améliorations, pour
faire face à la diversification toujours plus importante des cas
d\'usages de Ruby.

Nous vous souhaitons un *happy hacking* avec Ruby 2.0.0 !

## Téléchargements

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.tar.bz2&gt;][1]

      SIZE:   10814890 bytes
      MD5:    895c1c581f8d28e8b3bb02472b2ccf6a
      SHA256: c680d392ccc4901c32067576f5b474ee186def2fcd3fcbfa485739168093295f

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.tar.gz&gt;][2]

      SIZE:   13608925 bytes
      MD5:    50d307c4dc9297ae59952527be4e755d
      SHA256: aff85ba5ceb70303cb7fb616f5db8b95ec47a8820116198d1c866cc4fff151ed

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.zip&gt;][3]

      SIZE:   15037340 bytes
      MD5:    db5af5d6034646ad194cbdf6e50f49ee
      SHA256: 0d0af6a9c8788537efd8d7d2358ce9468e6e2b7703dacba9ebd064d8b7da5f99

## Quoi de neuf dans Ruby 2.0.0 ?

### Nouvelles fonctionnalités

Petit aperçu des nouveautés…

* Fonctionnalités principales du langage :
  * les arguments mots-clés, pour plus de flexibilité (API…)
  * Module#prepend, une nouvelle façon « d\'augmenter » une classe
  * le litéral %i, pour créer un tableau de symboles avec une syntaxe
    minimale
  * \_\_dir\_\_, pour accéder directement au nom du dossier contenant le
    fichier en cours d\'exécution
  * UTF-8 devient l\'encodage par défaut (fini les commentaires «
    magiques » !)

* Au niveau des librairies du Core :
  * Enumerable#lazy et Enumerator::Lazy permettent de gérer des suites
    potentiellement infinies (lazy streams)
  * Enumerator#size et Range#size, pour déterminer la taille par
    évaluation retardée (lazy evaluation)
  * \#to\_h comme nouvelle méthode conventionnelle pour gérer la
    conversion vers un Hash
  * Onigmo remplace Oniguruma comme moteur d\'expressions régulières
    (c\'est un fork)
  * nouvelle API de gestion asynchrone des exceptions

* Du côté de la chasse aux bugs
  * support de DTrace, ce qui permet notamment de produire des rapports
    at run-time en production
  * TracePoint, une meilleure API de tracing (pour l\'analyse de logs)

* Améliorations des performances
  * optimisation du ramasse-miettes par \"bitmap marking\"
  * optimisation de Kernel#require, ce qui permet par exemple à Ruby On
    Rails de démarrer très rapidement
  * diverses optimisations dans la VM (routage des messages aux
    méthodes…)
  * optimisation des opérations de calculs sur les flottants (Float)

Par ailleurs, et toujours en mode « expérimental », vous retrouverez
dans cette version les Refinements.

Pour prendre connaissance de tous les détails, consultez le fichier
NEWS.

### Compatibilité

Nous avons pris garde à concevoir la version 2.0.0 de telle façon à ce
qu\'elle soit compatible avec la 1.9, à quelques détails près (seulement
!). Il sera donc plus facile de migrer de la 1.9 à la 2.0 qu\'il ne
l\'avait été pour le passage 1.8 / 1.9. Les incompatibilités principales
sont décrites ci-après.

À noter que grâce au travail de nombreux collaborateurs, un certain
nombre d\'applications telles que Rails ou tDiary sont d\'ores et déjà
fonctionnelles sur cette version 2.0.0-p0 !

### Documentation

Un effort important à également été produit pour améliorer la
documentation, ce qui a été une demande régulière de la part de la
communauté. Le volume de documentation rdoc pour les modules et les
méthodes a ainsi notablement augmenté : 75% de la 2.0.0 est couvert,
tandis que la 1.9.3 plafonnait vers les 60%. Par ailleurs, vous pouvez
retrouver une description de la syntaxe ruby en appelant:

{% highlight sh %}
ri ruby:syntax
{% endhighlight %}

### Stabilité

Contrairement à la 1.9.0, la version 2.0.0 est une release stable… bien
que son numéro micro soit 0. Évidemment, nous incitons tous les
mainteneurs de librairies à supporter dès que possible Ruby 2.0.0, ce
qui devrait être relativement simple (cf. Compatibilité).

Pour conclure, Ruby 2.0.0 est bel et bien là, prête à vous simplifier
une nouvelle fois la vie : adoptez-la !

## Notes

### Articles

Voici une sélection d\'articles parus à l\'occasion du lancement de la
2.0.0 :

* [&lt;URL:http://blog.marc-andre.ca/2013/02/23/ruby-2-by-example&gt;][4]
  (exhaustif, recommandé)
* [&lt;URL:https://speakerdeck.com/shyouhei/whats-new-in-ruby-2-dot-0&gt;][5]
  (exhaustif, recommandé)
* [&lt;URL:http://el.jibun.atmarkit.co.jp/rails/2012/11/ruby-20-8256.html&gt;][6]
  (court, en japonais)
* [&lt;URL:https://speakerdeck.com/nagachika/rubyist-enumeratorlazy&gt;][7]
  (à propos de Enumerator::Lazy, en japonais)

Les articles suivants sont également intéressants, hormis pour ce qui
concerne les Refinements (il y a eu des changements depuis leurs
parutions) :

* [&lt;URL:http://rubysource.com/a-look-at-ruby-2-0/&gt;][8]
* [&lt;URL:https://speakerdeck.com/a\_matsuda/ruby-2-dot-0-on-rails&gt;][9]
* [&lt;URL:http://globaldev.co.uk/2012/11/ruby-2-0-0-preview-features/&gt;][10]
* [&lt;URL:http://www.infoq.com/news/2012/11/ruby-20-preview1&gt;][11]

La dernière édition du Rubyist Magazine propose quelques articles très
intéressants écrits par les contributeurs des fonctionnalités sur
lesquels ils portent :

* [&lt;URL:http://jp.rubyist.net/magazine/?0041-200Special&gt;][12]

Ce dernier contenu est malheureusement disponible en japonais
uniquement. Nous avons dans l\'idée d\'en faire des traductions
anglaises rapidement.

### Incompatibilités

Il y a cinq incompatibilités majeures connues à ce jour, par rapport à
la 1.9 :

* L\'encodage par défaut des scripts ruby est désormais UTF-8
  [\[#6679\]][13]. Certaines personnes ont mentionné le fait que cela
  affecte le fonctionnement de programmes existant, par exemple des
  systèmes de benchmarking qui deviennent très lents
  [\[ruby-dev:46547\]][14].
* iconv a finalement été retiré, après avoir été déprécié lors de
  l\'introduction de M17N dans ruby 1.9. Utilisez désormais
  String#encode et autres.
* L\'ABI (Application Binary Interface) connaît un changement majeur
  [\[ruby-core:48984\]][15]. A priori, une simple réinstallation des
  extensions doit faire l\'affaire, mais soyez bien attentifs à ne pas
  copier les fichiers .so ou .bundle depuis une installation 1.9 (\"DO
  NOT COPY .so OR .bundle FILES FROM 1.9\"), faute de quoi Ruby ne
  fonctionnera pas.
* \#lines, #chars, #codepoints et #bytes retournent désormais un Array au
  lieu d\'un Enumerator [\[#6670\]][16]. Cette modification permet
  d\'éviter d\'avoir à écrire systématiquement \"lines.to\_a\". Pour
  retrouver un énumérateur, utilisez #each\_line, par exemple.
* Object#inspect retourne désormais toujours une chaîne de caractères,
  telle que #&lt;ClassName:0x...&gt;, au lieu de passer la main à #to\_s
  [\[#2152\]][17].

Pour les incompatibilités mineures, voyez [\[ruby-core:49119\]][18].

### À propos des Refinements

Nous avons décidé d\'intégrer la nouvelle fonctionnalité appelée
Refinements dans cette version. Elle étend les possibilités coté
modularité des scripts Ruby. Il s\'agit toutefois d\'une fonctionnalité
expérimentale, et sa spécification est susceptible de changer d\'ici la
prochaine version de Ruby. Néanmoins, nous vous encourageons à la
tester, et à nous faire part de vos retours qui nous seront d\'une
grande aide pour la finaliser.

## Remerciements

Un très grand nombre de personnes ont participé à l\'élaboration de
cette version. Il est rapidement devenu manifeste que même une liste
partielle de remerciements serait trop longue à inclure directement dans
cette actualité ! Aussi, permettez-moi de vous rediriger vers un lien
spécial :

* [&lt;URL:https://bugs.ruby-lang.org/projects/ruby/wiki/200SpecialThanks&gt;][19]

Merci à tous et à toutes !



[1]: https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.tar.bz2
[2]: https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.tar.gz
[3]: https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.zip
[4]: http://blog.marc-andre.ca/2013/02/23/ruby-2-by-example
[5]: https://speakerdeck.com/shyouhei/whats-new-in-ruby-2-dot-0
[6]: http://el.jibun.atmarkit.co.jp/rails/2012/11/ruby-20-8256.html
[7]: https://speakerdeck.com/nagachika/rubyist-enumeratorlazy
[8]: http://rubysource.com/a-look-at-ruby-2-0/
[9]: https://speakerdeck.com/a_matsuda/ruby-2-dot-0-on-rails
[10]: http://globaldev.co.uk/2012/11/ruby-2-0-0-preview-features/
[11]: http://www.infoq.com/news/2012/11/ruby-20-preview1
[12]: http://jp.rubyist.net/magazine/?0041-200Special
[13]: https://bugs.ruby-lang.org/issues/6679
[14]: https://blade.ruby-lang.org/ruby-dev/46547
[15]: https://blade.ruby-lang.org/ruby-core/48984
[16]: https://bugs.ruby-lang.org/issues/6670
[17]: https://bugs.ruby-lang.org/issues/2152
[18]: https://blade.ruby-lang.org/ruby-core/49119
[19]: https://bugs.ruby-lang.org/projects/ruby/wiki/200SpecialThanks
