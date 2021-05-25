---
layout: page
title: "Ruby 20분 가이드"
lang: ko

header: |
  <div class="multi-page">
    <strong>1</strong>
    <span class="separator"> | </span>
    <a href="2/" title="Part 2">2</a>
    <span class="separator"> | </span>
    <a href="3/" title="Part 3">3</a>
    <span class="separator"> | </span>
    <a href="4/" title="Part 4">4</a>
  </div>
  <h1>Ruby 20분 가이드</h1>

---

## 소개

이 문서는 20분 정도면 따라 해볼 수 있는 간단한 Ruby 튜토리얼입니다.
이 튜토리얼을 따라 하기 위해서는 컴퓨터에 Ruby가 설치되어 있어야
합니다. (아직 Ruby가 설치되어 있지 않다면, 시작하기 전에
[설치][installation]하시기 바랍니다.)

## 대화형 Ruby 셸(irb)

Ruby에는 당신이 입력한 Ruby 구문을 바로 결과로 보여주는 프로그램이
동봉되어 있습니다. 대화형 세션에서 Ruby 코드를 가지고 노는 것은
Ruby를 배울 수 있는 훌륭한 방법입니다.

irb(Interactive Ruby의 약자)를 시작하십시오.

* **macOS**를 사용한다면, 터미널 애플리케이션을 시작하여 `irb`라고
  입력하고 엔터를 누릅니다.
* **Linux**를 사용한다면, 셸을 시작하여 `irb`라고 입력하고 엔터를 누릅니다.
* **Windows**를 사용한다면, 시작 메뉴의 Ruby 섹션에서 `Interactive Ruby`를
  시작합니다.

{% highlight irb %}
irb(main):001:0>
{% endhighlight %}

이제 irb 프롬프트에 `"Hello World"`라고 입력해 봅니다.

{% highlight irb %}
irb(main):001:0> "Hello World"
=> "Hello World"
{% endhighlight %}

## 당신의 첫 Ruby 코드가 실행되었습니다!

지금 무엇을 한 거냐고요? 세상에서 제일 짧은 “Hello World” 프로그램을
짰을까요? 아닙니다. IRB는 입력한 Ruby 코드를 실행한 결과를 다음 줄에
보여준 것뿐입니다. 만약 “Hello World”를 출력하고 싶다면, 다음과
같이 해야 합니다.

{% highlight irb %}
irb(main):002:0> puts "Hello World"
Hello World
=> nil
{% endhighlight %}

`puts`는 Ruby에서 출력할 때 주로 사용하는 명령어입니다. 그럼
`=> nil` 부분은 무슨 뜻일까요? 바로 우리가 입력한 Ruby 코드가
반환한 값입니다. `puts` 명령어는 언제나 nil을 반환합니다.
Ruby에서의 nil은 절대적으로 아무것도 없는(absolutely-positively-nothing) 값입니다.

## 무료 탁상용 계산기

irb는 계산기로 쓰기에도 무척 유용합니다.

{% highlight irb %}
irb(main):003:0> 3+2
=> 5
{% endhighlight %}

3 더하기 2. 무척 쉽지요. 3 *곱하기* 2는 어떨까요?
아주 짧지만, 다시 입력하는 대신에 **위쪽 화살표 키**를 눌러보세요.
아마도 `3+2`가 나올 겁니다. 화살표 키로 커서를 움직여서 `+`를 `*`로
바꾸어 보세요.

{% highlight irb %}
irb(main):004:0> 3*2
=> 6
{% endhighlight %}

이번에는 3의 제곱을 계산해보죠.

{% highlight irb %}
irb(main):005:0> 3**2
=> 9
{% endhighlight %}

Ruby에서 `**`는 "거듭제곱"을 뜻합니다. 제곱근은 어떻게 구할까요?

{% highlight irb %}
irb(main):006:0> Math.sqrt(9)
=> 3.0
{% endhighlight %}

무언가 새로운 게 나왔군요. 뭐, 9의 제곱근은 잘 계산되었지만 말입니다.
우선 `Math`가 무엇인지부터 보도록 하지요.

## 모듈, 용도에 따른 코드 분류

`Math`는 수학계산을 위한 내부 모듈입니다. Ruby에서 모듈은 두 가지
역할을 합니다. 위의 예는 이중 한 가지를 보여주고 있습니다. 즉, 관련이
있는 여러 메서드를 하나의 이름으로 묶어두는 것이지요. `Math`에는
`sin()`과 `tan()` 같은 메서드도 들어있답니다.

다음은 점을 설명할 차례군요. 점은 무슨 역할을 할까요? 점은 메시지와
메시지를 받는 대상을 구분하여 줍니다. 메시지가 무엇이냐구요? 위의
예제의 경우 메시지는 `sqrt(9)`입니다. 이는 "제곱근"을 의미하는
`sqrt` 메서드를 호출하며 `9`를 매개 변수로 넘기라는 의미입니다.

이 메서드 호출의 결과 값은 `3.0`입니다. 그냥 `3`이 아니라는 걸
눈치채셨는지요? 사실 대부분의 경우에 제곱근의 값은 정수가 아니므로
`sqrt` 메서드는 언제나 실수를 반환합니다.

계산의 결과 값을 저장해두고 싶다면 어떻게 해야 할까요? 변수에 할당해두면
됩니다.

{% highlight irb %}
irb(main):007:0> a = 3 ** 2
=> 9
irb(main):008:0> b = 4 ** 2
=> 16
irb(main):009:0> Math.sqrt(a+b)
=> 5.0
{% endhighlight %}

물론 계산기만으로도 유용하겠지만, 이제 다시 전통적인 `Hello World` 프로그램을
만드는 초심자 튜토리얼으로 [돌아가 보겠습니다.](2/)

[installation]: /ko/documentation/installation/
