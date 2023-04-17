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
    <strong>8</strong>
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

## 클래스 와 모듈

### 클래스 정의를 반복할 수 있나요?

클래스는 반복적으로 정의할 수 있습니다. 각 정의는 마지막 정의에 추가됩니다.
메서드가 재정의되면 이전 메서드가 재정의되고 손실됩니다.

### 클래스 변수가 있나요?

있습니다. 앞에 기호(`@@`) 두 개가 붙은 변수는 클래스 변수로, 클래스의 인스턴스
메서드와 클래스 메서드 모두에서 액세스할 수 있습니다.

~~~
class Entity

  @@instances = 0

  def initialize
    @@instances += 1
    @number = @@instances
  end

  def who_am_i
   "I'm #{@number} of #{@@instances}"
  end

  def self.total
    @@instances
  end
end

entities = Array.new(9) { Entity.new }

entities[6].who_am_i  # => "I'm 7 of 9"
Entity.total          # => 9
~~~

하지만 클래스 변수 대신 _클래스 인스턴스 변수_를 사용해야 합니다.

### 클래스 인스턴스 변수는 무엇인가요?

여기서는 클래스 인스턴스 변수를 사용하여 이전 섹션의 예제를 다시 작성했습니다.

~~~
class Entity

  @instances = 0

  class << self
    attr_accessor :instances  # 읽기/쓰기를 위한 클래스 메서드 제공
  end

  def initialize
    self.class.instances += 1
    @number = self.class.instances
  end

  def who_am_i
   "I'm #{@number} of #{self.class.instances}"
  end

  def self.total
    @instances
  end
end

entities = Array.new(9) { Entity.new }

entities[6].who_am_i  # => "I'm 7 of 9"
Entity.instances      # => 9
Entity.total          # => 9
~~~

여기서 `@instances`는 _클래스_ 인스턴스 변수입니다. 이 변수는 `Entity`
클래스의 인스턴스에 속하는 것이 아니라 `Class` 클래스의 인스턴스인
클래스 객체 `Entity`에 속합니다.

클래스 인스턴스 변수는 클래스의 클래스 메서드 내에서만 직접 액세스할 수
있습니다.

### 클래스 변수와 클래스 인스턴스 변수의 차이점은 무엇인가요?

주요 차이점은 상속과 관련된 동작입니다. 클래스 변수는 클래스와 모든 서브클래스
간에 공유되는 반면, 클래스 인스턴스 변수는 특정 클래스 하나에만 속합니다.

클래스 변수는 어떤 식으로든 상속 계층 구조의 컨텍스트 내에서 전역 변수로 볼 수
있으며, 전역 변수에 따르는 모든 문제가 있습니다.
예를 들어, 클래스 변수가 (실수로) 서브클래스에 의해 재할당되어 다른 모든
클래스에 영향을 미칠 수 있습니다.

~~~
class Woof

  @@sound = "woof"

  def self.sound
    @@sound
  end
end

Woof.sound  # => "woof"

class LoudWoof < Woof
  @@sound = "WOOF"
end

LoudWoof.sound  # => "WOOF"
Woof.sound      # => "WOOF" (!)
~~~

또는 조상 클래스가 나중에 다시 열리고 변경되어 예상치 못한 효과가 나타날 수도
있습니다.

~~~
class Foo

  @@var = "foo"

  def self.var
    @@var
  end
end

Foo.var  # => "foo" (as expected)

class Object
  @@var = "object"
end

Foo.var  # => "object" (!)
~~~

따라서 수행 중인 작업을 정확히 알고 있고 이러한 종류의 동작이 명시적으로 필요한
경우가 아니라면 클래스 인스턴스 변수를 사용하는 것이 좋습니다.

