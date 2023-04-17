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
    <strong>6</strong>
    <span class="separator"> | </span>
    <a href="../7/" title="파트 7">7</a>
    <span class="separator"> | </span>
    <a href="../8/" title="파트 8">8</a>
    <span class="separator"> | </span>
    <a href="../9/" title="파트 9">9</a>
    <span class="separator"> | </span>
    <a href="../10/" title="파트 10">10</a>
    <span class="separator"> | </span>
    <a href="/en/documentation/faq/11/" title="파트 11">11</a>
  </div>
  <h1>공식 Ruby FAQ</h1>

---

{% include faq-notice.md %}

## 구문

### 즉시 값(immediate value)과 참조의 차이점은 무엇인가요?
{: #immediate}

{% include faq-out-of-date.html %}

`Fixnum`, `true`, `nil`, `false`는 즉시 값으로 구현되어 있습니다. 즉시
값을 사용하면 변수는 객체에 대한 참조가 아니라 객체 자체를 보유합니다.

이러한 객체에는 싱글턴 메서드를 정의할 수 없습니다. 동일한 값을 가진 두 개의
`Fixnum`은 항상 동일한 객체 인스턴스를 나타내므로, (예를 들어) 값이
`1`인 `Fixnum`에 대한 인스턴스 변수는 시스템의 모든 `1`에 공유됩니다. 따라서
이 중 하나에 대해서만 싱글톤 메서드를 정의하는 것은 불가능합니다.

### `nil`과 `false`의 차이점은 무엇인가요?

먼저 유사성부터 설명하겠습니다. `nil`과 `false`는 불 컨텍스트에서 `false`로
평가되는 유일한 두 개의 객체입니다.
(즉, 이 둘은 유일한 "falsy" 값이며 다른 모든 객체는 "truthy"입니다.)

그러나 `nil`과 `false`는 서로 다른 클래스(`NilClass`와 `FalseClass`)의
인스턴스이며, 다른 곳에서는 다른 동작을 합니다.

술어(predicate) 메서드(이름이 물음표로 끝나는 메서드)는 `true` 또는 `false`를
반환하는 것이 좋습니다. 실패를 표시해야 하는 다른 메서드는 `nil`을 반환하는
것이 좋습니다.

### 빈 문자열이 `false`가 아닌 이유는 무엇인가요?

Q: 조건 표현식에서 빈 문자열(`""`)이 `true`를 반환하던데요! Perl에서는
`false`였는데...

A: 하지만 Ruby는 Perl이 아닙니다. ;-) Ruby에서는 조건부 컨텍스트에서
`nil`과 `false`만 거짓입니다.

`empty?`를 사용하거나, 문자열을 `""`와 비교하거나, 문자열의 `size`, `length`를
`0`과 비교하여 문자열이 비어 있는지 확인할 수 있습니다.

### `:name`은 무엇을 의미하나요?

이름 뒤에 콜론을 붙이면 식별자와 일대일로 대응하는 심볼 객체가 생성됩니다.
프로그램이 실행되는 동안 주어진 이름이나 문자열에 대해 동일한 심볼 객체가
생성됩니다. 심볼은 `"name".intern` 또는 `"name".to_sym`으로 생성할 수도
있습니다.

심볼 객체는 메서드, 변수 등에 대한 식별자를 나타낼 수 있습니다.
`define_method`, `method_missing`, `trace_var`와 같은 일부 메서드에는 심볼이
필요합니다. 다른 메서드(예: `attr_accessor`, `send`, `autoload`)는
문자열도 허용합니다.

심볼은 한 번만 생성되기 때문에 해시 키로 자주 사용됩니다. 문자열 해시 키는
매번 사용할 때마다 새 객체를 생성하므로 약간의 메모리 오버헤드가 발생합니다.
심볼 해시 키를 위한 특별한 구문도 있습니다.

~~~
person_1 = { :name => "John", :age => 42 }
person_2 = { name: "Jane", age: 24 }        # 대안 문법
~~~

심볼을 열거형 값으로 사용하거나 상수에 고유한 값을 할당하는 데에도 사용할 수
있습니다.

~~~
status = :open  # :closed, ...

NORTH = :NORTH
SOUTH = :SOUTH
~~~

### 심볼의 값에 액세스하려면 어떻게 해야 하나요?

심볼에 해당하는 변수의 값을 얻으려면 `symbol.to_s` 또는 `"#{symbol}"`을
사용하여 변수 이름을 얻은 다음 심볼의 스코프에서 이를 평가하여 변수의 내용을
얻을 수 있습니다.

~~~
a = "This is the content of `a'"
b = eval("#{:a}")
a.object_id == b.object_id  # => true
~~~

다음을 사용할 수도 있습니다.

~~~
b = binding.local_variable_get(:a)
~~~

심볼이 메서드의 이름인 경우 `send`를 사용할 수 있습니다.

~~~
class Demo
  def hello
    "Hello, world"
  end
end

demo = Demo.new
demo.send(:hello)
~~~

또는 `Object#method`를 사용하여 해당 `Method` 객체를 반환하게 한 다음 호출할
수 있습니다.

~~~
m = demo.method(:hello)  # => #<Method: Demo#hello>
m.call                   # => "Hello, world"
~~~

### `loop`는 제어 구조인가요?

