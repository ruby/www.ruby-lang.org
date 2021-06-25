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
    <a href="../3/" title="Partie 3">3</a>
    <span class="separator"> | </span>
    <strong>4</strong>
  </div>
  <h1>Ruby en vingt minutes</h1>

---

Première nouveauté... la première ligne du bout de code ci-dessous. Elle
débute par le caractère # (dièse ou *sharp*). En Ruby, toute ligne
commençant par ce signe est un commentaire, qui sera totalement ignorée
par l’interpréteur (IRB compris). Cependant, dans votre fichier,
sachez que la toute première ligne (`#!/usr/bin/env ruby`) est
l’inévitable exception à la règle que je viens d’énoncer : son rôle à
elle est d’indiquer, sous un système d’exploitation Unix ou apparenté,
la bonne façon de traiter le contenu du fichier. En l’occurence, elle
signale qu’il s’agit d’un programme à manipuler avec l’interpréteur
Ruby, dont elle indique la localisation.

La méthode `say_hi` est devenue un tout petit peu plus complexe entre
temps :

{% highlight ruby %}
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
{% endhighlight %}

Elle jette maintenant un coup d’œil au paramètre `@names` pour décider
de la suite. S’il s’agit de l’absence de valeur signalée par `nil`, elle
écrira trois points « ... »—ça ne sert à rien de dire bonjour dans le
vide s’il n’y a personne, n’est-ce pas ?

## Cycles, loopings… l’itération

Si le paramètre `@name`, qui est un objet, comme toute chose en Ruby,
*comprend* la méthode `each`, cela signifie qu’il contient plusieurs
choses, et donc qu’il serait intéressant de récupérer ces choses une par
unes… de réaliser une itération, en somme. Dernier cas de figure, si
`@names` n’est ni `nil`, ni une liste à parcourir, alors il s’agit
d'une personne unique, et nous pouvons écrire son nom sans plus de
manipulation.

Voyons d’un peu plus près cette fameuse itération :

{% highlight ruby %}
@names.each do |name|
  puts "Hello #{name}!"
end
{% endhighlight %}

`each` est une méthode, un itérateur, qui travaille conjointement avec
un bloc de code. Elle fait tourner ce bloc sur chaque élément récupéré
dans une liste. Le bloc est délimité par les mot-clés `do` et `end` ; il
s’agit en quelque sorte d’une fonction qui-ne-dit-pas-son-nom, ou
fonction *lambda*, intégrée au reste du programme. Elle peut prendre des
paramètres, qui sont indiqués entre deux caractères *pipe* \|.

Dans notre exemple, pour chaque item de la liste, le paramètre `name`
prend la valeur de l’item en question, de sorte que l’expression `puts
"Hello #{name}"` s’applique à ce nom. Et donc, après itération, à tous
les noms, dans l’ordre de la liste `names`.

La plupart des autres langages utilisent un itérateur célèbre, la «
boucle for », ce qui donne par exemple en C :

{% highlight c %}
for (i=0; i<number_of_elements; i++)
{
  do_something_with(element[i]);
}
{% endhighlight %}

Ce qui fonctionne parfaitement, mais n’est pas spécialement élégant.
Vous devez en effet définir une variable locale telle que `i`,
déterminer combien d’itérations vont être effectuées, et expliciter
clairement la façon dont la boucle va fonctionner avec le `i` et le
reste… De fait, la façon de faire de Ruby est intrinsèquement plus
confortable, puisque que tous ces détails sont l’affaire de la méthode
`each`, qui les garde pour elle. De votre coté, vous ne faites que
l’appeler sur un objet de votre choix, et vous vous en remettez à elle
pour gérer la mécanique interne. Pour la petite histoire, `each`
consiste essentiellement en un appel à un mot-clé, `yield`, qui renvoie
son résultat au bloc appelant… `yield "Albert"`, `yield "Brenda"`, etc.
Mais ce n’est pas l’objet de ce tutoriel.

## Les blocs, tout simplement

La réelle puissance des blocs se dévoile dans leur utilisation dans des
contextes plus compliqués que la manipulation de listes, pour lesquelles
ils sont déjà très pratiques. Ils permettent non seulement de conserver
au sein de la méthode le « pourquoi du comment » de son fonctionnement,
mais également de gérer personnalisation, destruction et erreurs
éventuelles—tout ça loin des yeux de l’utilisateur final de la méthode,
qui s’en moque totalement.

{% highlight ruby %}
# Dire au revoir à tout le monde
def say_bye
  if @names.nil?
    puts "..."
  elsif @names.respond_to?("join")
    # Grouper les noms par des virgules
    puts "Goodbye #{@names.join(", ")}.  Come back soon!"
  else
    puts "Goodbye #{@names}.  Come back soon!"
  end
end
{% endhighlight %}

Cette méthode n’utilise pas `each`, mais la méthode `join` (si elle est
comprise par `@names` ; sinon, elle écrit juste la valeur de `@names`,
comme dans la méthode précédente). Cette approche consistant à se baser
sur ce que la méthode *sait faire*, plutôt que sur ce qu’elle *est* (sur
les méthodes disponibles plutôt que sur le type de l’objet traité), est
désignée par l’expression *Duck Typing*. Le fameux « si ça marche comme
un canard et que ça couine comme un canard, alors c’est un canard. » Le
principal bénéfice de cette façon de faire est qu’elle ne limite pas de
façon abusive les types de variables supportés. Si quelqu’un décide un
jour, par génie ou bêtise, de créer un nouveau type de liste, et écrit
une classe pour cela, tant que cette classe implémente la méthode `join`
en collant à la sémantique des autres listes (*ie*. tant que `join` fait
quelque chose de censé, tout simplement), alors tout fonctionnera
parfaitement bien.

## La SuperVersion finale du SuperProgramme

Nous voilà donc rendus au bout de l’examen de notre super programme,
tirant parti des principales fonctionnalités de base de Ruby. Il
contient la classe `MegaGreeter`, le reste du fichier étant simplement
des appels à cette classe, la manipulation d’instances… Il reste un seul
point d’ombre :

{% highlight ruby %}
if __FILE__ == $0
{% endhighlight %}

`__FILE__` est une variable « magique » qui contient le nom du fichier
courant. `$0` contient quant à elle le nom du fichier utilisé pour
lancer le programme courant. La ligne réalise donc le test « si c’est
bien *ce* fichier que nous utilisons actuellement… », ce qui permet par
exemple d’utiliser un fichier comme bibliothèque, en n’exécutant
volontairement du code que si le fichier est exécuté, comme un programme
autonome.

## Bienvenue à bord

Notre rapide tour de Ruby touche maintenant à sa fin… mais il reste
encore bien des choses à explorer ! À commencer par les différentes
structures de contrôles offertes par Ruby, l’utilisation des blocs et de
`yield`, les modules et les mixins, et plus encore. J’espère que cet
avant-goût vous aura donné envie de poursuivre plus avant.

Si tel est le cas, rendez-vous sur notre
[documentation](/fr/documentation), qui rassemble des liens vers des
manuels et tutoriels disponibles gratuitement en ligne.

Bonne continuation !
