---
layout: page
title: "De Python à Ruby"
lang: fr
---

Python est un autre très bon langage généraliste. Si vous passez de
Python à Ruby, vous verrez qu’il y a un peu plus d’éléments syntaxiques
à retenir, quelques astuces, aussi—mais que dans l’ensemble, le tout
n’est pas trop éloigné.

### Similarités

Tout comme en Python, en Ruby…

* il existe une console interactive ou 'shell' (commande `irb` pour *Interactive Ruby*) ;
* la documentation est accessible dans le terminal par la commande `ri`,
  à l’instar de `pydoc` ;
* il n’y a pas besoin de signe particulier pour marquer la fin des
  lignes, si ce n’est passer à la ligne suivante ;
* les chaînes peuvent s’étaler sur plusieurs lignes, comme avec le
  système de *triple-quotes* de Python ;
* on trouve des crochets pour les listes, des accolades pour les
  dictionnaires (que Ruby designe comme des hashs) ;
* le comportement des tableaux est le même (l’addition donne un nouveau
  long tableau, mais la composition, comme dans `@a3 = [ a1, a2 ]`,
  donne un tableau de tableaux) ;
* les objets sont fortement mais dynamiquement typés ;
* tout est un objet. Les variables ne sont que des noms pour les objets
  qu’elles référencent ;
* bien que les mot-clés soient légèrement différents, les exceptions
  agissent de la même manière ;
* un outil de documentation embarqué est disponible (RDOC, `rdoc`).

### Différences

Contrairement à Python, en Ruby…

* les chaînes sont altérables ;
* vous pouvez créer des constantes (pour Ruby, des variables dont la
  valeur n’est pas censée changer) ;
* quelques règles de nommage sont imposées (par exemple, les noms de
  classes débutent par une majuscule, de même que les constantes ; les
  variables commencent par une minuscule ; etc.) ;
* il n’existe qu’un seul type de conteneur (le tableau), altérable ;
* les chaînes de caractères entre guillemets doubles admettent les
  séquences d’échappement, telles que `\t`, ainsi qu’une syntaxe de
  substitution d’expression. Elle permet notamment d’insérer directement
  le résultat d’expressions dans d’autres chaînes sans utiliser le `+`.
  Les chaînes entre guillemets simples sont la même chose que `r"raw
  string"` de Python ;
* il n’y a aucune distinction entre des classes *old style* et *new
  style*, il n’en existe qu’un seul type ;
* l’accès aux attributs de classe se réalise toujours par des méthodes,
  jamais directement ;
* les parenthèses dans les appels de méthodes sont bien souvent
  optionnelles ;
* les mot-clés `public`, `private` et `protected` sont utilisés pour
  gérer l’accès aux classes, au lieu des syntaxes basées sur le signe
  `_` ;
* l’héritage multiple se réalise à travers le mécanisme des mixins ;
* il est possible de ré-ouvrir une classe et de la modifier à loisir, y
  compris durant l’exécution ;
* on utilisera `true` au lieu de `True`, `false` au lieu de `False`, et
  `nil` au lieu de `None` ;
* seuls `false` et `nil` s’évaluent à faux dans les tests conditionnels
  ; tout le reste est intrinsèquement vrai, y compris `0`, `0.0`,
  `"..."`, `[]`, etc. ;
* on écrira `elsif` au lieu de `elif` ;
* et `require` au lieu d’`import` ;
* l’ajout de documentation embarquée se fait par RDoc, avec la syntaxe
  usuelles des commentaires, et au-dessus des sections (et non en
  dessous) ;
* un certain nombre de raccourcis sont offerts, dont la mémorisation est
  cependant assez rapide.
