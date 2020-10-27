---
layout: news_post
title: "Trennung von Positions- und Schlüsselwortargumenten in Ruby 3.0"
author: "mame"
translator: "Marvin Gülker"
date: 2019-12-12 12:00:00 +0000
lang: de
---

Diese Artikel erklärt den geplanten Kompatibilitätsbruch bei
Schlüsselwortargumenten in Ruby 3.0.

## Kurzfassung

Ab Ruby 3.0 werden Positions- und Schlüsselwortargumente getrennt.
Ruby 2.7 warnt bei Verhalten, das für Ruby 3.0 geändert werden muss.
Wenn Sie eine der folgenden Warnungen sehen, dann müssen Sie Ihren
Code ändern:

* `Using the last argument as keyword parameters is deprecated`, oder
* `Passing the keyword argument as the last hash parameter is deprecated`, oder
* `Splitting the last argument into positional and keyword parameters is deprecated`

In den meisten Fällen können Sie die Inkompatibilität durch Einfügen
des doppelten Auflösungsoperators _(double splat operator_)
vermeiden. Dieser verlangt die ausdrückliche Übergabe von
Schlüsselwortargumente anstelle eines Hash. Dementsprechend können
geschweifte Klammern `{}` erforderlich sein, um ausdrücklich ein
`Hash`-Objekt statt Schlüsselwortargumenten zu verlangen. Lesen Sie
den nachfolgenden Abschnitt "Typische Fälle" für weitere
Informationen.

Ab Ruby 3 muss eine Methode, die alle ihre Argumente delegiert, dies
neben den Positions- auch ausdrücklich für Schlüsselwortargumente tun.
Wenn Sie das Delegationsverhalten von Ruby 2.7 beibehalten wollen,
müssen Sie `ruby2_keywords` verwenden. Siehe den Abschnitt "Behandlung
der Argument-Delegation" weiter unten.

