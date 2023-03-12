---
layout: page
title: "다른 언어에서 Ruby로"
lang: ko
---

처음 Ruby 코드를 볼 때, 그것은 당신이 사용했던 다른 프로그래밍 언어를
연상하게 할 수 있습니다. 이것은 의도적입니다. 대부분의 문법은 Perl, Python,
Java나 다른 언어들과 유사합니다. 다른 언어를 사용한 적이 있다면 Ruby를
배우기는 아주 쉬울 것입니다.
{: .summary}

이 문서에는 두 가지 주요 단원이 있습니다. 첫번째는 *어떤* 언어에서 Ruby로
넘어올 때의 빠른 요약입니다. 두번째는 이미 잘 알고있는 것과 비교할 수
있도록 언어의 주요 기능을 다룹니다.

## 차이점들: *어떤 언어*에서 Ruby로

* [C나 C++에서 Ruby로](to-ruby-from-c-and-cpp/)
* [Java에서 Ruby로](to-ruby-from-java/)
* [Perl에서 Ruby로](to-ruby-from-perl/)
* [PHP에서 Ruby로](to-ruby-from-php/)
* [Python에서 Ruby로](to-ruby-from-python/)

## 언어의 중요한 기능과 알아둘 점

Ruby를 배우는 동안 보게 될 Ruby의 주요 기능들의 요점과 힌트들을 알아봅시다.

### 이터레이션

익숙해져야 하지만 전에 본 것과는 다를 수 있는 Ruby의 두 가지 기능은 "블록"과
이터레이터입니다. (C, C++, pre-1.5 Java처럼) 인덱스로 반복하거나 (Perl의
`for (@a) {...}`나 Python의 `for i in aList: ...`처럼) 리스트로 반복하는
대신, Ruby에서는 매우 자주 다음과 같은 구문을 사용하는 것을 보게 됩니다.

{% highlight ruby %}
some_list.each do |this_item|
  # 블록 안
  # this_item으로 연산 수행
end
{% endhighlight %}

`each`(나 `collect`, `find`, `inject`, `sort` 등등)에 관한 더 자세한
정보는 `ri Enumerable`(혹은 `ri Enumerable#some_method`)로 확인하세요.

### 모든 것은 값을 가지고 있다

표현식과 구문에 차이가 없습니다. 값이 **nil** 일지언정 모든 것은 값을
가지고 있습니다. 이런 것이 가능합니다.

{% highlight ruby %}
x = 10
y = 11
z = if x < y
      true
    else
      false
    end
z # => true
{% endhighlight %}

### 심볼은 가벼운 문자열이 아니다

많은 Ruby 뉴비들은 심볼을 이해하는데 어려워하고, 어디에 사용하는 것인지
궁금해 합니다.

심볼은 최선의 아이덴티티라고 할 수 있습니다. 심볼은 **무엇**인지에 대한
것이 아니라 **누구**인지에 대한 것입니다. `irb`에서 차이점을 확인해 보세요.

{% highlight irb %}
irb(main):001:0> :george.object_id == :george.object_id
=> true
irb(main):002:0> "george".object_id == "george".object_id
=> false
irb(main):003:0>
{% endhighlight %}

`object_id` 메서드는 객체의 아이덴티티를 반환합니다. 만약 두 객체가 같은
`object_id`를 가진다면 두 객체는 같습니다(메모리 안의 같은 객체를 가리킵니다).

보시다시피, 심볼을 한 번 사용하면, 같은 문자열을 사용하는 모든 심볼은
메모리 안의 같은 객체를 참조합니다. 어떤 두 심볼이 같은 문자들을 가지고 있다면,
`object_id`는 일치하게 됩니다.

이제 문자열 (“george”)를 살펴봅시다. `object_id`가 일치하지 않습니다.
이 말은 메모리 안의 다른 객체를 참조하고 있다는 뜻입니다. 새로운 문자열을
사용할 때마다, Ruby는 매번 메모리에 할당 합니다.

심볼을 사용해야 할지 문자열을 사용해야 할지 결정해야 한다면, 무엇이 더
중요한지 생각해보세요. 객체의 아이덴티티가 중요한 경우(예를 들어 해시 키로
사용할 때)나 내용이 중요할 때(위에 있는 예제처럼 “george”)로 나눌 수
있습니다.

### 모든 것은 객체입니다.

"모든 것이 객체"라는 말은 과장이 아닙니다. 클래스나 정수조차도 객체입니다.
다른 객체에서 하는 일을 클래스나 정수에서도 할 수 있습니다.

{% highlight ruby %}
MyClass = Class.new do
  attr_accessor :instance_var
end
# 위 구문은 밑의 구문과 같습니다.
# class MyClass
#   attr_accessor :instance_var
# end
{% endhighlight %}

### 변경가능한 상수

상수는 실제로 상수는 아닙니다. 이미 초기화된 상수를 수정한다면, 경고를
발생하긴 하지만, 프로그램을 종료시키진 않습니다. 이 이야기는 상수의
재 정의를 **권장** 한다는 이야기는 아닙니다.

### 이름 규칙

