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
    <strong>2</strong>
    <span class="separator"> | </span>
    <a href="/en/documentation/faq/3/" title="파트 3">3</a>
    <span class="separator"> | </span>
    <a href="/en/documentation/faq/4/" title="파트 4">4</a>
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

## Ruby의 경쟁 상대는...?

### Ruby는 Python과 어떻게 다릅니까?

Python과 Ruby는 둘 다 절차적 프로그래밍 스타일에서 객체 지향 프로그래밍
스타일로의 원활한 전환을 제공하는 객체 지향 언어입니다. 대조적으로 Smalltalk는
객체만 있습니다. 객체, 상속 및 상당한 규모의 Smalltalk 클래스 계층 구조를
이해하기 전에는 아무것도 할 수 없습니다. Python과 Ruby는 절차적 보조 바퀴를
제공함으로써 Smalltalk가 주류가 되지 못하게 했던 기능 중 하나를
"수정"합니다. 두 언어는 반대 방향에서 이 해법에 접근한다는 점에서 다릅니다.

Python은 하이브리드 언어입니다. 절차적 프로그래밍을 위한 함수와 객체 지향
프로그래밍을 위한 객체가 있습니다. Python은 함수와 메서드가 모든 메서드 def의
명시적인 `self` 매개 변수를 사용하여 상호 변환할 수 있도록 하여 두 세계를
연결합니다. 함수가 객체에 삽입되면 첫 번째 인수는 자동으로 수신자에 대한 참조가
됩니다.

Ruby는 절차적 언어로 가장할 수 있는 순수한 객체 지향 언어입니다. 함수는 없고
메서드 호출만 있습니다. Ruby 메서드에서 `self`라고도 하는 수신자는 C++의
`this`와 같은 숨겨진 인수입니다. 클래스 정의 밖의 `def` 문은 Python에서는
함수지만 Ruby에서 실제로는 메서드 호출입니다. 이러한 가짜 함수는 Ruby 클래스
계층 구조의 루트인 Object 클래스의 private 메서드가 됩니다. 절차적 프로그래밍은
다른 방향에서 깔끔하게 해결됩니다. 모든 것이 객체입니다. 사용자가 아직 객체를
이해하지 못했어도 `def`가 함수 정의인 것처럼 동작해서 문제없이 사용할 수 있습니다.

Ruby의 객체 지향 순수성은 Python에는 부족하거나 Python이 여전히 노력하고 있는 다음과 같은
여러 기능을 더 제공합니다. 통합 타입/클래스 계층 구조, 메타클래스, 모든 항목을
하위 클래스로 분류하는 기능, 균일한 메서드 호출(`len()`은 함수지만 `items()`는
메서드라는 말도 안 되는 일은 없습니다). Ruby는 Smalltalk와 마찬가지로 단일 상속만
지원하지만 매우 강력한 믹스인 개념이 있습니다. 클래스 정의에 모듈을 인클루드
할 수 있고, 그러면 해당 모듈의 메서드, 상수 등이 클래스에 삽입됩니다.

Ruby는 또 Smalltalk와 마찬가지로 클로저와 코드 블록을 제공하고 동일한 효과를
위해 사용합니다. Ruby 컬렉션 클래스와 반복자는 Python이 싹트고 있는
임시방편(람다, 리스트 컴프리헨션)보다 뛰어나고 훨씬 강력하고 우아합니다.

Ruby의 구문과 디자인 철학은 Perl의 영향을 많이 받았습니다. 문법적 변동성이
많습니다. 명령문 수정자(`if`, `unless`, `while`, `until` 등)는 명령문 끝에
올 수 있습니다. 일부 키워드는 선택사항입니다(예: `if` 문의 `then`). 메서드
호출에서 괄호가 생략되는 경우가 있습니다. 메서드의 수신자는 일반적으로 생략될 수
있습니다. 아주 많은 것들을 Perl에서 바로 가져왔습니다. 빌트인 정규식, `$_` 및 그
친구들, 히어 도큐먼트(here document), 작은따옴표/큰따옴표 문자열 구분, `$` 및 `@` 접두사를 사용하여
이름의 종류 구분 등, 이 외에도 더 있습니다.

Perl을 좋아한다면 Ruby도 좋아할 것이고 그 문법에 익숙할 것입니다. Smalltalk를
좋아한다면 Ruby를 좋아할 것이고 그 의미론에 익숙할 것입니다. Python을 좋아한다면
Python과 Ruby/Perl 사이의 엄청난 디자인 철학 차이로 인해 흥미를 잃을 수도, 아닐 수도
있습니다.

Ruby는 Python보다 훨씬 더 복잡하지만 대부분의 경우 Ruby의 기능이 서로 잘
어울립니다. Ruby는 잘 설계되었으며 P3K(Python 3000)에 채용할 만한 깔끔한 아이디어로
가득 차 있습니다. 하지만 얼마나 많은 Python 프로그래머가 그것에 끌릴지 잘
모르겠습니다. Ruby는 (아직) 저를 유혹하지는 못했습니다. 그러나 진지하게 연구할
가치가 있으며 Perl에 실질적인 위협이 될 수 있습니다.

작성자: [John Dell'Aquila](mailto:jbd@alum.mit.edu), comp.lang.python,
2000년 11월 17일. 허락을 받아 재가공했습니다.
