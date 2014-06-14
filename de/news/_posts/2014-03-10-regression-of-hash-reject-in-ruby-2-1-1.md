---
layout: news_post
title: "Regression in Hash#reject in Ruby 2.1.1"
author: "sorah"
translator: "Quintus"
date: 2014-03-10 14:00:00 +0000
lang: de
---

In Ruby 2.1.0 und früher gab die `reject`-Methode jeder Klasse, die
von `Hash` erbt, ein Objekt der eigenen Klasse zurück.
In Ruby 2.1.1 hat sich dieses Verhalten versehentlich in der Weise
verändert, dass stets ein gewöhnliches Hash-Objekt anstelle eines
Objekts der Subklasse zurückgegeben wird.

{% highlight ruby %}
class SubHash < Hash
end

p Hash.new.reject { }.class
#=> 2.1.0: Hash, 2.1.1: Hash
p SubHash.new.reject { }.class
#=> 2.1.0: SubHash, 2.1.1: Hash
{% endhighlight %}

(Um es ganz genau zu sagen: eigene Erweiterungen etwa in Form von
Instanzvariablen werden ebenfalls nicht übernommen.)

Ruby 2.1.1 sollte derartige Verhaltensänderungen nicht enthalten, weil
wir mit der Veröffentlichung von Ruby 2.1.0
[unsere Versionierungs-Richtlinien](https://www.ruby-lang.org/de/news/2013/12/21/ruby-version-policy-changes-with-2-1-0/)
geändert haben und Ruby 2.1.1 somit ein Patchlevel-Release ist, das
die Rückwärtskompatibilität beibeihalten sollte.

Diese Regression betrifft möglicherweise viele Bibliotheken;
Beispiele sind etwa Rails’ `HashWithIndifferentAccess` und
`OrderedHash`. Sie funktionieren zurzeit nicht:
[Rails-Ticket #14188](https://github.com/rails/rails/issues/14188).

In Ruby 2.1.2 wird das ursprüngliche Verhalten von 2.1.0
wiederhergestellt werden, ab Ruby 2.2.0 wird dieses neue Verhalten
jedoch voraussichtlich der Standardfall sein:
[Feature #9223](https://bugs.ruby-lang.org/issues/9223).
Wir empfehlen Ihnen daher, Ihren Code der neuen Situation anzupassen.

Dieser Unfall wurde durch einen fehlenden Backport-Commit
verursacht. Weitere Informationen dazu können Sie unter
[http://blog.sorah.jp/2014/03/10/hash-reject-regression-in-ruby211](http://blog.sorah.jp/2014/03/10/hash-reject-regression-in-ruby211)
finden.

Wir entschuldigen uns für die Unannehmlichkeiten und danken Ihnen für
Ihre Unterstützung.
