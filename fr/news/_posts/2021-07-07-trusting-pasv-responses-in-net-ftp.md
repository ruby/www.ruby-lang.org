---
layout: news_post
title: "CVE-2021-31810: Une vulnérabilité concernant la confiance des réponses FTP PASV dans Net::FTP"
author: "shugo"
translator: "Kevin Rosaz"
date: 2021-07-07 09:00:00 +0000
tags: security
lang: fr
---

Une vulnérabilité concernant la confiance des réponses FTP PASV a été découverte dans Net::FTP.
Cette vulnérabilité possède l'identifiant CVE [CVE-2021-31810](https://www.cve.org/CVERecord?id=CVE-2021-31810).
Nous vous recommandons fortement de mettre à jour Ruby.

net-ftp est une gemme incluse par défaut dans Ruby 3.0.1, mais a un problème d'empaquetage. Veuillez donc mettre à jour Ruby lui-même.

## Détails

Un serveur FTP malveillant peut utiliser la réponse PASV pour tromper Net::FTP afin qu'il se reconnecte à une adresse IP et port donnés. Cela permet potentiellement à Net::FTP de récupérer des informations sur des services qui sont par ailleurs privés et non divulgués (par exemple, l'attaquant peut effectuer des analyses de ports et récupérer les bannières de services).

## Versions concernées

* Toutes les versions de Ruby 2.6 antérieures à Ruby 2.6.7
* Toutes les versions de Ruby 2.7 antérieures à Ruby 2.7.3
* Toutes les versions de Ruby 3.0 antérieures à Ruby 3.0.1

## Remerciements

Merci à [Alexandr Savca](https://hackerone.com/sighook) pour la découverte de ce problème.

## Historique

* Paru initialement le 2021-07-07 09:00:00 UTC
