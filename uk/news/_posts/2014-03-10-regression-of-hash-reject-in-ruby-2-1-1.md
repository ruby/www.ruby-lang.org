---
layout: news_post
title: "Регресія Hash#reject в Ruby 2.1.1"
author: "sorah"
translator: "Andrii Furmanets"
date: 2014-03-10 14:00:00 +0000
lang: uk
---

У Ruby 2.1.0 або раніше, метод `reject` у будь-якому класі, який успадковує
`Hash`, повертає об'єкт свого власного класу.
Але в Ruby 2.1.1 ця поведінка випадково змінилася, щоб завжди повертати
звичайний об'єкт Hash, а не успадкованого класу.

{% highlight ruby %}
class SubHash < Hash
end

p Hash.new.reject { }.class
#=> 2.1.0: Hash, 2.1.1: Hash
p SubHash.new.reject { }.class
#=> 2.1.0: SubHash, 2.1.1: Hash
{% endhighlight %}

(Щоб бути точним, додаткові стани, такі як змінні екземпляра, тощо, також не
копіюються.)

Ruby 2.1.1 не повинен включати такі зміни поведінки, оскільки з випуском
Ruby 2.1.0 ми [змінили нашу політику версіонування](https://www.ruby-lang.org/uk/news/2013/12/21/ruby-version-policy-changes-with-2-1-0/),
тому Ruby 2.1.1 є випуском рівня патчу, і він не повинен ламати зворотну
сумісність.

Ця регресія потенційно може вплинути на багато бібліотек, один такий випадок -
це `HashWithIndifferentAccess` та `OrderedHash` Rails. Вони зламані:
[Проблема Rails #14188](https://github.com/rails/rails/issues/14188).

Ця поведінка буде повернена до поведінки 2.1.0 в Ruby 2.1.2,
але очікується, що це буде поведінка за замовчуванням для Ruby 2.2.0:
[Функція #9223](https://bugs.ruby-lang.org/issues/9223).
Тому ми рекомендуємо виправити ваш код, щоб очікувати цю зміну поведінки.

Ця випадковість спричинена одним відсутнім комітом backport. Для більше деталей, див.
[http://blog.sorah.jp/2014/03/10/hash-reject-regression-in-ruby211](http://blog.sorah.jp/2014/03/10/hash-reject-regression-in-ruby211).

Вибачте за будь-які незручності, та дякуємо за вашу підтримку.

