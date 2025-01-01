---
layout: page
title: "Ruby en vingt minutes"
lang: fr

header: |
  <div class="multi-page">
    <a href="../" title="Partie 1">1</a>
    <span class="separator"> | </span>
    <a href="../2/" title="Partie 2">2</a>
    <span class="separator"> | </span>
    <strong>3</strong>
    <span class="separator"> | </span>
    <a href="../4/" title="Partie 4">4</a>
  </div>
  <h1>Ruby en vingt minutes</h1>

---

Maintenant, créons un objet de la classe `Greeter` et animons-le :

{% highlight irb %}
irb(main):035:0> g = Greeter.new("Pat")
=> #<Greeter:0x16cac @name="Pat">
irb(main):036:0> g.say_hi
Hi Pat!
=> nil
irb(main):037:0> g.say_bye
Bye Pat, come back soon.
=> nil
{% endhighlight %}

Une fois l’objet `g` créé, il se souvient que le nom qui lui est lié est
Pat, comme indiqué à sa création. Il serait d’ailleurs intéressant de
pouvoir récupérer directement ce nom. Essayons :

{% highlight irb %}
irb(main):038:0> g.@name
SyntaxError: compile error
(irb):52: syntax error
        from (irb):52
{% endhighlight %}

Whoa, ça n’a pas l’air possible pour l’instant.

## Dans la peau d’un objet

`name` est, comme nous l’avons vu, une variable d’instance. « Instance »
est synonyme d’objet. Les variables d’instances sont donc cachées au
cœur des objets que nous pouvons créer à loisir, en utilisant un modèle
générique, la classe. Mais elles ne sont pas si bien cachées que ça.
Pour commencer, vous pouvez les voir si vous *inspectez* un objet (avec
la méthode `inspect`), et il existe des moyens d’y accéder. Mais Ruby
fait en sorte de garder un peu d’ordre dans sa maison, et collant au
plus près de l’approche orientée objet, y compris dans la gestion des
données et variables qui les renferment.

Quelles sont les méthodes disponibles pour nos instances de la classe
`Greeter` ?

{% highlight irb %}
irb(main):039:0> Greeter.instance_methods
=> ["method", "send", "object_id", "singleton_methods",
    "__send__", "equal?", "taint", "frozen?",
    "instance_variable_get", "kind_of?", "to_a",
    "instance_eval", "type", "protected_methods", "extend",
    "eql?", "display", "instance_variable_set", "hash",
    "is_a?", "to_s", "class", "tainted?", "private_methods",
    "untaint", "say_hi", "id", "inspect", "==", "===",
    "clone", "public_methods", "respond_to?", "freeze",
    "say_bye", "__id__", "=~", "methods", "nil?", "dup",
    "instance_variables", "instance_of?"]
{% endhighlight %}

Ouch. Voilà une sacré liste de méthodes. Et pourtant, nous n’en avons
défini que deux… d’où sortent donc les autres ? En fait, il s’agit d’une
liste exhaustive des méthodes applicables aux objets de la classe
`Greeter`, y compris celles définies dans les classes *parentes* de
`Greeter`. Si nous voulons obtenir la listes des méthodes définies
uniquement pour `Greeter`, il suffit de passer le paramètre `false`\:

{% highlight irb %}
irb(main):040:0> Greeter.instance_methods(false)
=> ["say_bye", "say_hi"]
{% endhighlight %}

Ok, c’est déjà plus confortable. Et conforme. Vérifions que c’est vrai,
en testant quelles méthodes reconnaissent effectivement les instances de
`Greeter`\:

{% highlight irb %}
irb(main):041:0> g.respond_to?("name")
=> false
irb(main):042:0> g.respond_to?("say_hi")
=> true
irb(main):043:0> g.respond_to?("to_s")
=> true
{% endhighlight %}

Une instance de `Greeter` connaît donc `say_hi` et `to_s` (une méthode
qui transforme « quelque chose » en une chaîne de caractère et qui est
disponible pour tout objet). Par contre, la méthode `name` est inconnue.

## Modifier les classes *a posteriori*

Mais nous n’en démordrons pas : il nous *faut* un moyen de récupérer le
nom lié à un objet. Comment faire ? Ruby propose un moyen très simple
pour accéder aux variables d’instances :

