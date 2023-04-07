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
    <strong>4</strong>
    <span class="separator"> | </span>
    <a href="/en/documentation/faq/5/" title="파트 5">5</a>
    <span class="separator"> | </span>
    <a href="/en/documentation/faq/6/" title="파트 6">6</a>
    <span class="separator"> | </span>
    <a href="/en/documentation/faq/7/" title="파트 7">7</a>
    <span class="separator"> | </span>
    <a href="/en/documentation/faq/8/" title="파트 8">8</a>
    <span class="separator"> | </span>
    <a href="/en/documentation/faq/9/" title="파트 9">9</a>
    <span class="separator"> | </span>
    <a href="/en/documentation/faq/10/" title="파트 10">10</a>
    <span class="separator"> | </span>
    <a href="/en/documentation/faq/11/" title="파트 11">11</a>
  </div>
  <h1>공식 Ruby FAQ</h1>

---

{% include faq-notice.md %}

## 변수, 상수, 인수

### 대입하면 객체의 새 복사본이 생성되나요?
{: #assignment}

모든 변수와 상수는 어떤 객체를 참조(가리킴)합니다. (초기화되지 않은 로컬 변수는
예외입니다. 이 경우 아무것도 참조하지 않습니다. 사용하면 `NameError` 예외가
발생합니다) 변수에 대입하거나 상수를 초기화할 때 변수 또는 상수가 참조하는
객체를 설정합니다.

따라서 대입 자체만으로는 객체의 새 복사본이 생성되지 않습니다.

특수한 경우에 대해 더 자세히 설명해 보겠습니다. `Fixnum`, `NilClass`,
`TrueClass`, `FalseClass`의 인스턴스는 변수나 상수에 직접 포함되며 참조가 사용되지
않습니다. 숫자 `42` 또는 상수 `true`를 보유한 변수는 실제로 값을 보유하는
것이지 참조를 보유하는 것이 아닙니다. 따라서 대입은 물리적으로 이러한
유형의 객체의 복사본을 생성합니다. 이에 대해서는
[즉시 객체와 참조 객체](/en/documentation/faq/6/#immediate)에서 자세히 설명합니다.


### 지역 변수의 스코프는 무엇인가요?

지역 변수에 대한 새로운 스코프는 (1) 최상위 수준(메인), (2) 클래스(또는 모듈)
정의, (3) 메서드 정의에 적용됩니다.

~~~
var = 1         # (1)
class Demo
  var = 2       # (2)
  def method
    var = 3     # (3)
    puts "in method: var = #{var}"
  end
  puts "in class: var = #{var}"
end
puts "at top level: var = #{var}"
Demo.new.method
~~~

결과:

~~~
in class: var = 2
at top level: var = 1
in method: var = 3
~~~

(주의: 클래스 정의는 실행 가능한 코드이므로 클래스가 정의될 때 정의에 포함된
추적 메시지가 기록됩니다.)

블록(`{ ... }`나 `do ... end`)은 거의 새로운 스코프를 도입합니다 ;-)
블록 내에서 생성된 지역 변수는 블록 외부에서 액세스할 수 없습니다.
그러나 블록 내의 지역 변수가 호출자 스코프의 기존 지역 변수와 이름이 같으면
새 지역 변수가 생성되지 않으며, 이후 블록 외부에서 해당 변수에 액세스할 수 있습니다.

~~~
a = 0
1.upto(3) do |i|
  a += i
  b = i*i
end
a  # => 6
# b is not defined here
~~~

이는 스레드를 사용할 때 중요해지는데, 각 스레드는 스레드 블록 내의
지역 변수의 자체 복사본을 받습니다.

~~~
threads = []

["one", "two"].each do |name|
  threads << Thread.new do
    local_name = name
    a = 0
    3.times do |i|
      Thread.pass
      a += i
      puts "#{local_name}: #{a}"
    end
  end
end

threads.each {|t| t.join }
~~~

다음 결과가 나올 수 있습니다. (스케줄러가 `Thread.pass`에 의해 힌트를 받은 대로
스레드를 전환하는 경우입니다. 이는 OS 및 프로세서에 따라 달라집니다)

~~~
one: 0
two: 0
one: 1
two: 1
one: 3
two: 3
~~~

`while`, `until`, `for`는 블록이 아닌 제어 구조이므로 그 안에 있는
지역 변수는 바깥 환경에서 액세스할 수 있습니다. 그러나 `loop`는 메서드이며
관련 블록은 새로운 스코프를 도입합니다.

### 지역 변수는 언제 액세스할 수 있나요?

사실 이 질문은 이렇게 묻는 것이 더 나을 수 있습니다. "Ruby는 어느 시점에서
어떤 것이 변수라는 것을 알아내는가?" 문제는 단순한 표현식 'a'가 변수일 수도
있고 매개변수가 없는 메서드에 대한 호출일 수도 있기 때문에 발생합니다.
어떤 경우인지 판단하기 위해 Ruby는 대입문을 찾습니다.
소스에서 `a`를 사용하기 전 어느 지점에서 `a`가 대입되는 것을 확인하면 `a`를
변수로 구문 분석하고, 그렇지 않으면 메서드로 처리하기로 결정합니다.
다소 병적인 사례로 Clemens Hintze가 만든 이 코드 조각을 살펴 보세요.


~~~
def a
  puts "method `a' called"

  99
end

[1, 2].each do |i|
  if i == 2
    puts "a = #{a}"
  else
    a = 1
    puts "a = #{a}"
  end
end
~~~

결과:

~~~
a = 1
method `a' called
a = 99
~~~

구문 분석 중에 Ruby는 첫 번째 `puts` 문에서 `a`가 사용된 것을 보고 `a`에
대한 할당을 아직 보지 못했기 때문에 메서드 호출이라고 가정합니다. 하지만 두 번째
`puts` 문에 도달하면 대입이 확인되었으므로 `a`를 변수로 취급합니다.

주의: 대입은 실행될 필요가 없으며 Ruby가 확인만 하면 됩니다. 이 프로그램은 오류를
발생시키지 않습니다.

~~~
a = 1 if false; a  # => nil
~~~

변수와 관련된 이 문제는 일반적으로 문제가 되지 않습니다. 이 문제가 발생하면
변수에 대한 첫 번째 액세스 전에 `a = nil`과 같은 대입을 시도해 보세요. 이렇게
하면 이후에 루프에 나타나는 지역 변수에 대한 액세스 시간이 빨라지는 추가적인
이점이 있습니다.

### 상수의 스코프는 무엇인가요?

클래스 또는 모듈 정의에 정의된 상수는 해당 클래스 또는 모듈의 정의 내에서
직접 액세스할 수 있습니다.

중첩된 클래스 및 모듈 내에서 외부 클래스 및 모듈의 상수에 직접 액세스할
수 있습니다.

슈퍼클래스와 포함된 모듈의 상수에 직접 액세스할 수도 있습니다.

이러한 경우 외에도 `::` 연산자, `ModuleName::CONST1` 또는 `ClassName::CONST2`를
사용하여 클래스 및 모듈 상수에 액세스할 수 있습니다.

### 인수는 어떻게 전달되나요?

실제 인수는 메서드가 호출될 때 형식 인수에 대입됩니다.
(대입의 의미에 대한 자세한 내용은 [대입](#assignment)을 참조하세요.)

~~~
def add_one(number)
  number += 1
end

a = 1
add_one(a)  # => 2
a           # => 1
~~~

객체 참조를 전달하기 때문에, 메서드가 전달된 변경 가능한 객체의 내용을 수정할 수
있습니다.

~~~
def downer(string)
  string.downcase!
end

a = "HELLO"  # => "HELLO"
downer(a)    # => "hello"
a            # => "hello"
~~~

다른 언어의 참조에 의한 전달과 다릅니다.

### 형식 인수에 대한 대입이 실제 인수에 영향을 주나요?

형식 인수는 지역 변수입니다. 메서드 내에서 형식 인수에 대입하면 단순히 인수가
다른 객체를 참조하도록 변경됩니다.

### 형식 인수를 통해 메서드를 호출하면 어떻게 되나요?

모든 Ruby 변수(메서드 인수 포함)는 객체에 대한 참조로 작동합니다. 이러한
객체에서 메서드를 호출하여 객체의 상태를 가져오거나 변경하고 객체가 어떤 작업을
수행하도록 할 수 있습니다. 메서드에 전달된 객체로 이 작업을 수행할 수 있습니다.
이러한 종류의 부작용으로 인해 프로그램을 따라가기 어려울 수 있으므로
이 작업을 수행할 때 주의해야 합니다.

### 인수 앞에 `*`가 붙으면 무슨 뜻인가요?

별표를 형식 매개변수 목록의 일부로 사용하면 인수를 배열로 모으고 별표가
표시된 매개변수에 해당 배열을 할당하여 메서드에 임의의 수의 인수를 전달
할 수 있습니다.

~~~
def foo(prefix, *all)
  all.each do |element|
    puts "#{prefix}#{element}"
  end
end

foo("val = ", 1, 2, 3)
~~~

결과:

~~~
val = 1
val = 2
val = 3
~~~

메서드 호출에 사용될 때 `*`는 배열을 확장하여 개별 요소를 인수로 전달합니다.

~~~
a = [1, 2, 3]
foo(*a)
~~~

다음의 경우 마지막 인수 앞에 `*`를 붙일 수 있습니다.

1. 다중 대입의 좌항
2. 다중 대입의 우항
3. 메서드 형식 인수의 정의
4. 메서드 호출의 실제 인수
5. `case` 구조의 `when` 절


예시:

~~~
x, *y = [7, 8, 9]
x                  # => 7
y                  # => [8, 9]
x,    = [7, 8, 9]
x                  # => 7
x     = [7, 8, 9]
x                  # => [7, 8, 9]
~~~

### 인수 앞에 `&`가 붙으면 무슨 뜻인가요?

메서드의 마지막 형식 인자 앞에 앰퍼샌드(`&`)가 붙으면 메서드 호출 뒤에 오는
블록이 `Proc` 객체로 변환되어 형식 매개변수에 할당됩니다.

메서드 호출의 마지막 실제 인수가 `Proc` 객체인 경우, 이름 앞에 앰퍼샌드를
붙여 블록으로 변환할 수 있습니다. 그런 다음 메서드는 `yield`를 사용하여 호출할
수 있습니다.

~~~
def meth1(&b)
  puts b.call(9)
end

meth1 {|i| i + i }

def meth2
  puts yield(8)
end

square = proc {|i| i * i }

meth2 {|i| i + i }
meth2 &square
~~~

결과:

~~~
18
16
64
~~~

### 형식 인수의 기본값을 지정하려면 어떻게 해야 하나요?

~~~
def greet(p1="hello", p2="world")
  puts "#{p1} #{p2}"
end

greet
greet("hi")
greet("morning", "mom")
~~~

결과:

~~~
hello world
hi world
morning mom
~~~

메서드가 호출될 때 기본값(임의의 표현식일 수 있음)이 평가됩니다. 기본값은
메서드의 스코프를 사용하여 평가됩니다.

### 블록에 인수를 전달하려면 어떻게 하나요?

블록의 형식 매개변수는 블록 시작 부분의 세로 막대 사이에 표시됩니다.

~~~
proc {|a, b| a <=> b }
~~~

이러한 매개변수는 실제로 지역 변수입니다. 블록이 실행될 때 같은 이름의 기존
지역 변수가 존재하면, 블록 호출에 의해 해당 변수가 수정됩니다. 이는 좋을 수도
나쁠 수도 있습니다.

일반적으로 인수는 `yield`(또는 `yield`를 호출하는 이터레이터)를 사용하거나
`Proc.call` 메서드를 사용하여 블록에 전달됩니다.

### 내 객체가 예기치 않게 변경된 이유는 무엇인가요?

~~~
A = a = b = "abc"
b.concat("d")  # => "abcd"
a              # => "abcd"
A              # => "abcd"
~~~

변수는 객체에 대한 참조를 보유합니다. `A = a = b = "abc"` 할당은 문자열
`"abc"`에 대한 참조를 `A`, `a`, `b`에 넣습니다.

`b.concat("d")`를 호출하면 해당 객체에 대해 concat 메서드를 호출하여
`"abc"`에서 `"abcd"`로 변경합니다. `a`와 `A`도 동일한 객체를 참조하기 때문에 겉보기
값도 변경됩니다.

이는 실제로 발생할 수 있는 문제에 비하면 작은 것입니다.

또한 모든 객체는 동결(frozen)하여 변경되지 않도록 보호할 수 있습니다.

### 상수의 값이 변경되긴 하는 건가요?

상수는 이름이 대문자로 시작하는 변수입니다. 상수는 인스턴스 메서드 내에서
새로 대입할 수 없지만, 그 외에는 마음대로 변경할 수 있습니다.
상수에 새 값이 대입되면 경고가 표시됩니다.

### 별도의 파일에서 변수를 로드할 수 없는 이유는 무엇인가요?

`file1.rb`에 다음이 포함되어 있다고 가정합시다.

~~~
var1 = 99
~~~

그리고 다른 파일에서 로드합니다.

~~~
require_relative "file1"
puts var1
~~~

결과:

~~~
prog.rb:2:in `<main>': undefined local variable or method `var1' for main:Object (NameError)
~~~

`load` 및 `require`는 지역 변수를 별도의 익명 네임스페이스에 저장하도록 정렬하여
효과적으로 지역 변수를 제거하기 때문에 오류가 발생합니다. 이는 코드가
오염되지 않도록 보호하기 위한 설계입니다.