Ruby는 몇몇 이름 규칙을 강제합니다. 대문자로 시작하는 식별자는 상수입니다.
달러 기호(`$`)로 시작하면 전역 변수입니다. `@`로 시작하면 인스턴스
변수입니다. `@@`로 시작하면 클래스 변수입니다.

하지만 메서드 이름은 대문자로 시작할 수 있습니다. 이는 밑에 예에서 볼 수
있는 것처럼 혼동을 야기할 수 있습니다.

{% highlight ruby %}
Constant = 10
def Constant
  11
end
{% endhighlight %}

이제 `Constant`는 10이지만, `Constant()`는 11입니다.

### 키워드 인자

Ruby 2.0부터 메서드는 Python처럼 키워드 인자로 선언할
수 있습니다.

{% highlight ruby %}
def deliver(from: "A", to: nil, via: "mail")
  "Sending from #{from} to #{to} via #{via}."
end

deliver(to: "B")
# => "Sending from A to B via mail."
deliver(via: "Pony Express", from: "B", to: "A")
# => "Sending from B to A via Pony Express."
{% endhighlight %}

### 범용적인 참

Ruby에서는, **nil**과 **false**를 제외한 모든 것이 참으로 간주됩니다.
C나 Python이나 많은 다른 언어들에서 0과 빈 리스트같은 값들이 거짓으로
간주됩니다. 다음 Python 코드를 보시죠. (이 예제는 다른 언어에도 적용됩니다)

{% highlight python %}
# Python
if 0:
  print("0 is true")
else:
  print("0 is false")
{% endhighlight %}

이 구문은 “0 is false”를 출력합니다. 같은 구문은 Ruby에서:

{% highlight ruby %}
# Ruby
if 0
  puts "0 is true"
else
  puts "0 is false"
end
{% endhighlight %}

“0 is true”를 출력합니다.

### 액세스 한정자는 스코프의 끝까지 적용

다음 Ruby 코드에서,

{% highlight ruby %}
class MyClass
  private
  def a_method; true; end
  def another_method; false; end
end
{% endhighlight %}

아마 `another_method`가 `public`이기를 기대할 수도 있지만, `private`
액세스 한정자가 스코프의 끝이나 다른 액세스 한정자가 나올 때까지 지속
됩니다. 기본적으로 메서드는 `public`입니다.

{% highlight ruby %}
class MyClass
  # 이제 a_method는 public입니다.
  def a_method; true; end

  private

  # another_method는 private입니다.
  def another_method; false; end
end
{% endhighlight %}

`public`, `private`, `protected`는 사실 메서드이므로 매개 변수를 받을 수
있습니다. 한정자에 심볼을 넘겨주면, 메서드의 액세스 범위가 변경됩니다.

### 메서드 액세스

Java에서, `public`은 누구라도 액세스 할 수 있음을 의미합니다. `protected`는
클래스의 인스턴스, 하위 클래스의 인스턴스, 같은 패키지의 클래스의 인스턴스
는 액세스할 수 있지만, 그 밖의 장소에서는 액세스 할 수 없음을 의미합니다.
`private`은 클래스의 인스턴스를 제외한 장소에서는 액세스 할 수 없음을 의미합니다.

Ruby는 약간 다릅니다. `public`은 말 그대로 공개입니다. `private`은 메서드에서만
명시적인 수신기 없이 메서드를 호출할 수 있다는 말입니다. **self**만이 private
메서드 호출의 리시버로 허용됩니다.

`protected` 밖에서부터 호출했을 때 주의해야 한다는 뜻입니다. `protected` 메서드는
클래스나 하위 클래스 인스턴스에서 호출할 수 있고, 다른 인스턴스를 리시버로
사용할 수 있습니다. [Ruby FAQ][faq]에서 가져온 예제입니다.

{% highlight ruby %}
class Test
  # 기본값은 public입니다.
  def identifier
    99
  end

  def ==(other)
    identifier == other.identifier
  end
end

t1 = Test.new  # => #<Test:0x34ab50>
t2 = Test.new  # => #<Test:0x342784>
t1 == t2       # => true

# 이제 `identifier'를 protected로 만들지만 protected가 다른
# 객체에서의 참조를 허용하기 때문에 여전히 동작합니다.

class Test
  protected :identifier
end

t1 == t2  # => true

# 이제 `identifier'을 private으로 만듭니다.

class Test
  private :identifier
end

t1 == t2
# NoMethodError: private method `identifier' called for #<Test:0x342784>
{% endhighlight %}

### 열린 클래스

Ruby의 클래스는 열려 있습니다. 언제든 클래스를 열어서, 추가하고, 변경할 수
있습니다. `Integer`나 심지어 모든 객체의 부모인 `Object` 같은 코어 클래스도
예외는 아닙니다. Ruby on Rails에서는 시간을 제어하기 위해 `Integer`에 많은
메서드를 추가해서 사용합니다. 밑을 보세요.

{% highlight ruby %}
class Integer
  def hours
    self * 3600 # 한 시간을 초로 환산한 수
  end
  alias hour hours
end

