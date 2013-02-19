---
layout: page
title: "루비 20분 가이드"
lang: ko
---

손가락에 무리를 주지 않으면서 “Hello”를 여러번 말하고 싶다면 어떻게 해야 할까요? 메서드를 정의해야 한답니다.

{% highlight ruby %}
irb(main):010:0> def h
irb(main):011:1> puts "Hello World!"
irb(main):012:1> end
=> nil
{% endhighlight %}

“def h”가 바로 메서드의 정의를 시작한답니다. 루비에게 우리가 “h”란 이름의 메서드의 정의를 시작한다는 것을 알리는
것이죠. 그 다음줄은 메서드 바디(body)입니다. 마지막으로 “end”는 루비에게 메서드 정의가 끝났음을 알려줍니다.
”=&gt; nil”은 메서드의 정의가 끝났음을 루비가 알아들었다는 것을 의미하죠.

## 메서드의 일시적이고 반복적인 삶

이제 정의한 메서드를 몇번 호출해 보겠습니다.

{% highlight ruby %}
irb(main):013:0> h
Hello World!
=> nil
irb(main):014:0> h()
Hello World!
=> nil
{% endhighlight %}

생각보다 쉽지 않나요? 루비에서 메서드를 호출하는 것은 단지 메서드 이름을 입력하는 것에 지나지 않지요. 메서드가 인자를 받지
않는다면, 그걸로 충분하답니다. 빈 괄호를 입력해도 되지만, 필요한 것은 아니랍니다.

온세상에 “Hello”라고 외치는 대신에 특정 사람에게 인사를 건네고 싶다면 어떻게 해야 할까요? 사람 이름을 인자로 받도록
“h”를 다시 정의하면 됩니다.

{% highlight ruby %}
irb(main):015:0> def h(name)
irb(main):016:1> puts "Hello #{name}!"
irb(main):017:1> end
=> nil
irb(main):018:0> h("Matz")
Hello Matz!
=> nil
{% endhighlight %}

생각처럼 잘 동작되는군요. 조금 더 자세히 들여다 보도록 하지요.

## 문자열의 중간에 자리를 잡아두기

”#\{name}” 부분은 무엇이냐구요? 루비에서 문자열 중간에 무엇을 삽입하는 방법이랍니다. 중괄호 사이의 부분이 문자열로
변환되어 (이미 문자열이 아니라면) 전체 문자열의 그 지점에 삽입되는 것이지요. 사람 이름의 첫글자를 대문자로 만들어주는 것도
가능합니다.

{% highlight ruby %}
irb(main):019:0> def h(name = "World")
irb(main):020:1> puts "Hello #{name.capitalize}!"
irb(main):021:1> end
=> nil
irb(main):022:0> h "chris"
Hello Chris!
=> nil
irb(main):023:0> h
Hello World!
=> nil
{% endhighlight %}

몇가지 눈의 띄는 것이 있을 겁니다. 첫째로 또 괄호를 사용하지 않고 있네요. 의도가 명백하다면 괄호는 단지 선택사항에 불과할
뿐이죠. 두번째로 디폴트 인자 “World”를 사용하고 있습니다. 즉 인자를 넘겨주지 않으면 “World”가 대신 사용되는
것이지요.

## 하인 두기

손님의 이름을 기억하고 항상 정중하게 마중과 배웅을 하는 하인을 두는 것은 어떨까요? 객체를 사용하는 것이 좋을 것 같습니다.
“Greeter” 클래스를 만들도록 하지요.

{% highlight ruby %}
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

새로운 키워드은 “class”가 나왔군요. 위에서는 새로운 “Greeter” 클래스와 여럿의 메서드가 정의되고 있습니다. 또한
”@name”이 보이지요. 이는 객체 변수로써 모든 메서드에서는 접근이 가능하답니다. 보다시피 “say\_hi”와
“say\_bye”에서 사용되고 있습니다.

어떻게 이 “Greeter” 클래스를 사용하냐구요? [객체를 만들면](/ko/documentation/quickstart/3/)
됩니다.

