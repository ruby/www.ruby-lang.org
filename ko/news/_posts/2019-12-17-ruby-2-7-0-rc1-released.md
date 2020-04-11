---
layout: news_post
title: "루비 2.7.0-rc1 릴리스"
author: "naruse"
translator: "shia"
date: 2019-12-17 12:00:00 +0000
lang: ko
---

{% assign release = site.data.releases | where: "version", "2.7.0-rc1" | first %}

루비 2.7.0-rc1 릴리스를 알리게 되어 기쁩니다.

릴리스 후보 버전은 12월에 예정된 최종 릴리스에 대한 의견을 모으기 위해서 릴리스됩니다.
이 rc1은 키워드 인자의 호환성 문제를 확인하기 위해서 릴리스됩니다.

이는 많은 새 기능과 성능 향상을 포함하고 있습니다. 특히 눈에 띄는 것은 다음과 같습니다.

* 압축 GC
* 패턴 매칭
* REPL 개선
* 위치 인자와 키워드 인자 분리

## 압축 GC

이 릴리스는 단편화된 메모리를 최적화할 수 있는 압축 GC를 도입합니다.

몇몇 멀티 스레드를 이용하는 루비 프로그램은 메모리 단편화를 일으킬 수 있고,
이는 과다한 메모리 사용과 성능 저하로 이어질 수 있습니다.

