---
layout: news_post
title: "Sortie de la version 1.9.3-p392 de Ruby"
author: "Bruno Michel"
date: 2013-02-23 14:13:53 +0000
lang: fr
---

La version 1.9.3-p392 de Ruby est sortie. Nous nous excusons des mises à
jour trop fréquentes.

Cette version inclut des correctifs de sécurité pour les bibliothèques
intégrées JSON et REXML :

* [Déni de service et vulnérabilité de création d\'objets non-sûrs
  (CVE-2013-0269)][1]
* [Vulnérabilité de type Déni de service par expansion des entités dans
  REXML (bombe XML, CVE-2013-1821)][2]

Et d\'autres correctifs de bugs mineurs sont également inclus.

Voyez les [tickets][3] et le [ChangeLog][4] pour plus de détails.

## Téléchargement

Vous pouvez télécharger cette nouvelle version depuis :

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p392.tar.bz2&gt;][5]

      SIZE:   10024221 bytes
      MD5:    a810d64e2255179d2f334eb61fb8519c
      SHA256: 5a7334dfdf62966879bf539b8a9f0b889df6f3b3824fb52a9303c3c3d3a58391

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p392.tar.gz&gt;][6]

      SIZE:   12557294 bytes
      MD5:    f689a7b61379f83cbbed3c7077d83859
      SHA256: 8861ddadb2cd30fb30e42122741130d12f6543c3d62d05906cd41076db70975f

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p392.zip&gt;][7]

      SIZE:   13863402 bytes
      MD5:    212fb3bc41257b41d1f8bfe0725916b7
      SHA256: f200ce4a63ce57bea64028a507350717c2a16bdbba6d9538bc69e9e7c2177c8b

## Commentaire sur cette version

De nombreux commiteurs, testeurs et utilisateurs ayant remonté des bugs
ont aidé à préparer cette version. Merci pour leurs contributions.



[1]: {{ site.url }}/fr/news/2013/02/23/dni-de-service-et-vulnrabilit-de-cration-dobjets-non-srs-cve-2013-0269/
[2]: {{ site.url }}/fr/news/2013/02/23/vulnrabilit-de-type-dni-de-service-par-expansion-des-entits-dans-rexml-bombe-xml/
[3]: https://bugs.ruby-lang.org/projects/ruby-193/issues?set_filter=1&amp;status_id=5
[4]: https://github.com/ruby/ruby/blob//v1_9_3_392/ChangeLog
[5]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p392.tar.bz2
[6]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p392.tar.gz
[7]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p392.zip
