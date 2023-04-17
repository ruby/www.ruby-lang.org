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
    <strong>7</strong>
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

## 메서드

### Ruby는 어떤 메서드를 호출할지 어떻게 선택하나요?

Ruby는 모든 메시지를 메서드에 동적으로 바인딩합니다. 먼저 수신자의 싱글톤
메서드를 검색한 다음, 수신자의 자체 클래스에 정의된 메서드를 검색하고
마지막으로 수신자의 수퍼클래스(혼합되었을 수 있는 모듈 포함)에 정의된 메서드를
검색합니다. `ClassName`의 조상 클래스와 모듈을 표시하는 `ClassName.ancestors`로
검색 순서를 확인할 수 있습니다.

대체 메서드를 검색한 후에도 일치하는 메서드를 찾을 수 없는 경우, Ruby는
동일한 검색 절차를 반복하여 `method_missing`이라는 메서드를 호출하여 메서드를
찾으려고 시도합니다. 이를 통해 알 수 없는 메서드에 대한 메시지를 처리할
수 있으며 클래스에 동적 인터페이스를 제공하는 데 자주 사용됩니다.

~~~
module Emphasizable
  def emphasize
    "**#{self}**"
  end
end

class String
  include Emphasizable
end

String.ancestors
  # => [String, Emphasizable, Comparable, Object, Kernel, BasicObject]

"Wow!".emphasize  # => "**Wow!**"
~~~

`emphasize` 메서드를 찾을 때 `String` 클래스에서 찾을 수 없으므로 Ruby는
다음에 `Emphasizable` 모듈에서 찾습니다.

수신자의 클래스에 이미 존재하는 메서드(예: `String#capitalize`)를 재정의하려면
`prepend`를 사용하여 해당 클래스 앞의 조상 체인에 모듈을 삽입해야 합니다.

~~~
module PrettyCapitalize
  def capitalize
    "**#{super}**"
  end
end

class String
  prepend PrettyCapitalize
end

String.ancestors
  # => [PrettyCapitalize, String, Comparable, Object, Kernel, BasicObject]

"hello".capitalize  # => "**Hello**"
~~~

### ', `-`, `*`, ...등은 연산자인가요?

`+`, `-` 등은 연산자가 아니라 메서드 호출입니다.
따라서 새로운 정의로 인해 과부하가 걸릴 수 있습니다.

~~~
class MyString < String
  def -(other)
    self[0...other.size]  # self를 other의 크기로 자름
  end
end
~~~

그러나 다음은 메서드가 아닌 기본 제공 제어 구조로, 재정의할 수 없습니다.

~~~
=, .., ..., not, ||, &&, and, or, ::
~~~

단항(unary) `+`, `-` 연산자를 오버로드하거나 정의하려면 메서드
이름으로 `+@`, `-@`을 사용해야 합니다.

`=`는 객체의 속성을 설정하는 메서드를 정의하는 데 사용됩니다.

~~~
class Test
  def attribute=(val)
    @attribute = val
  end
end

t = Test.new
t.attribute = 1
~~~

`+`, `-`와 같은 연산자가 정의되어 있으면 Ruby는 자체 할당 형식(`+=`, `-=` 등)을
자동으로 처리합니다.

### `++`와 `--`는 없나요?

Ruby에는 자동 증가 및 자동 감소 연산자가 없습니다.
대신 `+= 1`과 `-= 1`을 사용할 수 있습니다.