`loop`는 제어 구조체처럼 보이지만 실제로는 `Kernel`에 정의된 메서드입니다.
loop 뒤에 오는 블록은 지역 변수에 대한 새로운 스코프를 만듭니다.

### Ruby에는 사후 테스트(post-test) 루프가 없습니다.

Q: Ruby에는 `do { ... } while` 구문이 없는데 마지막에 조건을 테스트하는
루프를 어떻게 구현하나요?

Clemens Hintze의 답변: Ruby의 `begin ... end`와 `while`, `until` 문
수정자를 조합하여 동일한 효과를 얻을 수 있습니다.

~~~
i = 0
begin
  puts "i = #{i}"
  i += 1
end until i > 4
~~~

결과:

~~~
i = 0
i = 1
i = 2
i = 3
i = 4
~~~

### `p {}`의 경우처럼 해시 리터럴을 메서드에 전달할 수 없는 이유는 무엇인가요?

`{}`는 `Hash` 생성자가 아닌 블록으로 파싱됩니다. `p({})`처럼 매개변수라는
사실을 명시하면 `{}`가 표현식으로 처리되도록 할 수 있습니다.

### `def pos=(val)`가 작동하지 않습니다!

다음과 같은 코드가 있지만 `pos = 1` 메서드를 사용할 수 없습니다.

~~~
def pos=(val)
  @pos = val
  puts @pos
end
~~~

`=`가 뒤에 붙은 메서드는 명시적 수신자와 함께 호출해야 합니다(수신자
가 없으면 지역 변수에 할당하는 것뿐입니다). `self.pos = 1`로
호출하세요.

### `'\1'`과 `'\\1'`의 차이점은 무엇인가요?

이들은 동일한 의미를 갖습니다. 작은따옴표로 묶인 문자열에서는 `\'`와 `\\`만
변환되고 다른 조합은 변경되지 않습니다.

그러나 큰따옴표로 묶인 문자열에서 `"\1"`은 바이트 `\001`(8진수
비트 패턴)이고, `"\\1"`은 백슬래시와 문자 `"1"`이 포함된 두 문자로 된
문자열입니다.

### `..`와 `...`의 차이점은 무엇인가요?

`..`는 범위의 오른쪽 항을 포함하지만 `...`는 포함하지 않습니다.

~~~
(5..8).to_a   # => [5, 6, 7, 8]
(5...8).to_a  # => [5, 6, 7]
~~~

### `or`와 `||`의 차이점은 무엇인가요?

Q: `p(nil || "Hello")`는 `"Hello"`를 출력하지만 `p(nil or "Hello")`는
구문 분석 오류를 발생시킵니다. 왜 그럴까요?

A: `or`의 우선순위가 너무 낮기 때문입니다, `p( (nil or "Hello") )`는
작동합니다.

`or`의 우선 순위는 `=`보다 낮지만 `||`의 우선 순위는 더 높습니다.

~~~
foo = nil || "Hello"  # foo = (nil || "Hello") 로 해석
foo  # => "Hello"

# 하지만 놀랍게도

foo = nil or "Hello"  # (foo = nil) or "Hello" 로 해석
foo  # => nil
~~~

`or`(및 유사하게 `and`)는 불 표현식을 결합하는 데 사용하는 것이 **아니라**
다음과 같은 제어 흐름에 사용하는 것이 가장 좋습니다.

~~~
do_something  or raise "some error!"
~~~

여기서 `do_something`은 오류가 발생하면 `false` 또는 `nil`을 반환합니다.

### Ruby에도 함수 포인터가 있나요?

`Proc.new`, `proc`, `lambda`에 의해 생성된 `Proc` 객체는 변수에서 참조할 수
있으므로 해당 변수는 함수 포인터라고 할 수 있습니다. 또한 특정 객체 인스턴스
내의 메서드에 대한 참조는 `object.method`를 사용하여 얻을 수 있습니다.

### `load`와 `require`의 차이점은 무엇인가요?

`load`는 Ruby 프로그램(`*.rb`)을 불러오고 실행합니다.

`require`는 Ruby 프로그램도 불러오지만 바이너리 Ruby 확장 모듈(공유 라이브러리
또는 DLL)도 불러옵니다. 거기에 더해 `require`는 기능을 두 번 이상 불러오지
않도록 합니다.

### Ruby에는 예외 처리가 있나요?

Ruby는 유연한 예외 처리 체계를 지원합니다.

~~~
begin
  statements which may raise exceptions
rescue [exception class names]
  statements when an exception occurred
rescue [exception class names]
  statements when an exception occurred
ensure
  statements that will always run
end
~~~

`begin` 절에서 예외가 발생하면 일치하는 예외 이름을 가진 `rescue` 절이
실행됩니다. `ensure` 절은 예외 발생 여부에 관계없이 실행됩니다. `rescue` 및
`ensure` 절은 생략할 수 있습니다.

`rescue` 절에 대해 예외 클래스가 지정되지 않은 경우 묵시적으로 `StandardError`
예외를 가리키며, `StandardError`와 `is_a?` 관계에 있는 예외가 캡처됩니다.

이 표현식은 `begin` 절의 값을 반환합니다.

가장 최근의 예외는 전역 변수 `$!`을 통해 액세스가 가능합니다(따라서 `$!.type`을
사용하여 유형을 확인할 수 있습니다).
