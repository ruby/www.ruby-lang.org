---
layout: news_post
title: "Sortie de Ruby 2.0.0-rc2"
author: "Jean-Denis Vauguet"
date: 2013-02-11 08:45:25 +0000
lang: fr
---

Ruby 2.0.0-rc2 est disponible ! Il s\'agit de la dernière release
candidate avant la version 2.0.0.

N\'hésitez pas à la tester et à rapporter tout problème rencontré.

## Téléchargement

Vous pouvez obtenir cette version depuis :

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-rc2.tar.bz2&gt;][1]

      SIZE:   10822239 bytes
      MD5:    e92420131bd7994513e0bf09a3e2a19b
      SHA256: d55f897bb04283c5fa80223d96d990fe8ecb598508dd59443b356cbba1f66145

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-rc2.tar.gz&gt;][2]

      SIZE:   13616756 bytes
      MD5:    9d5e6f26db7c8c3ddefc81fdb19bd41a
      SHA256: 87072ab3e6d393d47f7402682364e4f24efe1c518969795cc01fcdeeb0e646f3

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-rc2.zip&gt;][3]

      SIZE:   15118480 bytes
      MD5:    1a2d33f1c50e32ca1532f8dea4790d53
      SHA256: c28e9baf3aa00b41b8823c16df436ae143e8a63e43e7a53302f23119e13d0ebf

## Nouvelles fonctionnalités de Ruby 2.0.0

* arguments « mots-clé »
* Enumerable#lazy
* Module#prepend
* \#to\_h: convention pour la conversion vers un Hash
* %i: un literal pour produire un tableau de symboles (à l\'instar de %s
  pour les chaînes de caractères)
* Moteur d\'expression régulière mis à jour : Onigmo (un fork
  d\'Oniguruma)
* Enumerator#size et Range#size font leur apparition
* support de DTrace
* TracePoint
* de meilleurs performances pour la directive require (en particulier
  sous Windows)
* support de NativeClient
* amélioration générale de la documentation
* meilleure gestion des interruptions asynchrones
* apparition de paramètres pour modifier la taille du stack de démarrage
* Refinements (expérimental !)

... et bien plus encore. Voir le fichiers NEWS pour tous les détails.

Voici quelques articles sur ces différents sujets récemment publiés :

* [&lt;URL:https://speakerdeck.com/a\_matsuda/ruby-2-dot-0-on-rails&gt;][4]
* [&lt;URL:http://globaldev.co.uk/2012/11/ruby-2-0-0-preview-features/&gt;][5]
* [&lt;URL:http://www.infoq.com/news/2012/11/ruby-20-preview1&gt;][6]
* [&lt;URL:http://timelessrepo.com/refinements-in-ruby&gt;][7]
  (Refinements)
* [&lt;URL:http://el.jibun.atmarkit.co.jp/rails/2012/11/ruby-20-8256.html&gt;][8]
  (en japonais)
* [&lt;URL:https://speakerdeck.com/nagachika/rubyist-enumeratorlazy&gt;][9]
  (Enumerator::Lazy, en japonais)

S\'il vous prend l\'envie d\'écrire un article, prévenez-nous pour
qu\'il soit cité dans la prochaine actualité.

## Notes

### Incompatibilités

Il en existe à notre connaissance trois principales :

* L\'encodage par défaut des scripts ruby est désormais UTF-8
  [\[#6679\]][10]. Certaines personnes ont mentionné le fait que cela
  affecte le fonctionnement de programmes existant, par exemple des
  systèmes de benchmarking qui deviennent très lents
  [\[ruby-dev:46547\]][11]. La spécification pourrait de ce fait encore
  évoluer d\'ici la release finale.
* iconv a finalement été retiré, après avoir été déprécié lors de
  l\'introduction de M17N dans ruby 1.9. Utilisez désormais
  String#encode et autres.
* L\'ABI (Application Binary Interface) connaît un changement majeur
  [\[ruby-core:48984\]][12]. A priori, une simple réinstallation des
  extensions doit faire l\'affaire, mais soyez bien attentifs à ne pas
  copier les fichiers .so ou .bundle depuis une installation 1.9 (\"DO
  NOT COPY .so OR .bundle FILES FROM 1.9\"), faute de quoi Ruby ne
  fonctionnera pas.

Il existe par ailleurs quelques incompatibilités mineurs, voir
[\[ruby-core:49119\]][13]. Merci de rapporter tout autre problème de ce
type d\'ici la release.

Bon à savoir : nous avons créé des notes de mise-à-jour, bien qu\'une
partie d\'entre elles soient déjà dépassées.

* [&lt;URL:https://bugs.ruby-lang.org/projects/ruby/wiki/200UpgradeNotesDraft&gt;][14]

### À propose des Refinements

Ruby 2.0.0 apportera les Refinements en tant que « fonctionnalité
expérimentale », faute d\'un accord final sur leur spécification.

Notez donc que leur comportement pourrait changer dans les prochaines
versions.

### Remerciements spéciaux

Merci à tous ceux et celles qui ont testé les preview et release
candidates ! Je suis très honoré du travail acharné de tous ces
contributeurs pour résoudre les bugs : je vous remercie tous
chaleureusement.



[1]: https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-rc2.tar.bz2
[2]: https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-rc2.tar.gz
[3]: https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-rc2.zip
[4]: https://speakerdeck.com/a_matsuda/ruby-2-dot-0-on-rails
[5]: http://globaldev.co.uk/2012/11/ruby-2-0-0-preview-features/
[6]: http://www.infoq.com/news/2012/11/ruby-20-preview1
[7]: http://timelessrepo.com/refinements-in-ruby
[8]: http://el.jibun.atmarkit.co.jp/rails/2012/11/ruby-20-8256.html
[9]: https://speakerdeck.com/nagachika/rubyist-enumeratorlazy
[10]: https://bugs.ruby-lang.org/issues/6679
[11]: https://blade.ruby-lang.org/ruby-dev/46547
[12]: https://blade.ruby-lang.org/ruby-core/48984
[13]: https://blade.ruby-lang.org/ruby-core/49119
[14]: https://bugs.ruby-lang.org/projects/ruby/wiki/200UpgradeNotesDraft
