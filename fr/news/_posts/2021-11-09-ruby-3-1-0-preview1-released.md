---
layout: news_post
title: "Ruby 3.1.0 Preview 1 est disponible"
author: "naruse"
translator: "Kevin Rosaz"
date: 2021-11-09 00:00:00 +0000
lang: fr
---
{% assign release = site.data.releases | where: "version", "3.1.0-preview1" | first %}

Nous avons le plaisir de vous annoncer la sortie de Ruby {{ release.version }}.


## YJIT: un nouveau compilateur JIT en cours de développement


Ruby 3.1 fusionne YJIT, un nouveau compilateur JIT développé par Shopify.

Depuis que [Ruby 2.6 a introduit MJIT en 2018](https://www.ruby-lang.org/en/news/2018/12/25/ruby-2-6-0-released/), ses performances se sont grandement améliorées et [nous sommes parvenus à Ruby3x3 l'année dernière](https://www.ruby-lang.org/fr/news/2020/12/25/ruby-3-0-0-released/). Même si Optcarrot a montré des accélérations impressionnantes, le JIT n'a pas profité aux applications du monde professionnel.

Récemment, Shopify a apporté de nombreuses améliorations à Ruby pour accélérer son application Rails. YJIT est une contribution importante et vise à améliorer les performances des applications Rails.

Bien que MJIT soit un compilateur JIT basé sur des méthodes et qu'il utilise un compilateur C externe, YJIT utilise le Basic Block Versioning et inclut le compilateur JIT à l'intérieur. Avec Lazy Basic Block Versioning (LBBV), cela compile d'abord le début d'une méthode et compile progressivement le reste lorsque le type des arguments et des variables est déterminé dynamiquement. Voir [YJIT: a basic block versioning JIT compiler for CRuby](https://dl.acm.org/doi/10.1145/3486606.3486781) pour une introduction détaillée.

Avec cette technologie, YJIT permet d'avoir à la fois un temps de démarrage rapide et des améliorations de performance sur la plupart des logiciels, jusqu'à 22% sur railsbench et 39% sur le rendu liquid.

<!-- 試す人向けのお知らせ -->

YJIT est toujours une fonctionnalité expérimentale. En tant que telle, elle est désactivée par défaut. Si vous souhaitez l'utiliser, spécifiez l'option en ligne de commande `--yjit` pour activer YJIT. L'utilisation est pour le moment limitée à macOS et Linux sur les plateformes x86-64.

* https://bugs.ruby-lang.org/issues/18229
* https://shopify.engineering/yjit-just-in-time-compiler-cruby
* https://www.youtube.com/watch?v=PBVLf3yfMs8

## debug gem: un nouveau débogueur

Un nouveau débogueur [debug.gem](https://github.com/ruby/debug) est inclu. debug.gem est une implémentation rapide du débogueur et fournit de nombreuses fonctionnalités telles que le débogage à distance, un REPL coloré, une intégration dans un IDE (VSCode) et bien plus encore. Cela remplace `lib/debug.rb` de la bibliothèque standard.

## error_highlight: localisation des erreurs plus précise

La gemme error_highlight a été ajoutée. Elle permet d'obtenir la localisation d'une erreur de manière plus précise dans la trace :

```
$ ruby test.rb
test.rb:1:in `<main>': undefined method `time' for 1:Integer (NoMethodError)

1.time {}
 ^^^^^
Did you mean?  times
```

Cette gemme est activée par défaut. Vous pouvez la désactiver en utilisant l'option en ligne de commande `--disable-error_highlight`. Voir [le dépôt](https://github.com/ruby/error_highlight) pour de plus amples informations.

## Amélioration d'IRB

À décrire dans le prochain aperçu.

## Autres nouvelles fonctionnalités notables

### Language

* Les valeurs dans les littéraux de hachage peuvent être omis. [Feature #14579]
  * `{x:, y:}` est un sucre syntaxique de `{x: x, y: y}`.
  * `foo(x:, y:)` est un sucre syntaxique de `foo(x: x, y: y)`.

* L'opérateur pin dans le filtrage par motif prend désormais une expression. [Feature #17411]

```ruby
Prime.each_cons(2).lazy.find_all{_1 in [n, ^(n + 2)]}.take(3).to_a
#=> [[3, 5], [5, 7], [11, 13]]
```


### RBS

RBS est un langage pour décrire la structure des programmes Ruby. Voir [le dépôt](https://github.com/ruby/rbs) pour de plus amples informations.

Mises à jour depuis Ruby 3.0.0:

* `rbs collection` a été introduite pour gérer les RBS des gemmes. [doc](https://github.com/ruby/rbs/blob/master/docs/collection.md)
* Plusieurs signatures pour des bibliothèques intégrées et standards ont été ajoutées/mises à jour.
* Il y a également de nombreuses corrections de bogues et d'améliorations de performance.

Voir [le CHANGELOG.md](https://github.com/ruby/rbs/blob/master/CHANGELOG.md) pour de plus amples informations.

### TypeProf

TypeProf est un analyseur de type statique pour Ruby. Il génère un prototype de RBS à partir de code Ruby non annoté de type. Voir [le document](https://github.com/ruby/typeprof/blob/master/doc/doc.md) pour de plus amples informations.

Mises à jour depuis Ruby 3.0.0 :

* [Le support expérimental pour IDE](https://github.com/ruby/typeprof/blob/master/doc/ide.md) a été implémenté.
* Il y a également de nombreuses corrections de bogues et d'améliorations de performance.

## Amélioration de performance

* MJIT
  * Pour les charges de travail telles que Rails, la valeur par défaut `--jit-max-cache` passe de 100 à 10000.
    Le compilateur JIT ne saute plus la compilation des méthodes de plus de 1000 instructions.
  * Pour prendre en charge Zeitwerk de Rails, le code généré par le compilateur JIT n'est plus annulé
    lorsqu'un TracePoint est activé pour les évènements de classe.

## Autres changements notables depuis la version 3.0

* Le filtrage par motif en une ligne, e.g., `ary => [x, y, z]`, n'est plus au stade expérimental.
* L'ordre d'évaluation des affectations multiples a été légèrement modifié. [[Bug #4443]](https://bugs.ruby-lang.org/issues/4443)
  * `foo[0], bar[0] = baz, qux` était évalué dans l'ordre `baz`, `qux`, `foo` puis `bar` dans Ruby 3.0. Dans Ruby 3.1, l'évaluation est dans l'ordre `foo`, `bar`, `baz` puis `qux`.
* Allocation de la taille d'une variable: Strings (expérimental) [[Bug #18239]](https://bugs.ruby-lang.org/issues/18239)

### Mises à jour des bibliothèques standards

* Plusieurs bibliothèques standards ont été mises à jour.
  * RubyGems
  * Bundler
  * RDoc 6.4.0
  * ReLine
  * JSON 2.6.0
  * Psych 4.0.2
  * FileUtils 1.6.0
  * Fiddle
  * StringIO 3.0.1
  * IO::Console 0.5.9
  * IO::Wait 0.2.0
  * CSV
  * Etc 1.3.0
  * Date 3.2.0
  * Zlib 2.1.1
  * StringScanner
  * IpAddr
  * Logger 1.4.4
  * OStruct 0.5.0
  * Irb
  * Racc 1.6.0
  * Delegate 0.2.0
  * Benchmark 0.2.0
  * CGI 0.3.0
  * Readline(C-ext) 0.1.3
  * Timeout 0.2.0
  * YAML 0.2.0
  * URI 0.11.0
  * OpenSSL
  * DidYouMean
  * Weakref 0.1.1
  * Tempfile 0.1.2
  * TmpDir 0.1.2
  * English 0.7.1
  * Net::Protocol 0.1.2
  * Net::Http 0.2.0
  * BigDecimal
  * OptionParser 0.2.0
  * Set
  * Find 0.1.1
  * Rinda 0.1.1
  * Erb
  * NKF 0.1.1
  * Base64 0.1.1
  * OpenUri 0.2.0
  * SecureRandom 0.1.1
  * Resolv 0.2.1
  * Resolv::Replace 0.1.0
  * Time 0.2.0
  * PP 0.2.1
  * Prettyprint 0.1.1
  * Drb 2.1.0
  * Pathname 0.2.0
  * Digest 3.1.0.pre2
  * Un 0.2.0
* Les gemmes incluses suivantes ont été mises à jour.
  * minitest 5.14.4
  * power_assert 2.0.1
  * rake 13.0.6
  * test-unit 3.5.0
  * rbs 1.6.2
  * typeprof 0.20.0
* Les gemmes par défaut suivantes sont désormais incluses.
  * net-ftp
  * net-imap
  * net-pop
  * net-smtp
  * matrix
  * prime

Voir [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
ou les [logs de commit](https://github.com/ruby/ruby/compare/v3_0_0...{{ release.tag }})
pour de plus amples informations.

Avec ces changements, [{{ release.stats.files_changed }} fichiers changés, {{ release.stats.insertions }} insertions(+), {{ release.stats.deletions }} suppressions(-)](https://github.com/ruby/ruby/compare/v3_0_0...{{ release.tag }}#file_bucket)
depuis Ruby 3.0.0!

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
