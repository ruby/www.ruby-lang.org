---
layout: news_post
title: "Ruby 3.1.0 릴리스"
author: "naruse"
translator: "deopard"
date: 2021-12-25 00:00:00 +0000
lang: ko
---

{% assign release = site.data.releases | where: "version", "3.1.0" | first %}

Ruby {{ release.version }} 릴리스를 알리게 되어 기쁩니다. Ruby 3.1은 Ruby 3.0과 호환성을 유지하며 새로운 여러 기능을 포함합니다.


## YJIT: 새로운 실험 인프로세스 JIT 컴파일러

Ruby 3.1은 Shopify에서 개발한 새로운 인프로세스 JIT 컴파일러인 YJIT를 포함합니다.

[Ruby 2.6이 2018년도에 MJIT를 발표](https://www.ruby-lang.org/en/news/2018/12/25/ruby-2-6-0-released/)한 뒤, 성능은 굉장히 향상되었으며 [작년에 드디어 Ruby3x3](https://www.ruby-lang.org/ko/news/2020/12/25/ruby-3-0-0-released/)을 달성했습니다. 하지만 Optcarrot이 인상적인 속도 향상을 보여줬음에도 JIT는 실제 세계의 비즈니스 애플리케이션들에 도움을 주지는 못했습니다.

최근에 Shopify는 그들의 Rails 애플리케이션의 속도를 높이기 위해 Ruby에 많은 기여를 했습니다. YJIT는 중요한 기여로, Rails 애플리케이션의 성능 향상을 목표로 합니다.

MJIT가 메서드 기반의 JIT 컴파일러고 외부 C 컴파일러를 이용하는 반면, YJIT는 기본 블록 버전 관리를 이용하며 JIT 컴파일러를 포함합니다. 게으른 기본 블록 버전 관리(Lazy Basic Block Versioning, LBBV)를 통해 우선 메서드의 시작을 컴파일하고 인자와 변수의 타입이 동적으로 결정되면 점진적으로 나머지 부분을 컴파일합니다. 자세한 설명은 [YJIT: CRuby를 위한 기본 블록 버전 관리 JIT 컴파일러](https://dl.acm.org/doi/10.1145/3486606.3486781)를 참고하세요.

이 기술을 이용하여, YJIT는 대부분의 현실 세계 소프트웨어에 railsbench에서는 최대 22%, liquid-render에서는 최대 39%의 빠른 준비 시간과 성능 향상을 가져다줍니다.

YJIT는 아직 실험적인 기능이기 때문에 기본으로는 비활성화되어 있습니다. 만약 사용하고 싶다면 `--yjit` 명령어 옵션을 통해 활성화할 수 있습니다. 그리고 아직은 Unix 계열 x86-64 플랫폼으로만 한정되어 있습니다.

* <https://bugs.ruby-lang.org/issues/18229>
* <https://shopify.engineering/yjit-just-in-time-compiler-cruby>
* <https://www.youtube.com/watch?v=PBVLf3yfMs8>

## debug gem: 새로운 디버거

완전히 새로 쓰인 디버거인 [debug.gem](https://github.com/ruby/debug)이 포함됩니다. debug.gem은 다음 기능을 갖고 있습니다.

* 디버깅 성능 향상(디버거가 있어도 애플리케이션을 느리게 만들지 않음).
* 원격 디버깅 지원.
* 풍부한 디버깅 프론트엔드 지원(현재 VS Code와 Chrome 브라우저를 지원).
* 멀티 프로세스/멀티 스레드 디버깅 지원.
* REPL 색상 지원.
* 그 외 녹화 및 재생 기능, 추적 기능 등 다양하고 유용한 기능들.

<video autoplay="autoplay" controls="controls" muted="muted" width="764" height="510" poster="https://cache.ruby-lang.org/pub/media/ruby310_debug_demo.jpg">
  <source src="https://cache.ruby-lang.org/pub/media/ruby310_debug_demo.mp4" type="video/mp4">
</video>

Ruby는 lib/debug.rb를 포함했지만 잘 관리되지 않았고 성능과 기능에 여러 이슈가 있었습니다. debug.gem은 lib/debug.rb를 완전히 대체합니다.

## error_highlight: 백트레이스에서의 세밀한 에러 위치

빌트인 gem인 error_highlight가 도입되었습니다. 백트레이스에 세밀한 에러 위치를 추가합니다.

```
$ ruby test.rb
test.rb:1:in `<main>': undefined method `time' for 1:Integer (NoMethodError)

1.time {}
 ^^^^^
Did you mean?  times
```

현재는 `NameError`만 지원합니다.

이 gem은 기본적으로 활성화되어 있습니다. 명령어에서 `--disable-error_highlight` 옵션을 통해 비활성화할 수 있습니다. [error_highlight 저장소](https://github.com/ruby/error_highlight)를 통해 자세한 내용을 참고하세요.

## IRB 자동완성과 문서 표시

IRB는 이제 그냥 코드를 입력하기만 하면 완성 후보 다이얼로그가 나타나는 자동 완성 기능을 포함합니다. Tab과 Shift+Tab을 통해 위아래로 이동할 수 있습니다.

만약에 완성 후보를 선택할 때 문서가 설치되어 있다면, 문서 다이얼로그가 선택한 완성 후보 다이얼로그 옆에 나타나며 해당 내용을 보여줍니다. Alt+d를 눌러서 전체 문서를 읽을 수 있습니다.

<video autoplay="autoplay" controls="controls" muted="muted" width="764" height="510" poster="https://cache.ruby-lang.org/pub/media/ruby310_irb_dialog.png">
  <source src="https://cache.ruby-lang.org/pub/media/ruby310_irb_dialog.mp4" type="video/mp4">
</video>

## 다른 주목할 만한 새로운 기능

### 언어

* 해시 리터럴과 키워드 인자의 값을 생략할 수 있습니다. [[Feature #14579]](https://bugs.ruby-lang.org/issues/14579)
  * `{x:, y:}`는 `{x: x, y: y}`의 편의 문법입니다.
  * `foo(x:, y:)`는 `foo(x: x, y: y)`의 편의 문법입니다.

* 패턴 매칭에서 핀 연산자(`^`)에 표현식을 사용할 수 있습니다. [[Feature #17411]](https://bugs.ruby-lang.org/issues/17411)

  ```ruby
  Prime.each_cons(2).lazy.find_all{_1 in [n, ^(n + 2)]}.take(3).to_a
  #=> [[3, 5], [5, 7], [11, 13]]
  ```

* 한 줄 패턴 매칭에서 괄호를 생략할 수 있습니다. [[Feature #16182]](https://bugs.ruby-lang.org/issues/16182)

  ```ruby
  [0, 1] => _, x
  {y: 2} => y:
  x #=> 1
  y #=> 2
  ```

### RBS

RBS는 Ruby 프로그램의 구조를 설명하기 위한 언어입니다. 자세한 설명은 [RBS 저장소](https://github.com/ruby/rbs)를 참고하세요.

Ruby 3.0.0 이후의 업데이트:

* 제네릭 타입 파라미터를 제한할 수 있습니다. ([PR](https://github.com/ruby/rbs/pull/844))
* 제네릭 타입 별명을 지원합니다. ([PR](https://github.com/ruby/rbs/pull/823))
* `rbs collection`이 gem들의 RBS를 관리하기 위해 도입되었습니다. ([doc](https://github.com/ruby/rbs/blob/master/docs/collection.md))
* 빌트인 및 표준 라이브러리의 시그니처가 추가되거나 갱신되었습니다.
* 많은 버그 수정과 성능 향상도 포함합니다.

더 많은 정보는 [RBS changelog](https://github.com/ruby/rbs/blob/master/CHANGELOG.md)를 참고하세요.

### TypeProf

TypeProf는 Ruby를 위한 정적 타입 분석기입니다. 타입을 기술하지 않은 Ruby 코드에서 RBS의 프로토타입을 생성합니다. 자세한 내용은 [문서](https://github.com/ruby/typeprof/blob/master/doc/doc.md)를 참고하세요.

Ruby 3.0.0 이후의 핵심 업데이트는 "IDE를 위한 TypeProf"라고 불리는 실험적 IDE 지원입니다.

![Demo of TypeProf for IDE](https://cache.ruby-lang.org/pub/media/ruby310_typeprof_ide_demo.png)

VS Code 확장이 각 메서드 정의 위에 추측된(혹은 RBS 파일에 명시적으로 적힌) 메서드 시그니처를 보여주거나, 이름이나 타입 에러가 발생할 만한 코드 아래 빨간 줄을 표시하기도 하며, 메서드 이름을 자동 완성(예: 메서드 후보를 보여줌)합니다. 자세한 내용은 [문서](https://github.com/ruby/typeprof/blob/master/doc/ide.md)를 참고하세요.

그리고, 많은 버그 수정과 성능 향상을 포함합니다.

## 성능 향상

* MJIT
  * Rails와 같은 작업량을 위하여 `--jit-max-cache`의 기본 값이 100에서 10000으로 변경되었습니다.
    JIT 컴파일러는 더 이상 1000개의 명령어보다 긴 메서드의 컴파일을 건너뛰지 않습니다.
  * Rails의 Zeitwerk를 지원하기 위하여, 클래스 이벤트의 TracePoint가
    활성화되었을 때 JIT된 코드를 더 이상 취소하지 않습니다.

## 그 외 3.0 이후 주목할 만한 변화

* 한 줄 패턴 매칭(예: `ary => [x, y, z]`)은 더 이상 실험적이지 않습니다.
* 다중 대입의 평가 순서가 살짝 변경되었습니다. [[Bug #4443]](https://bugs.ruby-lang.org/issues/4443)
  * `foo[0], bar[0] = baz, qux`는 Ruby 3.0에서 `baz`, `qux`, `foo`, `bar` 순으로 평가되었습니다. Ruby 3.1에선 `foo`, `bar`, `baz`, `qux` 순으로 평가됩니다.
* 변수 너비 할당: 문자열 (실험적). [[Bug #18239]](https://bugs.ruby-lang.org/issues/18239)

* Psych 4.0은 `Psych.load`가 기본적으로 `safe_load`를 사용하도록 변경되었습니다.
  이런 행동으로 바꾸기 위해서는 Psych 3.3.2를 사용해야 할 수 있습니다.
  [[Bug #17866]](https://bugs.ruby-lang.org/issues/17866)

### 표준 라이브러리 업데이트

* 다음 기본 gem이 업데이트 되었습니다.
  * RubyGems 3.3.3
  * base64 0.1.1
  * benchmark 0.2.0
  * bigdecimal 3.1.1
  * bundler 2.3.3
  * cgi 0.3.1
  * csv 3.2.2
  * date 3.2.2
  * did_you_mean 1.6.1
  * digest 3.1.0
  * drb 2.1.0
  * erb 2.2.3
  * error_highlight 0.3.0
  * etc 1.3.0
  * fcntl 1.0.1
  * fiddle 1.1.0
  * fileutils 1.6.0
  * find 0.1.1
  * io-console 0.5.10
  * io-wait 0.2.1
  * ipaddr 1.2.3
  * irb 1.4.1
  * json 2.6.1
  * logger 1.5.0
  * net-http 0.2.0
  * net-protocol 0.1.2
  * nkf 0.1.1
  * open-uri 0.2.0
  * openssl 3.0.0
  * optparse 0.2.0
  * ostruct 0.5.2
  * pathname 0.2.0
  * pp 0.3.0
  * prettyprint 0.1.1
  * psych 4.0.3
  * racc 1.6.0
  * rdoc 6.4.0
  * readline 0.0.3
  * readline-ext 0.1.4
  * reline 0.3.0
  * resolv 0.2.1
  * rinda 0.1.1
  * ruby2_keywords 0.0.5
  * securerandom 0.1.1
  * set 1.0.2
  * stringio 3.0.1
  * strscan 3.0.1
  * tempfile 0.1.2
  * time 0.2.0
  * timeout 0.2.0
  * tmpdir 0.1.2
  * un 0.2.0
  * uri 0.11.0
  * yaml 0.2.0
  * zlib 2.1.1
* 다음 내장 gem이 업데이트 되었습니다.
  * minitest 5.15.0
  * power_assert 2.0.1
  * rake 13.0.6
  * test-unit 3.5.3
  * rexml 3.2.5
  * rbs 2.0.0
  * typeprof 0.21.1
* 다음 기본 gem은 이제 내장 gem입니다. bundler 환경에서는 `Gemfile`에 다음 라이브러리를 추가해야 합니다.
  * net-ftp 0.1.3
  * net-imap 0.2.2
  * net-pop 0.1.1
  * net-smtp 0.3.1
  * matrix 0.4.2
  * prime 0.1.2
  * debug 1.4.0

더 자세한 내용은 [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)나
[커밋 로그](https://github.com/ruby/ruby/compare/v3_0_0...{{ release.tag }})를
확인해주세요.

이러한 변경사항에 따라, Ruby 3.0.0 이후로 [파일 {{ release.stats.files_changed }}개 수정, {{ release.stats.insertions }}줄 추가(+), {{ release.stats.deletions }}줄 삭제(-)](https://github.com/ruby/ruby/compare/v3_0_0...{{ release.tag }}#file_bucket)
가 이루어졌습니다!

메리 크리스마스, 해피 홀리데이, 그리고 Ruby 3.1과 함께 프로그래밍을 즐겨보세요!

## 다운로드

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

## Ruby는

Ruby는 1993년에 Matz(마츠모토 유키히로) 씨가 처음 개발했고,
현재는 오픈 소스로서 개발되고 있습니다. 여러 플랫폼에서 동작하며,
특히 웹 개발에서 전 세계적으로 이용되고 있습니다.
