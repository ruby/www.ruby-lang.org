---
layout: news_post
title: "Ruby 3.0.0 Preview 2 est disponible"
author: "naruse"
translator: "chatpitre"
date: 2020-12-08 00:00:00 +0000
lang: en
---

Nous sommes heureux de vous annoncer la sortie de Ruby 3.0.0-preview2.

Cela introduit un certain nombre de nouvelles fonctionnalités et d'amélioration de performance.

We are pleased to announce the release of Ruby 3.0.0-preview2.

It introduces a number of new features and performance improvements.

## Analyse statique

## Static Analysis

### RBS

RBS est un langage qui décrit les types des programmes Ruby.

RBS is a language to describe the types of Ruby programs.

Les vérifications de type incluent TypeProf et d'autres outils supportant RBS qui comprennent les programmes Ruby bien mieux avec les définitions RBS.

Type checkers including TypeProf and other tools supporting RBS will understand Ruby programs much better with RBS definitions.

Vous pouvez écrire directement la définition des classes et modules : les méthodes définis dans la classe, les variables d'instances et leurs types et les relations d'héritage/mix-in.

You can write down the definition of classes and modules: methods defined in the class, instance variables and their types, and inheritance/mix-in relations.

Le but de RBS est de supporter les patterns communs dans les programmes Ruby et de permettre d'écrire des types avancés incluant les unions de types, la surcharge de méthode et les génériques. Cela supporte aussi le duck typing avec _interface types_.

The goal of RBS is to support commonly seen patterns in Ruby programs and it allows writing advanced types including union types, method overloading, and generics. It also supports duck typing with _interface types_.

Ruby 3.0 arrive avec la gem `rbs`, qui inclue l'analyse et le traitement des définitions de type écrit en RBS.
Le code ci-dessous est un petit exemple de RBS avec une des définitions de classe, module et constante.

Ruby 3.0 ships with `rbs` gem, which allows parsing and processing type definitions written in RBS.
The following is a small example of RBS with class, module, and constant definitions.

```rbs
module ChatApp
  VERSION: String
  class Channel
    attr_reader name: String
    attr_reader messages: Array[Message]
    attr_reader users: Array[User | Bot]              # `|` means union types, `User` or `Bot`.
    def initialize: (String) -> void
    def post: (String, from: User | Bot) -> Message   # Method overloading is supported.
            | (File, from: User | Bot) -> Message
  end
end
```

