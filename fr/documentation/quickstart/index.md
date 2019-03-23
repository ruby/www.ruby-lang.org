---
layout: page
title: "Ruby en vingt minutes"
lang: fr

header: |
  <div class="multi-page">
    <strong>1</strong>
    <span class="separator"> | </span>
    <a href="2/" title="Partie 2">2</a>
    <span class="separator"> | </span>
    <a href="3/" title="Partie 3">3</a>
    <span class="separator"> | </span>
    <a href="4/" title="Partie 4">4</a>
  </div>
  <h1>Ruby en vingt minutes</h1>

---

## Introduction

Ce court tutoriel ne devrait pas prendre plus de vingt minutes de votre
temps. Il part du principe que vous avez déjà installé Ruby ; si ce
n’est pas le cas, il vous est chaleureusement conseillé de [le
faire](/fr/downloads/) avant de poursuivre votre lecture.

*Note*\: le traducteur a ici considéré qu’il était plus pertinent de
conserver l’entièreté du code en anglais, plutôt que de présenter un
mélange en « [franglais][1] » de mot-clés anglais et noms de variables
français. L’usage d’un langage de programmation, quel qu’il soit,
nécessite hélas (?) encore quelques notions essentielles dans la langue
de [Shakespeare][2].

## Interactive Ruby

Une première approche de Ruby, la plus simple, consiste à utiliser IRB (*Interactive Ruby*) dans un terminal :

* si vous utilisez **macOS**, ouvrez un `Terminal` et tapez `irb`,
  puis appuyez sur \[Entrée\] ;
* si vous êtes sous **Linux**, ouvrez une console et tapez `irb`, puis
  appuyez sur \[Entrée\] ;
* si enfin, vous utilisez **Windows**, lancez `Interactive Ruby` qui
  se trouve dans la section Ruby du menu Démarrer &gt; Applications.

IRB permet d’écrire et d’interpréter du Ruby *à la volée*, sans avoir à
enregistrer un fichier et l’exécuter ensuite.

{% highlight irb %}
irb(main):001:0>
{% endhighlight %}

Voilà, IRB est lancé. Et maintenant ?

Tapez ceci : `"Hello World"` et appuyez sur \[Entrée\] pour valider (ce
que vous devrez faire après chaque nouvelle ligne).

{% highlight irb %}
irb(main):001:0> "Hello World"
=> "Hello World"
{% endhighlight %}

## Ruby… au doigt et à l’œil

Que vient-il de se passer au juste ? Venons-nous d’écrire le plus court
programme *Hello World* jamais vu ? Pas tout à fait… mais presque. La
seconde ligne, celle débutant par le signe `=>`, est la façon dont IRB
nous informe du résultat de la dernière expression évaluée. Si nous
voulons véritablement *écrire* « Hello World », il en faut un tout petit
peu plus :

{% highlight irb %}
irb(main):002:0> puts "Hello World"
Hello World
=> nil
{% endhighlight %}

`puts` est la commande de base pour écrire quelque chose avec Ruby. Et
qu’est-ce que `nil` que nous présente IRB ? Le résultat de notre
expression `puts "Hello World"`, bien sûr ! En fait, `puts` retourne
toujours `nil`, qui est, pour Ruby et bientôt, pour vous, l’*absence
totale de valeur*.

## Premiers pas en calcul

Il est très facile d’utiliser IRB comme une vulgaire calculatrice :

{% highlight irb %}
irb(main):003:0> 3+2
=> 5
{% endhighlight %}

Trois plus deux. Assez facile, j’en conviens. Et *quid* de trois
**fois** deux ? Notez ici que vous pouvez, si vous le voulez, appuyer
sur la touche \[Flèche haut\] pour rappeler la dernière ligne tapée dans
IRB, et avec les flèches directionnelles et \[backspace\], remplacer le
signe `+` par `*`\:

{% highlight irb %}
irb(main):004:0> 3*2
=> 6
{% endhighlight %}

Maintenant, essayons trois au carré :

{% highlight irb %}
irb(main):005:0> 3**2
=> 9
{% endhighlight %}

Dans la syntaxe Ruby, `**` est là pour signifier « à la puissance… » ;
et si vous souhaitez aller dans l’autre sens, à savoir obtenir la racine
carré d’un nombre, vous écrirez ceci :

{% highlight irb %}
irb(main):006:0> Math.sqrt(9)
=> 3.0
{% endhighlight %}

Un peu moins trivial. Vous avez vraisembablement deviné que cela
demandait la racine carré (Ndt : **sq**uare **r**oo**t** en
anglais). Mais qu’est-ce que ce `Math` ?

## Les modules, ou comment regrouper le code par thématiques

`Math` est ce qu’on appelle en Ruby, un module. Il vous est fournit
d’office (il fait partie de la bibliothèque standard, qui regroupe les
modules d’intérêt général) et s’occupe, comme son nom l’indique, des
mathématiques. Les modules ont deux grands rôles à jouer au sein de
Ruby. L’exemple précédent illustre le premier de ces rôles : regrouper
des méthodes (souvent désignées sous le vocable de « fonctions » dans
d’autres langages). Par exemple, le module `Math` contient aussi, et
entre autres, les méthodes `sin` et `tan`, deux fonctions
trigonométriques biens connues.

Après `Math` venait, dans notre code source, un point « . » collé entre
`Math` et la méthode `sqrt`. Quel est son rôle ? Le point permet
d’identifier sans ambiguïté *qui* doit recevoir un message. La question
se pose donc de savoir ce qu’est un « message » en Ruby. Dans notre,
exemple, le message est tout simplement l’action désirée, à savoir
`sqrt(9)`\: « récupérer la racine carrée du chiffre 9. » Pour Ruby, ce
message consiste à appeler la méthode `sqrt`, avec le paramètre `9`, et
à retourner le résultat.

Comme vous le voyez dans IRB, le résultat de cet appel de méthode est la
valeur numérique `3.0`. Vous remarquerez ici que ce n’est pas simplement
l’entier naturel `3`. Parceque bien souvent, le résultat d’une racine
carrée n’est pas un entier, la méthode retourne par défaut un nombre
réel (du point de vue de l’ordinateur, un nombre à virgule flottante).

Si nous souhaitons conserver « quelque part » le résultat de cette
opération mathématique, il suffit de l’assigner à une variable.

{% highlight irb %}
irb(main):007:0> a = 3 ** 2
=> 9
irb(main):008:0> b = 4 ** 2
=> 16
irb(main):009:0> Math.sqrt(a+b)
=> 5.0
{% endhighlight %}

Bien, notre calculatrice est déjà un bon début, mais le sujet principal
de ce tutoriel est le programme *Hello World*. Revenons donc à nos
moutons dans la [seconde partie](2/).



[1]: http://fr.wikipedia.org/wiki/Franglais
[2]: http://fr.wikipedia.org/wiki/William_Shakespeare
