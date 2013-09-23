---
layout: page
title: "De C/C++ à Ruby"
lang: fr
---

Il est quelque peu délicat d’écrire une liste des différences entre un
code rédigé en C ou C++ et sa version en Ruby, tant ces différences
seront grandes. Une des raisons à cela est que Ruby privilégie
l’exécution avant toute chose. En fait, Ruby est peut-être le langage le
plus éloigné de la vision « aucun mécanisme caché » qui prévaut en C—le
but de Ruby est plutôt de faciliter le travail de l’humain en laissant
les mécanismes internes de Ruby gérer l’essentiel du travail pendant
l’exécution. À moins que (ou jusqu’à ce que) vous ne repassiez vraiment
en revue votre code pour optimisation, vous n’aurez pas vraiment à faire
attention à la bonne santé du compilateur Ruby.

Cela étant posé, il est vraisemblable que votre code Ruby s’exécutera
moins vite que son « équivalent » en C ou C++ . Mais, d’un autre coté,
vous aller réfléchir beaucoup plus aisément et rapidement, et la version
Ruby sera beaucoup, beaucoup plus courte. Ruby est réellement plus
simple que C++, notamment.

Ruby a un mécanisme de typage dynamique et non statique, qui privilégie
l’exécution. Par exemple, il n’est pas besoin de déterminer à l’avance
quels seront les modules nécessaires (lien, chargement et utilisation),
ni l’ordre général des méthodes dans le temps, etc.

Il est heureux que le C et Ruby soient très liés. Ruby gère ce qu’on
appelera usuellement des « modules d’extensions », qui sont en fait des
modules écrits en C et utilisables au sein des programmes Ruby, où ils
se comporteront vraiment comme n’importe quel bout de code écrit en
Ruby… y compris pour l’extérieur. Cette option est assez pratique pour
mettre l’accent sur quelques parties où les performances seraient
critiques et où l’accès au bas niveau est requis.

Enfin, Ruby est lui-même écrit en C.

### Similarités avec le C

Tout comme en C, en Ruby…

* vous pouvez faire de la programmation impérative (mais il s’agira
  implicitement de programmation orientée objet) ;
* la plupart des opérateurs sont les mêmes (y compris les raccourcis
  d’opérations et les opérateurs sur les bits). Par contre, Ruby ne
  propose pas `++` et `--` ;
* `__FILE__` et `__LINE__` sont de la partie ;
* les constantes aussi, bien qu’il n’y ai pas de mot-clé du genre
  `const`\: l’état de constante est explicité par une convention de
  nommage—les noms débutant par une majuscule sont des constantes ;
* les “chaînes de caractères” sont entre *double-quotes* ;
* et elles sont modifiables ;
* à l’instar de la commande `man`, il existe `ri` pour accéder à
  l’essentiel de la documentation dans son terminal ;
* un deboggueur en ligne de commande du même genre qu’en C est
  disponible.

### Similarités avec C++

Tout comme en C++, en Ruby…

* vous avez à votre disposition les mêmes opérateurs (même `::`). `<<`
  est souvent utilisé pour ajouter des éléments à la fin d’une liste. À
  noter cependant : en Ruby, vous n’utiliserez jamais `->`, mais
  toujours et uniquement `.` ;
* `public`, `private` et `protected` ont le même sens ;
* la syntaxe pour l’héritage est aussi simple (un seul caractère : `<`
  au lieu de `:`) ;
* vous pouvez organiser votre code en modules, qui sont l’équivalent des
  `namespace` de C++ ;
* les exceptions fonctionnent de manière similaire, bien que les noms
  aient été changés—clarifiés.

### Différences avec le C

Contrairement au C, avec Ruby…

* les objets sont fortement typés (et les noms de variables en eux-mêmes
  sont dépourvus de type) ;
* pas de macros ou *preprocessing*. Pas de *casts*. Pas de pointeurs (ni
  d’arithmétique des pointeurs). Pas de *typedef*, *sizeof*, encore
  moins d’*enums*.
* pas de de fichier d’en-tête (*header*). Vous définissez directement
  les fonctions (appelées méthodes) et les classes dans le fichier
  source ;
* pas de `#define`\: utilisez plus simplement des constantes à la place
  ;
* jusqu’à Ruby 1.8, le code est interprété durant l’exécution, et non
  compilé par une machine virtuelle, ou transformé en bytecode (note :
  certaines implémentations de Ruby, dont JRuby et Ruby 2.0, proposent
  un tel mécanisme) ;
