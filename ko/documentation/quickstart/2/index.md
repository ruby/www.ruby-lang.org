---
layout: page
title: "Ruby 20분 가이드"
lang: ko

header: |
  <div class="multi-page">
    <a href="../" title="Part 1">1</a>
    <span class="separator"> | </span>
    <strong>2</strong>
    <span class="separator"> | </span>
    <a href="../3/" title="Part 3">3</a>
    <span class="separator"> | </span>
    <a href="../4/" title="Part 4">4</a>
  </div>
  <h1>Ruby 20분 가이드</h1>

---

손가락에 무리를 주지 않으면서 “Hello”를 여러 번 말하고 싶다면 어떻게 해야 할까요? 메서드를 정의해야 한답니다.

{% highlight irb %}
irb(main):010:0> def h
irb(main):011:1> puts "Hello World!"
irb(main):012:1> end
=> :h
{% endhighlight %}

`def h`는 메서드의 정의의 시작입니다. Ruby에게 `h`란 이름의 메서드의 정의를
시작한다는 것을 알리는 것이죠. 그 다음 줄은 메서드 몸통(body)입니다. 전에 본 것과
같은 `puts "Hello World"`입니다.
마지막으로 `end`는 Ruby에게 메서드 정의가 끝났음을 알려줍니다.
`=> :h`은 메서드의 정의가 끝났음을 Ruby가 알아들었다는 것을 의미하죠.
Ruby 2.0이나 그 이전 버전이라면 이 반환 값은 `=> nil`이 될 수도 있습니다.
하지만 여기에서는 별로 중요하지 않으니 다음으로 넘어갑시다.

이제 정의한 메서드를 몇 번 호출해 보겠습니다.

{% highlight irb %}
irb(main):013:0> h
Hello World!
=> nil
irb(main):014:0> h()
Hello World!
=> nil
{% endhighlight %}

생각보다 쉽지 않나요? Ruby에서 메서드를 호출하는 것은 단지 메서드 이름을 입력하는 것에 지나지 않지요. 메서드가 인자를 받지
않는다면, 그걸로 충분하답니다. 빈 괄호를 입력해도 되지만, 필요한 것은 아니랍니다.

온 세상에 “Hello”라고 외치는 대신에 특정 사람에게 인사를 건네고 싶다면 어떻게 해야
할까요? 사람 이름을 매개 변수로 받도록 `h`를 다시 정의하면 됩니다.

{% highlight irb %}
irb(main):015:0> def h(name)
irb(main):016:1> puts "Hello #{name}!"
irb(main):017:1> end
=> :h
irb(main):018:0> h("Matz")
Hello Matz!
=> nil
{% endhighlight %}

생각처럼 잘 동작되는군요. 조금 더 자세히 들여다 보도록 하지요.

## 문자열의 중간에 자리를 잡아두기

`#{name}` 부분은 무엇이냐구요? Ruby에서 문자열 중간에 무엇을 삽입하는 방법입니다.
중괄호 사이의 부분이 문자열로 변환되어 (이미 문자열이 아니라면) 전체 문자열의 그
지점에 삽입되는 것이지요. 사람 이름의 첫 글자를 대문자로 만들어주는 것도 가능합니다.

{% highlight irb %}
irb(main):019:0> def h(name = "World")
irb(main):020:1> puts "Hello #{name.capitalize}!"
irb(main):021:1> end
=> :h
irb(main):022:0> h "chris"
Hello Chris!
=> nil
irb(main):023:0> h
Hello World!
=> nil
{% endhighlight %}

몇 가지 눈에 띄는 것이 있을 겁니다. 첫째로 또 괄호를 사용하지 않고 있네요. 의도가
명백하다면 괄호는 단지 선택사항일 뿐이죠. 또 하나의 트릭은 기본 매개 변수로 `World`를
사용하고 있는 부분입니다. 이 부분의 의미는 "인자를 넘겨주지 않으면 그 대신
`"World"`를 사용하겠다"입니다.

## 하인 두기

손님의 이름을 기억하고 항상 정중하게 마중과 배웅을 하는 하인을 두는 것은 어떨까요? 객체를 사용하는 것이 좋을 것 같습니다.
“Greeter” 클래스를 만들도록 하지요.

{% highlight irb %}
irb(main):024:0> class Greeter
irb(main):025:1>   def initialize(name = "World")
irb(main):026:2>     @name = name
irb(main):027:2>   end
irb(main):028:1>   def say_hi
irb(main):029:2>     puts "Hi #{@name}!"
irb(main):030:2>   end
irb(main):031:1>   def say_bye
irb(main):032:2>     puts "Bye #{@name}, come back soon."
irb(main):033:2>   end
irb(main):034:1> end
=> nil
{% endhighlight %}

새로운 키워드 `class`가 나왔군요. 위에서는 새로운 “Greeter” 클래스와 메서드가
정의되고 있습니다. 또 `@name`도 보이네요. 이는 인스턴스 변수로 모든 메서드에서
접근이 가능합니다. 보다시피 `say_hi`와 `say_bye`에서 사용되고 있습니다.

어떻게 이 “Greeter” 클래스를 사용하냐구요? [객체를 만들면](../3/) 됩니다.
