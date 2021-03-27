---
layout: news_post
title: "Ruby 3.0.0 Preview 2 est disponible"
author: "naruse"
translator: "chatpitre"
date: 2020-12-08 00:00:00 +0000
lang: fr
---

Nous sommes heureux de vous annoncer la sortie de Ruby 3.0.0-preview2.

Cela introduit un certain nombre de nouvelles fonctionnalités et d'améliorations de performance.

## Analyse statique

### RBS

RBS est un langage qui décrit les types de programmes Ruby.

Les vérificateurs de type, y compris TypeProf et d'autres outils prenant en charge RBS, comprendront mieux les programmes Ruby avec des définitions RBS.

Vous pouvez écrire la définition des classes et des modules: les méthodes qui sont définies dans la classe, les variables d'instance et leurs types, et les relations d'héritage / mix-in.

Le but de RBS est de prendre en charge les modèles couramment observés dans les programmes Ruby et de vous permettre d'écrire des types avancés, notamment les unions de type, les surcharges de méthode et les génériques. Il prend également en charge le duck typing avec _interface types_.

Ruby 3.0 arrive avec la gemme 'rbs', qui inclue l'analyse et le traitement des définitions de type écrites en RBS.

Le code ci-dessous est un petit exemple de RBS une classe, un module et des définitions de constantes.

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