* toutes les variables vivent leur vie dans le tas. Pas besoin de les
  libérer (*free*) manuellement : le *ramasse-miettes* se charge de tout
  ;
* les paramètres des méthodes sont passés par référence, jamais par
  valeur ;
* on écrira `require 'foo'` au lieu de `#include <foo>` ou `#include
  "foo"` ;
* impossible de démonter l’abstraction jusqu’à faire de l’assembleur ;
* pas de point-virgule à la fin des instructions et lignes ;
* pas besoin de parenthèses dans les expressions `if`, `while` ;
* les parenthèses pour les appels de méthodes sont souvent optionnelles
  ;
* en général, l’utilisation d’accolades n’est pas nécessaire : les blocs
  multilignes (et même monoligne) se terminent par un `end`, à la suite
  d’un `while` par exemple ;
* le mot-clé `do` initie ce qu’on appelera un « bloc » sans plus de
  détail : il n’y a pas d’expression *do* comme en C
* le terme de « bloc » a un sens différent : il s’agit en Ruby d’un bloc
  de code associé à un appel de méthode, de sorte que le corps de la
  méthode peut rappeler le bloc pendant son exécution ;
* pas de déclarations des variables : les valeurs sont assignées
  directement, à la volée, au besoin ;
* lors des tests de vérité, seuls `false` et `nil` valent faux. Tout le
  reste retourne vrai, y compris `0`, `0.0`, `"0"`, etc.)
* pas de `char`—simplement une chaîne d’une lettre ;
* les chaînes ne se terminent pas par un octet nul ;
* utilisation des crochets au lieu des accolades pour les tableaux ;
* les tableaux s’agrandissent sans plus de cérémonie lorsqu’on leur
  ajoute de nouveaux éléments ;
* si vous additionnez deux tableaux, il vous est retourné un troisième
  tableau, alloué sur le tas ;
* dans tous les cas, sauf exception jusqu’ici inconnue, tout est une
  expression en tant que telle (ainsi, une expression `while` vaut une
  *rvalue*).

### Différences avec le C++

Contrairement au C++, en Ruby…

* il n’y a pas de références explicites. C’est-à-dire qu’en Ruby, toute
  variable est simplement un nom automatiquement déréférencé pour un
  objet quelconque ;
* les objets sont fortement mais aussi *dynamiquement* typés. Lors de
  l’exécution, il est vérifié que l’appel de méthode fonctionne
  effectivement pour le type en cours ; si ce n’est pas le cas, le
  typage est adapté à la volée ;
* le constructeur est `initialize` plutôt que le nom de la classe ;
* toutes les méthodes sont toujours virtuelles ;
* les variables (statiques) de classe commencent toujours par `@@`
  (exemple : `@@total_final`) ;
* vous n’accédez pas directement aux variables de membre : l’accès à ce
  que Ruby appelle des attributs se fait toujours par l’intermédiaire
  des méthodes ;
* `self` plutôt que `this` ;
* certaines méthodes se terminent par « ? » ou « ! », le signe faisant
  réellement partie du nom ;
* pas d’héritage multiple, mais le puissant mécanisme des *mixins*
  (héritage des méthodes d’un module) ;
* quelques conventions de style et nommage sont imposées (les noms de classes
  débutent par une majuscule, de même que les constantes, les variables
  par une minuscule, etc.) ;
* les parenthèses pour les appels de méthode sont bien souvent
  optionnelles ;
* possibilité de ré-ouvrir une classe durant l’exécution et d’y faire
  des modifications, ajouter des méthodes, etc. ;
* pas besoin des *templates* à la C++, puisque vous pouvez assigner tout
  type d’objet à une variable donnée, la gestion des types étant du
  domaine de l’exécution. Pas de *cast* non plus ;
* l’itération est réalisée quelque peu différemment : en Ruby, il n’est
  pas nécessaire d’utiliser un objet séparé comme itérateur (du genre
  `vector<T>::const_iterator iter`), car les objets peuvent inclure le
  module `Enumerator` et proposer la méthode `each` ;
* seulement deux types de conteneur : `Array` et `Hash` ;
* pas de conversions entre types. En fait, ce n’est pas nécessaire dans
  le modèle de Ruby ;
* *Multithreading* intégré d’office, avec jusqu’à Ruby 1.8 une
  séparation entre *green threads* (implémentés uniquement au sein de
  l’interprétateur) et *native threads* ;
* une bibliothèque de tests unitaires est fournie.
