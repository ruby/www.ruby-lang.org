---
layout: news_post
title: "CVE-2021-31799: Faille d'injection de commandes dans RDoc"
author: "aycabta"
translator: "Kevin Rosaz"
date: 2021-05-02 09:00:00 +0000
tags: security
lang: fr
---

Il y a une faille concernant l'injection de commandes dans RDoc qui est inclue dans Ruby.
Il est recommandé aux utilisateurs de Ruby de mettre à jour RDoc vers la dernière version afin de corriger la faille.

## Détails

La faille suivante a été signalée.

- [CVE-2021-31799](https://www.cve.org/CVERecord?id=CVE-2021-31799)

RDoc fait appel à `Kernel#open` pour ouvrir un fichier localement. Si un projet Ruby possède un fichier dont le nom commence par `|` et se termine par `tags`, alors la commande suivant le pipe (barre verticale) est exécutée. Un projet Ruby malveillant pourrait exploiter ce comportement pour exécuter des commandes arbitraires à l'encontre de l'utilisateur qui tente de lancer `rdoc`

Les utilisateurs du Ruby dont la version de RDoc est concernée par cette faille devrait faire une mise à jour vers la dernière version de RDoc.

## Versions concernées

- Toutes les versions de RDoc depuis la 3.11 jusqu'à la 6.3.0

## Comment mettre à jour ?

Veuillez lancer la commande suivante pour mettre à jour RDoc à la dernière version (6.3.1 ou supérieure) afin de corriger la faille.

```
gem install rdoc
```

## Remerciements

Merci à [Alexandr Savca](https://hackerone.com/sighook) d'avoir signalé cette faille.

## Historique

- Paru initialement le 2021-05-02 09:00:00 UTC
