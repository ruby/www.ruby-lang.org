---
layout: news_post
title: "Changement des options par défaut de ext/openssl"
author: "usa"
translator: "Geoffrey Roguelon"
date: 2014-10-27 12:00:00 +0000
tags: security
lang: fr
---

Nous avons changé les options par défaut de ext/openssl dans Ruby 2.1.4,
Ruby 2.0.0-p594 et Ruby 1.9.3-p550.
Avec ce changement, les options non-sécurisées de SSL/TLS sont désactivées par défaut.
Cependant, avec ce changement, il se peut que certains problèmes apparaissent
avec les connexions SSL.

## Détails

OpenSSL implémente encore des protocoles et des algorithmes de chiffrement
reconnus comme vulnérables pour des raisons historiques.
Par exemple, la faille POODLE ([CVE-2014-3566](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-3566)),
si vous continuez à utiliser OpenSSL avec ce genre de fonctionnalités, il se
peut que vous ne puissiez garantir la sécurité de vos échanges réseaux.
Par conséquent, suite à la discussion du [bug #9424](https://bugs.ruby-lang.org/issues/9424),
nous avons décidé de désactiver les options non-sécurisées de SSL/TLS par défaut.
Si vous avez besoin d'annuler ce changement (inclus ci-dessous), appliquez le
patch inverse pour revenir en arrière.

2.1.4
: [r48098](https://git.ruby-lang.org/ruby.git)

2.0.0-p594
: [r48110](https://git.ruby-lang.org/ruby.git)

1.9.3-p550
: [r48121](https://git.ruby-lang.org/ruby.git)

Néanmoins, si vous annulez ce changement, vous risquez de ne plus pouvoir
garantir la sécurité de vos communications réseaux.
Vous devez comprendre les implications de ce changement avant de le supprimer.

### Bibliothèques incluses dans Ruby

Ce changement affecte les bilbiothèques net/http, net/imap et net/pop.
Depuis que DRb et WEBrick gèrent leurs options séparément, ce changement ne les
concerne pas.

### Scripts utilisant ext/openssl directement

Ce changement affecte les instances de l'objet `OpenSSL::SSL::SSLContext` et les
appels de la méthode d'instance `set_params`.

Plus particulièrement les codes du type :

{% highlight ruby %}
ctx = OpenSSL::SSL::SSLContext.new
ctx.set_params  # si vous voulez changez certaines options, telle que le mode de vérification et autre, vous pouvez les passer dans une Hash
ssl = OpenSSL::SSL::SSLSocket.new(socket, ctx)
{% endhighlight %}

Quand vous utilisez ext/openssl côté client, nous partons du principe que ce
changement ne posera pas de problème.
Par contre, si vous utilisez ext/openssl côté serveur et que vous utilisez ces
nouvelles options, il se peut que certains anciens clients (Internet Explorer 6
sur Windows XP, les navigateurs sur les vieux mobiles, etc…) ne puissent pas se
connecter au serveur.

Cette décision vous appartient d'appliquer ou non ce changement, considérez le
pour et le contre.

## Solution alternative

Si vous ne pouvez pas mettre à jour Ruby mais que vous devez vous prémunir des
options non-sécurisées de SSL/TLS, appliquez le patch suivant à vos projets :

{% highlight ruby %}
module OpenSSL
  module SSL
    class SSLContext
      remove_const(:DEFAULT_PARAMS)
      DEFAULT_PARAMS = {
        :ssl_version => "SSLv23",
        :verify_mode => OpenSSL::SSL::VERIFY_PEER,
        :ciphers => %w{
          ECDHE-ECDSA-AES128-GCM-SHA256
          ECDHE-RSA-AES128-GCM-SHA256
          ECDHE-ECDSA-AES256-GCM-SHA384
          ECDHE-RSA-AES256-GCM-SHA384
          DHE-RSA-AES128-GCM-SHA256
          DHE-DSS-AES128-GCM-SHA256
          DHE-RSA-AES256-GCM-SHA384
          DHE-DSS-AES256-GCM-SHA384
          ECDHE-ECDSA-AES128-SHA256
          ECDHE-RSA-AES128-SHA256
          ECDHE-ECDSA-AES128-SHA
          ECDHE-RSA-AES128-SHA
          ECDHE-ECDSA-AES256-SHA384
          ECDHE-RSA-AES256-SHA384
          ECDHE-ECDSA-AES256-SHA
          ECDHE-RSA-AES256-SHA
          DHE-RSA-AES128-SHA256
          DHE-RSA-AES256-SHA256
          DHE-RSA-AES128-SHA
          DHE-RSA-AES256-SHA
          DHE-DSS-AES128-SHA256
          DHE-DSS-AES256-SHA256
          DHE-DSS-AES128-SHA
          DHE-DSS-AES256-SHA
          AES128-GCM-SHA256
          AES256-GCM-SHA384
          AES128-SHA256
          AES256-SHA256
          AES128-SHA
          AES256-SHA
          ECDHE-ECDSA-RC4-SHA
          ECDHE-RSA-RC4-SHA
          RC4-SHA
        }.join(":"),
        :options => -> {
          opts = OpenSSL::SSL::OP_ALL
          opts &= ~OpenSSL::SSL::OP_DONT_INSERT_EMPTY_FRAGMENTS if defined?(OpenSSL::SSL::OP_DONT_INSERT_EMPTY_FRAGMENTS)
          opts |= OpenSSL::SSL::OP_NO_COMPRESSION if defined?(OpenSSL::SSL::OP_NO_COMPRESSION)
          opts |= OpenSSL::SSL::OP_NO_SSLv2 if defined?(OpenSSL::SSL::OP_NO_SSLv2)
          opts |= OpenSSL::SSL::OP_NO_SSLv3 if defined?(OpenSSL::SSL::OP_NO_SSLv3)
          opts
        }.call
      }
    end
  end
end
{% endhighlight %}

## Versions concernées

* Ruby 1.9.3 patchlevel 550 et plus récent
* Ruby 2.0.0 patchlevel 594 et plus récent
* Ruby 2.1.4 et plus récent
* révision 48097 du trunk et plus récente

## Historique

* Article publié le 27 octobre 2014 à 12h00 (UTC)
