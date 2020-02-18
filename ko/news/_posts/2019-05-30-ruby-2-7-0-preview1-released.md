---
layout: news_post
title: "루비 2.7.0-preview1 릴리스"
author: "naruse"
translator: "shia"
date: 2019-05-30 00:00:00 +0000
lang: ko
---

루비 2.7.0-preview1 릴리스를 알리게 되어 기쁩니다.

프리뷰 버전은 12월에 예정된 최종 릴리스에 대한 의견을 모으기 위해서 릴리스됩니다. 이는 많은 새 기능과 성능 향상을 포함하고 있습니다. 특히 눈에 띄는 것은 이하입니다.

* 압축 GC
* 패턴 매칭
* REPL 개선

## 압축 GC

이 릴리스는 단편화된 메모리를 최적화할 수 있는 압축 GC를 도입합니다.

몇몇 멀티 스레드를 이용하는 루비 프로그램은 메모리 단편화를 일으킬 수 있고, 이는 과다한 메모리 사용과 성능 저하로 이어질 수 있습니다.

힙 공간을 압축하는 `GC.compact` 메서드가 도입되었습니다. 이 기능은 더 적은 페이지를 사용하고, 힙이 CoW(Copy on Write)에 유리하도록 힙 내부에 살아있는 객체들을 압축합니다. [#15626](https://bugs.ruby-lang.org/issues/15626)

## 패턴 매칭 [Experimental]

함수형 언어에서 널리 알려진 패턴 매칭 기능이 실험적으로 도입되었습니다. [#14912](https://bugs.ruby-lang.org/issues/14912)
이는 패턴에 일치하는 경우, 주어진 객체를 순회하여 그 값을 대입합니다.

```ruby
case JSON.parse('{...}', symbolize_names: true)
in {name: "Alice", children: [{name: "Bob", age: age}]}
  p age
  ...
end
```

더 자세한 설명은 [Pattern matching - New feature in Ruby 2.7](https://speakerdeck.com/k_tsj/pattern-matching-new-feature-in-ruby-2-dot-7)을 확인해 주세요.

## REPL 개선

루비에 기본으로 포함되어 있는 상호작용 환경(REPL; Read-Eval-Print-Loop)인 `irb`가 이제 여러 줄 입력을 지원합니다. 이는 `readline`과 호환되는 순수 루비 구현인 `reline`으로 동작합니다.
또한 rdoc 통합도 제공됩니다. `irb`에서 주어진 클래스, 모듈, 메서드의 레퍼런스를 볼 수 있습니다. [#14683](https://bugs.ruby-lang.org/issues/14683), [#14787](https://bugs.ruby-lang.org/issues/14787), [#14918](https://bugs.ruby-lang.org/issues/14918)
그뿐만 아니라, `binding.irb`에서 보이는 소스 코드나 코어 클래스 객체의 inspect 결과에 색이 추가되었습니다.

<video autoplay="autoplay" controls="controls" muted="muted" width="576" height="259">
  <source src="https://cache.ruby-lang.org/pub/media/irb_improved_with_key_take2.mp4" type="video/mp4">
</video>

## 이외의 주목할 만한 새 기능

* 메서드 참조 연산자 <code>.:</code>가 실험적으로 도입되었습니다. [#12125](https://bugs.ruby-lang.org/issues/12125), [#13581](https://bugs.ruby-lang.org/issues/13581)

* 번호 지정 파라미터가 기본 블록 파라미터로서 실험적으로 도입되었습니다. [#4475](https://bugs.ruby-lang.org/issues/4475)

* 시작 값을 지정하지 않는 범위 연산자가 실험적으로 추가됩니다. 종료 지정이 없는 범위 연산자처럼 유용하지
  않을 수도 있습니다만, DSL 용도로는 유용할 것입니다. [#14799](https://bugs.ruby-lang.org/issues/14799)

      ary[..3]  # identical to ary[0..3]
      rel.where(sales: ..100)

* `Enumerable#tally`가 추가됩니다. 이는 각 요소가 몇번 출현했는지를 셉니다.

      ["a", "b", "c", "b"].tally
      #=> {"a"=>1, "b"=>2, "c"=>1}

## 성능 향상

* JIT [Experimental]

  * 최적화 가정이 유효하지 않은 경우 JIT으로 컴파일 된 코드는 최적화 레벨이 낮은 코드로 재컴파일 됩니다.

  * 순수하다고 판단된 메서드를 인라인으로 삽입하게 됩니다. 이 최적화는 아직 실험적이며 많은 메서드는 아직 순수하다고 판정되지 않은 상태입니다.

  * `--jit-min-calls`의 기본값이 5에서 10,000으로 변경됩니다.

  * `--jit-max-cache`의 기본값이 1,000에서 100으로 변경됩니다.

## 그 이외의 2.6 이후로 주목할 만한 변경

* 블록을 넘긴 메서드의 호출 안에서 블록이 없는 `Proc.new`와 `proc`을 사용하면 경고가 발생합니다.

* 블록을 넘긴 메서드의 호출 안에서 블록이 없는 `lambda`는 에러가 발생합니다.

* 유니코드와 에모지의 버전을 11.0.0에서 12.0.0으로 갱신했습니다. [[Feature #15321]](https://bugs.ruby-lang.org/issues/15321)

* 유니코드를 일본의 새로운 연호 레이와를 가리키는 코드(U+32FF SQUARE ERA NAME REIWA)에 대한 지원을 추가한 12.1.0으로 갱신했습니다. [[Feature #15195]](https://bugs.ruby-lang.org/issues/15195)

* JIS X 0301의 새 버전이 나올 때까지 잠정적으로 `Date.jisx0301`, `Date#jisx0301`, `Date.parse`에 새 일본 연호를 대응했습니다. [[Feature #15742]](https://bugs.ruby-lang.org/issues/15742)

* 루비 빌드에 C99를 지원하는 컴파일러를 요구하게 됩니다. [[Misc #15347]](https://bugs.ruby-lang.org/issues/15347)
  * 이에 대한 자세한 정보: <https://bugs.ruby-lang.org/projects/ruby-master/wiki/C99>

[NEWS](https://github.com/ruby/ruby/blob/v2_7_0_preview1/NEWS)나 [커밋 로그](https://github.com/ruby/ruby/compare/v2_6_0...v2_7_0_preview1)에서 더 자세한 설명을 확인할 수 있습니다.

이러한 변경사항에 따라, 루비 2.6.0 이후로 [파일 1727개 수정, 76022줄 추가(+), 60286줄 삭제(-)](https://github.com/ruby/ruby/compare/v2_6_0...v2_7_0_preview1)가 이루어졌습니다!

루비 2.7을 즐겨주시기 바랍니다!

## 다운로드

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview1.tar.gz>

      SIZE:   16021286 bytes
      SHA1:   2fbecf42b03a9d4391b81de42caec7fa497747cf
      SHA256: c44500af4a4a0c78a0b4d891272523f28e21176cf9bc1cc108977c5f270eaec2
      SHA512: f731bc9002edd3a61a4955e4cc46a75b5ab687a19c7964f02d3b5b07423d2360d25d7be5df340e884ca9945e3954e68e5eb11b209b65b3a687c71a1abc24b91f

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview1.zip>

      SIZE:   20283343 bytes
      SHA1:   7488346fa8e58203a38158752d03c8be6b1da65b
      SHA256: fdf25573e72e1769b51b8d541d0e1a894a5394dbfdf1b08215aa093079cca64c
      SHA512: b3b1f59dce94c242ef88a4e68381a4c3a6f90ba0af699083e5a1a00b0fb1dce580f057dad25571fe789ac9aa95aa6e9c071ebb330328dc822217ac9ea9fbeb3f

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview1.tar.bz2>

      SIZE:   14038296 bytes
      SHA1:   f7e70cbc2604c53a9e818a2fc59cd0e2d6c859fa
      SHA256: d45b4a1712ec5c03a35e85e33bcb57c7426b856d35e4f04f7975ae3944d09952
      SHA512: a36b241fc1eccba121bb7c2cc5675b11609e0153e25a3a8961b67270c05414b1aa669ce5d4a5ebe4c6b2328ea2b8f8635fbba046b70de103320b3fdcb3d51248

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview1.tar.xz>

      SIZE:   11442988 bytes
      SHA1:   45e467debc194847a9e3afefb20b11e6dc28ea31
      SHA256: 8c546df3345398b3edc9d0ab097846f033783d33762889fd0f3dc8bb465c3354
      SHA512: d416e90bfa3e49cc0675c4c13243c8ec319b7a0836add1bd16bd7662d09eaf46656d26e772ef3b097e10779896e643edd8a6e4f885147e3235257736adfdf3b5

## 루비는

루비는 1993년에 Matz(마츠모토 유키히로)가 처음 개발했고, 현재는 오픈 소스로서 개발되고 있습니다. 이는 여러 플랫폼에서 동작하며, 특히 웹 개발에서 전 세계적으로 이용되고 있습니다.