### Ruby에는 클래스 메서드가 있나요?
{: #class-method}

클래스 객체의 [싱글톤 메서드](../7/#singleton-method)를 클래스 메서드라고 합니다.
(사실 클래스 메서드는 메타클래스에 정의되어 있지만, 이는 거의 투명합니다).
이를 다른 방식으로 보면 클래스 메서드는 수신자가 클래스인 메서드라고 말할 수
있습니다.

이 모든 것은 수신자로 해당 클래스의 인스턴스(객체)가 없어도 클래스 메서드를
호출할 수 있다는 사실로 귀결됩니다.

클래스 `Foo`의 싱글톤 메서드를 만들어 봅시다.

~~~
class Foo
  def self.test
    "this is foo"
  end
end

# 이런 식으로 호출됩니다.

Foo.test  # => "this is foo"
~~~

이 예제에서 `Foo.test`는 클래스 메서드입니다.

`Class`에 정의된 인스턴스 메서드는 모든(!) 클래스에 대한 클래스
 메서드로 사용할 수 있습니다.

### 싱글톤 클래스란 무엇인가요?

싱글톤 클래스는 특정 객체와 연관된 클래스를 서브클래싱하여 생성되는 익명
클래스입니다. 싱글톤 클래스는 하나의 객체와 관련된 기능을 확장하는 또 다른
방법입니다.

`Foo`가 있다고 합시다.

~~~
class Foo
  def hello
    "hello"
  end
end

foo = Foo.new
foo.hello  # => "hello"
~~~

이제 이 인스턴스 하나에만 클래스 수준 기능을 추가해야 한다고 가정해 보
겠습니다.

~~~
class << foo
  attr_accessor :name

  def hello
    "hello, I'm #{name}"
  end
end

foo.name = "Tom"
foo.hello         # => "hello, I'm Tom"
Foo.new.hello     # => "hello"
~~~

`Foo`의 특성을 변경하지 않고 `foo`를 재정의했습니다.

### 모듈 함수란 무엇인가요?

{% include faq-out-of-date.html %}

모듈 함수는 모듈에 정의된 private 싱글톤 메서드입니다. 사실상
[클래스 메서드](#class-method)와 유사하며, `Module.method` 표기법을
사용하여 호출할 수 있습니다.

~~~
Math.sqrt(2)  # => 1.414213562
~~~

그러나 모듈을 클래스에 혼합할 수 있기 때문에 접두사 없이 모듈 함수를 사용
할 수도 있습니다(모든 `Kernel` 함수를 객체에서 사용할 수 있는 방식입니다).

~~~
include Math
sqrt(2)  # => 1.414213562
~~~

메서드를 모듈 함수로 만들려면 `module_function`을 사용합니다.

~~~
module Test
  def thing
    # ...
  end
  module_function :thing
end
~~~

### 클래스와 모듈의 차이점은 무엇인가요?

모듈은 메서드와 상수의 모음입니다. 인스턴스를 생성할 수 없습니다. 클래스는
인스턴스(객체)를 생성할 수 있으며 인스턴스별 상태(인스턴스 변수)를 가질 수
있습니다.

모듈은 클래스 및 다른 모듈에 혼합될 수 있습니다. 혼합된 모듈의 상수와 메서드는
해당 클래스의 상수와 메서드에 혼합되어 클래스의 기능을 보강합니다.
그러나 클래스는 다른 어떤 것과도 섞일 수 없습니다.

클래스는 다른 클래스에서 상속할 수 있지만 모듈에서는 상속할 수 없습니다.

모듈은 아무 것도 상속할 수 없습니다.

### 모듈을 서브클래스할 수 있나요?

그러나 모듈을 클래스나 다른 모듈에 포함시켜 다중 상속(믹스인 기능)을 모방할
수 있습니다.

이렇게 하면 상속이 필요한 하위 클래스가 생성되지는 않지만 클래스와 모듈 사이
에 `is_a?` 관계가 생성됩니다.

### 믹스인의 예를 보여주세요.

`Comparable` 모듈은 다양한 비교 연산자(`<`, `<=`, `==`, `>=`, `>`, `between?`)를
제공합니다. 이는 일반적인 비교 메서드인 `<=>`에 대한 호출로 정의됩니다. 그러나
`<=>` 자체를 정의하지는 않습니다.


동물의 다리 개수를 기준으로 비교하는 클래스를 만들고 싶다고 가정해 보겠습니다.

~~~
class Animal
  include Comparable

  attr_reader :legs

  def initialize(name, legs)
    @name, @legs = name, legs
  end

  def <=>(other)
    legs <=> other.legs
  end

  def inspect
    @name
  end
end

c = Animal.new("cat", 4)
s = Animal.new("snake", 0)
p = Animal.new("parrot", 2)

c < s             # => false
s < c             # => true
p >= s            # => true
p.between?(s, c)  # => true
[p, s, c].sort    # => [snake, parrot, cat]
~~~

`Animal`은 `<=>` 연산자에 대한 자체 시맨틱을 정의하고 `Comparable` 모듈을
mixin만 하면 됩니다. 이제 `Comparable`의 메서드는 `Animal`의 메서드와
구분할 수 없게 되고 클래스에 새로운 기능이 갑자기 생겨납니다. 그리고
많은 클래스에서 동일한 `Comparable` 모듈을 사용하기 때문에 새 클래스는
일관되고 잘 이해되는 의미를 공유하게 됩니다.

### 클래스 메서드를 정의하는 방법이 두 가지인 이유는 무엇인가요?

클래스 정의에서 클래스 메서드를 정의할 수 있으며, 최상위 수준에서 클래스
메서드를 정의할 수 있습니다.

~~~
class Demo
  def self.class_method
  end
end

def Demo.another_class_method
end
~~~

둘 사이에는 단 한 가지 중요한 차이점이 있습니다. 클래스 정의에서는 상수가
범위 내에 있으므로 클래스의 상수를 직접 참조할 수 있습니다. 최상위 레벨에서는
`Class::CONST` 표기법을 사용해야 합니다.

### 'include'과 'extend'의 차이점은 무엇인가요?

{% include faq-out-of-date.html %}

`include`는 모듈을 클래스나 다른 모듈에 혼합합니다. 해당 모듈의 메서드는 함수
스타일(수신자 없이)로 호출됩니다.

`extend`는 객체(인스턴스)에 모듈을 포함할 때 사용됩니다.
모듈의 메서드는 객체의 메서드가 됩니다.

### `self`는 무슨 뜻인가요?

`self`은 현재 실행 중인 수신자, 즉 메서드가 적용되는 객체입니다. 함수형
메서드 호출은 `self`를 수신자로 의미합니다.
