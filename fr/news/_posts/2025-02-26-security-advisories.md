---
layout: news_post
title: "Avis de sécurité : CVE-2025-27219, CVE-2025-27220 et CVE-2025-27221"
author: "hsbt"
translator: "Florent Drousset"
date: 2025-02-26 07:00:00 +0000
tags: security
lang: fr
---

Nous avons publié des avis de sécurité pour CVE-2025-27219, CVE-2025-27220 et CVE-2025-27221. Veuillez lire les détails ci-dessous.

## CVE-2025-27219 : Déni de service dans `CGI::Cookie.parse`.

Une possibilité de déni de service (DoS) existe dans la gem cgi. Cette vulnérabilité a été assignée à l'identifiant CVE [CVE-2025-27219](https://www.cve.org/CVERecord?id=CVE-2025-27219). Nous recommandons de mettre à jour la gem cgi.

### Détails

La méthode `CGI::Cookie.parse` prenait un temps super-linéaire pour analyser certaines chaînes de cookies. L’insertion d’une chaîne de cookies conçue à des fins malveillantes pouvait entraîner un déni de service.

Veuillez mettre à jour la gem CGI vers la version 0.3.5.1, 0.3.7, 0.4.2 ou une version ultérieure.

### Versions affectées

* Versions de la gem cgi <= 0.3.5, 0.3.6, 0.4.0 et 0.4.1.

### Remerciements

Merci à [lio346](https://hackerone.com/lio346) pour avoir découvert ce problème. Merci également à [mame](https://github.com/mame) pour avoir corrigé cette vulnérabilité.

## CVE-2025-27220 : ReDoS dans `CGI::Util#escapeElement`.

Une possibilité de déni de service par expression régulière (ReDoS) existe dans la gem cgi. Cette vulnérabilité a été assignée à l'identifiant CVE [CVE-2025-27220](https://www.cve.org/CVERecord?id=CVE-2025-27220). Nous recommandons de mettre à jour la gem cgi.

### Détails

L'expression régulière utilisée dans `CGI::Util#escapeElement` est vulnérable à une attaque ReDoS. Une entrée malveillante pouvait entraîner une forte consommation du processeur.

Cette vulnérabilité affecte uniquement Ruby 3.1 et 3.2. Si vous utilisez ces versions, veuillez mettre à jour la gem cgi vers la version 0.3.5.1, 0.3.7, 0.4.2 ou une version ultérieure.

### Versions affectées

* Versions de la gem cgi <= 0.3.5, 0.3.6, 0.4.0 et 0.4.1.

### Remerciements

Merci à [svalkanov](https://hackerone.com/svalkanov) pour avoir découvert ce problème. Merci également à [nobu](https://github.com/nobu) pour avoir corrigé cette vulnérabilité.


## CVE-2025-27221 : Fuite d’informations utilisateur dans `URI#join`, `URI#merge` et `URI#+`.

Une possibilité de fuite d’informations utilisateur existe dans la gem `uri`. Cette vulnérabilité a été assignée à l'identifiant CVE [CVE-2025-27221](https://www.cve.org/CVERecord?id=CVE-2025-27221). Nous recommandons de mettre à jour la gem `uri`.

### Détails

Les méthodes `URI#join`, `URI#merge` et `URI#+` conservaient les informations utilisateur (comme `user:password`), même après remplacement de l’hôte. Lorsqu’une URL contenant des informations sensibles était utilisée pour générer une URL vers un hôte malveillant via ces méthodes, une fuite involontaire des informations utilisateur pouvait se produire.

Veuillez mettre à jour la gem URI vers la version 0.11.3, 0.12.4, 0.13.2, 1.0.3 ou une version ultérieure.

### Versions affectées

* Versions de la gem uri < 0.11.3, 0.12.0 à 0.12.3, 0.13.0, 0.13.1 et 1.0.0 à 1.0.2.

### Remerciements

Merci à [Tsubasa Irisawa (lambdasawa)](https://hackerone.com/lambdasawa) pour avoir découvert ce problème. Merci également à [nobu](https://github.com/nobu) pour les corrections supplémentaires apportées à cette vulnérabilité.

## Historique

* Publié initialement le 26-02-2025 à 7:00:00 (UTC).
