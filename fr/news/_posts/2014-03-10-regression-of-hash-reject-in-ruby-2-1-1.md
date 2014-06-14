---
layout: news_post
title: "Régression de la méthode Hash#reject dans Ruby 2.1.1"
author: "sorah"
translator: "Geoffrey Roguelon"
date: 2014-03-10 14:00:00 +0000
lang: fr
---

Dans les versions de Ruby 2.1.0 et inférieures, la méthode `reject` des classes
héritées de `Hash` retourne un objet de cette sous-classe. Mais en Ruby 2.1.1,
ce comportement a accidentellement changé pour retourner constamment un objet de
la classe `Hash`.

{% highlight ruby %}
class SubHash < Hash
end

p Hash.new.reject { }.class
#=> 2.1.0: Hash, 2.1.1: Hash
p SubHash.new.reject { }.class
#=> 2.1.0: SubHash, 2.1.1: Hash
{% endhighlight %}

(Pour être exact, les autres états comme les variables d'instance et autres ne
sont pas copiés non plus.)

Ruby 2.1.1 n'aurait pas dû inclure ce changement de comportement car depuis la
sortie de Ruby 2.1.0, nous avons changé la
[politique de versionnage](https://www.ruby-lang.org/fr/news/2013/12/21/ruby-version-policy-changes-with-2-1-0/),
par conséquent, Ruby 2.1.1 est une version patch et ne doit contenir ce type
de changement de comportement.

Cette régression peut affecter potentiellement plusieurs bibliothèques, parmi
lesquels `HashWithIndifferentAccess` ou encore `OrderedHash` de Rails.
Exemple de
[ticket Rails](https://github.com/rails/rails/issues/14188).

Ruby 2.1.2 rétablira le comportement Ruby 2.1.0 de la méthode `Hash#reject`.
En revanche ce "défaut" deviendra le comportement par défaut de Ruby 2.2.0 :
[fonctionnalité #9223](https://bugs.ruby-lang.org/issues/9223).
Par conséquent, nous recommandons de corriger votre code en perspective de
ce nouveau comportement.

Cet incident a été causé par un commit manquant. Pour plus de détails, consultez :
[http://blog.sorah.jp/2014/03/10/hash-reject-regression-in-ruby211](http://blog.sorah.jp/2014/03/10/hash-reject-regression-in-ruby211).

Désolé pour la gêné occasionnée et merci pour votre soutien.
