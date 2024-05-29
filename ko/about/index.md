---
layout: page
title: "Ruby에 대해서"
lang: ko
---

Ruby가 왜 인기 있을까요? Ruby의 팬들은 아름답고 기교가 뛰어난 언어이기 때문이라고 말합니다. 하지만 이 말로는 부족하지요. 어떤
점이 Ruby를 이처럼 매력적인 언어로 만드는 것일까요?
{: .summary}

### Ruby를 만든 마츠의 목표

Ruby는 균형잡힌 언어입니다. Ruby를 만든 [유키히로 마츠모토][matz](일명 마츠)는 그가 좋아하는 언어인 Perl, Smalltalk, Eiffel, Ada, Lisp를 섞어서 명령형 프로그래밍 언어이자 함수형 언어인 새로운 언어를 만들었습니다.

그는 “Ruby를 단순하게 만드는 것이 아니라 자연스럽게 만들려고 노력한다”라고 말하곤 합니다. 우리의 삶을 반영하고자 한다는
것이지요.

이렇게 말한 적도 있습니다.

> Ruby는 언뜻 보기에는 간단해 보입니다. 하지만 그 내부는 무척이나 복잡하지요. 마치 사람의 몸처럼요<sup>[1](#fn1)</sup>.

### Ruby의 성장세

1995년에 처음 공개된 이후로 전세계에 많은 Ruby 개발자가 생겨났습니다. 특히 2006년에는 수많은 사람들이 Ruby를 배웠습니다.
전 세계의 웬만한 도시에는 활발한 사용자 그룹이 만들어졌고, Ruby와 관련된 콘퍼런스는 모두 매진되었습니다.

Ruby의 주된 [메일링 리스트](/ko/community/mailing-lists/)인 Ruby-Talk는 2006년까지 하루에 평균 200개의 글이 올라올 정도로
성장하였습니다. 최근 몇 년 동안 커뮤니티의 경향이 하나의 집중된 메일링 리스트보다 작은 그룹에서의 토론을 선호하게 바뀌어
토론의 숫자는 감소 중입니다.

Ruby는 성장세와 인기 면에서 [TIOBE Index][tiobe] 같은 세계적인 랭킹의 10위권 안에 드는 프로그래밍 언어입니다.
이런 성장은 Ruby로 만들어진 대중적인 소프트웨어, 특히 [Ruby on Rails][ror] 웹 프레임워크의 공입니다.

Ruby는 [완전히 무료]({{ site.license.url }})입니다. 사용뿐만 아니라 복사, 수정, 배포까지도 무료입니다.

### 모든 것은 객체

처음에 마츠는 이상적인 문법을 가진 언어를 찾고 있었습니다. 그 때를 회고하며 그는 “나는 Perl보다 강력하고 Python보다는 객체지향적인
스크립트 언어가 필요했다<sup>[2](#fn2)</sup>.”고 했습니다.

Ruby에서는 모든 것이 객체입니다. 따라서 Ruby에서 모든 것은 자신만의 속성과 액션을 갖습니다. 객체지향 프로그래밍에서 이런 속성을
*인스턴스 변수*라고 하고, 액션을 *메서드*라고 합니다. Ruby의 순수 객체지향 접근법은 아래의 예제처럼 숫자에 액션을 취하는
코드로 대표되곤 합니다.

{% highlight ruby %}
5.times { print "우리는 Ruby를 *사랑*해요! 너무 멋져요!" }
{% endhighlight %}

많은 언어에서 숫자는 원시 타입이지 객체는 아닙니다. 하지만 Ruby는 Smalltalk의 영향을 받아 모든 형태의 것에 메서드와 인스턴스
변수를 부여합니다. 이는 모든 곳에서 일관되게 적용되므로 Ruby 사용법을 쉽게 해줍니다.

### Ruby의 유연함

개발자가 Ruby의 어떤 부분이든 자유롭게 바꿀 수 있기 때문에 매우 유연한 언어라고 할 수 있습니다. 원한다면 Ruby 코어 부분도
제거하고 재정의할 수 있습니다. 이미 존재하는 코드에 무엇인가를 덧붙일 수도 있습니다. Ruby는 기본적으로 개발자의 사고를 제한하지
않습니다.

예를 들어 아래는 `+` 연산자 대신 `plus`라고 쓰는 것이 더 읽기 편하다고 결정했다면 Ruby의 빌트인 클래스인
`Numeric`에 메서드를 추가하면 됩니다.

{% highlight ruby %}
class Numeric
  def plus(x)
    self.+(x)
  end
end

y = 5.plus 6
# 이제 y는 11이 되었다
{% endhighlight %}

Ruby의 연산자는 메서드를 이용한 문법 단축에 불과합니다. 물론 이 부분도 재정의할 수 있습니다.

### Ruby의 표현력을 풍부하게 해주는 블록

Ruby의 블록 기능 또한 뛰어난 유연성의 원천입니다. 개발자는 어떤 메서드에든 클로저를 추가함으로써 메서드의 동작을 기술할 수
있습니다. Ruby에서 이 클로저를 *블록*이라고 부릅니다. 이는 PHP, Visual Basic 등 다른 명령형 언어에서 Ruby로 이주한
개발자에게 가장 매력적인 기능으로 꼽힙니다.

블록은 함수형 언어에서 아이디어를 따왔습니다. 마츠는 “Ruby 클로저를 만들면서 나는 Lisp의 클로저 기능을 존중하고
싶었다<sup>[3](#fn3)</sup>.”고 말했습니다.

{% highlight ruby %}
search_engines =
  %w[Google Yahoo MSN].map do |engine|
    "http://www." + engine.downcase + ".com"
  end
{% endhighlight %}

위 예제에서 블록은 `do ... end` 문법 구조에 기술되었습니다. `map` 메서드는 주어진 단어 목록에 블록을 적용합니다.
이처럼 Ruby의 다른 메서드도 그 동작 중 일부를 자신의 블록으로 채워넣을 수 있도록 개발자에게 열린 구조를 제공하고 있습니다.

### Ruby와 믹스인

다른 객체지향 언어와 달리 Ruby는 **의도적으로** 단일 상속만을 제공합니다. 대신 Ruby에는 모듈 개념(Objective-C에서는
카테고리라 불리는)이 있습니다. 모듈은 메서드의 컬렉션입니다.

클래스에 모듈을 믹스인할 수 있는데, 그렇게 하면 유용한 메서드를 손쉽게 얻을 수 있습니다. 예를 들어 `each` 메서드를 구현하고
있는 클래스는 어떤 것이든 `Enumerable` 모듈을 믹스인하기만 하면, `each`를 루프에 이용해 많은 함수들이 추가됩니다.

{% highlight ruby %}
class MyArray
  include Enumerable
end
{% endhighlight %}

대부분 루비스트들은 위와 같은 기능이 복잡하기만 하고 제한적인 다중 상속보다 훨씬 간결한 방법이라고 생각합니다.

### Ruby 코드의 외향

Ruby는 종종 매우 제한된 문장 부호를 사용하고 일반적으로 영어 키워드를 선호하지만, 일부 문장 부호는 Ruby를 장식하는 데 사용됩니다.
Ruby에는 변수 선언이 없습니다. 단지 변수의 범위를 나타내기 위해 몇 가지 간단한 이름 관례를 사용하고 있습니다.

* `var` 지역변수.
* `@var` 인스턴스 변수.
* `$var` 전역변수.

이런 몇 가지 장치는 변수의 역할을 명확히 드러냄으로써 개발자가 코드를 읽기 쉽게 해줍니다. 그리고 모든 인스턴스 메서드에
붙인다면 정말 피곤할 `self.`도 대부분 생략할 수 있습니다.

### 고급 기능

Ruby는 개발자의 편의를 위해 많은 기능을 제공합니다. 그 중 유용한 일부는 아래와 같습니다.

* Ruby에는 Java, Python처럼 예외 처리 기능이 있어서 에러 처리를 간편하게 할 수 있습니다.

* Ruby는 모든 객체를 대상으로 마크-스윕 가비지 컬렉터를 제공합니다. 확장 라이브러리에서 레퍼런스 카운트를 관리할 필요는 없습니다.
  마츠는 이를 “건강을 위한” 기능이라고 표현했습니다.

* C 에서 Ruby를 사용하기 위한 간결한 API를 제공하기 때문에, Perl이나 Python보다 쉽게 C 확장기능을 만들 수 있습니다. 여기에는
  스크립팅을 위해 Ruby를 임베딩하는 것도 포함됩니다. 물론, SWIG 인터페이스도 제공됩니다.

* OS가 지원한다면 확장 기능을 동적으로 로드할 수 있습니다.

* Ruby는 운영체제에 의존하지 않는 스레딩 기능을 제공합니다. 그리고 이는 Ruby가 동작하는 모든 플랫폼에 적용되어서 스레드를
  지원하지 않는 MS-DOS에서도 다중 스레드 프로그램을 작성할 수 있습니다.

* Ruby는 이식성이 매우 높습니다. 대부분 GNU Linux에서 개발되었지만 대부분의 UNIX, macOS, Windows, DOS, BeOS, OS/2 등에서 동작합니다.

### Ruby의 다른 구현체들

언어로서 Ruby는 몇몇 다른 구현체가 있습니다. 본 가이드에서는 커뮤니티에서 자주 거론되는
**MRI**(“Matz의 Ruby 인터프리터”)나 **CRuby**(C로 작성된 Ruby) 같은 레퍼런스 구현체(reference
implementation)에 대해 이야기하고 있습니다만, 다른 것들도 있습니다.
이들은 특정 상황에서 유용할 때가 있는데, 다른 언어 혹은 환경과의 추가 통합을 지원한다거나
MRI가 지원하지 않는 특별한 기능을 가지거나 합니다.

다음은 해당 구현체 목록입니다.

* [JRuby][jruby]는 JVM(Java 가상 머신) 위에서 구동되는 Ruby입니다. JVM의 최적화 JIT 컴파일러, 가비지 컬렉터, 병렬 스레드, 툴 에코시스템,
  그리고 다양한 라이브러리 집합을 활용합니다.
* [Rubinius][rubinius]는 ‘Ruby로 쓰인 Ruby’입니다. LLVM 위에 구축되어,
  Rubinius는 다른 언어 역시 구축된 멋진 가상 머신 위에서 활동합니다.
* [mruby][mruby]는 Ruby의 경량 구현체로 애플리케이션 안에 링크되거나 포함시킬 수 있습니다.
  Ruby의 창시자인 유키히로 “Matz” 마츠모토가 개발을 이끌고 있습니다.
* [IronRuby][ironruby]는 “.NET Framework과 강력하게 통합된” 구현체입니다.
* [MagLev][maglev]는 “통합된 개체 지속성과 분산 공유 캐시를 가진 빠르고, 안정적인 Ruby 구현체”입니다.
* [Cardinal][cardinal]는 “[Parrot][parrot] 가상 기기을 위한 Ruby 컴파일러”(Perl 6)입니다.

### 참조

<sup>1</sup> 마츠, Ruby-Talk 메일링 리스트에서, [May 12th,
2000][blade].
{: #fn1}

<sup>2</sup> 마츠, [An Interview with the Creator of Ruby][linuxdevcenter], Nov.
29th, 2001.
{: #fn2}

<sup>3</sup> 마츠, [Blocks and Closures in Ruby][artima], December 22nd,
2003.
{: #fn3}



[matz]: http://www.rubyist.net/~matz/
[blade]: https://blade.ruby-lang.org/ruby-talk/2773
[ror]: http://rubyonrails.org/
[linuxdevcenter]: http://www.linuxdevcenter.com/pub/a/linux/2001/11/29/ruby.html
[artima]: http://www.artima.com/intv/closures2.html
[tiobe]: http://www.tiobe.com/index.php/content/paperinfo/tpci/index.html
[jruby]: http://jruby.org
[rubinius]: http://rubini.us
[mruby]: http://www.mruby.org/
[ironruby]: http://www.ironruby.net
[maglev]: http://maglev.github.io
[cardinal]: https://github.com/parrot/cardinal