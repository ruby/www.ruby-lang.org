---
layout: news_post
title: "루비 3.0의 위치 인자와 키워드 인자 분리"
author: "mame"
translator: "yous"
date: 2019-12-12 12:00:00 +0000
lang: ko
---

루비 3.0에 계획된 키워드 인자에 대한 호환되지 않는 변경에 대해 설명합니다.

## 요약

루비 3.0에서 위치 인자와 키워드 인자는 분리됩니다. 루비 2.7은 루비 3.0에서
변하는 동작에 대해 경고합니다. 다음 경고를 본다면 코드를 업데이트해야 합니다.

* `Using the last argument as keyword parameters is deprecated`, 또는
* `Passing the keyword argument as the last hash parameter is deprecated`, 또는
* `Splitting the last argument into positional and keyword parameters is deprecated`

대부분의 경우 _이중 스플랫(double splat)_ 연산자를 추가해서 호환성 문제를 해결할
수 있습니다. 이는 명시적으로 `Hash` 객체 대신 키워드 인자를 넘깁니다. 마찬가지로
`{}` 중괄호를 추가해서 명시적으로 키워드 인자 대신 `Hash` 객체를 넘길 수
있습니다. 자세한 내용은 아래의 '대표 사례' 섹션을 보세요.

루비 3에서 인자 모두를 델리게이트하는 메서드는 반드시 위치 인자에 더해 키워드
인자를 명시적으로 델리게이트해야 합니다. 루비 2.7 이전의 위치 인자에 적용되던
델리게이트 동작을 유지하려면 `ruby2_keywords`를 사용하세요. 자세한 내용은 아래의
'인자 델리게이트 다루기' 섹션을 보세요.