힙 공간을 압축하는 `GC.compact` 메서드가 도입되었습니다.
이 함수는 더 적은 페이지를 사용하고, 힙이 CoW(Copy on Write)에 유리하도록
힙 내부에 살아있는 객체들을 압축합니다.
[[Feature #15626]](https://bugs.ruby-lang.org/issues/15626)

## 패턴 매칭 [실험적]

함수형 언어에서 널리 사용되는 패턴 매칭 기능이 실험적으로 도입되었습니다.
[[Feature #14912]](https://bugs.ruby-lang.org/issues/14912)

이는 주어진 객체를 순회하다가 패턴이 일치하는 경우 그 값을 대입합니다.

```ruby
require "json"

json = <<END
{
  "name": "Alice",
  "age": 30,
  "children": [{ "name": "Bob", "age": 2 }]
}
END

case JSON.parse(json, symbolize_names: true)
in {name: "Alice", children: [{name: "Bob", age: age}]}
  p age #=> 2
end
```

더 자세한 설명은 [Pattern matching - New feature in Ruby 2.7](https://speakerdeck.com/k_tsj/pattern-matching-new-feature-in-ruby-2-dot-7)을 확인해 주세요.

## REPL 개선

루비에 포함되어 있는 상호작용 환경(REPL; Read-Eval-Print-Loop)인 `irb`가
이제 여러 줄 편집을 지원합니다.
이는 `readline`과 호환되는 순수 루비 구현인 `reline`으로 동작합니다.
또한 rdoc 통합도 제공됩니다. `irb`에서 주어진 클래스, 모듈, 메서드의 레퍼런스를 볼 수 있습니다.
[[Feature #14683]](https://bugs.ruby-lang.org/issues/14683),
[[Feature #14787]](https://bugs.ruby-lang.org/issues/14787),
[[Feature #14918]](https://bugs.ruby-lang.org/issues/14918)

그뿐만 아니라, `binding.irb`에서 보이는 소스 코드나 코어 클래스 객체의
inspect 결과에 색이 추가되었습니다.

<video autoplay="autoplay" controls="controls" muted="muted" width="576" height="259">
  <source src="https://cache.ruby-lang.org/pub/media/irb_improved_with_key_take2.mp4" type="video/mp4">
</video>

## 위치 인자와 키워드 인자 분리

키워드 인자와 위치 인자의 자동 변환이 폐기 예정 상태가 되었습니다.
이 변환은 루비 3에서 제거될 예정입니다.
[[Feature #14183]](https://bugs.ruby-lang.org/issues/14183)

* 메서드 호출이 마지막 인자로 Hash를 넘기며 아무 키워드도 넘기지 않을 때,
  호출된 메서드는 키워드를 받을 때 경고가 발생합니다.
  계속 키워드로 취급되도록 하려면, 이중 스플랫(double splat) 연산자를 추가해서
  경고를 피하고 루비 3에서 올바르게 동작하도록 하세요.

  ```ruby
  def foo(key: 42); end; foo({key: 42})   # warned
  def foo(**kw);    end; foo({key: 42})   # warned
  def foo(key: 42); end; foo(**{key: 42}) # OK
  def foo(**kw);    end; foo(**{key: 42}) # OK
  ```

* 메서드 호출이 키워드를 넘기고 호출된 메서드도 키워드를 받을 때,
  필요한 위치 인자가 부족한 경우 키워드들을 마지막 위치 인자로 간주하고 경고가 발생합니다.
  경고를 피하고 루비 3에서 올바르게 동작하도록 하려면 인자를 키워드 대신 해시로 넘기세요.

  ```ruby
  def foo(h, **kw); end; foo(key: 42)      # warned
  def foo(h, key: 42); end; foo(key: 42)   # warned
  def foo(h, **kw); end; foo({key: 42})    # OK
  def foo(h, key: 42); end; foo({key: 42}) # OK
  ```

* 메서드가 키워드 스플랫(splat)은 받지 않고 특정 키워드는 받을 때,
  심볼과 심볼이 아닌 키를 모두 포함한 해시 또는 키워드 스플랫을
  메서드에 넘긴 경우 경고가 발생합니다.
  루비 3에서 올바르게 동작하려면 메서드를 호출하는 코드가 별도의 해시를 넘기도록
  수정해야 합니다.

  ```ruby
  def foo(h={}, key: 42); end; foo("key" => 43, key: 42)   # warned
  def foo(h={}, key: 42); end; foo({"key" => 43, key: 42}) # warned
  def foo(h={}, key: 42); end; foo({"key" => 43}, key: 42) # OK
  ```

* 메서드가 키워드를 받지 않는데 키워드와 함께 호출되면,
  키워드는 위치 인자에 해당하는 해시로 인식되고, 경고가 발생하지 않습니다.
  이 동작은 루비 3에서도 유지될 것입니다.

  ```ruby
  def foo(opt={});  end; foo( key: 42 )   # OK
  ```

* 메서드가 임의의 키워드를 받으면 심볼이 아닌 키도 키워드 인자로 허용됩니다.
  [[Feature #14183]](https://bugs.ruby-lang.org/issues/14183)

  ```ruby
  def foo(**kw); p kw; end; foo("str" => 1) #=> {"str"=>1}
  ```

* 메서드가 키워드를 받지 않음을 명시하기 위해 메서드 정의에서 `**nil`을 사용할 수 있습니다.
  이러한 메서드를 키워드와 함께 호출하면 ArgumentError가 발생합니다.
  [[Feature #14183]](https://bugs.ruby-lang.org/issues/14183)

  ```ruby
  def foo(h, **nil); end; foo(key: 1)       # ArgumentError
  def foo(h, **nil); end; foo(**{key: 1})   # ArgumentError
  def foo(h, **nil); end; foo("str" => 1)   # ArgumentError
  def foo(h, **nil); end; foo({key: 1})     # OK
  def foo(h, **nil); end; foo({"str" => 1}) # OK
  ```

* 키워드를 받지 않는 메서드에 빈 키워드 스플랫을 넘겼을 때, 더 이상 빈 해시를 넘기지 않습니다.
  파라미터가 필요한 경우 빈 해시를 넘기지만, 경고가 발생합니다.
  위치 인자로서 해시를 넘기려면 이중 스플랫(double splat)을 제거하세요.
  [[Feature #14183]](https://bugs.ruby-lang.org/issues/14183)

  ```ruby
  h = {}; def foo(*a) a end; foo(**h) # []
  h = {}; def foo(a) a end; foo(**h)  # {} and warning
  h = {}; def foo(*a) a end; foo(h)   # [{}]
  h = {}; def foo(a) a end; foo(h)    # {}
  ```

NOTE: 키워드 인자 비호환으로 인한 너무 많은 폐기 경고가 번잡하다는 의견이 있습니다.
현재 두 가지 해결책을 의논중입니다. 하나는 기본 설정을 폐기 경고를 비활성화하는
것([#16345](https://bugs.ruby-lang.org/issues/16345))과 중복되는 경고의 출력을
생략하는 것([#16289](https://bugs.ruby-lang.org/issues/16289))입니다.
아직 결정이 나지 않았습니다만, 공식 릴리스 이전에 정해질 것입니다.

## 이외의 주목할 만한 새 기능

* 메서드 참조 연산자 `.:`가 이전 프리뷰에서 실험적으로 도입되었지만 취소되었습니다.
  [[Feature #12125]](https://bugs.ruby-lang.org/issues/12125),
  [[Feature #13581]]( https://bugs.ruby-lang.org/issues/13581),
  [[Feature #16275]](https://bugs.ruby-lang.org/issues/16275)

* 번호 지정 파라미터가 기본 블록 파라미터로서 실험적으로 도입되었습니다.
  [[Feature #4475]](https://bugs.ruby-lang.org/issues/4475)

* 시작 값을 지정하지 않는 범위 연산자가 실험적으로 추가됩니다.
  종료 지정이 없는 범위 연산자처럼 유용하지 않을 수도 있습니다만, DSL 용도로는 유용할 것입니다.
  [[Feature #14799]](https://bugs.ruby-lang.org/issues/14799)

  ```ruby
  ary[..3]  # identical to ary[0..3]
  rel.where(sales: ..100)
  ```

* `Enumerable#tally`가 추가됩니다. 이는 각 요소가 몇 번 출현했는지를 셉니다.

  ```ruby
  ["a", "b", "c", "b"].tally
  #=> {"a"=>1, "b"=>2, "c"=>1}
  ```

* `self`에 private 메서드를 호출하는 것이 허용됩니다.
  [[Feature #11297]](https://bugs.ruby-lang.org/issues/11297),
  [[Feature #16123]](https://bugs.ruby-lang.org/issues/16123)

  ```ruby
  def foo
  end
  private :foo
  self.foo
  ```

* `Enumerator::Lazy#eager`가 추가됩니다.
  지연 열거자(lazy enumerator)에서 지연 없는 열거자를 생성합니다.
  [[Feature #15901]](https://bugs.ruby-lang.org/issues/15901)

  ```ruby
  a = %w(foo bar baz)
  e = a.lazy.map {|x| x.upcase }.map {|x| x + "!" }.eager
  p e.class               #=> Enumerator
  p e.map {|x| x + "?" }  #=> ["FOO!?", "BAR!?", "BAZ!?"]
  ```

## 성능 향상

* JIT [실험적]

  * 최적화 가정이 유효하지 않은 경우 JIT으로 컴파일된 코드는 최적화 레벨이 낮은
  코드로 재컴파일됩니다.

  * 순수하다고 판단된 메서드를 인라인으로 삽입하게 됩니다.
    이 최적화는 아직 실험적이며 많은 메서드는 아직 순수하다고 판단되지 않는 상태입니다.

  * `--jit-min-calls`의 기본값이 5에서 10,000으로 변경됩니다.

  * `--jit-max-cache`의 기본값이 1,000에서 100으로 변경됩니다.

* ~~`Symbol#to_s`,~~ `Module#name`, `true.to_s`, `false.to_s`, `nil.to_s`가 이제 항상 얼린 문자열을 반환합니다.
  주어진 객체에 대해 항상 동일한 문자열이 반환됩니다. [실험적]
  [[Feature #16150]](https://bugs.ruby-lang.org/issues/16150)

* `CGI.escapeHTML`의 성능이 향상되었습니다.
  [GH-2226](https://github.com/ruby/ruby/pull/2226)

* Monitor와 MonitorMixin의 성능이 향상되었습니다.
  [[Feature #16255]](https://bugs.ruby-lang.org/issues/16255)

## 그 이외의 2.6 이후로 주목할 만한 변경

* 표준 라이브러리를 업데이트했습니다.
  * Bundler 2.1.0.pre.3
    ([History](https://github.com/bundler/bundler/blob/2-1-stable/CHANGELOG.md#210pre3-november-8-2019))
  * RubyGems 3.1.0.pre.3
    ([History](https://github.com/rubygems/rubygems/blob/3.1/History.txt))
  * CSV 3.1.2
    ([NEWS](https://github.com/ruby/csv/blob/v3.1.2/NEWS.md))
  * Racc 1.4.15
  * REXML 3.2.3
    ([NEWS](https://github.com/ruby/rexml/blob/v3.2.3/NEWS.md))
  * RSS 0.2.8
    ([NEWS](https://github.com/ruby/rss/blob/v0.2.8/NEWS.md))
  * StringScanner 1.0.3
  * 기존 버전이 없는 다른 몇몇 라이브러리도 업데이트되었습니다.

* 표준 라이브러리가 기본 젬으로 승격됩니다.
  * 다음 기본 젬들이 rubygems.org 에서 배포중입니다.
    * benchmark
    * cgi
    * delegate
    * getoptlong
    * net-pop
    * net-smtp
    * open3
    * pstore
    * singleton
  * 다음 기본 젬들은 ruby-core에서는 젬으로 승격되었지만, 아직 rubygems.org에서 배포하고 있지 않습니다.
    * monitor
    * observer
    * timeout
    * tracer
    * uri
    * yaml

* 블록을 넘긴 메서드의 호출 안에서 블록이 없는 `Proc.new`와 `proc`을 사용하면 경고가 발생합니다.

* 블록을 넘긴 메서드의 호출 안에서 블록이 없는 `lambda`는 에러가 발생합니다.

* 유니코드와 에모지의 버전을 11.0.0에서 12.0.0으로 업데이트했습니다.
  [[Feature #15321]](https://bugs.ruby-lang.org/issues/15321)

* 유니코드를 일본의 새로운 연호 레이와를 가리키는 코드(U+32FF SQUARE ERA NAME REIWA)에 대한 지원을 추가한 12.1.0으로 업데이트했습니다.
  [[Feature #15195]](https://bugs.ruby-lang.org/issues/15195)

* `Date.jisx0301`, `Date#jisx0301`, `Date.parse`에서 새 일본 연호를 지원합니다.
  [[Feature #15742]](https://bugs.ruby-lang.org/issues/15742)

* 루비 빌드에 C99를 지원하는 컴파일러를 요구합니다.
  [[Misc #15347]](https://bugs.ruby-lang.org/issues/15347)
  * 이에 대한 자세한 정보: <https://bugs.ruby-lang.org/projects/ruby-master/wiki/C99>

* ~~`Regexp#match{?}`에 `nil`을 넘기면 String, Symbol에서처럼 TypeError를 던집니다.
  [[Feature #13083]](https://bugs.ruby-lang.org/issues/13083)~~ 취소되었습니다.

[NEWS](https://github.com/ruby/ruby/blob/v2_7_0_rc1/NEWS)나
[커밋 로그](https://github.com/ruby/ruby/compare/v2_6_0...v2_7_0_rc1)에서
더 자세한 설명을 확인할 수 있습니다.

이러한 변경사항에 따라, 루비 2.6.0 이후로 [파일 {{ release.stats.files_changed }}개 수정, {{ release.stats.insertions }}줄 추가(+), {{ release.stats.deletions }}줄 삭제(-)](https://github.com/ruby/ruby/compare/v2_6_0...v2_7_0_rc1)가 이루어졌습니다!
루비 2.7을 즐겨주시기 바랍니다!

## 다운로드

* <{{ release.url.bz2 }}>

      SIZE: {{ release.size.bz2 }}
      SHA1: {{ release.sha1.bz2 }}
      SHA256: {{ release.sha256.bz2 }}
      SHA512: {{ release.sha512.bz2 }}

* <{{ release.url.gz }}>

      SIZE: {{ release.size.gz }}
      SHA1: {{ release.sha1.gz }}
      SHA256: {{ release.sha256.gz }}
      SHA512: {{ release.sha512.gz }}

* <{{ release.url.xz }}>

      SIZE: {{ release.size.xz }}
      SHA1: {{ release.sha1.xz }}
      SHA256: {{ release.sha256.xz }}
      SHA512: {{ release.sha512.xz }}

* <{{ release.url.zip }}>

      SIZE: {{ release.size.zip }}
      SHA1: {{ release.sha1.zip }}
      SHA256: {{ release.sha256.zip }}
      SHA512: {{ release.sha512.zip }}

## 루비는

루비는 1993년에 Matz(마츠모토 유키히로)가 처음 개발했고, 현재는 오픈 소스로서 개발되고 있습니다.
이는 여러 플랫폼에서 동작하며, 특히 웹 개발에서 전 세계적으로 이용되고 있습니다.