{% highlight irb %}
irb(main):044:0> class Greeter
irb(main):045:1>   attr_accessor :name
irb(main):046:1> end
=> [:name, :name=]
{% endhighlight %}

Il semblerait que nous ayons défini une seconde fois la classe
`Greeter`... mais il n’en est rien. Nous l’avons simplement « ré-ouverte
» et modifiée. Et les changements ainsi définis sont immédiatement
disponibles dans tout objet nouvellement créé, ainsi que dans ceux déjà
existants ! Créons un nouvel objet et testons l’artifice :

{% highlight irb %}
irb(main):047:0> g = Greeter.new("Andy")
=> #<Greeter:0x3c9b0 @name="Andy">
irb(main):048:0> g.respond_to?("name")
=> true
irb(main):049:0> g.respond_to?("name=")
=> true
irb(main):050:0> g.say_hi
Hi Andy!
=> nil
irb(main):051:0> g.name="Betty"
=> "Betty"
irb(main):052:0> g
=> #<Greeter:0x3c9b0 @name="Betty">
irb(main):053:0> g.name
=> "Betty"
irb(main):054:0> g.say_hi
Hi Betty!
=> nil
{% endhighlight %}

Le fait d’écrire `attr_accessor` a implicitement défini deux nouvelles
méthodes à peu de frais : `name` pour récupérer la valeur de la
variable/objet `name`, et `name=` pour la définir et la modifier.

## Accueillir tout et tout le monde !

Le problème avec notre programme actuel, c’est qu’il ne peut s’occuper
que d’une seule personne à la fois. Il nous faut vraiment un…
SuperProgramme, qui pourrait aussi bien s’occuper de tout le monde en
une fois, que d’une seule personne ou de plusieurs personnes à la fois…

Comme notre programme commence à prendre de l’ampleur, arrêtons ici avec
IRB, et continuons dans un véritable éditeur de texte. Nous allons
enregistrer la suite dans un fichier. Pour quitter IRB, écrivez
simplement `quit`, `exit` ou appuyez sur \[Ctrl\]+\[D\].

Notre fichier va se présenter comme suit :

{% highlight ruby %}
#!/usr/bin/env ruby

class MegaGreeter
  attr_accessor :names

  # Création d'un objet
  def initialize(names = "World")
    @names = names
  end

  # Saluer tout le monde
  def say_hi
    if @names.nil?
      puts "..."
    elsif @names.respond_to?("each")
      # @names est une liste de noms : traitons-les uns par uns
      @names.each do |name|
        puts "Hello #{name}!"
      end
    else
      puts "Hello #{@names}!"
    end
  end

  # Dire au revoir à tout le monde
  def say_bye
    if @names.nil?
      puts "..."
    elsif @names.respond_to?("join")
      # Grouper les différents noms de la liste par des virgules
      puts "Goodbye #{@names.join(", ")}.  Come back soon!"
    else
      puts "Goodbye #{@names}.  Come back soon!"
    end
  end

end


if __FILE__ == $0
  mg = MegaGreeter.new
  mg.say_hi
  mg.say_bye

  # Modifier le nom en Zeke
  mg.names = "Zeke"
  mg.say_hi
  mg.say_bye

  # Changer le nom pour un tableau (une liste de noms)
  mg.names = ["Albert", "Brenda", "Charles",
    "Dave", "Engelbert"]
  mg.say_hi
  mg.say_bye

  # Maintenant, le nom n'est plus...
  mg.names = nil
  mg.say_hi
  mg.say_bye
end
{% endhighlight %}

Sauvegardez ce fichier, par exemple en tant que “ri20min.rb”
(l’extension .rb, pour ruby, est importante sous Windows, d’usage sous
les autres OS), et éxécutez-le en tapant “ruby ri20min.rb” dans votre
terminal. Vous devriez y lire ceci :

    Hello World!
    Goodbye World.  Come back soon!
    Hello Zeke!
    Goodbye Zeke.  Come back soon!
    Hello Albert!
    Hello Brenda!
    Hello Charles!
    Hello Dave!
    Hello Engelbert!
    Goodbye Albert, Brenda, Charles, Dave, Engelbert.  Come
    back soon!
    ...
    ...
{: .code}

Il y a un certain nombre de choses nouvelles dans ce fichier.
[Examinons-les en détails](../4/).
