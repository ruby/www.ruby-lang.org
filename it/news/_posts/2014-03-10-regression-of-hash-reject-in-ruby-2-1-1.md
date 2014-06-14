---
layout: news_post
title: "Regressione di Hash#reject in Ruby 2.1.1"
author: "sorah"
translator: "alepore"
date: 2014-03-10 14:00:00 +0000
lang: it
---

In Ruby 2.1.0 e precedenti il metodo `reject` in ogni classe che eredita
`Hash` ritorna un oggetto della propria classe.
In Ruby 2.1.1 invece questo comportamento è accidentalmente cambiato per
ritornare sempre un semplice oggetto Hash, non della classe che eredita.

{% highlight ruby %}
class SubHash < Hash
end

p Hash.new.reject { }.class
#=> 2.1.0: Hash, 2.1.1: Hash
p SubHash.new.reject { }.class
#=> 2.1.0: SubHash, 2.1.1: Hash
{% endhighlight %}

(Per essere precisi non vengono copiati neanche extra states come le variabili
di istanza ecc.)

Ruby 2.1.1 non dovrebbe includere questo cambio di comportamento perché con il
rilascio di Ruby 2.1.0 abbiamo [cambiato la nostra policy di versioning](https://www.ruby-lang.org/it/news/2013/12/21/ruby-version-policy-changes-with-2-1-0/),
quindi Ruby 2.1.1 è una patch level release e non dovrebbe rompere la
retrocompatibilità.

Questa regressione potrebbe potenzialmente affliggere molte librerie, uno di
questi casi è `HashWithIndifferentAccess` e `OrderedHash` di Rails.
Sono rotti: [issue #14188 di Rails](https://github.com/rails/rails/issues/14188).

Questo comportamento sarà ripristinato come era nella 2.1.0 in Ruby 2.1.2,
ma è previsto diventare il comportamento di default su Ruby 2.2.0:
[Feature #9223](https://bugs.ruby-lang.org/issues/9223).
Raccomandiamo quindi di modificare il vostro codice in modo da attendersi questa
modifica.

Questo incidente è stato causato da un backport commit mancante. Per maggiori
dettagli vedere [http://blog.sorah.jp/2014/03/10/hash-reject-regression-in-ruby211](http://blog.sorah.jp/2014/03/10/hash-reject-regression-in-ruby211).

Siamo spiacenti per ogni inconveniente causato, grazie per il supporto.
