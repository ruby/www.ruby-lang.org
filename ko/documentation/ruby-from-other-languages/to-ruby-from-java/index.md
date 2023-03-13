---
layout: page
title: "Java에서 Ruby로"
lang: ko
---

Java는 성숙하고 검증되어 있고 (Java를 싫어하는 사람들은 여전히 이의를
제기하겠지만) 빠릅니다. 하지만 장황하기도 합니다. Java에서 Ruby로
전환하면 코드량이 상당히 적어질 것입니다. 또 빠르게 프로토타입을
만들 때 시간이 적게 걸릴 것입니다.

### 비슷한 점

Java처럼, Ruby에서도...

* 메모리는 가비지 컬렉터에서 관리합니다.
* 객체는 강 타입입니다.
* public, private, protected 메서드가 있습니다.
* 내장된 문서화 툴이 있습니다(Ruby에서는 RDoc이라 합니다). rdoc으로
  생성한 문서는 javadoc으로 생성한 문서와 매우 비슷합니다.

### 다른 점

Java와는 다르게, Ruby에서는...

* 코드를 컴파일할 필요가 없습니다. 직접 실행하면 됩니다.
* 여러 인기 있는 서드파티 GUI 툴킷이 있습니다. Ruby 유저는
  [WxRuby][1], [FXRuby][2], [Ruby-GNOME2][3], [Qt][4],
  [Ruby Tk](https://github.com/ruby/tk) 등을 사용할 수 있습니다.
* 클래스 같은 것을 정의할 때 코드 블록에 중괄호를 넣는 대신, 선언 뒤에
  `end` 키워드를 사용합니다.
* `import` 대신 `require`를 사용합니다.
* 모든 맴버 변수는 private입니다. 밖에서의 모든 접근은 메서드를 통해 합니다.
* 메서드 호출의 괄호는 보통 생략 가능하고 자주 생략합니다.
* 2나 3.14159 같은 숫자를 포함해 모든 것이 객체입니다.
* 정적 타입 체크가 없습니다.
* 변수 이름은 라벨일 뿐입니다. 변수 이름에 관련된 타입은 없습니다.
* 타입 선언이 없습니다. 필요할 때 새로운 변수 이름에 대입만 하면 그대로
  "동작"합니다(예를 들어, `int[] a = {1,2,3};` 대신 `a = [1,2,3]`).
* 캐스팅이 없습니다. 그냥 메서드를 호출하세요. 예외를 보게 될 때에는
  유닛 테스트가 코드를 실행하기도 전에 말해 줄 것입니다.
* `Foo foo = new Foo("hi")` 대신 `foo = Foo.new("hi")`를 사용합니다.
* 생성자는 클래스 이름 대신 항상 “initialize”로 명명됩니다.
* 인터페이스 대신 "믹스인"을 사용합니다.
* XML보다 YAML을 선호하는 경향이 있습니다.
* `null` 대신 `nil`을 사용합니다.
* Ruby는 `==`과 `equals()`를 다르게 취급합니다. Ruby에서 값이 같은지를
  확인하려면 `==`를 사용하고(Java에서는 `equals()`), 객체가 같은지를 확인하려면
  `equal?()`을 사용합니다(Java에서는 `==`).



[1]: https://github.com/eumario/wxruby
[2]: https://github.com/larskanis/fxruby
[3]: https://ruby-gnome2.osdn.jp/
[4]: https://github.com/ryanmelt/qtbindings/
