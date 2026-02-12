---
layout: news_post
title: "Sortie de la version 2.0.0-p247 de Ruby"
author: "nagachika"
translator: "Bruno Michel"
date: 2013-06-27 11:00:03 +0000
lang: fr
---

La version 2.0.0-p247 de Ruby vient d'être publiée.

Cette version inclut un correctif de sécurité sur la bibliothèque OpenSSL
embarquée :

 * [Vulnérabilité dans le client SSL permettant de contourner la vérification du nom de domaine
   (CVE-2013-4073)](/fr/news/2013/06/27/hostname-check-bypassing-vulnerability-in-openssl-client-cve-2013-4073/)

Elle contient également des correctifs de bugs.

## Téléchargement

Vous pouvez télécharger cette version depuis :

* [https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p247.tar.bz2](https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p247.tar.bz2)

      SIZE:   10804581 bytes
      MD5:    60913f3eec0c4071f44df42600be2604
      SHA256: 08e3d4b85b8a1118a8e81261f59dd8b4ddcfd70b6ae554e0ec5ceb99c3185e8a

* [https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p247.tar.gz](https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p247.tar.gz)

      SIZE:   13652782 bytes
      MD5:    c351450a0bed670e0f5ca07da3458a5b
      SHA256: 3e71042872c77726409460e8647a2f304083a15ae0defe90d8000a69917e20d3

* [https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p247.zip](https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p247.zip)

      SIZE:   15100206 bytes
      MD5:    7548f781d868456e84afcd0327c7f894
      SHA256: 40c938238075b1e7e8df5d7ebfd069a45b93066318d91da9024d81b20a1c5a8a

## Modifications

Les principaux correctifs sont listés ci-dessous.

Voyez les [tickets](https://bugs.ruby-lang.org/projects/ruby-200/issues?set_filter=1&amp;status_id=5)
et le [ChangeLog](https://git.ruby-lang.org/ruby.git/plain/ChangeLog?id=refs/tags/v2_0_0_247) pour plus de détails.

### Arguments mots-clés

* [#8040](https://bugs.ruby-lang.org/issues/8040) modification de la priorité entre les arguments mots-clés et les arguments obligatoires.
* [#8416](https://bugs.ruby-lang.org/issues/8416) super ne transmet pas les `**` nommés ou anonymes.
* [#8463](https://bugs.ruby-lang.org/issues/8463) bug sur le Proc auto-splat avec les arguments nommés.

### VM/Language Processing

* [#8424](https://bugs.ruby-lang.org/issues/8424) corrige une boucle infinie sur un débordement de pile avec TH_PUSH_TAG()
* [#8436](https://bugs.ruby-lang.org/issues/8436) \__dir__ ne fonctionne pas dans eval avec binding
* [#8489](https://bugs.ruby-lang.org/issues/8489) Le tracepoint API: B_RETURN_EVENT n'est pas déclenché quand "next" est utilisé
* [#8341](https://bugs.ruby-lang.org/issues/8341) block_given? (et le bloc actuel) persiste entre des appels à un proc créé depuis une méthode (en utilisant method().to_proc()).
* [#8531](https://bugs.ruby-lang.org/issues/8531) block_given? (et le bloc actuel) persiste entre des appels à un proc créé par Symbol#to_proc.

### RubyGems

La version embarquée de RubyGems est maintenant la 2.0.3.

### Encodage

* [#8516](https://bugs.ruby-lang.org/issues/8516) IO#readchar retourne de mauvais codepoints sur des conversions d'encodage

### Windows

* [#8431](https://bugs.ruby-lang.org/issues/8431) File.read() plante sur Win32SP3 32bit

### Bibliothèques

* [#8467](https://bugs.ruby-lang.org/issues/8467) Rembobiner et itérer à travers IO gzippés provoquent des segmentation faults
* [#8415](https://bugs.ruby-lang.org/issues/8415) Net::IMAP#capability_response lève une exception "Net::IMAP::ResponseParseError: unexpected token CRLF" pour une CAPABILITY courante

## Commentaire

De nombreux committers, testeurs et utilisateurs qui ont remonté des bugs
m'ont aidé pour sortie cette version. Merci pour leurs contributions.