# 1월 1일 00:00부터 14시간 후
# (aka when you finally wake up ;)
Time.mktime(2006, 01, 01) + 14.hours # => Sun Jan 01 14:00:00
{% endhighlight %}

### 웃긴 메서드 이름

Ruby에서는, 메서드 이름이 물음표나 느낌표로 끝날 수 있습니다.
관례에 의하면, 질문에 답하는 메서드는 물음표로 끝납니다.
(예를 들어 리시버가 비었을 때 **true**를 반환하는 `Array#empty?`)
관례에서 "위험할" 수 있는 메서드는 느낌표로 끝납니다.
(예를 들어 `exit!` 같은 **self**나 인자를 변경하는 메서드)
인자를 변경하는 모든 메서드가 느낌표로 끝나지는 않습니다.
`Array#replace`는 다른 배열의 내용으로 배열의 내용을 치환합니다.
느낌표를 self를 수정하지 **않는** 메서드에 사용하는 것은 말이
되지 않습니다.

### 싱글턴 메서드

싱글턴 메서드는 객체별 메서드입니다. 싱글턴 메서드는 정의된 객체에서만
사용 가능합니다.

{% highlight ruby %}
class Car
  def inspect
    "Cheap car"
  end
end

porsche = Car.new
porsche.inspect # => Cheap car
def porsche.inspect
  "Expensive car"
end

porsche.inspect # => Expensive car

# 다른 객체는 영향 없음
other_car = Car.new
other_car.inspect # => Cheap car
{% endhighlight %}

### 없는 메서드

Ruby는 특정 메시지에 응답할 메서드를 찾을 수 없을 때에도 포기하지
않습니다. 찾을 수 없었던 메서드의 이름과 인자를 가지고
`method_missing` 메서드를 호출합니다. 기본적으로 `method_missing`은
NameError 예외를 일으키지만, 애플리케이션에 맞게 재정의 할 수 있고
많은 라이브러리들이 그렇게 사용합니다. 예제를 보세요.

{% highlight ruby %}
# id는 메서드 호출의 이름이고 , * 문법은 모든 인자를
# 'arguments'라는 이름의 배열에 넣어줍니다.
def method_missing(id, *arguments)
  puts "Method #{id} was called, but not found. It has " +
       "these arguments: #{arguments.join(", ")}"
end

__ :a, :b, 10
# => Method __ was called, but not found. It has these
# arguments: a, b, 10
{% endhighlight %}

위의 코드는 단지 호출의 상세 정보를 출력합니다만, 적합한 어떤
방식으로든 자유롭게 메시지를 처리할 수 있습니다.

### 함수 호출이 아닌, 메시지 넘기기

메서드 호출은 사실 다른 객체로 던지는 **메시지**입니다.

{% highlight ruby %}
# 이 구문들은
1 + 2
# 전부
1.+(2)
# 같습니다.
1.send "+", 2
{% endhighlight %}

### 블록은 객체, 다만 아직 모를 뿐

블록(사실은 클로저)은 표준 라이브러리에서 매우 많이 사용되고 있습니다.
블록을 호출하려면, `yield`를 사용하거나 특별한 인자를 붙여 `Proc`으로
만들 수 있습니다.

{% highlight ruby %}
def block(&the_block)
  # Inside here, the_block is the block passed to the method
  the_block # return the block
end
adder = block { |a, b| a + b }
# adder는 이제 Proc 객체입니다.
adder.class # => Proc
{% endhighlight %}

메서드 호출 밖에서도 블록과 함께 `Proc.new`를 호출하거나 `lambda` 메서드를
호출해 블록을 만들 수 있습니다.

비슷하게, 메서드도 만들 때에는 객체입니다.

{% highlight ruby %}
method(:puts).call "puts is an object!"
# => puts is an object!
{% endhighlight %}

### 연산자는 신택스 슈거

Ruby의 대부분의 연산자는 메서드 호출의 (몇가지 우선순위 규칙을
포함한) 신택스 슈거입니다. 예를 들어, Integer의 + 메서드를 오버라이드
할 수 있습니다.

{% highlight ruby %}
class Integer
  # 할 수는 있지만, 하지 마세요.
  def +(other)
    self - other
  end
end
{% endhighlight %}

C++의 `operator+` 같은 건 필요 없습니다.

`[]` 와 `[]=` 메서드를 정의한다면 배열 스타일 액세스도 가능합니다.
(+1나 -2 같은) 단항 +와 -를 정의하기 위해서는 각기 `+@`와 `-@` 메서드를
정의하시면 됩니다. 밑의 연산자는 신택스 슈거가 **아닙니다**. 메서드가
아니며 재정의할 수 없습니다.

{% highlight ruby %}
=, .., ..., not, &&, and, ||, or, ::
{% endhighlight %}

덧붙여, `+=`, `*=` 등등은 `var = var + other_var`, `var = var * other_var`
등등의 단축이며 재정의할 수 없습니다.

## 더 읽을 거리

더 많은 Ruby에 관한 정보를 보고 싶으시면 [문서](/ko/documentation) 항목을
보세요.



[faq]: http://ruby-doc.org/docs/ruby-doc-bundle/FAQ/FAQ.html
