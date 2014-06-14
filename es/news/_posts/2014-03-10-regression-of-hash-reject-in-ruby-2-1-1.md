---
layout: news_post
title: "Regresión en Hash#reject en Ruby 2.1.1"
author: "sorah"
translator: "David Padilla"
date: 2014-03-10 14:00:00 +0000
lang: es
---

En Ruby 2.1.0 o anteriores, el método `reject` de cualquier clase que
hereda de `Hash` regresa un objeto de su misma clase.
Pero en Ruby 2.1.1, este comportamiento cambió accidentalmente a que
devuelva siempre un objeto Hash plano, no de la clase que hereda.

{% highlight ruby %}
class SubHash < Hash
end

p Hash.new.reject { }.class
#=> 2.1.0: Hash, 2.1.1: Hash
p SubHash.new.reject { }.class
#=> 2.1.0: SubHash, 2.1.1: Hash
{% endhighlight %}

(Para ser exactos, los estados extra como las variables de instancia, etc. no
se copian tampoco.)

Ruby 2.1.1 no debería incluir este cambio en el comportamiento. Con
la entrega de Ruby 2.1.0 cambiamos [nuestra política de versiones](https://www.ruby-lang.org/es/news/2013/12/21/ruby-version-policy-changes-with-2-1-0/),
así que Ruby 2.1.1 debería ser un nivel de parche que no debe romper la compatibilidad
con versiones anteriores.

Esta regresión podría afectar muchas librerías, uno de los casos detectados es
la clase `HashWithIndifferentAccess` de Rails y `OrderedHash`. Están rotos de acuerdo a
el [issue de Rails #14188](https://github.com/rails/rails/issues/14188).

Este comportamiento será revertido a el de 2.1.0 en Ruby 2.1.2,
pero se espera que sea el comportamiento por defecto en Ruby 2.2.0:
[Feature #9223](https://bugs.ruby-lang.org/issues/9223).
Así que te recomendamos que corrijas tu código para manejar este cambio.

Si quieres ver más detalles sobre este problema ve a
[http://blog.sorah.jp/2014/03/10/hash-reject-regression-in-ruby211](http://blog.sorah.jp/2014/03/10/hash-reject-regression-in-ruby211).

Sentimos mucho cualquier inconveniencia y agradecemos tu apoyo.