## 대표 사례
{: #typical-cases }

가장 대표적인 사례입니다. Hash 대신 키워드를 넘기려면 이중 스플랫(double splat)
연산자(`**`)를 사용할 수 있습니다.

{% highlight ruby %}
# 이 메서드는 키워드 인자 하나만을 받습니다
def foo(k: 1)
  p k
end

h = { k: 42 }

# 이 메서드 호출은 Hash 위치 인자 하나를 넘깁니다
# 루비 2.7: Hash는 자동으로 키워드 인자로 변환됩니다
# 루비 3.0: 이 호출은 ArgumentError를 발생시킵니다
foo(h)
  # => demo.rb:11: warning: Using the last argument as keyword parameters is deprecated; maybe ** should be added to the call
  #    demo.rb:2: warning: The called method `foo' is defined here
  #    42

# 루비 3.0에서 동작을 유지하려면 이중 스플랫(double splat)을 사용하세요
foo(**h) #=> 42
{% endhighlight %}

다른 사례입니다. 키워드 대신 명시적으로 Hash를 넘기려면 중괄호(`{}`)를 사용할 수
있습니다.

{% highlight ruby %}
# 이 메서드는 위치 인자 하나와 나머지 키워드 인자 하나를 받습니다
def bar(h, **kwargs)
  p h
end

# 이 호출은 키워드 인자 하나만 넘기고 위치 인자를 넘기지 않습니다
# 루비 2.7: 키워드는 Hash 위치 인자로 변환됩니다
# 루비 3.0: 이 호출은 ArgumentError를 발생시킵니다
bar(k: 42)
  # => demo2.rb:9: warning: Passing the keyword argument as the last hash parameter is deprecated
  #    demo2.rb:2: warning: The called method `bar' is defined here
  #    {:k=>42}

# 루비 3.0에서 동작을 유지하려면 중괄호를 써서 명시적인 Hash를 만드세요
bar({ k: 42 }) # => {:k=>42}
{% endhighlight %}

## 제거 예정된 기능은 무엇인가요?
{: #what-is-deprecated }

루비 2에서 키워드 인자는 마지막 Hash 위치 인자로 간주될 수 있고, 마지막 Hash
위치 인자는 키워드 인자로 간주될 수 있습니다.

이는 마지막 섹션에 설명한 것처럼 자동 변환이 가끔은 너무 복잡하고 힘들기
때문입니다. 그래서 루비 2.7에서는 제거 예정된 기능이고 루비 3에서 제거됩니다.
다시 말해서, 키워드 인자는 루비 3에서 위치 인자와 완전히 분리됩니다. 키워드
인자를 넘기고 싶다면 항상 `foo(k: expr)` 또는 `foo(**expr)`를 사용해야 합니다.
키워드 인자를 받고 싶다면 원칙적으로 항상 `def foo(k: default)`, `def foo(k:)`,
`def foo(**kwargs)`를 사용해야 합니다.

루비 3.0은 키워드 인자를 받지 않는 메서드를 키워드 인자와 함께 호출했을 때
다르게 동작하지 않습니다. 예를 들어, 다음과 같은 경우는 제거 예정되지 않았고
루비 3.0에서도 계속 동작합니다. 키워드 인자는 계속 Hash 위치 인자로 간주됩니다.

{% highlight ruby %}
def foo(kwargs = {})
  kwargs
end

foo(k: 1) #=> {:k=>1}
{% endhighlight %}

이는 이런 형태가 굉장히 많이 사용되고, 인자가 어떻게 간주되어야 하는지에 대한
모호함이 없기 때문입니다. 이런 변환을 금지하면 추가적인 호환성 문제가 생기는 데
반해 얻는 이득은 작습니다.

하지만 이런 형태를 새 코드에 사용하는 건 추천하지 않습니다. Hash를 위치 인자로
넘기면서 키워드 인자를 사용하는 게 자주 있는 일이 아니라면 말이죠. 그 대신 이중
스플랫(double splat)을 사용하세요.

{% highlight ruby %}
def foo(**kwargs)
  kwargs
end

foo(k: 1) #=> {:k=>1}
{% endhighlight %}

## 제 코드가 루비 2.7에서 동작하지 않게 되나요?
{: #break-on-ruby-2-7 }

짧게 대답하자면 '아마도 아닙니다'.

루비 2.7의 변경은 3.0으로 옮기는 과정이 되도록 디자인되었습니다. 원칙적으로 루비
2.7은 루비 3에서 변경될 동작에 대해 경고만 하지만, 사소하다고 생각되는 몇몇
호환되지 않는 변경도 포함하고 있습니다. 자세한 내용은 '그 외 사소한 변경'
섹션을 보세요.

경고와 사소한 변경을 제외하고, 루비 2.7은 루비 2.6과 호환성을 유지하려고
했습니다. 여러분의 코드는 경고를 발생시킬지는 몰라도 아마 루비 2.7에서도 동작할
겁니다. 루비 2.7에서 코드를 실행하는 것으로 여러분의 코드가 루비 3.0에 대해
준비되었는지 확인할 수 있습니다.

제거 예정 경고를 끄고 싶다면 커맨드 라인 인자`-W:no-deprecated`를 사용하거나,
코드에 `Warning[:deprecated] = false`를 추가하세요.

## 인자 델리게이트 다루기
{: #delegation }

### 루비 2.6 이전
{: #delegation-ruby-2-6-or-prior }

루비 2에서는 `*rest` 인자와 `&block` 인자를 받아 대상 메서드에 넘기는 델리게이트
메서드를 만들 수 있습니다. 여기에서 키워드 인자는 암묵적으로 위치 인자나 키워드
인자로 자동 변환되어 처리됩니다.

{% highlight ruby %}
def foo(*args, &block)
  target(*args, &block)
end
{% endhighlight %}

### 루비 3
{: #delegation-ruby-3 }

키워드 인자를 명시적으로 델리게이트해야 합니다.

{% highlight ruby %}
def foo(*args, **kwargs, &block)
  target(*args, **kwargs, &block)
end
{% endhighlight %}

루비 2.6 이전 버전과의 호환성이 필요하지 않고 아무 인자도 수정하지 않는다면 루비
2.7에서 도입된 새로운 델리게이트 문법(`...`)을 사용할 수 있습니다.

{% highlight ruby %}
def foo(...)
  target(...)
end
{% endhighlight %}

### 루비 2.7
{: #delegation-ruby-2-7 }

요약: `Module#ruby2_keywords`를 사용하고 `*args, &block`을 델리게이트하세요.

{% highlight ruby %}
ruby2_keywords def foo(*args, &block)
  target(*args, &block)
end
{% endhighlight %}

`ruby2_keywords`는 키워드 인자를 마지막 Hash 인자로 받고, 다른 메서드를 호출할
때 이를 키워드 인자로 넘깁니다.

사실 루비 2.7은 많은 경우에 새로운 형태의 델리게이트를 허용하지만, 알려진 예외가
있습니다. 다음 섹션을 보세요.

### 루비 2.6, 2.7, 루비 3에서 호환되는 델리게이트
{: #a-compatible-delegation }

요약: 이번에도 `Module#ruby2_keywords`를 사용하세요.

{% highlight ruby %}
ruby2_keywords def foo(*args, &block)
  target(*args, &block)
end
{% endhighlight %}

안타깝게도 루비 2.6 이전 버전은 새로운 형태의 델리게이트를 제대로 처리할 수 없기
때문에 예전 형태의 델리게이트(즉, `**kwargs` 없음)를 사용해야 합니다. 이는
키워드 인자를 분리하게 된 이유 중 하나입니다. 자세한 내용은 마지막 섹션에
설명되어 있습니다. `ruby2_keywords`는 루비 2.7과 3.0에서도 예전 형태가 동작하게
합니다. 루비 2.6 이전 버전엔 `ruby2_keywords`가 정의되어 있지 않기 때문에,
[ruby2_keywords 젬](https://rubygems.org/gems/ruby2_keywords)을 사용하거나 직접
정의하세요.

{% highlight ruby %}
def ruby2_keywords(*)
end if RUBY_VERSION < "2.7"
{% endhighlight %}

---

코드가 루비 2.6 이전 버전에서 동작할 필요가 없다면 루비 2.7에 도입된 새로운
형태를 시도해보세요. 대부분의 경우에 동작하지만, 안타깝게도 다음 예외가
존재합니다.

{% highlight ruby %}
def target(*args)
  p args
end

def foo(*args, **kwargs, &block)
  target(*args, **kwargs, &block)
end

foo({})       #=> 루비 2.7: []   ({}는 무시됩니다)
foo({}, **{}) #=> 루비 2.7: [{}] (명시적으로 키워드 '없이' 넘겨서 {}를 넘길 수 있습니다)
{% endhighlight %}

빈 Hash 인자는 자동으로 변환되어 `**kwargs`에 병합됩니다. 델리게이트 호출은 빈
키워드 해시를 제거하여 `target`에는 아무 인자도 넘기지 않습니다. 우리가 아는 한
예외는 이것뿐입니다.

마지막 줄에서 언급한 것처럼 이 문제는 `**{}`를 사용해서 해결할 수 있습니다.

이식성이 걱정된다면 `ruby2_keywords`를 사용하세요.(루비 2.6 이전 버전은 키워드
인자에 관한 예외가 굉장히 많다는 걸 알아두세요. :-)
`ruby2_keywords`는 루비 2.6이 유지보수 종료된 후 제거될 수 있습니다. 그 시점에는
키워드 인자를 명시적으로 델리게이트하는 것을 추천합니다(위의 루비 3 코드를
보세요).

## 그 외 사소한 변경
{: #other-minor-changes }

루비 2.7에 키워드 인자와 관련된 사소한 변경 세 가지가 있습니다.

### 1. 키워드 인자에 Symbol이 아닌 키 허용
{: #other-minor-changes-non-symbol-keys }

루비 2.6 이전 버전은 키워드 인자에 Symbol 키만 사용할 수 있습니다. 루비
2.7에서는 키워드 인자에 Symbol이 아닌 키를 사용할 수 있습니다.

{% highlight ruby %}
def foo(**kwargs)
  kwargs
end
foo("key" => 42)
  #=> 루비 2.6 이전: ArgumentError: wrong number of arguments
  #=> 루비 2.7 이후: {"key"=>42}
{% endhighlight %}

메서드가 옵셔널 인자와 키워드 인자 모두 받는 경우, 루비 2.6에서 Symbol 키와
Symbol이 아닌 키 모두를 갖고 있는 Hash는 둘로 나뉘었습니다. 루비 2.7에서는
Symbol이 아닌 키를 허용하기 때문에 둘 다 키워드로 받습니다.

{% highlight ruby %}
def bar(x=1, **kwargs)
  p [x, kwargs]
end

bar("key" => 42, :sym => 43)
  #=> 루비 2.6: [{"key"=>42}, {:sym=>43}]
  #=> 루비 2.7: [1, {"key"=>42, :sym=>43}]

# 동작을 유지하려면 중괄호를 사용하세요
bar({"key" => 42}, :sym => 43)
  #=> 루비 2.6 및 2.7: [{"key"=>42}, {:sym=>43}]
{% endhighlight %}

루비 2.7은 명시적 키워드를 받지만 나머지 키워드 인자(`**kwargs`)는 받지 않는
메서드를, Symbol과 Symbol이 아닌 키 모두를 갖는 Hash 또는 키워드 인자를 넘겨
호출한 경우 여전히 해시를 나누고 경고를 발생시킵니다. 이 동작은 루비 3에서
제거되고 `ArgumentError`를 발생시킵니다.

{% highlight ruby %}
def bar(x=1, sym: nil)
  p [x, sym]
end

bar("key" => 42, :sym => 43)
# 루비 2.6 및 2.7: => [{"key"=>42}, 43]
# 루비 2.7: warning: Splitting the last argument into positional and keyword parameters is deprecated
#           warning: The called method `bar' is defined here
# 루비 3.0: ArgumentError
{% endhighlight %}

### 2. 이중 스플랫(double splat)을 사용한 빈 해시(`**{}`)는 아무 인자도 넘기지 않음
{: #other-minor-changes-empty-hash }

루비 2.6 이전 버전은 `**empty_hash`를 넘기면 위치 인자로 빈 Hash를 넘깁니다.
루비 2.7 이후 버전은 아무 인자도 넘기지 않습니다.

{% highlight ruby %}
def foo(*args)
  args
end

empty_hash = {}
foo(**empty_hash)
  #=> 루비 2.6 이전: [{}]
  #=> 루비 2.7 이후: []
{% endhighlight %}

`foo(**{})`는 루비 2.6과 2.7 모두 아무것도 넘기지 않습니다. 루비 2.6 이전 버전은
파서에 의해 `**{}`를 제거하고, 루비 2.7 이후 버전은 `**empty_hash`와 동일하게
간주되어, 메서드에 아무 키워드 인자도 넘기지 않는 쉬운 방법을 제공합니다.

루비 2.7에서는 필요한 위치 인자 개수보다 적은 인자를 넘겨 메서드를 호출했을 때,
루비 2.6과의 호환성을 위해 `foo(**empty_hash)`에서 빈 해시를 넘기고 경고를
발생시킵니다. 이 동작은 3.0에서 제거됩니다.

{% highlight ruby %}
def foo(x)
  x
end

empty_hash = {}
foo(**empty_hash)
  #=> 루비 2.6 이전: {}
  #=> 루비 2.7: warning: Passing the keyword argument as the last hash parameter is deprecated
  #             warning: The called method `foo' is defined here
  #=> 루비 3.0: ArgumentError: wrong number of arguments
{% endhighlight %}

### 3. 키워드 인자 없음 문법(`**nil`) 도입
{: #other-minor-changes-double-splat-nil }

메서드가 키워드 인자를 받지 않는다는 것을 명시적으로 나타내기 위해 메서드 정의에 `**nil`을 사용할 수 있습니다. 이러한 메서드를 키워드 인자와 함께 호출하면 `ArgumentError`가 발생합니다.(이건 새 기능이고, 호환되지 않는 기능이 아닙니다)

{% highlight ruby %}
def foo(*args, **nil)
end

foo(k: 1)
  #=> 루비 2.7 이후: no keywords accepted (ArgumentError)
{% endhighlight %}

메서드가 키워드 인자를 받지 않는다는 것을 명시적으로 만들 때 유용합니다. 이렇게
하지 않으면 위의 예제에서 키워드는 나머지 인자에 병합됩니다. 메서드가 키워드
인자를 받도록 확장하면 메서드는 다음과 같은 호환성 문제를 갖게 될 수 있습니다.

{% highlight ruby %}
# 메서드가 나머지 인자를 받고 `**nil`이 없는 경우
def foo(*args)
  p args
end

# 키워드를 넘기면 Hash 객체로 변환됩니다(루비 3.0도 마찬가지)
foo(k: 1) #=> [{:k=>1}]

# 메서드가 키워드를 받도록 확장된 경우
def foo(*args, mode: false)
  p args
end

# 기존의 호출이 동작하지 않을 수 있습니다
foo(k: 1) #=> ArgumentError: unknown keyword k
{% endhighlight %}

## 자동 변환이 제거 예정된 이유
{: #why-deprecated }

처음에 자동 변환은 좋은 아이디어처럼 보였고, 많은 경우에 잘 동작했습니다. 하지만
너무 많은 예외가 존재했고, 이 동작에 관한 많은 버그 제보를 받았습니다.

자동 변환은 메서드가 옵셔널 위치 인자와 키워드 인자를 받는 경우 잘 동작하지
않습니다. 어떤 사람들은 마지막 Hash 객체가 위치 인자로 간주될 거라고 생각하고,
또 어떤 사람들은 키워드 인자로 변환될 거라고 생각합니다.

이는 가장 헷갈리는 경우 중 하나입니다.

{% highlight ruby %}
def foo(x, **kwargs)
  p [x, kwargs]
end

def bar(x=1, **kwargs)
  p [x, kwargs]
end

foo({}) #=> [{}, {}]
bar({}) #=> [1, {}]

bar({}, **{}) #=> expected: [{}, {}], actual: [1, {}]
{% endhighlight %}

루비 2에서 `foo({})`는 빈 해시를 일반적인 인자로 넘기지만(즉, `{}`는 `x`에 대입됩니다), `bar({})`는 키워드 인자를 넘깁니다(즉, `{}`는 `kwargs`에 대입됩니다). 그래서 `any_method({})`는 굉장히 모호합니다.

`bar({}, **{})`가 빈 해시를 명시적으로 `x`에 넘길 거라고 생각할 수 있습니다. 놀랍게도 이는 생각한 대로 동작하지 않고 루비 2.6에서 여전히 `[1, {}]`를 출력합니다. 루비 2.6에서 `**{}`가 파서에 의해 무시되고, 첫 번째 인자 `{}`는 키워드(`**kwargs`)로 자동 변환되기 때문입니다. 이 경우에 `bar({}, {})`를 호출해야 하는데, 아주 이상하죠.

같은 문제가 나머지 인자와 키워드 인자를 받는 메서드에도 적용됩니다. 이는 키워드 인자의 명시적인 델리게이트가 동작하지 않게 합니다.

{% highlight ruby %}
def target(*args)
  p args
end

def foo(*args, **kwargs, &block)
  target(*args, **kwargs, &block)
end

foo() #=> 루비 2.6 이전: [{}]
      #=> 루비 2.7 이후: []
{% endhighlight %}

`foo()`는 아무 인자도 넘기지 않지만 루비 2.6에서 `target`은 빈 해시 인자를
받습니다. `foo` 메서드가 키워드(`**kwargs`)를 명시적으로 델리게이트하기
때문입니다. `foo()`가 호출되었을 때 `args`는 빈 Array, `kwargs`는 빈 Hash,
`block`은 `nil`입니다. 그 후 `target(*args, **kwargs, &block)`은 빈 Hash를
인자로 넘기는데, `**kwargs`가 Hash 위치 인자로 자동 변환되기 때문입니다.

자동 변환은 사람을 혼란스럽게 할 뿐만 아니라 메서드의 확장성도 떨어뜨립니다. 이
동작 변경에 대한 근거와 구현과 관련된 선택이 이루어진 이유에 대한 자세한 내용은
[[Feature #14183]](https://bugs.ruby-lang.org/issues/14183)을 보세요.

## 감사의 글

이 글을 리뷰해 준(그리고 같이 작성해 준) Jeremy Evans와 Benoit Daloze에게 감사를 표합니다.

## 수정 이력

* 2019-12-25 수정: 2.7.0-rc2에서 경고 메시지가 약간 수정되었고, 경고를 끄는 API를 추가했습니다.
