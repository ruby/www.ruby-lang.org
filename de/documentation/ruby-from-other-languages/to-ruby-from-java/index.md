---
layout: page
title: "Von Java zu Ruby"
lang: de
---

Java ist ausgereift. Es ist getestet. Und es ist schnell (auch wenn die
Anti-Java-Gemeinde etwas anderes behauptet.) Es ist aber auch ziemlich
langatmig. Wenn du von Java nach Ruby wechselst, wird dein Quellcode
deutlich schrumpfen. Außerdem wirst du bemerken, dass das
Zusammenbasteln von Prototypen weniger Zeit in Anspruch nimmt.

### Ähnlichkeiten

In Java und Ruby…

* wird Speicher von einem **Garbage-Collector** verwaltet.
* sind Objekte **stark getypt**.
* können Methoden `public`, `private` und `protected` sein.
* sind Werkzeuge zur **Dokumentation** enthalten. In Ruby gibt es RDoc;
  Die von RDoc generierten Dokumentationen ähneln denen von JavaDoc
  stark.

### Unterschiede

Anders als in Java…

* muss **nicht kompiliert** werden. Der Quellcode wird direkt
  ausgeführt.
* gibt es verschiedene **GUI-Toolkits**. Ruby-Entwickler können folgende
  Toolkits ausprobieren: [WxRuby][1], [FXRuby][2], [Ruby-GNOME2][3],
  [Qt][4], oder das integrierte Ruby Tk.
* verwendest du **Schlüsselworte** wie `do` und `end` beim Definieren
  von Klassen, für Verzweigungen usw. (und keine geschweiften Klammern).
* benutzt man `require` anstatt `import`.
* sind alle **Instanzvariablen** privat. Von Außen wird auf alles über
  Methoden zugegriffen.
* sind **Klammern in Methodenaufrufen** optional und werden häufig
  weggelassen.
* ist **alles ein Objekt**, auch Zahlen wie `2` und `3.14159`.
* gibt es **keine statische Typprüfung**.
* sind **Variablennamen** lediglich Bezeichner. Sie haben keinen Typ.
* gibt es **keine Typdeklarationen**. Du brauchst nur einer neuen
  Variable etwas zuzuweisen, z.B. `a = [1,2,3]` anstelle von `int[] a =
  {1,2,3};`.
* gibt es **keine Typumwandlungen** (Casting). Ruf’ einfach die Methoden
  auf.
* ist **Unit-Testing** noch einfacher als in Java.
* heißt es `foo = Foo.new("hi")` statt `Foo foo = new Foo("hi")`.
* heißt der **Konstruktor** immer `initialize` (und nicht wie der
  Klassenname).
* gibt es **Mixins** anstelle von Interfaces.
* wird eher YAML verwendet als XML.
* heißt es `nil` anstelle von `null` und `self` statt `this`.
* `==` und `equals()` verhalten sich in Ruby anders. `==` sollte
  verwendet werden, wenn zwei Objekte auf Klassenebene verglichen werden
  sollen (`equals()` Variante in Java). `equal?()` wird dagegen
  verwendet um herauszufinden ob zwei Objekte die gleiche Identität
  haben (`==` in Java).



[1]: https://github.com/eumario/wxruby
[2]: https://github.com/larskanis/fxruby
[3]: https://ruby-gnome2.osdn.jp/
[4]: https://github.com/ryanmelt/qtbindings/