Voir le [README de la gem rbs](https://github.com/ruby/rbs) pour plus de détails.

See [README of rbs gem](https://github.com/ruby/rbs) for more detail.

### TypeProf

TypeProf est un outil d'analyse de type compris dans Ruby.

TypeProf is a type analysis tool bundled in the Ruby package.

Actuellement, TypeProf permet une sorte d'inférence de type.

Currently, TypeProf serves as a kind of type inference.

Cela lit du code Ruby non annoté, analyse quelles méthodes sont définis, comment elles sont utilités et générenet un prototype de signature de type au format RBS.

It reads plain (non-type-annotated) Ruby code, analyzes what methods are defined and how they are used, and generates a prototype of type signature in RBS format.

Here is a simple demo of TypeProf.

An example input:

Un exemple d'entrée :

```ruby
# test.rb
class User
  def initialize(name:, age:)
    @name, @age = name, age
  end
  attr_reader :name, :age
end
User.new(name: "John", age: 20)
```

Un exemple de sortie :

An example output:

```
$ typeprof test.rb
# Classes
class User
  attr_reader name : String
  attr_reader age : Integer
  def initialize : (name: String, age: Integer) -> [String, Integer]
end
```

Vous pouvez lancer TypeProf en sauvegadant l'entrée dans un fichier "test.rb" et en appelant la commande "typeprof test.rb".

You can run TypeProf by saving the input as "test.rb" and invoke a command called "typeprof test.rb".

Vous pouvez aussi [essayer TypeProf en ligne](https://mame.github.io/typeprof-playground/#rb=%23+test.rb%0Aclass+User%0A++def+initialize%28name%3A%2C+age%3A%29%0A++++%40name%2C+%40age+%3D+name%2C+age%0A++end%0A++%0A++attr_reader+%3Aname%2C+%3Aage%0Aend%0A%0AUser.new%28name%3A+%22John%22%2C+age%3A+20%29&rbs=). (Cela lance TypeProf coté serveur, donc désolé si c'est)

You can also [try TypeProf online](https://mame.github.io/typeprof-playground/#rb=%23+test.rb%0Aclass+User%0A++def+initialize%28name%3A%2C+age%3A%29%0A++++%40name%2C+%40age+%3D+name%2C+age%0A++end%0A++%0A++attr_reader+%3Aname%2C+%3Aage%0Aend%0A%0AUser.new%28name%3A+%22John%22%2C+age%3A+20%29&rbs=). (It runs TypeProf on the server side, so sorry if it is out!)

Voir [la documentation](https://github.com/ruby/typeprof/blob/master/doc/doc.md) and [les demos](https://github.com/ruby/typeprof/blob/master/doc/demo.md) pour plus de détails.

See [the documentation](https://github.com/ruby/typeprof/blob/master/doc/doc.md) and [demos](https://github.com/ruby/typeprof/blob/master/doc/demo.md) for details.

TypeProf est expérimental et n'est pas encore mature. Seulement un sous ensemble du langage Ruby est supporté et la détection des erreurs de typage est limitée. Cela évolue rapidement tout de même afin d'améliorer la couvertures des fonctionnalités du langage, l'analyse de performance et la maniabilité. Tout retour est le bienvenue.

TypeProf is experimental and not so mature yet; only a subset of the Ruby language is supported, and the detection of type errors is limited. But it is still growing rapidly to improve the coverage of language features, the analysis performance, and usability. Any feedback is very welcome.

## Ractor (experimental)

Ractor est un modèle d'acteur permettant une abstraction pour la concurrence. Il fournit un outil permettant l'execution thread-safe de code.

Ractor is an Actor-model like concurrent abstraction designed to provide a parallel execution feature without thread-safety concerns.

Vous pouvez créer plusieurs ractors et les lancer en parallele. Ractor vous permet de créer des programmes thread-safe car les reactors ne partage pas des objets normaux. La communication entre ractors se fait par passage de message.

You can make multiple ractors and you can run them in parallel. Ractor enables you to make thread-safe parallel programs because ractors can not share normal objects. Communication between ractors are supported by message passing.

Afin de limiter le partage d'objet, Ractor introduit plusieurs restriction sur la syntaxe de Ruby (sans plusieurs ractors, il n'y a pas de restriction).

To limit sharing of objects, Ractor introduces several restrictions to the Ruby's syntax (without multiple Ractors, there is no restriction).

La spécification et l'implémintation ne sont pas matures et peuvent changer dans le futur. Par conséquent cette fonctionnalité est marquée commme experimentale et montre l'avertissement "experimental feature" au premier `Ractor.new`.

The specification and implementation are not matured and may be changed in the future, so this feature is marked as experimental and show the "experimental feature" warning when the first `Ractor.new`.

Le bout de code suivant calcul `n.prime?` (`n` est un entier relativement grand) en parallele avec deux ractors. Vous pouvez vérifier que le programme est deux fois plus rapide que celui séquentiel sur le calcul parralele.

The following small program calculates `n.prime?` (`n` is relatively a big integer) in parallel with two ractors. You will confirm that the program execution is about x2 times faster compared to the sequential program on the parallel computer.

```ruby
require 'prime'
# n.prime? with sent integers in r1, r2 run in parallel
r1, r2 = *(1..2).map do
  Ractor.new do
    n = Ractor.recv
    n.prime?
  end
end
# send parameters
r1.send 2**61 - 1
r2.send 2**61 + 15
# wait for the results of expr1, expr2
p r1.take #=> true
p r2.take #=> true
```

Voir [doc/ractor.md](https://github.com/ruby/ruby/blob/master/doc/ractor.md) pour plus de details.

See [doc/ractor.md](https://github.com/ruby/ruby/blob/master/doc/ractor.md) for more details.

## Fiber Scheduler

`Fiber#scheduler` est introduit pour intercepter des opérations de blocage. Cela permet une concurrence légère sans changer le code existant. Voir ["Don't Wait For Me, Scalable Concurrency for Ruby 3"](https://www.youtube.com/watch?v=Y29SSOS4UOc) pour avoir un apercu du fonctionnement.

`Fiber#scheduler` is introduced for intercepting blocking operations. This allows for light-weight concurrency without changing existing code. Watch ["Don't Wait For Me, Scalable Concurrency for Ruby 3"](https://www.youtube.com/watch?v=Y29SSOS4UOc) for an overview of how it works.

Currently supported classes/methods:
Les classes et méthodes prises en charge:

- `Mutex#lock`, `Mutex#unlock`, `Mutex#sleep`
- `ConditionVariable#wait`
- `Queue#pop`, `SizedQueue#push`
- `Thread#join`
- `Kernel#sleep`
- `Process.wait`
- `IO#wait`, `IO#read`, `IO#write` et les méthodes rattachées (e.g. `#wait_readable`, `#gets`, `#puts` etc.)
- `IO#select` n'est _pas prise en charge_.

Cet exemple de code permet de faire plusieurs requetes HTTP de facon concurrente.
(Expliquer la gem Async avec des liens). Cet exemple de code permet de faire plusieurs requetes HTTP de facon concurrente.
(Explain Async gem with links). This example program will perform several HTTP requests concurrently:
(Expler ceci:)

1. async est une gemme externe
2. async utilise cette nouvelle fonctionnalité

```ruby
require 'async'
require 'net/http'
require 'uri'
Async do
  ["ruby", "python", "c"].each do |topic|
    Async do
      Net::HTTP.get(URI "https://www.google.com/search?q=#{topic}")
    end
  end
end
```

## Autres ajouts notables

## Other Notable New Features

- Le filtrage par motif en une ligne utilise `=>` au lieu de `in`.
- One-line pattern matching now uses `=>` instead of `in`.
  ```ruby
  # version 3.0
  {a: 0, b: 1} => {a:}
  p a # => 0
  # version 2.7
  {a: 0, b: 1} in {a:}
  p a # => 0
  ```
- Le pattern Find.
  ```ruby
  case ["a", 1, "b", "c", 2, "d", "e", "f", 3]
  in [*pre, String => x, String => y, *post]
    p pre  #=> ["a", 1]
    p x    #=> "b"
    p y    #=> "c"
    p post #=> [2, "d", "e", "f", 3]
  end
  ```
- La définition sans le mot clé `end`.
  ```ruby
  def square(x) = x * x
  ```
- `Hash#except` est désormais intégré.
  ```ruby
  h = { a: 1, b: 2, c: 3 }
  p h.except(:a) #=> {:b=>2, :c=>3}
  ```
- Memory view est ajoutée en tant que fonctionnalité experimentale

  - C'est un nouvel ensemble d'API C pour échanger une zone mémoire brute, comme un tableau de nombre ou une image bitmap, entre des bibliotheques d'extension. Les bibliotheques d'extension permettent aussi de partager les méta données de la zone mémoire qui est constituée de la forme, du format de l'élément, etc. En utilisant ce types de métadata, les librairies d'extenstion peuvent partager meme des tableau multidimensionnel de facon approprié. Cette fonctionnalité est concu en se referrant au protocol tampon de python.

  - This is a new C-API set to exchange a raw memory area, such as a numeric array and a bitmap image, between extension libraries. The extension libraries can share also the metadata of the memory area that consists of the shape, the element format, and so on. Using these kinds of metadata, the extension libraries can share even a multidimensional array appropriately. This feature is designed by referring to Python's buffer protocol.

## Amélioration des performances

## Performance improvements

- Plusieurs améliorations sont implémentées dans MJIT. Voir NEWS pour les details.
- Coller du code dans IRB est 53 fois plus rapide qu'en Ruby 2.7.0. Par exemple le temps nécessaire pour coller [cet exemple de code](https://gist.github.com/aycabta/30ab96334275bced5796f118c9220b0b) passe de 11.7 secondes à 0.22 secondes.

- Many improvements were implemented in MJIT. Voir NEWS pour les details.
- Pasting long code to IRB is 53 times faster than bundled with Ruby 2.7.0. For example, the time required to paste [this sample code](https://gist.github.com/aycabta/30ab96334275bced5796f118c9220b0b) goes from 11.7 seconds to 0.22 seconds.

## Autres changements notables depuis la version 2.7

## Other notable changes since 2.7

- Les arguments de mot clé sont séparé des autres arguments.
  - En principe, le code qui affiche un avertissement dans la version 2.7 de ruby ne fonctionnera pas. Voir le [document](https://www.ruby-lang.org/en/news/2019/12/12/separation-of-positional-and-keyword-arguments-in-ruby-3-0/) pour plus de détails.
  - La transmission d'arguments prend en charge les arguments de l'en-tête.
    ```ruby
    def method_missing(meth, ...)
      send(:"do_#{ meth }", ...)
    end
    ```
- La fonctionnalité `$SAFE` a été completement supprimée. C'est désormais une variable globale.
- L'ordre de la backtrace a été inversé depuis la version 2.5 de Ruby, mais cela a été remis comme avant. Cela se comporte comme la version 2.4 de Ruby. Le message d'erreur et le numéro de ligne ou l'exception apparait sont affichés en premiers. Les appelants sont affichés apres.
- Plusieurs bibliothèques standard ont été mises à jour.
  - RubyGems 3.2.0.rc.1
  - Bundler 2.2.0.rc.1
  - IRB 1.2.6
  - Reline 0.1.5
- Les librairies suivantes ne sont plus empaquetées. Il faut installer jes gems correspondantes pour utiliser leurs fonctionnalitées.
  - net-telnet
  - xmlrpc
- Les gems suivantes sont désormais empaquetées avec Ruby.
  - rexml
  - rss
- Les fichiers stdlib suivants sont désormais des gems et sont publiées sur rubygems.org. The following stdlib files are now default gems and are published on rubygems.org.

- Keyword arguments are separated from other arguments.
  - In principle, code that prints a warning on Ruby 2.7 won't work. See the [document](https://www.ruby-lang.org/en/news/2019/12/12/separation-of-positional-and-keyword-arguments-in-ruby-3-0/) in detail.
  - By the way, arguments forwarding now supports leading arguments.
    ```ruby
    def method_missing(meth, ...)
      send(:"do_#{ meth }", ...)
    end
    ```
- The `$SAFE` feature was completely removed; now it is a normal global variable.
- The order of backtrace had been reversed at Ruby 2.5, and is reverted. Now it behaves like Ruby 2.4; an error message and the line number where the exception occurs are printed first, and its callers are printed later.
- Some standard libraries are updated.
  - RubyGems 3.2.0.rc.1
  - Bundler 2.2.0.rc.1
  - IRB 1.2.6
  - Reline 0.1.5
- The following libraries are no longer bundled gems.
  Install the corresponding gems to use these features.
  - net-telnet
  - xmlrpc
- The following default gems are now bundled gems.
  - rexml
  - rss
- The following stdlib files are now default gems and are published on rubygems.org.
  - abbrev
  - base64
  - English
  - erb
  - find
  - io-nonblock
  - io-wait
  - net-ftp
  - net-http
  - net-imap
  - net-protocol
  - nkf
  - open-uri
  - optparse
  - resolv
  - resolv-replace
  - rinda
  - securerandom
  - set
  - shellwords
  - tempfile
  - time
  - tmpdir
  - tsort
  - weakref

Voir [NEWS](https://github.com/ruby/ruby/blob/v3_0_0_preview2/NEWS.md)
ou les [logs de commit](https://github.com/ruby/ruby/compare/v2_7_0...v3_0_0_preview2) pour plus de détails.

{% assign release = site.data.releases | where: "version", "3.0.0-preview2" | first %}

Avec ces changements, [{{ release.stats.files_changed }} fichiers changés, {{ release.stats.insertions }} insertions(+), {{ release.stats.deletions }} suppressions(-)](https://github.com/ruby/ruby/compare/v2_7_0...v3_0_0)
depuis Ruby 2.7.0!

Essayez Ruby 3.0.0-preview2 s'il vous plait et faites nous des retours !

## Téléchargement

- <{{ release.url.gz }}>

      SIZE: {{ release.size.gz }}
      SHA1: {{ release.sha1.gz }}
      SHA256: {{ release.sha256.gz }}
      SHA512: {{ release.sha512.gz }}

- <{{ release.url.xz }}>

      SIZE: {{ release.size.xz }}
      SHA1: {{ release.sha1.xz }}
      SHA256: {{ release.sha256.xz }}
      SHA512: {{ release.sha512.xz }}

- <{{ release.url.zip }}>

      SIZE: {{ release.size.zip }}
      SHA1: {{ release.sha1.zip }}
      SHA256: {{ release.sha256.zip }}
      SHA512: {{ release.sha512.zip }}

## Ruby, c'est quoi ?

Ruby a d'abord été developpé par Matz (Yukihiro Matsumoto) en 1993, mais est désormais Open Source.
Ruby fonctionne sur de multiple plateformes et est utilisé à travers le monde notamment dans le développement web.

and is now developed as Open Source. It runs on multiple platforms
and is used all over the world especially for web development.
