---
layout: news_post
title: "CVE-2021-32066: Une vulnérabilité StartTLS stripping dans Net::IMAP"
author: "shugo"
translator: "Kevin Rosaz"
date: 2021-07-07 09:00:00 +0000
tags: security
lang: fr
---

Une vulnérabilité StartTLS stripping a été découverte dans Net::IMAP.
Cette vulnérabilité possède l'identifiant CVE [CVE-2021-32066](https://www.cve.org/CVERecord?id=CVE-2021-32066).
Nous vous recommandons fortement de mettre à jour Ruby.

net-imap est une gemme incluse par défaut dans Ruby 3.0.1, mais a un problème d'empaquetage. Veuillez donc mettre à jour Ruby lui-même.

## Détails

Net::IMAP ne lève pas d'exception lorsque StartTLS échoue avec une réponse inconnue. Cela pourrait permettre à des attaques de type man-in-the-middle de contourner les protections de TLS en se positionnant entre le client et le registre pour bloquer la commande StartTLS, alias une attaque par "StartTLS stripping".

## Versions concernées

* Toutes les versions de Ruby 2.6 antérieures à Ruby 2.6.7
* Toutes les versions de Ruby 2.7 antérieures à Ruby 2.7.3
* Toutes les versions de Ruby 3.0 antérieures à Ruby 3.0.1

## Remerciements

Merci à [Alexandr Savca](https://hackerone.com/sighook) pour la découverte de ce problème.

## Historique

* Paru initialement le 2021-07-07 09:00:00 UTC
