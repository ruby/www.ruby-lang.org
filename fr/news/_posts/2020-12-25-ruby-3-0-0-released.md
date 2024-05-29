---
layout: news_post
title: "Ruby 3.0.0 est disponible"
author: "naruse"
translator: "chatpitre"
date: 2020-12-25 00:00:00 +0000
lang: fr
---

Nous avons le plaisir de vous annoncer la sortie de Ruby 3.0.0. Nous avons travaillé dur pour atteindre Ruby 3 dont les objectifs sont la performance, la concurrence et le typage. Surtout en ce qui concerne les performances, Matz a déclaré que "Ruby3 sera trois fois plus rapide que Ruby2" a.k.a. [Ruby 3x3](https://blog.heroku.com/ruby-3-by-3).

{% assign release = site.data.releases | where: "version", "3.0.0" | first %}

<img src='https://cache.ruby-lang.org/pub/media/ruby3x3.png' alt='Optcarrot 3000 frames' width='100%' />

Avec [Optcarrot benchmark](https://github.com/mame/optcarrot) qui mesure les performances d'un seul thread basé sur la charge de travail de l'émulation d'un jeu NES, Ruby 3.0 a atteint des performances trois fois plus rapide que Ruby 2.0 ! <details>Les mesures ont été réalisées dans l'environnement suivant : [https://github.com/ruby/ruby/tree/master/benchmark](https://github.com/ruby/ruby/tree/master/benchmark). [Commit 8c510e4095](https://github.com/ruby/ruby/commit/8c510e4095) a été utilisé comme Ruby 3.0. Cela peut ne pas être trois fois plus rapide en fonction de votre environnement ou benchmark.</details>

Ruby 3.0.0 couvre les objectifs de :

- Performance
  - MJIT
- Concurrence
  - Ractor
  - Fiber Scheduler
- Typage (Analyse statique)
  - RBS
  - TypeProf

Avec le gain de performance, Ruby 3.0 amène de nouvelles fonctionnalités (décrites ci-dessous).

## Performance

> Quand j'ai déclaré "Ruby3x3" pour la première fois dans le discours d'ouverture de la conférence, de nombreux membres de la core team ont estimé que "Matz est un vantard". En fait, j'en avais aussi l'impression. Mais nous l'avons fait. Je suis honoré de voir ce que la core team a réellement accomplie pour rendre Ruby3.0 trois fois plus rapide que Ruby2.0 (dans certains benchmarks). -- Matz

### MJIT

Plusieurs améliorations ont été implémentées dans MJIT. Voir News pour plus de détails.

A partir de Ruby 3.0, JIT est censé améliorer les performances des charges de travail limitées telles que les jeux ([Optcarrot](https://github.com/mame/optcarrot)), l'IA ([Rubykon](https://github.com/benchmark-driver)), ou n'importe quelle application qui passe la majorité de son temps à appeler quelques méthodes de nombreuse fois.

Bien que Ruby 3.0 [ait considérablement réduit la taille du code JIT](https://twitter.com/k0kubun/status/1256142302608650244), il n'est toujours pas prêt pour optimiser des charges de travail comme Rails, qui passe souvent du temps sur tant de méthodes qu'il souffre de problèmes d'i-cache exacerbés par JIT. Restez à l'écoute de Ruby 3.1 pour d'autres améliorations sur ce problème.

## Concurrence / Parallèle

> Aujourd'hui est l'ère du multi-cœur. La concurrence est très importante. Avec Ractor et Async Fiber, Ruby sera un véritable langage concurrent. --- Matz

### Ractor (expérimental)

Ractor est un modèle d'acteur permettant une abstraction pour la concurrence. Il fournit un outil permettant l'exécution de code de façon thread-safe.

Vous pouvez créer plusieurs ractors et les lancer en parallèle. Ractor vous permet de créer des programmes thread-safe puisque les ractors ne partagent pas d'objets normaux. La communication entre ractors se fait par passage de messages.

Afin de limiter le partage d'objet, Ractor introduit plusieurs restrictions sur la syntaxe de Ruby (sans plusieurs ractors, il n'y a pas de restriction).

La spécification et l'implémentation ne sont pas matures et pourront donc changer. Cette fonctionnalité est marquée comme expérimentale et montre l'avertissement "experimental feature" au premier `Ractor.new`.

Le bout de code suivant mesure le temps d'exécution du célèbre benchmark de ([la fonction de Takeuchi - Wikipedia](https://fr.wikipedia.org/wiki/Fonction_de_Takeuchi)) en l'exécutant quatre fois de façon séquentielle ou quatre fois en parallèle avec des ractors.

```ruby
def tarai(x, y, z) =
  x <= y ? y : tarai(tarai(x-1, y, z),
                     tarai(y-1, z, x),
                     tarai(z-1, x, y))
require 'benchmark'
Benchmark.bm do |x|
  # sequential version
  x.report('seq'){ 4.times{ tarai(14, 7, 0) } }

  # parallel version
  x.report('par'){
    4.times.map do
      Ractor.new { tarai(14, 7, 0) }
    end.each(&:take)
  }
end
```

```
Benchmark result:
          user     system      total        real
seq  64.560736   0.001101  64.561837 ( 64.562194)
par  66.422010   0.015999  66.438009 ( 16.685797)
```

Les résultats sont mesurés sur Ubuntu 20.04, Intel(R) Core(TM) i7-6700 (4 cores, 8 hardware threads). Cela montre que la version exécutée en parallèle est 3.87 fois plus rapide que la version séquentielle.

Voir [doc/ractor.md](https://docs.ruby-lang.org/en/3.0/ractor_md.html) pour plus de détails.

### Fiber Scheduler

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

Cet exemple de code permet de faire plusieurs requêtes HTTP de façon concurrente.

```ruby
require 'async'
require 'net/http'
require 'uri'

Async do
  ["ruby", "rails", "async"].each do |topic|
    Async do
      Net::HTTP.get(URI "https://www.google.com/search?q=#{topic}")
    end
  end
end
```

Cela utilise [async](https://github.com/socketry/async) qui fournit la boucle d'évènements. Cette boucle utilise les hooks `Fiber#scheduler` pour rendre `Net::HTTP` non bloquant. D'autres gemmes peuvent utiliser cette interface afin de fournir une exécution non bloquante à Ruby et peuvent être compatibles avec d'autres implémentations de Ruby (par exemple, JRuby, TruffleRuby) qui peuvent prendre en charge les mêmes hooks non bloquants.

## Analyse statique

> Les années 2010 ont été une ère de langages de programmation statiquement typés. Ruby souhaite un futur avec de la vérification de type statique, sans déclaration de type, en utilisant une interprétation abstraite. RBS et TypeProf sont la première étape vers le futur. D'autres étapes sont à venir. --- Matz

### RBS

RBS est un langage qui décrit les types de programmes Ruby.

Les vérificateurs de type, y compris TypeProf et d'autres outils prenant en charge RBS, comprendront mieux les programmes Ruby avec des définitions RBS.

Vous pouvez écrire la définition des classes et des modules: les méthodes qui sont définies dans la classe, les variables d'instance et leurs types, et les relations d'héritage / mix-in.

Le but de RBS est de prendre en charge les modèles couramment observés dans les programmes Ruby et de vous permettre d'écrire des types avancés, notamment les unions de type, les surcharges de méthode et les génériques. Il prend également en charge le duck typing avec _interface types_.

Ruby 3.0 arrive avec la gemme `rbs`, qui inclue l'analyse et le traitement des définitions de type écrites en RBS.

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

## Autres ajouts notables

- Le filtrage par motif en une ligne est changé (expérimental).

  - `=>` est ajouté. Il peut être utilisé comme une affectation à droite.

    ```ruby
    0 => a
    p a #=> 0

    {b: 0, c: 1} => {b:}
    p b #=> 0
    ```

  - `in` est changé pour retourner `true` ou `false`.

    ```ruby
    # version 3.0
    0 in 1 #=> false

    # version 2.7
    0 in 1 #=> raise NoMatchingPatternError
    ```

- Le pattern Find est ajouté (expérimental).

  ```ruby
  case ["a", 1, "b", "c", 2, "d", "e", "f", 3]
  in [*pre, String => x, String => y, *post]
    p pre  #=> ["a", 1]
    p x    #=> "b"
    p y    #=> "c"
    p post #=> [2, "d", "e", "f", 3]
  end
  ```

- La définition de méthode sans le mot clé `end` est ajoutée.

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

- Coller du code dans IRB est 53 fois plus rapide qu'en Ruby 2.7.0. Par exemple, le temps nécessaire pour coller [cet exemple de code](https://gist.github.com/aycabta/30ab96334275bced5796f118c9220b0b) passe de 11.7 secondes à 0.22 secondes.

<video autoplay="autoplay" controls="controls" muted="muted" width="764" height="510" poster="https://cache.ruby-lang.org/pub/media/ruby-3.0-irb-highspeed.png">
  <source src="https://cache.ruby-lang.org/pub/media/ruby-3.0-irb-highspeed.mp4" type="video/mp4">
</video>

- La commande `measure` est ajoutée à IRB. Elle permet simplement de mesurer le temps.

  ```
  irb(main):001:0> 3
  => 3
  irb(main):002:0> measure
  TIME is added.
  => nil
  irb(main):003:0> 3
  processing time: 0.000058s
  => 3
  irb(main):004:0> measure :off
  => nil
  irb(main):005:0> 3
  => 3
  ```

## Autres changements notables depuis la version 2.7

- Les arguments de mot-clé sont séparés des autres arguments.

  - En principe, le code qui affiche un avertissement dans la version 2.7 de Ruby ne fonctionnera pas. Voir le [document](https://www.ruby-lang.org/en/news/2019/12/12/separation-of-positional-and-keyword-arguments-in-ruby-3-0/) pour plus de détails.
  - La transmission d'arguments prend désormais en charge les arguments principaux.

    ```ruby
    def method_missing(meth, ...)
      send(:"do_#{ meth }", ...)
    end
    ```

- Le filtrage par motif (`case`/`in`) n'est plus expérimentale.
  - Voir la [documentation du filtrage par motif](https://docs.ruby-lang.org/en/3.0/syntax/pattern_matching_rdoc.html) pour plus de détails.
- La fonctionnalité `$SAFE` a été completement supprimée. C'est désormais une variable globale.
- L'ordre de la backtrace a été inversé depuis la version 2.5 de Ruby, mais cela a été remis comme avant. Cela se comporte comme la version 2.4 de Ruby. Le message d'erreur et le numéro de ligne où l'exception apparait sont affichés en premiers. Les appelants sont affichés après.
- Plusieurs bibliothèques standard ont été mises à jour.
  - RubyGems 3.2.3
  - Bundler 2.2.3
  - IRB 1.3.0
  - Reline 0.2.0
  - Psych 3.3.0
  - JSON 2.5.1
  - BigDecimal 3.0.0
  - CSV 3.1.9
  - Date 3.1.0
  - Digest 3.0.0
  - Fiddle 1.0.6
  - StringIO 3.0.0
  - StringScanner 3.0.0
  - etc.
- Les librairies suivantes ne sont plus incluses. Il faut installer les gemmes correspondantes pour utiliser leurs fonctionnalitées.
  - sdbm
  - webrick
  - net-telnet
  - xmlrpc
- Les gemmes suivantes sont désormais incluses avec Ruby.
  - rexml
  - rss
- Les fichiers stdlib suivants sont désormais des gemmes et sont disponibles sur rubygems.org.
  - English
  - abbrev
  - base64
  - drb
  - debug
  - erb
  - find
  - net-ftp
  - net-http
  - net-imap
  - net-protocol
  - open-uri
  - optparse
  - pp
  - prettyprint
  - resolv-replace
  - resolv
  - rinda
  - set
  - securerandom
  - shellwords
  - tempfile
  - tmpdir
  - time
  - tsort
  - un
  - weakref
  - digest
  - io-nonblock
  - io-wait
  - nkf
  - pathname
  - syslog
  - win32ole

Voir [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
ou les [logs de commit](https://github.com/ruby/ruby/compare/v2_7_0...{{ release.tag }})
pour plus de détails.

Avec ces changements, [{{ release.stats.files_changed }} fichiers changés, {{ release.stats.insertions }} insertions(+), {{ release.stats.deletions }} suppressions(-)](https://github.com/ruby/ruby/compare/v2_7_0...{{ release.tag }}#file_bucket)
depuis Ruby 2.7.0!

> Ruby3.0 est une étape importante. Le langage évolue en restant compatible. Mais ce n'est pas la fin. Ruby continuera à progresser et deviendra encore plus grand. Restez à l'écoute ! --- Matz

Joyeux Noël, bonnes vacances, et profitez de la programmation avec Ruby 3.0!

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
