---
layout: news_post
title: "Vulnérabilité de contournement de $SAFE via Exception#to_s et NameError#to_s (CVE-2012-4464, CVE-2012-4466)"
author: "Bruno Michel"
lang: fr
---

Des vulnérabilités ont été découvertes sur les méthodes Exception#to\_s, NameError#to\_s et name\_err\_mesg\_to\_s(), cette dernière faisant partie de l\'API interne de l\'interpréteur Ruby. Une personne malveillante peut contourner la vérification de $SAFE en utilisant un de ces trous de sécurité.

## Détails

$SAFE est un mécanisme de Ruby n\'autorisant du code provenant d\'un
utilisateur non-autorisé que dans un mode où la variable $SAFE est
supérieure ou égale à 4. C\'est une sorte de méthode de confinement,
interdisant certaines opérations afin de protéger les données en dehors
de la zone de confinement.

Le problème trouvé permet de contourner ce mécanisme. Les méthodes
Exception#to\_s, NameError#to\_s et name\_err\_mesg\_to\_s() ne géraient
pas correctement les bits $SAFE : une chaîne de caractères
non-contaminée (untainted) pouvait être marquée comme contaminée
(tainted), de manière destructive, par une de ces méthodes. Ainsi, du
code non-autorisé dans une zone de confinement pouvait modifier une
chaîne de caractère qui était initialement marquée comme non-contaminée.

Ruby 1.8 avait déjà eu [une faille de sécurité similaire][1].
Exception#to\_s et NameError#to\_s avaient été corrigées à sa suite,
mais le problème est resté pour name\_err\_mesg\_to\_str() malgré le
correctif de sécurité.

## Versions de Ruby affectées

* Toutes les versions de Ruby 1.8.7 antérieures au patchlevel 371
* Toutes les versions de Ruby 1.9.3 antérieures au patchlevel 286
* Toutes les branches de développement de Ruby 2.0 antérieures à la
  révision r37068

## Solution

Mettre à jour vers la dernière version disponible.

## Crédit

La vulnérabilité a été découverte par Tyler Hickes.

## Mises à jour

* Initialement publié le 2012-10-12 à 19:17:50 JST.



[1]: {{ site.url }}/en/news/2011/02/18/exception-methods-can-bypass-safe/
