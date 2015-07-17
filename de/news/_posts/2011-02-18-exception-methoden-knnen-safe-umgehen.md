---
layout: news_post
title: "Exception-Methoden können $SAFE umgehen"
author: "Quintus"
lang: de
---

Die Methode Exception#to\_s kann missbraucht werden, um die Überprüfung
von `$SAFE` zu umgehen, was unsicherem Code erlaubt, beliebige Strings
zu verändern.

Das Konzept von Rubys `$SAFE`-Variablen auf Stufe 4 erlaubt es,
unsicheren Code (wie z.B. Plugins), in einem sicheren Kontext
auszuführen. Das bedeutet, dass bei höhren Stufen einige Einstellungen
vorgenommen werden, die Attacken auf äußeren (sicheren) Code verhindern
sollen.

Es ist bekannt geworden, dass Exception#to\_s sich hier problematisch
verhält. Mithilfe dieser Methode kann man den Mechanismus der
Sicherheitsstufen umgehen und einen *untainted* String destruktiv
bearbeiten und in einen *tainted* umwandeln. Damit kann ein Angreifer
beliebige *untainted* Strings wie folgt verändern:

{% highlight ruby %}
$secret_path = "foo"

proc do
    $SAFE = 4
    Exception.new($secret_path).to_s
    $secret_path.replace "/etc/passwd"
end.call

open($secret_path) do
  ...
end
{% endhighlight %}

### Betroffene Versionen

Glücklicherweise sind solche Attacken in der 1.9er-Serie von Ruby
wirkungslos. Es sind lediglich die folgenden Versionen betroffen:

* Ruby 1.8.6-p420 und alle vorherigen Versionen
* Ruby 1.8.7-p330 und alle vorherigen Versionen
* Entwicklerversionen von Ruby 1.8 (1.8.8-dev)

### Lösungen

Aktualisiere auf eine neuere Version.

### Updates

Ruby 1.8.7-p334 wurde zur Behandlung des Problems veröffentlicht.
Nutzern von 1.8.7 wird empfohlen, zu aktualisieren.

* [https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p334.tar.bz2][1]
* [https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p334.tar.gz][2]
* [https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p334.zip][3]



[1]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p334.tar.bz2
[2]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p334.tar.gz
[3]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p334.zip
