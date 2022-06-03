---
layout: news_post
title: "Ruby 3.1.0 est disponible"
author: "naruse"
translator: "Kevin Rosaz"
date: 2021-12-25 00:00:00 +0000
lang: fr
---

{% assign release = site.data.releases | where: "version", "3.1.0" | first %}

Nous avons le plaisir de vous annoncer la sortie de Ruby {{ release.version }}. Ruby 3.1 conserve la compatibilité avec Ruby 3.0 et ajoute également de nombreuses fonctionnalités.


## YJIT: un nouveau compilateur JIT en cours de développement

Ruby 3.1 fusionne YJIT, un nouveau compilateur JIT développé par Shopify.

Depuis que [Ruby 2.6 a introduit MJIT en 2018](https://www.ruby-lang.org/en/news/2018/12/25/ruby-2-6-0-released/), ses performances se sont grandement améliorées et [nous sommes parvenus à Ruby3x3 l'année dernière](https://www.ruby-lang.org/fr/news/2020/12/25/ruby-3-0-0-released/). Même si Optcarrot a montré des accélérations impressionnantes, le JIT n'a pas profité aux applications du monde professionnel.

Récemment, Shopify a apporté de nombreuses améliorations à Ruby pour accélérer son application Rails. YJIT est une contribution importante et vise à améliorer les performances des applications Rails.

Bien que MJIT soit un compilateur JIT basé sur des méthodes et qu'il utilise un compilateur C externe, YJIT utilise le Basic Block Versioning et inclut le compilateur JIT à l'intérieur. Avec Lazy Basic Block Versioning (LBBV), cela compile d'abord le début d'une méthode et compile progressivement le reste lorsque le type des arguments et des variables est déterminé dynamiquement. Voir [YJIT: a basic block versioning JIT compiler for CRuby](https://dl.acm.org/doi/10.1145/3486606.3486781) pour une introduction détaillée.

Avec cette technologie, YJIT permet d'avoir à la fois un temps de démarrage rapide et des améliorations de performance sur la plupart des logiciels, jusqu'à 22% sur railsbench et 39% sur le rendu liquid.

YJIT est toujours une fonctionnalité expérimentale. En tant que telle, elle est désactivée par défaut. Si vous souhaitez l'utiliser, spécifiez l'option en ligne de commande `--yjit` pour activer YJIT. L'utilisation est pour le moment limitée à macOS et Linux sur les plateformes x86-64.

* https://bugs.ruby-lang.org/issues/18229
* https://shopify.engineering/yjit-just-in-time-compiler-cruby
* https://www.youtube.com/watch?v=PBVLf3yfMs8

## debug.gem : un nouveau débogueur

Un débogueur complètement réécrit [debug.gem](https://github.com/ruby/debug) est fourni. Debug.gem possède les fonctionnalités suivantes :

* Améliorer les performances de débogage (il ne ralentit pas l'application même avec le débogueur)
* Prise en charge du débogage à distance
* Prise en charge de l'interface de débogage riche (VSCode et navigateur Chrome sont désormais pris en charge)
* Prise en charge du débogage multiprocessus/multithread
* REPL coloré et d'autres fonctionnalités utiles telles que la fonction enregistrer et rejouer , la fonction de traçage, etc.

<video autoplay="autoplay" controls="controls" muted="muted" width="764" height="510" poster="https://cache.ruby-lang.org/pub/media/ruby310_debug_demo.jpg">
  <source src="https://cache.ruby-lang.org/pub/media/ruby310_debug_demo.mp4" type="video/mp4">
</video>

Ruby avait intégré lib/debug.rb, mais il n'était pas bien maintenu et posait des problèmes de performances et de fonctionnalités. Debug.gem a complètement remplacé lib/debug.rb.

## error_highlight: localisation des erreurs plus précise

La gemme error_highlight a été ajoutée. Elle permet d'obtenir la localisation d'une erreur de manière plus précise dans la trace :

```
$ ruby test.rb
test.rb:1:in `<main>': undefined method `time' for 1:Integer (NoMethodError)
1.time {}
 ^^^^^
Did you mean?  times
```

Actuellement, seul `NameError` est pris en charge.

Cette gemme est activée par défaut. Vous pouvez la désactiver en utilisant l'option en ligne de commande `--disable-error_highlight`. Voir [le dépôt](https://github.com/ruby/error_highlight) pour de plus amples informations.

## Auto-complétion dans IRB et affichage de la documentation

IRB dispose désormais d'une fonction de saisie semi-automatique où vous pouvez simplement taper le code et une boîte de dialogue des candidats à la complétion apparaîtra. Vous pouvez utiliser Tab et Shift+Tab pour vous déplacer de haut en bas.

Si la documentation est installée lorsque vous sélectionnez une proposition à la complétion, la boîte de dialogue de la documentation apparaîtra à côté de celle-ci, affichant une partie du contenu. Vous pouvez lire la documentation complète en appuyant sur Alt+d.

<video autoplay="autoplay" controls="controls" muted="muted" width="764" height="510" poster="https://cache.ruby-lang.org/pub/media/ruby310_irb_dialog.png">
  <source src="https://cache.ruby-lang.org/pub/media/ruby310_irb_dialog.mp4" type="video/mp4">
</video>

## Autres nouvelles fonctionnalités notables

### Language

* Les valeurs dans les littéraux de hachage peuvent être omis. [[Feature #14579]](https://bugs.ruby-lang.org/issues/14579)
  * `{x:, y:}` est un sucre syntaxique de `{x: x, y: y}`.
  * `foo(x:, y:)` est un sucre syntaxique de `foo(x: x, y: y)`.

* L'opérateur pin (`^`) dans le filtrage par motif prend désormais une expression. [[Feature #17411]](https://bugs.ruby-lang.org/issues/17411)

```ruby
Prime.each_cons(2).lazy.find_all{_1 in [n, ^(n + 2)]}.take(3).to_a
#=> [[3, 5], [5, 7], [11, 13]]
```

* Les parenthèses peuvent être omises dans les filtrages par motifs qui ne font qu'une seule ligne. [[Feature #16182]](https://bugs.ruby-lang.org/issues/16182)

```ruby
[0, 1] => _, x
{y: 2} => y:
x #=> 1
y #=> 2
```

### RBS

RBS est un langage pour décrire la structure des programmes Ruby. Voir [le dépôt](https://github.com/ruby/rbs) pour de plus amples informations.

Mises à jour depuis Ruby 3.0.0 :

* Les paramètres de type générique peuvent être bornés. ([PR](https://github.com/ruby/rbs/pull/844))
* Les alias de type générique sont pris en charge. ([PR](https://github.com/ruby/rbs/pull/823))
* `rbs collection` été introduit pour gérer les RBS des gemmes. ([doc](https://github.com/ruby/rbs/blob/master/docs/collection.md))
* De nombreuses signatures pour les bibliothèques intégrées et standard ont été ajoutées/mises à jour.
* Il inclut également de nombreuses corrections de bogues et améliorations des performances.

Voir [le CHANGELOG.md](https://github.com/ruby/rbs/blob/master/CHANGELOG.md) pour de plus amples informations.

### TypeProf

TypeProf est un analyseur de type statique pour Ruby. Il génère un prototype de RBS à partir de code Ruby non annoté de type. Voir [la documentation](https://github.com/ruby/typeprof/blob/master/doc/doc.md) pour de plus amples informations.

Les principales mises à jour depuis Ruby 3.0.0 concernent un support IDE expérimental appelé "TypeProf for IDE".

![Demo de TypeProf for IDE](https://cache.ruby-lang.org/pub/media/ruby310_typeprof_ide_demo.png)

L'extension vscode affiche une signature de méthode devinée (ou explicitement écrite dans un fichier RBS) au-dessus de chaque définition de méthode, souligne en rouge le code qui peut provoquer une erreur de nom ou de type et complète les noms de méthode (c'est-à-dire affiche les méthodes candidates). Voir la [documentation](https://github.com/ruby/typeprof/blob/master/doc/ide.md) pour de plus amples informations.

De plus, la version inclut de nombreuses corrections de bogues et améliorations des performances.

## Améliorations de performance

* MJIT
  * Pour les charges de travail telles que Rails, la valeur par défaut `--jit-max-cache` passe de 100 à 10000.
    Le compilateur JIT ne saute plus la compilation des méthodes de plus de 1000 instructions.
  * Pour prendre en charge Zeitwerk de Rails, le code généré par le compilateur JIT n'est plus annulé lorsqu'un TracePoint est activé pour les évènements de classe.

## Autres changements notables depuis la version 3.0
* Le filtrage par motif en une ligne, e.g., `ary => [x, y, z]`, n'est plus au stade expérimental.
* L'ordre d'évaluation des affectations multiples a été légèrement modifié. [[Bug #4443]](https://bugs.ruby-lang.org/issues/4443)
  * `foo[0], bar[0] = baz, qux` était évalué dans l'ordre `baz`, `qux`, `foo` puis `bar` dans Ruby 3.0. Dans Ruby 3.1, l'évaluation est dans l'ordre `foo`, `bar`, `baz` puis `qux`.
* Allocation de la taille d'une variable String (expérimental) [[Bug #18239]](https://bugs.ruby-lang.org/issues/18239)
* Psych 4.0 change `Psych.load` en `safe_load` par défaut. Vous devrez peut-être utiliser Psych 3.3.2 pour migrer vers ce comportement. [[Bug #17866]](https://bugs.ruby-lang.org/issues/17866)

### Mise à jour des bibliothèques standards

*   Les gemmes par défaut suivantes ont été mises à jour.
    * RubyGems 3.3.3
    * base64 0.1.1
    * benchmark 0.2.0
    * bigdecimal 3.1.1
    * bundler 2.3.3
    * cgi 0.3.1
    * csv 3.2.2
    * date 3.2.2
    * did_you_mean 1.6.1
    * digest 3.1.0
    * drb 2.1.0
    * erb 2.2.3
    * error_highlight 0.3.0
    * etc 1.3.0
    * fcntl 1.0.1
    * fiddle 1.1.0
    * fileutils 1.6.0
    * find 0.1.1
    * io-console 0.5.10
    * io-wait 0.2.1
    * ipaddr 1.2.3
    * irb 1.4.1
    * json 2.6.1
    * logger 1.5.0
    * net-http 0.2.0
    * net-protocol 0.1.2
    * nkf 0.1.1
    * open-uri 0.2.0
    * openssl 3.0.0
    * optparse 0.2.0
    * ostruct 0.5.2
    * pathname 0.2.0
    * pp 0.3.0
    * prettyprint 0.1.1
    * psych 4.0.3
    * racc 1.6.0
    * rdoc 6.4.0
    * readline 0.0.3
    * readline-ext 0.1.4
    * reline 0.3.0
    * resolv 0.2.1
    * rinda 0.1.1
    * ruby2_keywords 0.0.5
    * securerandom 0.1.1
    * set 1.0.2
    * stringio 3.0.1
    * strscan 3.0.1
    * tempfile 0.1.2
    * time 0.2.0
    * timeout 0.2.0
    * tmpdir 0.1.2
    * un 0.2.0
    * uri 0.11.0
    * yaml 0.2.0
    * zlib 2.1.1
*   Les gemmes groupées suivantes ont été mises à jour.
    * minitest 5.15.0
    * power_assert 2.0.1
    * rake 13.0.6
    * test-unit 3.5.3
    * rexml 3.2.5
    * rbs 2.0.0
    * typeprof 0.21.1
*   Les gemmes par défaut suivantes sont désormais des gemmes groupées. Vous devez les ajouter au `Gemfile` sous l'environnement bundler.
    * net-ftp 0.1.3
    * net-imap 0.2.2
    * net-pop 0.1.1
    * net-smtp 0.3.1
    * matrix 0.4.2
    * prime 0.1.2
    * debug 1.4.0

Voir [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
ou les [logs de commit](https://github.com/ruby/ruby/compare/v3_0_0...{{ release.tag }})
pour de plus amples informations.

Avec ces changements, [{{ release.stats.files_changed }} fichiers changés, {{ release.stats.insertions }} insertions(+), {{ release.stats.deletions }} suppressions(-)](https://github.com/ruby/ruby/compare/v3_0_0...{{ release.tag }}#file_bucket)
depuis Ruby 3.0.0 !

Joyeux Noël, joyeuses fêtes et bonne programmation avec Ruby 3.1 !

## Téléchargement

* <{{ release.url.gz }}>

      SIZE: {{ release.size.gz }}
      SHA1: {{ release.sha1.gz }}
      SHA256: {{ release.sha256.gz }}
      SHA512: {{ release.sha512.gz }}

* <{{ release.url.xz }}>

      SIZE: {{ release.size.xz }}
      SHA1: {{ release.sha1.xz }}
      SHA256: {{ release.sha256.xz }}
      SHA512: {{ release.sha512.xz }}

* <{{ release.url.zip }}>

      SIZE: {{ release.size.zip }}
      SHA1: {{ release.sha1.zip }}
      SHA256: {{ release.sha256.zip }}
      SHA512: {{ release.sha512.zip }}

## Ruby, c'est quoi ?

Ruby a été initialement développé par Matz (Yukihiro Matsumoto) en 1993 puis est devenu open source. Il fonctionne sur de nombreuses plateformes et est utilisé partout dans le monde, en particulier pour le développement web.
