---
layout: news_post
title: "루비 2.1.1의 Hash#reject의 회귀"
author: "sorah"
translator: "marocchino"
date: 2014-03-10 14:00:00 +0000
lang: ko
---

루비 2.1.0이나 이전에는 `Hash` 클래스를 상속받은 클래스에서 `reject` 메서드는
자신의 클래스의 객체를 반환했습니다.
하지만 루비 2.1.1에는 의도치 않게 상속된 클래스가 아닌 Hash 클래스를 반환하게
변경되었습니다.

{% highlight ruby %}
class SubHash < Hash
end

p Hash.new.reject { }.class
#=> 2.1.0: Hash, 2.1.1: Hash
p SubHash.new.reject { }.class
#=> 2.1.0: SubHash, 2.1.1: Hash
{% endhighlight %}

(정확히 말하면, 인스턴스 변수 같은 다른 속성도 복사하지 않게 되었습니다.)

루비 2.1.0부터 [버전 정책이 바뀌었기
때문에](https://www.ruby-lang.org/ko/news/2013/12/21/ruby-version-policy-changes-with-2-1-0/),
루비 2.1.1은 패치 레벨 릴리스에 해당합니다. 패치 레벨 릴리스는 하위호환성이 있어야
하므로, 앞으로 루비 2.1.1에 이런 행동의 변화는 있어서는 안 됩니다.

이 회귀(regression)는 많은 라이브러리에 영향을 줄 수 있습니다. 예를 들어
레일즈의 `HashWithIndifferentAccess`와 `OrderedHash`가 있습니다.
[Rails issue #14188](https://github.com/rails/rails/issues/14188)

이 행동은 루비 2.1.2에서 2.1.0의 동작으로 복구될 예정입니다. 하지만
루비 2.2.0에서는 기본 동작이 될 것입니다.
[Feature #9223](https://bugs.ruby-lang.org/issues/9223)
그래서 이 사양 변화에 따라 코드를 수정할 것을 권장합니다.

이 사고는 한 커밋의 백 포트를 빼먹어서 생겼습니다. 좀 더 자세한 내용은
[http://blog.sorah.jp/2014/03/10/hash-reject-regression-in-ruby211](http://blog.sorah.jp/2014/03/10/hash-reject-regression-in-ruby211)를
확인해 주세요.

불편을 끼쳐 죄송하고 지원에 감사드립니다.
