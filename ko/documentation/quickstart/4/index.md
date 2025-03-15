---
layout: page
title: "Ruby 20분 가이드"
lang: ko

header: |
  <div class="multi-page">
    <a href="../" title="Part 1">1</a>
    <span class="separator"> | </span>
    <a href="../2/" title="Part 2">2</a>
    <span class="separator"> | </span>
    <a href="../3/" title="Part 3">3</a>
    <span class="separator"> | </span>
    <strong>4</strong>
  </div>
  <h1>Ruby 20분 가이드</h1>

---

앞의 Ruby 코드를 자세히 살펴보면 샵(#)으로 시작하는 줄이 여럿 있음을 알 수 있습니다. Ruby에서는 샵으로 시작하는 줄은
주석으로 프로그램 실행시에 무시됩니다. 파일의 첫 번째 줄은 다소 예외적인 경우인데, 유닉스 계열의 운영체제에서 어떻게 이 파일을
실행할 수 있는지를 알려주는 역할을 합니다. 다른 주석은 단지 코드를 이해하기 쉽게 하기 위해서 위해 있을 뿐입니다.

`say_hi` 메서드가 조금 더 복잡해졌습니다.

{% highlight ruby %}
# Say hi to everybody
def say_hi
  if @names.nil?
    puts "..."
  elsif @names.respond_to?("each")
    # @names is a list of some kind, iterate!
    @names.each do |name|
      puts "Hello #{name}!"
    end
  else
    puts "Hello #{@names}!"
  end
end
{% endhighlight %}

`say_hi` 메서드는 이제 결정을 내리기 위해 `@names` 인스턴스 변수의 내용을 확인합니다.
만약 `@names`가 nil이라면, 세 개의 점을 출력하게 되죠. 존재하지 않는 사람에게 인사를
할 필요는 없을 테니 말입니다.

## 순환과 반복 - 이터레이션(Iteration)

만약 `@names` 객체가 `each`에 반응하면, 이 객체의 내용물을 순차적으로 접근 할
수 있습니다. 이 말은 객체를 순차적으로 접근하여 매회 다른 사람에게 인사를 할
수 있다는 뜻입니다. 만약 반응하지 않다면, `@names`를 문자열로 (자동으로) 변환시켜서
그냥 인사를 하게 하고 있습니다.

그 부분을 조금 더 자세히 들여다 보도록 하지요.

{% highlight ruby %}
@names.each do |name|
  puts "Hello #{name}!"
end
{% endhighlight %}

`each`는 코드 블록을 넘겨 받아서 리스트의 각 원소에 순차적으로 이를 적용시키는
메서드입니다. `do`와 `end` 사이의 코드가 바로 블록이지요. 블록은 익명 함수 또는
`lambda`와 유사하다고 볼 수 있습니다. 두개의 `|` 사이의 변수는 이 블록에 넘겨지는
매개 변수입니다.

여기서 일어나고 있는 것은 리스트의 각 원소가 `name` 변수에 넘겨져서, 그 `name`을
가지고 `puts "Hello #{name}!"` 코드가 실행되고 있는 거랍니다.

대부분의 다른 프로그래밍 언어에서는 보통 `for` 반복문을 사용해서 리스트의 내용물을
처리하게 되지요. C 코드로는 다음과 같겠죠.

{% highlight c %}
for (i=0; i<number_of_elements; i++)
{
  do_something_with(element[i]);
}
{% endhighlight %}

물론 위의 코드는 잘 작동합니다. 하지만 그다지 우아하지는 않지요. 임시 변수인 `i`가
필요한 데다가, 리스트의 길이가 얼마인지도 계산해야 하지요. 그리고 리스트의 내용물을
접근하는 코드도 작성해야 합니다. Ruby의 방식이 훨씬 더 우아합니다. 핵심적이지 않은
코드는 `each` 메서드 안에 숨겨져 버렸지요. 단지 각 내용물을 가지고 무엇을 할 것인지만
코딩하면 됩니다. 내부적으로 `each` 메서드는 `yield "Albert"`를 하고 `yield "Brenda"`를
하고 `yield "Charles"` 등등을 계속 호출함으로써 리스트의 내용물을 블록에 넘겨줍니다.

## Ruby에서의 전가의 보도, 블록

블록의 진짜 힘은 리스트보다 복잡한 것을 다룰 때 나타납니다. 위와 같은 자잘한 작업뿐만
아니라, 각종 셋업 코드, 에러처리 등을 모두 사용자가 신경 끄도록 감춰주는데 사용됩니다.

{% highlight ruby %}
# Say bye to everybody
def say_bye
  if @names.nil?
    puts "..."
  elsif @names.respond_to?("join")
    # Join the list elements with commas
    puts "Goodbye #{@names.join(", ")}.  Come back soon!"
  else
    puts "Goodbye #{@names}.  Come back soon!"
  end
end
{% endhighlight %}

`say_bye` 메서드는 `each` 메서드를 사용하지 않는군요. `say_bye` 메서드는 단지 `@names`가
`join` 메서드를 가졌는지 확인하고, 가지고 있다면 `join` 하고 있습니다. 그렇지 않다면, 변수를 문자열로 출력만 합니다. 이
메서드는 변수의 실제 *타입*은 신경을 쓰지 않는군요. 이처럼 단지 어떤 메서드만을 가지고 있는지에 의존하는 것을 덕 타이핑(Duck
Typing)이라고 부릅니다. “만약 오리처럼 걷고 오리처럼 꽥꽥거리면...”에서처럼 말입니다. 이런 방식의 장점은 어떤 타입의
변수를 지원할 것인지를 제한할 필요가 없다는 것입니다. 만약 누군가가 새로운 종류의 list 클래스를 정의했다고 해도, 거기에
`join` 메서드만 정의되어 있으면 잘 동작 할 것입니다.

## 스크립트 실행하기

“MegaGreeter” 클래스는 그게 전부입니다. 나머지 코드는 단지 클래스의 메서드를 호출할 뿐이지요. 아, 설명하지 않은 것이
한 가지 더 있군요. 다음의 코드입니다.

{% highlight ruby %}
if __FILE__ == $0
{% endhighlight %}

`__FILE__`은 현재 파일의 이름이 저장되어 있는 특수한 변수입니다. `$0`은 현재의 프로그램을 시작한 파일의 이름이 저장된
변수이죠. 이 코드는 “만약 현재의 파일이 메인 파일로 사용된 것이라면...”을 확인해주고 있습니다. 이것은 이 파일이
라이브러리로 사용될 때는 코드가 실행되지 않다가, 파일 자체가 실행될 때는 코드를 실행해주게 되지요.

## 이제 기초는 다 익혔습니다

Ruby를 잠깐 둘러 보았습니다. 물론 훨씬 더 많은 것들이 기다리고 있습니다. Ruby가 제공하는 여러 제어문들, 블록의 사용과
“yield” 메서드, 모듈과 믹스인, 그리고 훨씬 더 많은 것들이요. 이 짧은 튜토리얼이 여러분이 Ruby를 더 배워보고 싶게
했으면 하는 바람입니다.

만약 그랬다면, 매뉴얼과 튜토리얼 등이 소개되어 있는 [문서 섹션](/ko/documentation)으로 가 보세요. 모두
온라인에 무료로 제공되고 있으니까요.

* 원문: [Ruby in Twenty Minutes][1]
* 번역: [황대산][2]
* 이 문서는 업데이트되고 있습니다. 대산 님의 초기 번역본과는 다를 수 있습니다.



[1]: /en/documentation/quickstart
[2]: http://beyond.daesan.com
