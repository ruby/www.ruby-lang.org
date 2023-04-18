---
layout: page
title: "공식 Ruby FAQ"
lang: ko

header: |
  <div class="multi-page">
    <a href="../" title="Content">콘텐츠</a>
    <span class="separator"> | </span>
    <a href="../1/" title="파트 1">1</a>
    <span class="separator"> | </span>
    <a href="../2/" title="파트 2">2</a>
    <span class="separator"> | </span>
    <a href="../3/" title="파트 3">3</a>
    <span class="separator"> | </span>
    <a href="../4/" title="파트 4">4</a>
    <span class="separator"> | </span>
    <a href="../5/" title="파트 5">5</a>
    <span class="separator"> | </span>
    <a href="../6/" title="파트 6">6</a>
    <span class="separator"> | </span>
    <a href="../7/" title="파트 7">7</a>
    <span class="separator"> | </span>
    <a href="../8/" title="파트 8">8</a>
    <span class="separator"> | </span>
    <a href="../9/" title="파트 9">9</a>
    <span class="separator"> | </span>
    <a href="../10/" title="파트 10">10</a>
    <span class="separator"> | </span>
    <strong>11</strong>
  </div>
  <h1>공식 Ruby FAQ</h1>

---

{% include faq-notice.md %}

## 기타 기능

### `a ? b : c`는 무엇을 의미하나요?

이것은 "삼항 연산자"라고 하며, 'if a then b else c end'와
동일합니다.

### 파일의 줄 수를 계산하려면 어떻게 해야 하나요?

다음 코드가 가장 빠른 결과를 제공할 수 있습니다.

~~~
File.readlines("example").size  # => 3
~~~

### `MatchData#begin`과 `MatchData#end`는 무엇을 반환하나요?

이 함수는 `$~`와 함께 작동하며 원본 문자열에서 일치하는 데이터의 시작 인덱스와
끝 인덱스를 반환합니다. [탭 확장](../9/#tab-expansion)에서 예제를 참조하세요.

### 배열의 요소를 합산하려면 어떻게 해야 하나요?

{% include faq-out-of-date.html %}

특정 문제를 해결하기보다는 일반적인 경우를 해결해 봅시다. 가장 먼저 할 일은
`Enumerable` 객체를 반복하고 단일 결과를 수집하는 메서드를 생성하는 것입니다.
Smalltalk는 이 메소드를 inject라고 부르기 때문에 우리도 그렇게 부르겠습니다.

~~~
module Enumerable

  # inject(n) {|n, i| ...}
  def inject(n)
    each {|i| n = yield(n, i) }

    n
  end
end
~~~

`Enumerable`에 메서드를 추가한 것을 주목하세요. 즉, Enumerable을 포함하는 모든
곳에서 이제 `inject`를 사용할 수 있습니다. 하지만 어떻게 사용할까요? 하나의
인자 `n`과 블록이 필요합니다. 열거되는 대상의 각 요소에 대해 `n`과 요소 자체를
전달하면서 블록을 호출합니다. 블록의 결과는 다시 `n`에 할당됩니다. 따라서
`sum`을 정의하기 위해 다음과 같이 작성할 수 있습니다:

~~~
module Enumerable
  def sum
    inject(0) {|n, i| n + i }
  end
end

[1,3,5,7,9].sum  # => 25
(1..100).sum     # => 5050
~~~

### 연속은 어떻게 사용하나요?

{% include faq-out-of-date.html %}

Ruby의 연속을 사용하면 Ruby 프로그램에서 특정 장소를 나타내는 객체를 생성한
다음 언제든지 해당 장소로 돌아갈 수 있습니다(범위를 벗어난 것처럼 보이
는 경우에도). 연속은 복잡한 제어 구조를 구현하는 데 사용할 수 있지만
일반적으로는 사람들에게 혼란을 더하기만 합니다.

[\[ruby-talk:4482\]][ruby-talk:4482]에서 Jim Weirich가 다음과 같은 연속 예제를
게시했습니다.

~~~
# --------------------------------------------------------------------
# 단순 생산자/소비자
# --------------------------------------------------------------------
# 연속을 사용하여 단순 계산 작업과 인쇄 작업을 함께 연결합니다.
#
# 사용법: count(limit)

def count_task(count, consumer)
  (1..count).each do |i|
    callcc {|cc| consumer.call cc, i }
  end
  nil
end

def print_task()
  producer, i = callcc { |cc| return cc }
  print "#{i} "
  callcc { |cc| producer.call }
end

def count(limit)
  count_task(limit, print_task())
  print "\n"
end
~~~


~~~
# --------------------------------------------------------------------
# 주어진 숫자의 배수 필터링하기
# --------------------------------------------------------------------
# 소비자이면서 동시에 생산자인 필터를 만듭니다. 카운팅 작업과 인쇄 작업 사이에
# 삽입합니다.
#
# 사용법: omit(2, limit)

def filter_task(factor, consumer)
  producer, i = callcc { |cc| return cc }
  if (i%factor) != 0 then
    callcc { |cc| consumer.call cc, i }
  end
  producer.call
end

def omit(factor, limit)
  printer = print_task()
  filter = filter_task(factor, printer)
  count_task(limit, filter)
  print "\n"
end
~~~


~~~
# --------------------------------------------------------------------
# 소수 생성기
# --------------------------------------------------------------------
# 소수 생성기를 생성합니다. 새로운 소수가 발견되면
# 생산자와 소비자의 체인에 새로운 다중 필터를 동적으로 추가합니다.
#
# 사용법: primes(limit)

def prime_task(consumer)
  producer, i = callcc { |cc| return cc }
  if i >= 2 then
    callcc { |cc| consumer.call cc, i }
    consumer = filter_task(i, consumer)
  end
  producer.call
end

def primes(limit)
  printer = print_task()
  primes = prime_task(printer)
  count_task(limit, primes)
  print "\n"
end
~~~

[ruby-talk:4482]: https://blade.ruby-lang.org/ruby-talk/4482
