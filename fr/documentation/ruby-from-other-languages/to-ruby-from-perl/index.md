---
layout: page
title: "De Perl à Ruby"
lang: fr
---

Perl est super. Sa documentation est super. La communauté Perl est…
super. Mais, mais, le langage est relativement gros et sans aucun doute
complexe. Pour tous les amateurs de Perl qui souhaiteraient quelque
chose de plus simple, un langage plus carré, plus élégant du point de
vue objet, avec beaucoup de fonctionnalités accessibles de base, Ruby
pourrait bien être intéressant.

### Similarités

Tout comme en Perl, en Ruby…

* vous avez un système de paquets, comme CPAN : [RubyGems][1] ;
* les regex (expressions régulières) font partie du pack de base ;
* il y a pas mal d’outils d’usage courant fournis d’office ;
* les parenthèses sont souvent optionnelles ;
* les chaînes de caractères sont globalement gérées de la même manière ;
* la syntaxe pour borner chaînes et regex est similaire (du genre
  `%q{hop}` (single-quote), ou `%Q{hop}` (double-quote), et
  `%w{une phrase à part entière}`. Vous `%Q|pouvez|` `%Q(utiliser)`
  `%Q^d'autres^` signes de début et fin, si vous le voulez) ;
* interpolation de variable dans les chaînes entre guillemets doubles :
  `"comme #{ceci}..."`. `#{}` peut contenir n’importe quel genre et
  longueur de code Ruby ;
* les commandes shell sont de `` `cette forme` `` ;
* un outil embarqué de documentation, `rdoc`, est à votre disposition.

### Différences

Contrairement à Perl, en Ruby…

* pas de règles dépendantes du contexte ;
* une variable n’est pas la même chose que l’objet auquel elle se réfère :
  c’est toujours en Ruby une référence (et seulement cela) à un objet ;
* bien que `$` et `@` soient parfois utilisés comme premier
  caractère de variables, ils indiquent non pas son type, mais sa portée
  (`$` pour les globales, `@` pour les instances d’objet, et
  `@@` pour les attributs de classes) ;
* les positions de tableaux sont entre crochets, et non entre
  parenthèses ;
* la création d’une liste à partir de plusieurs ne les regroupe pas en
  une grosse liste : il vous est retourné un tableau de tableaux ;
* `def` au lieu `sub` ;
* pas besoin de point-virgule à la fin de chaque ligne. En règle
  générale, les définitions de méthodes, classes, les blocs sont
  clôturés avec le mot-clé `end` ;
* les objets sont fortement typés. Il faut faire appel à des méthodes
  telles que `foo.to_i`, `foo.to_s` pour réaliser les conversions entre
  types ;
* pas de `eq`, `ne`, `lt`, `gt`, `ge`, `le` ;
* pas de *diamond operator* (`<>`)\: on utilisera en général
  `IO.une_fonction` à la place ;
* le symbole `=>` n’est utilisée que pour les littéraux de hash ;
* pas de `undef`. Ruby utilise `nil`, un objet modélisant l’absence de
  valeur et valant faux en terme de booléen ;
* seuls `false` et `nil` rendent faux dans les tests de vérité ; tout le
  reste est intrinsèquement vrai, y compris `0`, `0.0`, `"0"`, etc ;
* pas de [PerlMonks][2]... mais la liste de diffusion ruby-talk est très
  pratique aussi.



[1]: http://guides.rubygems.org
[2]: http://www.perlmonks.org/