## Typische Fälle
{: #typical-cases }

Dieses ist der typischste Fall. Sie können den doppelten
Auflösungsoperator (`**`) benutzen, um Schlüsselwörter statt eines
Hash zu übergeben.

{% highlight ruby %}
# Diese Methode akzeptiert nur ein Schlüsselwortargument
def foo(k: 1)
  p k
end

h = { k: 42 }

# Dieser Methodenaufruf übergibt ein positionsgebundenes Hash-Argument.
# In Ruby 2.7: Das Hash wird automatisch in ein Schlüsselwortargument konvertiert
# In Ruby 3.0: Dieser Aufruf verursacht einen ArgumentError
foo(h)
  # => demo.rb:11: warning: The last argument is used as the keyword parameter
  #    demo.rb:2: warning: for `foo' defined here; maybe ** should be added to the call?
  #    42

# Wenn Sie das alte Verhalten in Ruby 3.0 behalten wollen, nutzen Sie
# den double-splat-Operator:
foo(**h) #=> 42
{% endhighlight %}

Hier ein anderer Fall. Sie können geschweifte Klammern (`{}`)
verwenden, um ausdrücklich ein Hash anstelle von Schlüsselwörtern zu
übergeben.

{% highlight ruby %}
# Diese Methode akzeptiert ein positionsgebundenes Argument und ein
# Schlüsselwort-Restargument
def bar(h, **kwargs)
  p h
end

# Dieser Aufruf übergibt nur ein Schlüsselwortargument und keine
# positionsgebundenen Argumente.
# In Ruby 2.7: Das Schlüsselwort wird in ein positionsgebundenes Hash-Argument konvertiert
# In Ruby 3.0: Dieser Aufruf verursacht einen ArgumentError
bar(k: 42)
  # => demo2.rb:9: warning: The keyword argument is passed as the last hash parameter
  #    demo2.rb:2: warning: for `bar' defined here
  #    {:k=>42}

# Wenn Sie das alte Verhalten in Ruby 3.0 beibehalten wollen,
# verlangen Sie mit geschweiften Klammern ausdrücklich ein Hash.
bar({ k: 42 }) # => {:k=>42}
{% endhighlight %}

## Was veraltet nun?
{: #what-is-deprecated }

In Ruby 2 können Schlüsselwortargumente als letztes
positionsgebundenes Argument behandelt werden und umgekehrt ein
letztes positionsgebundenes Hash-Argument als Schlüsselwortargumente.

Wie im letzten Abschnitt beschrieben wird, ist diese diese
automatische Konvertierung manchmal zu komplex und problematisch.
Daher gilt sie in Ruby 2.7 nun als veraltet und wird in Ruby 3
entfernt. Das bedeutet, dass Schlüsselwortargumente in Ruby 3
vollständig von den positionsgebundenen Argumenten getrennt sein
werden. Wenn Sie also Schlüsselwortargumente übergeben wollen, dann
sollten Sie stets `foo(k: expr)` oder `foo(**expr)` benützen. Wenn Sie
Schlüsselwortargumente akzeptieren wollen, sollten Sie stets
`def foo(k: default)` oder `def foo(k:)` oder `def foo(**kwargs)`
verwenden.

Beachten Sie, dass Ruby 3 sich beim Aufruf einer Methode mit
Schlüsselwortargumenten auch dann nicht anders verhält, wenn die
Methode keine Schlüsselwortargumente akzeptiert. Beispielsweise wird
der folgende Fall nicht als veraltet markiert und wird auch in Ruby
3.0 weiterhin funktionieren. Die Schlüsselwortargumente werden
weiterhin als positionsgebundenes Hash behandelt.

{% highlight ruby %}
def foo(kwargs = {})
  kwargs
end

foo(k: 1) #=> {:k=>1}
{% endhighlight %}

Dies findet seinen Grund darin, dass dieses Idiom sehr häufig genutzt
wird und gleichzeitig die beabsichtigte Verwendung des Arguments nicht
mehrdeutig ist. Ein Verbot dieser Konvertierung würde eine zusätzliche
Inkompatibilität für nur wenig Nutzen einführen.

Dennoch wird dieser Stil für neuen Code nicht mehr empfohlen, es sei
denn, Sie übergeben oft Hashes als positionsgebundene Argumente und
benützen außerdem Schlüsselwortargumente. Ansonsten verwenden Sie den
doppelten Auflösungsoperator:

{% highlight ruby %}
def foo(**kwargs)
  kwargs
end

foo(k: 1) #=> {:k=>1}
{% endhighlight %}

## Wird mein Code mit Ruby 2.7 nicht mehr funktionieren?
{: #break-on-ruby-2-7 }

Eine kurze Antwort ist „vielleicht nicht“.

Die Änderungen in Ruby 2.7 sind als Migrationspfad zu Ruby 3.0 gedacht.
Prinzipiell warnt Ruby 2.7 lediglich wegen Verhaltens, das sich in
Ruby 3 ändern wird. Jedoch enthält es einige inkompatible Änderungen,
die wir als hinnehmbar betrachten. Siehe den Abschnitt „Andere kleine
Änderungen“ für Details.

Abgesehen von den Warnungen und kleineren Änderungen versucht Ruby 2.7
die Kompatibilität mit Ruby 2.6 aufrecht zu erhalten. Daher wird Ihr
Code wahrscheinlich mit Ruby 2.7 weiterhin funktionieren und nur
Warnungen auslösen. Indem Sie ihn auf Ruby 2.7 ausführen, können Sie
daher prüfen, ob Ihr Code mit Ruby 3.0 kompatibel ist.

Wenn Sie die Veraltungswarnungen unterdrücken wollen, verwenden Sie
den Kommandozeilenschalter `-W:no-deprecated` oder fügen Sie Ihrem
Code den Befehl `Warning[:deprecated] = false` hinzu.

## Weiterleiten von Argumenten
{: #delegation }

### Ruby 2.6 und früher
{: #delegation-ruby-2-6-or-prior }

In Ruby 2 können Sie eine Delegatormethode schreiben, indem Sie ein
`*rest`- und ein `&block`-Argument akzeptieren und beide an die
Zielmethode weitergeben. In diesem Verhalten enthalten ist die
automatische Konvertierung zwischen positionsgebundenen und
Schlüsselwortargumenten.

{% highlight ruby %}
def foo(*args, &block)
  target(*args, &block)
end
{% endhighlight %}

### Ruby 3
{: #delegation-ruby-3 }

Sie müssen Schlüsselwortargumente ausdrücklich delegieren.

{% highlight ruby %}
def foo(*args, **kwargs, &block)
  target(*args, **kwargs, &block)
end
{% endhighlight %}

Alternativ können Sie, wenn Sie keine Kompatibilität mit Ruby 2.6 oder
früher benötigen und die Argumente nicht verändern, die mit Ruby 2.7 neu
eingeführte Delegatorsyntax (`...`) verwenden.

{% highlight ruby %}
def foo(...)
  target(...)
end
{% endhighlight %}

### Ruby 2.7
{: #delegation-ruby-2-7 }

In Kürze: verwenden Sie `Module#ruby2_keywords` und delegieren Sie `*args, &block`.

{% highlight ruby %}
ruby2_keywords def foo(*args, &block)
  target(*args, &block)
end
{% endhighlight %}

`ruby2_keywords` akzeptiert Schlüsselwortargumente als das letzte
Hash-Argument und leitet sie beim Aufruf der Zielmethode als
Schlüsselwortargumente weiter.

Tatsächlich erlaubt Ruby 2.7 den neuen Delegationsstil in vielen
Fällen. Es gibt allerdings einen Sonderfall; siehe den nächsten
Abschnitt.

### Eine mit Ruby 2.6, 2.7 und Ruby 3 kompatible Delegation
{: #a-compatible-delegation }

In Kürze: verwenden Sie auch hier `Module#ruby2_keywords`.

{% highlight ruby %}
ruby2_keywords def foo(*args, &block)
  target(*args, &block)
end
{% endhighlight %}

Leider muss man hier den alten Delegationsstil (also kein `**kwargs`)
verwenden, weil Ruby 2.6 und früher die neue Delegationssyntax nicht
richtig verarbeiten. Das ist einer der Gründe für die Abspaltung von
Schlüsselwortargumenten; die Details erklärt der letzte Abschnitt.
`ruby2_keywords` erlaubt es, den alten Stil noch in Ruby 2.7 und sogar
in Ruby 3.0 zu benutzen. Weil `ruby2_keywords` freilich in Ruby 2.6
und früher fehlt, können Sie hierfür das [ruby2_keywords-Gem](https://rubygems.org/gems/ruby2_keywords)
einsetzen oder die Methode selbst definieren:

{% highlight ruby %}
def ruby2_keywords(*)
end if RUBY_VERSION < "2.7"
{% endhighlight %}

---

Wenn Ihr Code nciht mit Ruby 2.6 oder älter kompatibel sein muss,
können Sie den mit Ruby 2.7 neu eingeführten Weg einschlagen. Das
funktioniert in fast allen Fällen. Einen unglücklichen Sonderfall
gibt es allerdings:

{% highlight ruby %}
def target(*args)
  p args
end

def foo(*args, **kwargs, &block)
  target(*args, **kwargs, &block)
end

foo({})       #=> Ruby 2.7: []   ({} fällt weg)
foo({}, **{}) #=> Ruby 2.7: [{}] (Sie können {} durch ausdrückliche Übergabe "keiner" Schlüsselwörtargumente erreichen)
{% endhighlight %}

Ein leeres Hash wird automatisch konvertiert und von `**kwargs`
absorbiert, und die Delegation entfernt dann das leere
Schlüsselwort-Hash, sodass an `target` gar kein Argument übergeben
wird. Soweit wir wissen, handelt es sich hierbei um den einzigen
Sonderfall.

Wie in der letzten Zeile festgehalten, können Sie das Problem durch
Übergabe von `**{}` umgehen.

Wenn Sie sich wirklich Sorgen um die Portabilität machen, verwenden
Sie `ruby2_keywords`. (Es sei daran erinnert, dass Ruby 2.6 und früher
ihrerseits dutzende Problemfälle bei der Behandlung von
Schlüsselwortargumenten aufwiesen :-)
Eventuell wird `ruby2_keywords` mit dem Ende der Unterstützung von
Ruby 2.6 entfernt werden. In diesem Fall werden wir empfehlen,
Schlüsselwortargumente ausdrücklich zu delegieren (siehe oben den Code
für Ruby 3).

## Andere kleine Änderungen
{: #other-minor-changes }

Es gibt in Ruby 2.7 drei kleinere Änderungen an den Schlüsselwortargumenten.

### 1. Nichtsymbole sind als Schlüssel zulässig
{: #other-minor-changes-non-symbol-keys }

In Ruby 2.6 und früher waren nur Symbolschlüssel zulässig. Ab Ruby 2.7
können auch andere Objekte als Schlüssel eingesetzt werden.

{% highlight ruby %}
def foo(**kwargs)
  kwargs
end
foo("key" => 42)
  #=> Ruby 2.6 und früher: ArgumentError: wrong number of arguments
  #=> Ruby 2.7 und später: {"key"=>42}
{% endhighlight %}

Wenn eine Methode sowohl optionale als auch Schlüsselwortargumente
akzeptiert, wurde in Ruby 2.6 ein Hash-Objekt, das sowohl Symbol- als
auch andere Schlüssel aufwies, in zwei Hashes zerlegt. Ab Ruby 2.7
werden beide Arten als Schlüsselwortargumente erkannt, weil
Nichtsymbolschlüssel erlaubt sind.

{% highlight ruby %}
def bar(x=1, **kwargs)
  p [x, kwargs]
end

bar("key" => 42, :sym => 43)
  #=> Ruby 2.6: [{"key"=>42}, {:sym=>43}]
  #=> Ruby 2.7: [1, {"key"=>42, :sym=>43}]

# Verwenden Sie geschweifte Klammern für das alte Verhalten
bar({"key" => 42}, :sym => 43)
  #=> Ruby 2.6 and 2.7: [{"key"=>42}, {:sym=>43}]
{% endhighlight %}

Ruby 2.7 zerlegt Hashes mit einer Warnung, wenn ein Hash oder
Schlüsselwortargumente, die sowohl Symbol- als auch
Nichtsymbolschlüssel enthalten, an eine Methode übergeben werden, die
ausdrückliche Schlüsselwortargumente, aber kein
Schlüsselwortrestargument (`**kwargs`) akzeptiert. Dieses Verhalten
wird in Ruby 3 entfernt werden und einen `ArgumentError` auslösen.

{% highlight ruby %}
def bar(x=1, sym: nil)
  p [x, sym]
end

bar("key" => 42, :sym => 43)
# Ruby 2.6 und 2.7: => [{"key"=>42}, 43]
# Ruby 2.7: warning: Splitting the last argument into positional and keyword parameters is deprecated
#           warning: The called method `bar' is defined here
# Ruby 3.0: ArgumentError
{% endhighlight %}

### 2. Doppelter Auflösunsoperator mit leerem Hash (`**{}`) übergibt keine Argumente
{: #other-minor-changes-empty-hash }

Bis Ruby 2.6 führte die Übergabe von `**leeres_hash` zur Übergabe
eines leeren Hashes als positionsgebundenes Argument. Ab Ruby 2.7
werden gar keine Argumente übergeben.

{% highlight ruby %}
def foo(*args)
  args
end

empty_hash = {}
foo(**empty_hash)
  #=> Ruby 2.6 or before: [{}]
  #=> Ruby 2.7 or later: []
{% endhighlight %}

Beachten Sie, dass `foo(**{})` weder in Ruby 2.6 noch in 2.7
irgendetwas übergibt. Bis Ruby 2.6 wird `**{}` vom Parser entfernt,
und ab Ruby 2.7 wird es genauso behandelt wie `**leeres_hash`, wodurch
eine einfache Möglchkeit geschaffen wird, gar keine
Schlüsselwortargumente an eine Methode zu übergeben.

In Ruby 2.7 führt der Aufruf einer Methode mit zu wenigen
erforderlichen positionsgebundenden Argumenten und
`foo(**leeres_hash)` dazu, dass ein leeres Hash übergeben und eine
Warnung ausgegeben wird, um Kompatibilität mit Ruby 2.6 zu
gewährleisten. Dieses Verhalten wird in 3.0 entfernt.

{% highlight ruby %}
def foo(x)
  x
end

empty_hash = {}
foo(**empty_hash)
  #=> Ruby 2.6 und früher: {}
  #=> Ruby 2.7: warning: Passing the keyword argument as the last hash parameter is deprecated
  #             warning: The called method `foo' is defined here
  #=> Ruby 3.0: ArgumentError: wrong number of arguments
{% endhighlight %}

### 3. Keine-Argumente-Syntax (`**nil`) wird eingeführt
{: #other-minor-changes-double-splat-nil }

Sie können jetzt `**nil` in einer Methodendefinition verwenden, um
ausdrücklich klarzustellen, dass die Methode keine
Schlüsselwortargumente akzeptiert. Der Aufruf solcher Methoden mit
Schlüsselwortargumenten verursacht einen `ArgumentError`. (Hierbei
handelt es sich um ein neues Feature, nicht um eine Inkompatibilität.)

{% highlight ruby %}
def foo(*args, **nil)
end

foo(k: 1)
  #=> Ruby 2.7 or later: no keywords accepted (ArgumentError)
{% endhighlight %}

Das ist nützlich, um festzulegen, dass die Methode
keine Schlüsselwortargumente akzeptiert. Ansonsten würden im obigen
Beispiel die Schlüsselwortargumente in das Restargument absorbiert.
Wenn Sie eine Methode dann später mit Schlüsselwortargumenten
erweitern wollen, könnte sie die folgende Inkompatibilität aufweisen:

{% highlight ruby %}
# Wenn eine Methode ein Restargument, aber kein `**nil` akzeptiert
def foo(*args)
  p args
end

# Die Übergabe von Schlüsselwortargumenten wird (auch in Ruby 3.0) in
# ein Hash konvertiert
foo(k: 1) #=> [{:k=>1}]

# Jetzt wird die Methode um ein Schlüsselwortargument erweitert
def foo(*args, mode: false)
  p args
end

# Der bestehende Methodenaufruf ist jetzt defekt
foo(k: 1) #=> ArgumentError: unknown keyword k
{% endhighlight %}

## Warum wir die automatische Konvertierung entfernen wollen
{: #why-deprecated }

Ursprünglich erschien die automatische Konvertierung als eine gute
Idee und funktionierte in vielen Fällen gut. Es stellte sich aber
heraus, dass zu viele unerwartete Fälle vorhanden waren, die zu
zahlreichen Bugreports über das vermeintlich fehlerhafte Verhalten
geführt haben.

So funktioniert die automatische Konvertierung nicht richtig, wenn
eine Methode optionale positionsgebundene Argumente und gleichzeitig
Schlüsselwortargumente akzeptiert. Einige Leute erwarten in diesem
Fall, dass das letzte Hash-Objekt als positionsgebundenes Argument
behandelt wird, während andere davon ausgehen, es werde zu
Schlüsselwortargumenten konvertiert.

Hier ist ein Beispiel für einen der besonders verwirrenden Fälle:

{% highlight ruby %}
def foo(x, **kwargs)
  p [x, kwargs]
end

def bar(x=1, **kwargs)
  p [x, kwargs]
end

foo({}) #=> [{}, {}]
bar({}) #=> [1, {}]

bar({}, **{}) #=> erwartet: [{}, {}], tatsächlich: [1, {}]
{% endhighlight %}

In Ruby 2 übergibt `foo({})` ein leeres Hash als normales Argument
(d.h., `{}` wird an `x` zugewiesen), während `bar({})` ein
Schlüsselwortargument übergibt (d.h. `{}` wird an `kwargs`
zugewiesen). Die bloße Angabe `jede_methode({})` ist mehrdeutig.

Man kann `bar({}, **{})` verstehen als das Verlangen, an `x`
ausdrücklich das leere Hash zuzuweisen. Überraschenderweise
funktioniert das nicht wie erwartet; in Ruby 2.6 gibt das immer noch
`[1, {}]` aus. Das liegt daran, dass `**{}` in Ruby 2.6 schon vom
Parser ignoriert wird und das dann einzige Argument `{}` automatisch
in ein Schlüsselwortargument (`**kwargs`) konvertiert wird. Es ist in
diesem Fall nötig, den Aufruf als `bar({}, {})` zu fassen, was
überaus anstößig ist.

Dieselben Probleme bestehen bei Methoden, die sowohl Rest- als auch
Schlüsselwortargumente akzeptieren. Die ausdrückliche Delegation von
Schlüsselwortargumenten schlägt dann fehl.

{% highlight ruby %}
def target(*args)
  p args
end

def foo(*args, **kwargs, &block)
  target(*args, **kwargs, &block)
end

foo() #=> Ruby 2.6 und früher: [{}]
      #=> Ruby 2.7 und später:  []
{% endhighlight %}

`foo()` übergibt keine Argumente, aber `target` wird in Ruby 2.6 ein
leeres Hash-Argument zugewiesen. Grund dafür ist, dass die Methode
`foo` ihre Schlüsselwortargumente (`**kwargs`) ausdrücklich delegiert.
Wenn `foo()` aufgerufen wird, ist `args` ein leeres Array, `kwargs`
ist ein leeres Hash, und `block` ist `nil`. Der Aufruf
`target(*args, **kwargs, &block)` übergibt dann ein leeres Hash als
Argument, weil `**kwargs` automatisch in ein positionsgebundenes
Hash-Argument konvertiert wird.

Schließlich verursacht die automatische Konvertierung nicht nur
Verwirrung, sondern schränkt die Erweiterbarkeit von Methoden ein.
Weitere Details über die Gründe der Änderung und bestimmte
Entscheidungen für die Implementation finden sich in [[Feature
#14183]](https://bugs.ruby-lang.org/issues/14183).

## Hinweis

Dieser Artikel wurde freundlicherweise von Jeremy Evans und Benoit
Daloze überprüft (wenn nicht sogar mitgeschrieben).

## Historie

* Aktualisiert 2019-12-25: In 2.7.0-rc2 wurden die Warnungen leicht
  verändert und ein API zu ihrer Unterdrückung hinzugefügt.
