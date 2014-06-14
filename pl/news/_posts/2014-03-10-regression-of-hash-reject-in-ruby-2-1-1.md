---
layout: news_post
title: "Regresja Hash#reject w Rubim 2.1.1"
author: "sorah"
translator: "crabonature"
date: 2014-03-10 14:00:00 +0000
lang: pl
---

W Rubim 2.1.0 i wcześniejszych metoda `reject` w klasie dziedziczącej z klasy
`Hash` zwraca obiekt własnej klasy.
Ale w Rubim 2.1.1 to zachowanie się przypadkowo zmieniło i zwraca zawsze zwykły
obiekt Hash, nie klasy dziedziczącej.

{% highlight ruby %}
class SubHash < Hash
end

p Hash.new.reject { }.class
#=> 2.1.0: Hash, 2.1.1: Hash
p SubHash.new.reject { }.class
#=> 2.1.0: SubHash, 2.1.1: Hash
{% endhighlight %}

(By być dokładnym, dodatkowy stan taki jak zmienne instancji itp. nie są
kopiowane).

Ruby 2.1.1 nie powinien zawierać takich zmian zachowania, ponieważ od wydania
Rubiego 2.1.0 [zmieniliśmy polisę wersjonowania](https://www.ruby-lang.org/pl/news/2013/12/21/ruby-version-policy-changes-with-2-1-0/),
Ruby 2.1.1 jest wydaniem typu patch i nie powinien łamać kompatybilności wstecz.

Ta regresja może potencjalnie wpływać na wiele bibliotek, na przykład Railsowe
`HashWithIndifferentAccess` i `OrderedHash` są zepsute: [błąd w Rails #14188](https://github.com/rails/rails/issues/14188).

To zachowanie będzie wycofane do zachowania z 2.1.0 w Rubim 2.1.2, ale jest
oczekiwane, że będzie domyślnym zachowaniem
w Rubim 2.2.0: [Funkcjonalność #9223](https://bugs.ruby-lang.org/issues/9223).
Zalecamy do naprawy twojego kodu z racji spodziewanych zmian zachowania.

Ten wypadek jest spowodowany przez brakujący jeden backport commit.
Po więcej szczegółów, zobacz [http://blog.sorah.jp/2014/03/10/hash-reject-regression-in-ruby211](http://blog.sorah.jp/2014/03/10/hash-reject-regression-in-ruby211)

Przepraszamy za wszelkie niedogodności i dziękujemy za wsparcie.
