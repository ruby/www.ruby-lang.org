---
layout: page
title: "루비 20분 가이드"
lang: ko

header: |
  <h2>루비 20분 가이드</h2>
  <ul class="multi-page">
    <li><strong>Part 1</strong></li>
    <li><a href="2/" title="Part 2">Part 2</a></li>
    <li><a href="3/" title="Part 3">Part 3</a></li>
    <li><a href="4/" title="Part 4">Part 4</a></li>
  </ul>
---

## 소개

이 문서는 20분 정도면 따라해볼 수 있는 간단한 루비 튜토리얼입니다. 이 튜토리얼을 따라하기 위해서는 컴퓨터에 루비가 설치되어
있어야 합니다. (아직 루비가 설치되어 있지 않다면, [이곳](/ko/downloads)에서 다운로드 받아 설치하기 바랍니다.)

## 대화형 루비 셸(irb)

irb를 시작하십시오.

* **맥 OS X**를 사용한다면, 터미널 애플리케이션을 시작하여 `irb`라고 입력하고 엔터를 누릅니다.
* **리눅스**를 사용한다면, 쉘을 시작하여 `irb`라고 입력하고 엔터를 누릅니다.
* **윈도우**를 사용한다면, 시작 메뉴의 루비 섹션에서 `fxri`를 시작합니다.
^

{% highlight ruby %}
irb(main):001:0>
{% endhighlight %}

이제 irb 프롬프트에 “Hello World”라고 입력해 봅니다.

{% highlight ruby %}
irb(main):001:0> "Hello World"
=> "Hello World"
{% endhighlight %}

## 당신의 첫 루비 코드가 실행되었습니다!

지금 무엇을 한거냐구요? irb는 입력한 루비 코드를 실행한 결과를 다음 줄에 보여줍니다. 만약 문자열을 프린트하고 싶다면,
다음과 같이 해야합니다.

{% highlight ruby %}
irb(main):002:0> puts "Hello World"
Hello World
=> nil
{% endhighlight %}

puts는 루비에서 출력을 할때 주로 사용하는 명령어입니다. ”=&gt; nil” 부분은 무엇일까요? 바루 우리가 입력한 루비
코드가 리턴한 값이랍니다. puts 명령어는 언제나 nil을 리턴합니다. nil은 무(無)를 의미하는데, 즉 리턴하는 값이 없음을
표시합니다.

## 탁상용 계산기

irb는 계산기로 쓰기에도 무척 유용합니다.

{% highlight ruby %}
irb(main):003:0> 3+2
=> 5
{% endhighlight %}

3 더하기 2. 무척 쉽지요. 3 곱하기 2는 어떨까요? 다시 입력하는 대신에 위쪽 화살표키를 눌러보세요. 아마도 “3+2”가
나올겁니다. 화살표키로 커서를 움직여서 ”+”를 “`*`“로 바꾸어 보세요.

{% highlight ruby %}
irb(main):004:0> 3*2
=> 6
{% endhighlight %}

이번에는 3의 제곱을 계산해보죠.

{% highlight ruby %}
irb(main):005:0> 3**2
=> 9
{% endhighlight %}

루비에서 “`**`“는 거듭제곱을 뜻합니다. 제곱근은 어떻게 구할까요?

{% highlight ruby %}
irb(main):006:0> Math.sqrt(9)
=> 3.0
{% endhighlight %}

무언가 새로운게 나왔군요. 뭐, 9의 제곱근은 잘 계산되었지만 말입니다. 우선 “Math”가 무엇인지 부터 보도록 하지요.

## 모듈, 용도에 따른 코드 분류

“Math”는 수학계산을 위한 내부 모듈입니다. 루비에서 모듈은 두가지 역할을 합니다. 위의 예는 이중 한가지를 보여주고
있습니다. 즉, 관련이 있는 여러 메소드를 하나의 이름으로 묶어두는 것이지요. “Math”에는 “sin()”과 “tan()” 같은
메소드도 들어있답니다.

다음은 점을 설명할 차례군요. “Math”와 “sqrt(9)” 사이의 점은 무슨 역할을 할까요? 점은 메세지를 받는 대상을
구분하여 줍니다. 메세지가 무엇이냐구요? 여기서 메세지는 “sqrt(9)”입니다. 이는 제곱근을 의미하는 “sqrt” 메소드를
호출하며 9를 파라미터로 넘기라는 의미입니다.

이 메소드 호출의 결과값은 3.0입니다. 그냥 3이 아니라 3.0이라는걸 눈치채셨는지요? 사실 대부분의 경우에 제곱근의 값은
정수가 아니게 됩니다. 따라서 “sqrt” 메소드는 언제나 실수를 리턴합니다.

만약 이러한 계산의 결과값을 저장해두고 싶다면 어떻게 해야 할까요? 변수에 지정해두면 됩니다.

{% highlight ruby %}
irb(main):007:0> a = 3 ** 2
=> 9
irb(main):008:0> b = 4 ** 2
=> 16
irb(main):009:0> Math.sqrt(a+b)
=> 5.0
{% endhighlight %}

이는 계산기로도 유용하겠지만, 이제 다시 [Hello World
프로그램](/ko/documentation/quickstart/2/)으로 돌아가 보겠습니다.

