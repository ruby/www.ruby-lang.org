---
layout: news_post
title: "La documentation de Ruby fait peau neuve"
author: "Stan Lo"
translator: "Alexandre ZANNI"
date: 2025-12-23 00:00:00 +0000
lang: fr
---
Après la [refonte de ruby-lang.org](https://www.ruby-lang.org/fr/news/2025/12/22/redesign-site-identity/), nous avons d'autres bonnes nouvelles pour célébrer le 30e anniversaire de Ruby : [docs.ruby-lang.org][ruby-doc] fait peau neuve avec Aliki, le nouveau thème par défaut de [RDoc](https://github.com/ruby/rdoc).

## Un nouveau style visuel pour la documentation Ruby

Écrire en Ruby a toujours été un plaisir, et désormais, la lecture de la documentation Ruby peut offrir une expérience tout aussi agréable. Aliki apporte un graphisme moderne et épuré à [docs.ruby-lang.org][ruby-doc] et à toute gem générant de la documentation avec RDoc v7.0+.

## Principales fonctionnalités

- **Recherche améliorée** : tri tenant compte de la casse, correspondance approximative et prise en charge de la recherche de constantes
- **Mode sombre** : respecte les préférences de votre système d'exploitation grâce à un bouton de basculement manuel
- **Mise en page à trois colonnes** : barre latérale gauche pour la navigation, partie centrale pour le contenu, barre latérale droite pour la table des matières
- **Améliorations des blocs de code** : boutons de copie sur les blocs de code et colorisation syntaxique du code C
- **Pied de page personnalisable** : les mainteneurs de gems peuvent ajouter des liens vers leur dépôt, leur outil de suivi des tickets et d'autres ressources

## Pour les auteurs de gems

Si vous générez de la documentation avec RDoc 7.0+, vos utilisateurs verront automatiquement Aliki. Vous pouvez personnaliser les liens du pied de page ou revenir au thème Darkfish dans votre fichier `.rdoc_options`.

## Essayez-le

Découvrez la nouvelle apparence en action sur [docs.ruby-lang.org][ruby-doc].

Si vous rencontrez des problèmes ou avez des suggestions, veuillez [ouvrir un ticket](https://github.com/ruby/rdoc/issues) sur GitHub.

[ruby-doc]: https://docs.ruby-lang.org/en/master/