### 싱글톤 메서드란 무엇인가요?
{: #singleton-method}

싱글톤 메서드는 하나의 특정 객체와 연관된 인스턴스 메서드입니다.

정의에 객체를 포함시켜 싱글톤 메서드를 생성합니다.

~~~
class Foo; end

foo = Foo.new
bar = Foo.new

def foo.hello
  puts "Hello"
end

foo.hello
bar.hello
~~~

결과:

~~~
Hello
prog.rb:11:in `<main>': undefined method `hello' for #<Foo:0x000000010f5a40> (NoMethodError)
~~~

싱글톤 메서드는 객체에 메서드를 추가하고 싶지만 새 서브클래스를 만드는 것이
적절하지 않을 때 유용합니다.

### 객체들은 됐고 Ruby에 간단한 함수는 없나요?

예인 동시에 아니요입니다. Ruby에는 C나 Perl과 같은 언어의 함수처럼 보이는
메서드가 있습니다.

~~~
def hello(name)
  puts "Hello, #{name}!"
end

hello("World")
~~~

결과:

~~~
Hello, World!
~~~

그러나 실제로는 수신자가 생략된 메서드 호출입니다. 이 경우 Ruby는
수신자가 자신(self)이라고 가정합니다.

따라서 `hello`는 함수처럼 보이지만 실제로는 `Object` 클래스에 속하는 메서드이며
숨겨진 수신자 자신에게 메시지로 전송됩니다. Ruby는 순수한 객체 지향 언어입니다.

물론 이러한 메서드를 함수처럼 사용할 수 있습니다.

### 그렇다면 이러한 함수 비슷한 메서드들은 모두 어디에서 온 것일까요?

Ruby의 거의 모든 클래스는 `Object` 클래스에서 파생됩니다. `Object` 클래스의
정의는 `Kernel` 모듈에 정의된 메서드에 섞여 있습니다. 따라서 이러한 메서드는
시스템의 모든 객체에서 사용할 수 있습니다.

클래스가 없는 간단한 Ruby 프로그램을 작성한다 하더라도 실제로는 `Object`
클래스 안에서 작업하는 것이 됩니다.

### 객체의 인스턴스 변수에 액세스할 수 있나요?

객체의 인스턴스 변수(`@`로 시작하는 변수)는 객체 외부에서 직접 액세스할 수
없습니다. 이는 좋은 캡슐화를 촉진합니다. 하지만 Ruby에서는 클래스 사용자가
인스턴스 변수를 어트리뷰트처럼 취급할 수 있도록 이러한 인스턴스 변수에 대한
접근자를 쉽게 정의할 수 있습니다. `attr_reader`, `attr_writer`,
`attr_accessor` 중에 사용하기만 하면 됩니다.

~~~
class Person
  attr_reader   :name           # 쓰기 전용
  attr_accessor :wearing_a_hat  # 읽기/쓰기

  def initialize(name)
    @name = name
  end
end

p = Person.new("Dave")
p.name           # => "Dave"
p.wearing_a_hat  # => nil
p.wearing_a_hat = true
p.wearing_a_hat  # => true
~~~

유효성 검사를 수행하거나 파생된 속성을 처리하기 위해 자신만의 접근자 함수를
정의할 수도 있습니다. 읽기 접근자는 매개변수를 받지 않는 메서드이고, 할당
접근자는 단일 매개변수를 받는 `=`로 끝나는 메서드 이름입니다. 메서드 정의에서
메서드 이름과 `=` 사이에 공백이 없어도 되지만, 메서드를 호출할 때 공백을
삽입하여 다른 할당처럼 보이게 만들 수 있습니다. `+` 또는 `-` 메서드가
정의되어 있는 한 `+=` 및 `-=`와 같은 자체 대입을 사용할 수도 있습니다.

### `private`와 `protected`의 차이점은 무엇인가요?

가시성 키워드 'private'은 명시적 수신자 없이 함수 형식으로만 메서드를 호출할
수 있게 하므로 수신자로 'self'만 가질 수 있습니다. private 메서드는 메서드가
정의된 클래스 또는 그 서브클래스 내에서만 호출할 수 있습니다.

~~~
class Test
  def foo
    99
  end

  def test(other)
    p foo
    p other.foo
  end
end

t1 = Test.new
t2 = Test.new

t1.test(t2)

# Now make `foo' private

class Test
  private :foo
end

t1.test(t2)
~~~

결과:

~~~
99
99
99
prog.rb:8:in `test': private method `foo' called for #<Test:0x00000000b57a48> (NoMethodError)
        from prog.rb:23:in `<main>'
~~~

protected 메서드는 자체 클래스 또는 그 하위 클래스 내에서만 호출할 수 있지만
함수 형식과 수신자를 사용하여 모두 호출할 수 있습니다. 다음 예를 보시죠.


~~~
def <=>(other)
  age <=> other.age
end
~~~

`age`가 protected 메서드인 경우 컴파일되지만 private이면 컴파일되지 않습니다.

이러한 기능을 통해 클래스 내부에 대한 접근을 제어할 수 있습니다.

### 메서드의 가시성을 변경하려면 어떻게 해야 하나요?

`private`, `protected`, `public`를 사용하여 메서드의 표시 여부를 변경합니다.
클래스 정의 중에 매개변수 없이 사용하면 후속 메서드의 표시 여부에 영향을
줍니다. 매개변수와 함께 사용하면 명명된 메서드의 가시성을 변경합니다.

~~~
class Foo
  def test
    puts "hello"
  end
  private :test
end

foo = Foo.new
foo.test
~~~

결과:

~~~
prog.rb:9:in `<main>': private method `test' called for #<Foo:0x0000000284dda0> (NoMethodError)
~~~

`private_class_method`를 사용하여 클래스 메서드를 private로 설정할 수 있습니다.

~~~
class Foo
  def self.test
    puts "hello"
  end
  private_class_method :test
end

Foo.test
~~~

결과:

~~~
prog.rb:8:in `<main>': private method `test' called for Foo:Class (NoMethodError)
~~~

클래스에 정의된 메서드의 기본 가시성은 public입니다만 인스턴스 초기화
메서드인 `initialize`는 예외입니다.

최상위 수준에서 정의된 메서드도 기본적으로 public이 됩니다.

### 대문자로 시작하는 식별자가 메서드 이름이 될 수 있나요?

예, 할 수 있지만 쉽게 하지는 않습니다! 대문자로 된 이름 뒤에 공백이 있는 경우
Ruby는 (문맥에 따라) 메서드 이름이 아니라 상수라고 간주할 수 있습니다. 따라서
대문자로 된 메서드 이름을 사용하는 경우 항상 매개변수 목록을 괄호 안에 넣고
공백 없이 메서드 이름 옆에 괄호를 넣는 것을 잊지 마세요.
(이 마지막 제안은 어쨌든 좋은 생각입니다!)


### `super`를 호출하면 `ArgumentError`가 발생합니다.

메서드에 매개변수 없이 `super`를 호출하면 해당 메서드의 모든 인수가
수퍼클래스에 있는 같은 이름의 메서드로 전달됩니다. 원래 메서드의 인자 수가 상위
메서드의 인자 수와 일치하지 않으면 `ArgumentError`가 발생합니다. 이 문제를
해결하려면 `super`를 호출하고 적절한 수의 인수를 전달하면 됩니다.

### 같은 이름의 메서드를 두 단계 위로 호출하려면 어떻게 해야 하나요?

`super`는 같은 이름의 메서드를 한 단계 위로 호출합니다. 더 먼 조상에 있는
메서드를 오버로드하는 경우 메서드 정의로 마스킹하기 전에 `alias`를 사용하여
새 이름을 지정합니다. 그런 다음 해당 별칭을 사용하여 호출할 수 있습니다.

### 내장 메서드를 재정의한 후 원래 메서드를 호출하려면 어떻게 해야 하나요?

메서드 정의 내에서 `super`를 사용할 수 있습니다. `alias`을 사용하여 다른 이름을
지정할 수도 있습니다. 마지막으로, 원래 메서드를 `Kernel`의 싱글톤 메서드로
호출할 수 있습니다.

### 파괴적 메서드란 무엇인가요?
{: #destructive-method}

파괴적인 메서드는 객체의 상태를 변경하는 메서드입니다. `String`, `Array`,
`Hash` 등이 이러한 메서드를 가지고 있습니다. 메서드에는 보통 두 가지 버전이
있는데, 하나는 일반 이름이고 다른 하나는 이름은 같지만 뒤에 `!`가 붙는
버전입니다. 일반 버전은 수신자의 복사본을 생성하고 이를 변경한 후 복사본을
반환합니다. "뱅" 버전(`!` 포함)은 수신자를 제자리에서 수정합니다.

그러나 할당 메서드(`name=`), 배열 할당(`[]=`), `Array.delete`와 같은 메서드를
포함하여 `!`가 없는 파괴적인 메서드가 상당히 많다는 점에 유의하세요.

### 파괴적인 메서드가 위험할 수 있는 이유는 무엇인가요?

대부분의 경우 할당은 객체 참조를 복사할 뿐이며, 매개변수 전달은 할당과
동일하다는 점을 기억하세요. 즉, 동일한 객체를 참조하는 변수가 여러 개 생길 수
있습니다. 이러한 변수 중 하나가 파괴적인 메서드를 호출하는 데 사용되면 모든
변수가 참조하는 객체가 변경됩니다.

~~~
def foo(str)
  str.sub!(/foo/, "baz")
end

obj = "foo"
foo(obj)     # => "baz"
obj          # => "baz"
~~~

이 경우 실제 인수가 변경됩니다.

### 메서드에서 여러 값을 반환할 수 있나요?

예인 동시에 아니요입니다.

~~~
def m1
  return 1, 2, 3
end

def m2
  [1, 2, 3]
end

m1  # => [1, 2, 3]
m2  # => [1, 2, 3]
~~~

따라서 하나의 값만 반환되지만 그 값은 임의로 복잡한 객체가 될 수 있습니다.
배열의 경우 다중 할당을 사용하여 여러 반환 값의 효과를 얻을 수 있습니다.
다음의 예를 보세요.

~~~
def foo
  [20, 4, 17]
end

a, b, c = foo
a              # => 20
b              # => 4
c              # => 17
~~~
