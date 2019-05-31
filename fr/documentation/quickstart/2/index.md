---
layout: page
title: "Ruby en vingt minutes"
lang: fr

header: |
  <div class="multi-page">
    <a href="../" title="Partie 1">1</a>
    <span class="separator"> | </span>
    <strong>2</strong>
    <span class="separator"> | </span>
    <a href="../3/" title="Partie 3">3</a>
    <span class="separator"> | </span>
    <a href="../4/" title="Partie 4">4</a>
  </div>
  <h1>Ruby en vingt minutes</h1>

---

Admettons, pour la bonne continuité de ce tutoriel, que nous voulons
tout à coup répéter et répéter encore « Hello World » ... mais sans trop
nous fatiguer. Il va falloir définir une méthode.

{% highlight irb %}
irb(main):010:0> def h
irb(main):011:1> puts "Hello World!"
irb(main):012:1> end
=> nil
{% endhighlight %}

Le mot-clé `def` a ici pour rôle de commencer la définition d’une
méthode. Il dit tout simplement à Ruby que nous \[*attention !*\]
commençons à écrire \[*grands signes vers Ruby*\] une nouvelle méthode,
laquelle s’appelle `h`. La ligne suivante constitue le corps de notre
méthode ; en l’occurence, il s’agit de la ligne que nous avons écrite
auparavant, `puts "Hello World"`. Enfin, la dernière ligne, `end`,
indique à Ruby que la définition de la méthode s’arrête **là**. Après
avoir appuyé sur \[Entrée\], Ruby répond… `nil`, ce qui est sa façon à
lui de dire qu’il a bien compris et enregistré notre nouvelle méthode.

## Courte et morne vie d’une méthode…

Bien, essayons de faire fonctionner cette méthode deux ou trois fois,
pour voir :

{% highlight irb %}
irb(main):013:0> h
Hello World!
=> nil
irb(main):014:0> h()
Hello World!
=> nil
{% endhighlight %}

Rien de très compliqué. Appeler une méthode en Ruby, c’est simplement
dire son nom, au minimum. Si la méthode n’attend pas de paramètres pour
préciser ce qu’elle doit faire, le nom suffira. Et d’ailleurs, vous
pouvez bien ajouter des parenthèses vides à une méthode qui n’attend
pas de paramètres : elles seront simplement ignorés.

Que faire si nous souhaitons dire bonjour à une personne en particulier,
et pas au monde entier ? Et bien, il suffit justement de demander à ce
que le nom de la personne concernée soit mentionné en tant que paramètre
de la méthode `h`\:

{% highlight irb %}
irb(main):015:0> def h(name)
irb(main):016:1> puts "Hello #{name}!"
irb(main):017:1> end
=> nil
irb(main):018:0> h("Matz")
Hello Matz!
=> nil
{% endhighlight %}

Ça fonctionne… mais pourquoi ? et comment ?

## Les chaînes des caractères

Le truc le plus étrange dans ce nouvel exemple est sûrement ce
`#{name}`. Il s’agit en fait du moyen le plus simple dont dispose Ruby
pour *insérer* quelque chose au sein d’une chaîne de caractère. Le mot
entre crochets, `name`, est à terme transformé en une chaîne de
caractère (sauf s’il en était déjà une, bien sûr) et incorporé à la
chaîne qui l’englobe (`"Hello !"`). Et comme, au départ, vous manipulez
une variable (`name`), vous pouvez lui passer des messages avec des
méthodes… Par exemple, lui demander de toujours débuter par une
majuscule avec `capitalize`\:

{% highlight irb %}
irb(main):019:0> def h(name = "World")
irb(main):020:1> puts "Hello #{name.capitalize}!"
irb(main):021:1> end
=> nil
irb(main):022:0> h "chris"
Hello Chris!
=> nil
irb(main):023:0> h
Hello World!
=> nil
{% endhighlight %}

D’autres petits ajouts ont eu lieu dans ce dernier bout de code. Tout
d’abord, nous n’appelons plus la méthode avec des parenthèses autour du
paramètre. Elles sont en effet optionnelles, et vous pouvez vous en
passer si ce que vous écrivez est trivial, comme c’est le cas ici.
Ensuite, nous avons défini une valeur par défaut pour le paramètre
`name`. Si la méthode est appelée sans que lui soit fourni un nom en
particulier, alors le nom prendra la valeur `"World"`.

## Un brin de politesse

L’accueil donné actuellement par notre méthode est un peu frustre… il ne
serait pas de trop d’avoir une formule plus respectueuse à l’encontre de
l’usager. Pour ce faire, nous utiliserons un objet. Et nous allons même
dans la foulée créer une classe, “Greeter”.

{% highlight irb %}
irb(main):024:0> class Greeter
irb(main):025:1>   def initialize(name = "World")
irb(main):026:2>     @name = name
irb(main):027:2>   end
irb(main):028:1>   def say_hi
irb(main):029:2>     puts "Hi #{@name}!"
irb(main):030:2>   end
irb(main):031:1>   def say_bye
irb(main):032:2>     puts "Bye #{@name}, come back soon."
irb(main):033:2>   end
irb(main):034:1> end
=> nil
{% endhighlight %}

Évidemment, la nouveauté la plus importante ici est le mot-clé `class`.
Son rôle est de définir une nouvelle classe, en l’occurence `Greeter`,
laquelle classe *contient* plusieurs méthodes. Vous avez également
repéré `@name`. Il s’agit d’une « variable d’instance », qui sera
disponible pour toutes les méthodes de la classe `Greeter`. Elle est
d’ailleurs utilisée par les méthodes `say_hi` et `say_bye`.

Maintenant, il s’agit de donner vie à notre classe. Donc de [créer un
objet](../3/)...
