---
layout: page
title: "De PHP à Ruby"
lang: fr
---

PHP est très répandu pour les applications Web, mais si vous avez
découvert Ruby on Rails ou souhaitez aborder un langage plus
généraliste, Ruby vaut certainement le coup d’œil.

### Similarités

Tout comme en PHP, en Ruby…

* le typage est dynamique : pas besoin de déclarer les variables ;
* il y a des classes, dont la gestion est la même qu’en PHP 5 (`public`,
  `protected`, `private`, etc.) ;
* certaines variables débutant par `$` (mais pas toutes : seulement les
  globales) ;
* `eval` est disponible (il est recommandé d'y apporter la même attention vis-à-vis des performances et de la sécurité) ;
* interpolation au sein des chaînes de caractères, de la forme
  `"#{foo} is a #{bar}"` au lieu de `"$foo is a $bar"`. Comme en PHP,
  cela ne fonctionne que pour les chaînes entre guillemets doubles ;
* les heredocs (échappement d'un bloc de texte) sont aussi disponibles ;
* des exceptions pour gérer les erreurs, comme en PHP 5 ;
* une bibliothèque standard relativement fournie ;
* des tableaux et des hashs identiques sur le fond, la forme étant
  respectivement `{...}` au lieu de `array()` ;
* `true` et `false` identiques, avec simplement `null` écrit `nil` ;

### Différences

Contrairement à PHP, avec Ruby…

* le typage est fort. Il faut utiliser des méthodes comme `to_s`, `to_i`
  pour faire les conversions de types ;
* nombres, chaînes de caractères, tableaux, hash, etc. tous sont des
  objets. Par exemple, on écrira `-1.abs` et non pas `abs(-1)` ;
* les parenthèses sont souvent optionnelles, notamment dans les appels
  de méthodes. Usage recommandé pour clarifier la filiation des
  paramètres, cependant ;
* la bibliothèque standard s’organise en modules et classes ;
* la réflection est une capacité intrinsèque des objets : pas besoin
  d’utiliser une classe comme `Reflection` en PHP 5 ;
* les variables sont des références aux objets (leurs noms), pas des
  objets ;
* pas de classes abstraites (`abstract`) ni d’interfaces ;
* les tableaux et dictionnaires (hashs) ne sont pas interchangeables ;
* seuls `false` et `nil` s’évaluent à faux : `0`, `array()`, `"..."`
  valent tous vrai dans les tests conditionnels ;
* à peu près tout est un appel de méthode, d’une manière ou d’une autre
  (même `raise`, le `throw` de PHP).
