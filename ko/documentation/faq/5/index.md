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
    <strong>5</strong>
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
    <a href="../11/" title="파트 11">11</a>
  </div>
  <h1>공식 Ruby FAQ</h1>

---

{% include faq-notice.md %}

## 이터레이터

### 이터레이터란 무엇인가요?

이터레이터는 블록 또는 `Proc` 객체를 받는 메서드입니다. 소스 파일에서
블록은 메서드 호출 직후에 위치합니다. 이터레이터는 사용자 정의 제어
구조, 특히 루프를 생성하는 데 사용됩니다.

이터레이터가 어떻게 작동하는지 예시를 통해 살펴봅시다. 이터레이터는 다음과 같이
컬렉션의 각 요소에 대해 동일한 작업을 반복하는 데 자주 사용됩니다.

~~~
data = [1, 2, 3]
data.each do |i|
  puts i
end
~~~

결과:

~~~
1
2
3
~~~

배열 `data`의 each 메서드에는 `do ... end` 블록이 전달되어 반복적으로
실행됩니다. 호출할 때마다 블록은 배열의 요소를 차례로 전달받습니다.

블록을 정의할 때 `do ... end` 대신 `{ ... }`를 쓸 수 있습니다.

~~~
data = [1, 2, 3]
data.each { |i|
  puts i
}
~~~

결과:

~~~
1
2
3
~~~

이 코드는 앞의 예제와 동일한 의미를 갖습니다. 그러나 경우에 따라 우선순위
문제로 인해 `do ... end`와 `{ ... }`가 다르게 동작할 수 있습니다.

~~~
foobar a, b do ... end  # foobar가 이터레이터.
foobar a, b { ... }     # b가 이터레이터.
~~~

이는 `{ ... }`가 `do ... end` 블록보다 앞의 표현식에 더 강하게 바인딩되기
때문입니다. 첫 번째 예는 `foobar(a, b) do ... end`와 같고, 두 번째 예는
`foobar(a, b { ... })`와 같습니다.

### 블록을 이터레이터에 전달하려면 어떻게 해야 하나요?

이터레이터 호출 뒤에 블록을 배치하기만 하면 됩니다. `Proc`을 참조하는 변수나 상수
이름 앞에 `&`를 붙여 `Proc` 객체를 전달할 수도 있습니다.

### 블록은 이터레이터에서 어떻게 사용되나요?

{% include warnings/faq_out_of_date.html %}

이터레이터 메서드에서 블록을 실행하는 방법에는 세 가지가 있습니다.
(1) `yield` 제어 구조, (2) `call`을 사용하여 (블록으로 만든) `Proc` 인자를
호출하는 것, (3) `Proc.new`를 사용한 후 호출하는 것입니다.

`yield` 문은 블록을 호출하며, 하나 이상의 인수를 전달할 수 있습니다.

~~~
def my_iterator
  yield 1, 2
end

my_iterator {|a, b| puts a, b }
~~~

결과:

~~~
1
2
~~~

메서드 정의에 블록 인수가 있는 경우(마지막 형식 매개 변수 앞에 앰퍼샌드(`&`)가
붙은 경우) `Proc` 객체로 변환된 첨부된 블록을 받습니다. 이것은
`proc.call(args)`을 사용하여 호출할 수 있습니다.

~~~
def my_iterator(&b)
  b.call(1, 2)
end

my_iterator {|a, b| puts a, b }
~~~

결과:

~~~
1
2
~~~

이터레이터 정의에서 `Proc.new`(또는 동치인 `proc`, `lambda` 호출)를 사용하면
메서드에 주어진 블록을 인수로 받아 프로시저 객체를 생성합니다. (`proc`과
`lambda`는 사실상 동의어입니다.)

_[업데이트 필요: `lambda`는 약간 다른 방식으로 작동하며, 블록 없이 Proc 객체를
생성하려고 시도했습니다(`tried to create Proc object without a block`)라는
경고가 표시됩니다.]_

~~~
def my_iterator
  Proc.new.call(3, 4)
  proc.call(5, 6)
  lambda.call(7, 8)
end

my_iterator {|a, b| puts a, b }
~~~

결과:

~~~
3
4
5
6
7
8
~~~

놀랍게도 `Proc.new`와 친구들은 메서드에 연결된 블록을 전혀 소비하지 않으며,
`Proc.new`를 호출할 때마다 동일한 블록에서 새 프로시저 객체를 생성합니다.

메서드에 연관된 블록이 있는지 여부는 `block_given?`을 호출하여 확인할 수
있습니다.

### 블록이 없는 `Proc.new`는 어떤 기능을 하나요?

블록이 없는 `Proc.new`는 프로시저 객체를 생성할 수 없으며 오류가 발생합니다.
그러나 메서드 정의에서 블록이 없는 `Proc.new`는 메서드가 호출될 때 블록이
존재한다는 것을 의미하므로 오류가 발생하지 않습니다.

### 이터레이터를 병렬로 실행하려면 어떻게 해야 하나요?

여기 [\[ruby-talk:5252\]][ruby-talk:5252]에서 Matz가 스레드를 사용하는 해결책을
가져왔습니다.

~~~
require "thread"

def combine(*iterators)
  queues = []
  threads = []

  iterators.each do |it|
    queue = SizedQueue.new(1)
    th = Thread.new(it, queue) do |i, q|
           send(i) {|x| q << x }
         end
    queues  << queue
    threads << th
  end

  loop do
    ary = []
    queues.each {|q| ary << q.pop }
    yield ary

    iterators.size.times do |i|
      return if !threads[i].status && queues[i].empty?
    end
  end
end

def it1
  yield 1; yield 2; yield 3
end

def it2
  yield 4; yield 5; yield 6
end

combine(:it1, :it2) do |x|
  # x is [1, 4], then [2, 5], then [3, 6]
end
~~~

[ruby-talk:5252]: https://blade.ruby-lang.org/ruby-talk/5252
