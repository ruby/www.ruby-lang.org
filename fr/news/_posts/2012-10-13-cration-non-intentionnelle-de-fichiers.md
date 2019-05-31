---
layout: news_post
title: "Création non-intentionnelle de fichiers"
author: "Bruno Michel"
lang: fr
---

Une vulnérabilité a été découverte, qui permet la création non-intentionnelle de fichiers en insérant de manière bien choisie des caractères NUL dans le chemin des fichiers.

## Détails

Ruby permet de manipuler des données binaires arbitraires en tant que
chaînes de caractères, y compris des caractères NUL. Par contre, les
systèmes d\'exploitation et autres bibliothèques ont tendance à être
plus restrictifs et à utiliser NUL comme marqueur de fin de chaînes.
Ainsi, pour les interfacer correctement avec Ruby, il convient de
traiter correctement les caractères NUL.

Cependant, certaines méthodes comme IO#open ne faisaient aucune
vérification sur les noms de fichiers qui lui étaient passés, et
transféraient telles quelles ces chaînes de caractères aux primitives de
plus bas niveau. Cela pouvait conduire à la création non-intentionnelle
de fichiers, comme dans cet exemple :

    p File.exists?("foo")      #=> false
    open("foo\0bar", "w") { |f| f.puts "hai" }
    p File.exists?("foo")      #=> true
    p File.exists?("foo\0bar") #=> raises ArgumentError

## Versions de Ruby affectées

* Toutes les versions de Ruby 1.9.3 antérieurs au patchlevel 286
* Toutes les branches de développement de Ruby 2.0.0 antérieures à la
  révision r37163

## Solution

Mettre à jour vers la version la plus récente.

## Crédit

Ce problème a été remonté par Peter Bex.

## Mises à jour

* Initialement publiées le 2012-10-12 à 19:19:55 JST.
