---
layout: page
title: "De Java à Ruby"
lang: fr
---

Java est un langage mature. Testé et éprouvé. Et rapide, avec ça (malgré
les racontars). D’un autre coté, il est assez verbeux. Passer Java à
Ruby, c’est vraiment voir *fondre* sa quantité de code. Ruby peut
également permettre au développeur Java une mise en place de prototypes plus rapide.

### Similarités

Tout comme en Java, en Ruby…

* la mémoire est l’affaire d’un *garbage collector* ;
* les objets sont fortement typés ;
* il y a des méthodes privées, publiques, protégées ;
* il y a des outils de documentation fournis par défaut (`ri`, RDoc),
  qui ont un *look ‘n feel* assez proche de javadoc.

### Différences

Contrairement à Java, en Ruby…

* il n’y a pas besoin de compiler son code, simplement de l’exécuter
  directement ;
* des *toolkits* graphiques différents sont disponibles. Voir par
  exemple [WxRuby][1], [FXRuby][2], [Ruby-GNOME2][3], [Qt][4],
  ou la bibliothèque Tk fournie d’office.
* utilisation du mot-clé `end` pour clôturer la définition des classes,
  par exemple, en lieu et place des accolades englobantes ;
* `require` au lieu du mot-clé `import` ;
* toutes les variables de membre sont privées ; l’accès à ces «
  attributs » se fait *via* des méthodes ;
* les parenthèses dans les appels de méthodes sont bien souvent
  optionnelles ;
* **tout** est un objet, y compris les nombres comme 2 et 3.14159 ;
* pas de vérification de typage statique ;
* les noms de variables ne sont que des étiquettes sans type ;
* pas de déclarations de type. Il suffit d’assigner un nom à une
  nouvelle variable lorsque le besoin s’en fait sentir (par exemple, `a
  = [1,2,3]` plutôt que `int[] a = {1,2,3};`) ;
* pas de *cast*. Appelez simplement les méthodes. Vos tests unitaires
  devraient vous dire très vite, avant d’exécuter le code, si une
  exception devrait survenir suite à une erreur ;
* `foo = Foo.new("hi")` au lieu de `Foo foo = new Foo("hi")`
* le constructeur s’appelle toujours `initialize`, et non pas le nom de
  la classe concernée ;
* l’héritage multiple et les interfaces sont géréés par le mécanisme des
  mixins ;
* YAML est souvent préféré à XML dans la communauté ;
* `nil` au lieu de @null ;
* Ruby attribue des comportements contraire à `==` et `equals()`. En
  Ruby, vous utiliserez `==` pour tester une équivalence logique (ce
  test est réalisé avec `equals()` en Java). La méthode `equals?()`,
  quant à elle, permet de savoir si deux objets n’en sont qu’un (c’est
  le sens de `==` en Java).



[1]: https://github.com/eumario/wxruby
[2]: https://github.com/larskanis/fxruby
[3]: https://ruby-gnome2.osdn.jp/
[4]: https://github.com/ryanmelt/qtbindings/