Voir le [README de la gemme rbs](https://github.com/ruby/rbs) pour plus de détails.

### TypeProf

TypeProf est un outil d'analyse de type inclus dans Ruby.

Actuellement, TypeProf permet une sorte d'inférence de type.

Il lit du code Ruby sans annotation de type, analyse quelles méthodes sont définies, comment elles sont utilisées et génère un prototype de la signature de type au format RBS.

Voici une simple démo de TypeProf.

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

```
$ typeprof test.rb
# Classes
class User
  attr_reader name : String
  attr_reader age : Integer
  def initialize : (name: String, age: Integer) -> [String, Integer]
end
```

Vous pouvez lancer TypeProf en sauvegadant le code dans un fichier "test.rb" et en appelant la commande "typeprof test.rb".

Vous pouvez aussi [essayer TypeProf en ligne](https://mame.github.io/typeprof-playground/#rb=%23+test.rb%0Aclass+User%0A++def+initialize%28name%3A%2C+age%3A%29%0A++++%40name%2C+%40age+%3D+name%2C+age%0A++end%0A++%0A++attr_reader+%3Aname%2C+%3Aage%0Aend%0A%0AUser.new%28name%3A+%22John%22%2C+age%3A+20%29&rbs=). (Cela lance TypeProf coté serveur, donc désolé si cela ne fonctionne pas !)

Voir [la documentation](https://github.com/ruby/typeprof/blob/master/doc/doc.md) et [les démos](https://github.com/ruby/typeprof/blob/master/doc/demo.md) pour plus de détails.

TypeProf est expérimental et n'est pas encore mature. Seulement un sous ensemble du langage Ruby est supporté et la détection des erreurs de typage est limitée. Mais il continue de croître rapidement pour améliorer la couverture des fonctionnalités du langage, les performances d'analyse et la convivialité. Tout commentaire est le bienvenu.

## Ractor (expérimental)

Ractor est un modèle d'acteur permettant une abstraction pour la concurrence. Il fournit un outil permettant l'exécution de code de façon thread-safe.

Vous pouvez créer plusieurs ractors et les lancer en parallèle. Ractor vous permet de créer des programmes thread-safe puisque les ractors ne partagent pas d'objets normaux. La communication entre ractors se fait par passage de messages.

Afin de limiter le partage d'objet, Ractor introduit plusieurs restrictions sur la syntaxe de Ruby (sans plusieurs ractors, il n'y a pas de restriction).

La spécification et l'implémentation ne sont pas matures et pourront donc changer. Cette fonctionnalité est marquée comme expérimentale et montre l'avertissement "experimental feature" au premier `Ractor.new`.

Le bout de code suivant calcul `n.prime?` (`n` est un entier relativement grand) en parallèle avec deux ractors. Vous pouvez vérifier que le programme est deux fois plus rapide que celui séquentiel.

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

Voir [doc/ractor.md](https://github.com/ruby/ruby/blob/master/doc/ractor.md) pour plus de détails.

## Fiber Scheduler

`Fiber#scheduler` est introduit pour intercepter des opérations de blocage. Cela permet une concurrence légère sans changer le code existant. Voir ["Don't Wait For Me, Scalable Concurrency for Ruby 3"](https://www.youtube.com/watch?v=Y29SSOS4UOc) pour avoir un aperçu du fonctionnement.

Les classes et méthodes prises en charge :

- `Mutex#lock`, `Mutex#unlock`, `Mutex#sleep`
- `ConditionVariable#wait`
- `Queue#pop`, `SizedQueue#push`
- `Thread#join`
- `Kernel#sleep`
- `Process.wait`
- `IO#wait`, `IO#read`, `IO#write` et les méthodes rattachées (e.g. `#wait_readable`, `#gets`, `#puts` etc.)
- `IO#select` n'est _pas prise en charge_.

(Expliquer la gem Async avec des liens). Cet exemple de code permet de faire plusieurs requêtes HTTP de façon concurrente.
(Expliquer ceci :)

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

- Le filtrage par motif en une ligne utilise `=>` au lieu de `in`.
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
- La définition de méthode sans le mot clé `end`.
  ```ruby
  def square(x) = x * x
  ```
- `Hash#except` est désormais inclus.

  ```ruby
  h = { a: 1, b: 2, c: 3 }
  p h.except(:a) #=> {:b=>2, :c=>3}
  ```

- Memory view est ajoutée en tant que fonctionnalité expérimentale

  - C'est un nouvel ensemble d'API C pour échanger une zone mémoire brute, comme un tableau de nombre ou une image bitmap, entre des bibliothèques d'extension. Les bibliothèques d'extension peuvent également partager les méta données de la zone mémoire comprenant la forme, le format de l'élément, etc. En utilisant ce type de métadonnées, les librairies d'extension peuvent même partager des tableaux multidimensionnels de façon appropriée. Cette fonctionnalité a été conçue en utilisant le protocole tampon de python.

## Amélioration des performances

- Plusieurs améliorations sont implémentées dans MJIT. Voir NEWS pour les détails.
- Coller du code dans IRB est 53 fois plus rapide qu'en Ruby 2.7.0. Par exemple, le temps nécessaire pour coller [cet exemple de code](https://gist.github.com/aycabta/30ab96334275bced5796f118c9220b0b) passe de 11.7 secondes à 0.22 secondes.

## Autres changements notables depuis la version 2.7

- Les arguments de mot-clé sont séparés des autres arguments.
  - En principe, le code qui affiche un avertissement dans la version 2.7 de Ruby ne fonctionnera pas. Voir le [document](https://www.ruby-lang.org/en/news/2019/12/12/separation-of-positional-and-keyword-arguments-in-ruby-3-0/) pour plus de détails.
  - La transmission d'arguments prend désormais en charge les arguments principaux.
    ```ruby
    def method_missing(meth, ...)
      send(:"do_#{ meth }", ...)
    end
    ```
- La fonctionnalité `$SAFE` a été completement supprimée. C'est désormais une variable globale.
- L'ordre de la backtrace a été inversé depuis la version 2.5 de Ruby, mais cela a été remis comme avant. Cela se comporte comme la version 2.4 de Ruby. Le message d'erreur et le numéro de ligne où l'exception apparait sont affichés en premiers. Les appelants sont affichés après.
- Plusieurs bibliothèques standard ont été mises à jour.
  - RubyGems 3.2.0.rc.1
  - Bundler 2.2.0.rc.1
  - IRB 1.2.6
  - Reline 0.1.5
- Les librairies suivantes ne sont plus incluses. Il faut installer les gemmes correspondantes pour utiliser leurs fonctionnalitées.
  - net-telnet
  - xmlrpc
- Les gemmes suivantes sont désormais incluses avec Ruby.
  - rexml
  - rss
- Les fichiers stdlib suivants sont désormais des gemmes et sont disponibles sur rubygems.org.
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

S'il vous plait, essayez Ruby 3.0.0-preview2 et faites nous des retours !

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

Ruby a été initialement développé par Matz (Yukihiro Matsumoto) en 1993 puis est devenu open source. Il fonctionne sur de nombreuses plates-formes et est utilisé partout dans le monde, en particulier pour le développement web.
