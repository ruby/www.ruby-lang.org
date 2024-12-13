---
layout: news_post
title: "Ruby 3.4.0 rc1 릴리스"
author: "naruse"
translator: "shia"
date: 2024-12-12 00:00:00 +0000
lang: ko
---

{% assign release = site.data.releases | where: "version", "3.4.0-rc1" | first %}
Ruby {{ release.version }} 릴리스를 알리게 되어 기쁩니다.

## Prism

parse.y에서 Prism으로 기본 파서를 변경했습니다. [[Feature #20564]]

## 모듈러 GC

* 다른 가비지 컬렉터(GC) 구현을 모듈러 가비지 컬렉터 기능을 통해 동적으로 로드할 수 있습니다.
  이 기능을 활성화하려면 Ruby 빌드 시에 `--with-modular-gc`를 설정하세요. GC 라이브러리는
  환경 변수 `RUBY_GC_LIBRARY`를 사용하여 런타임에 로드할 수 있습니다.
  [[Feature #20351]]

* Ruby의 내장 가비지 컬렉터는 `gc/default/default.c`에 분리되어 있으며,
  `gc/gc_impl.h`에 정의된 API를 사용하여 Ruby와 상호 작용합니다.
  내장 가비지 컬렉터는 `make modular-gc MODULAR_GC=default`를 사용하여
  라이브러리로서 빌드하고 환경 변수 `RUBY_GC_LIBRARY=default`를
  사용하여 활성화할 수 있습니다. [[Feature #20470]]

* [MMTk](https://www.mmtk.io/)를 기반으로 한 실험적인 GC 라이브러리가 제공됩니다.
  이 GC 라이브러리는 `make modular-gc MODULAR_GC=mmtk`를 사용하여 빌드하고
  환경 변수 `RUBY_GC_LIBRARY=mmtk`를 사용하여 활성화할 수 있습니다.
  이는 빌드 머신에 Rust 도구 체인이 필요합니다. [[Feature #20860]]


## 언어 변경

* 파일에 `frozen_string_literal` 주석이 없을 때, 문자열 리터럴이 변경되면
  폐기 예정 경고를 출력합니다.
  이 경고는 `-W:deprecated`나 `Warning[:deprecated] = true` 설정을 통해 활성화할 수 있습니다.
  이 변경을 무효화하고 싶다면 Ruby를 실행할 때 `--disable-frozen-string-literal` 커맨드라인 인수를
  사용하세요. [[Feature #20205]]

* 블록 인자를 가리키는 `it`이 추가됩니다. [[Feature #18980]]

* 메서드 호출 시에 `nil`에 키워드 스플랫을 지원합니다.
  `**nil`은 `**{}`와 비슷하게 동작하며, 키워드를 넘기지 않으며,
  어떤 변환 메서드도 호출하지 않습니다. [[Bug #20064]]

* 블록을 인덱스로 사용할 수 없게 됩니다. [[Bug #19918]]

* 키워드 인수를 인덱스로 사용할 수 없게 됩니다. [[Bug #20218]]

## YJIT

TL;DR:
* x86-64와 arm64 플랫폼에서 대부분의 벤치마크에서 성능이 향상되었습니다.
* YJIT 메타 데이터 컴파일의 메모리 사용량이 줄었습니다.
* 여러 버그가 수정되었습니다. YJIT는 이제 더 견고하고 잘 테스트되었습니다.

새 기능:
* YJIT의 메모리 사용량을 추적하는 통합 메모리 제한을 `--yjit-mem-size`
  커맨드 라인 옵션(기본값 128 MiB)으로 추가했습니다.
  이는 이전 `--yjit-exec-mem-size`보다 직관적이며, YJIT의 전체 메모리 사용량을 추적합니다.
* 이제 `RubyVM::YJIT.runtime_stats`를 통해 항상 더 많은 통계가 사용 가능합니다.
* `--yjit-log`를 통해 무엇이 컴파일되었는지 추적하는 컴파일 로그를 추가했습니다.
  * 실행 중에도 로그의 마지막 부분을 `RubyVM::YJIT.log`로 확인할 수 있습니다.
* 멀티 Ractor 모드에서 공유 가능한 상수를 지원합니다.
* `--yjit-track-exits=COUNTER`로 종료한 횟수를 추적할 수 있습니다.

새 최적화:
* YJIT 메타 데이터를 저장하는 데 필요한 메모리를 줄이는 콘텍스트 압축.
* 로컬 변수를 위한 레지스터를 할당할 수 있는 개선된 할당기.
* YJIT을 사용할 때 Ruby로 작성된 더 많은 코어 프리미티브를 사용합니다.
  * 성능을 높이기 위해 Ruby로 다시 작성된 `Array#each`, `Array#select`, `Array#map` [[Feature #20182]].
* 작고 사소한 메서드를 인라인으로 변환하는 능력.
  * 빈 메서드
  * 상수를 반환하는 메서드
  * `self`를 반환하는 메서드
  * 인수를 직접 반환하는 메서드
* 더 많은 실행시간 메서드에 대한 특별한 코드 생성
* `String#getbyte`, `String#setbyte` 및 다른 문자열 메서드를 최적화
* 저 레벨 비트/바이트 조작을 빠르게 하기 위한 비트 연산 최적화
* 다양한 다른 점진적 최적화

## 코어 클래스 변경

주의: 눈에 띄는 클래스 변경만을 포함합니다.

* Exception

  * `Exception#set_backtrace`는 이제 `Thread::Backtrace::Location`의 배열을 입력으로 받을 수 있습니다.
    `Kernel#raise`, `Thread#raise`와 `Fiber#raise`도 같은 형식의 입력을 받습니다. [[Feature #13557]]

* Range

  * `Range#size`는 이제 범위가 순회 가능하지 않다면 `TypeError`를 던집니다. [[Misc #18984]]



## 호환성 문제

주의: 기능 버그 수정은 포함되어 있지 않습니다.

* 에러 메시지와 백트레이스의 출력 결과가 변경됩니다.
  * 여는 따옴표로 백틱 대신 작은따옴표를 사용합니다. [[Feature #16495]]
  * 메서드 이름 앞에 클래스 이름을 출력합니다(클래스가 불변하는 이름을 가지고 있는 경우만). [[Feature #19117]]
  * `Kernel#caller`, `Thread::Backtrace::Location`의 메서드 등도 마찬가지로 변경됩니다.

  ```
  Old:
  test.rb:1:in `foo': undefined method `time' for an instance of Integer
          from test.rb:2:in `<main>'

  New:
  test.rb:1:in 'Object#foo': undefined method 'time' for an instance of Integer
          from test.rb:2:in '<main>'
  ```

## C API 변경

* `rb_newobj`와 `rb_newobj_of`(그리고 대응하는 매크로인 `RB_NEWOBJ`, `RB_NEWOBJ_OF`, `NEWOBJ`, `NEWOBJ_OF`)가 삭제됩니다. [[Feature #20265]]
* 폐기 예정인 `rb_gc_force_recycle` 함수가 삭제됩니다. [[Feature #18290]]

## 그 이외의 변경

* 상세 모드(`-w`)에서 메서드에 넘긴 블록이 사용되지 않았을 때
  경고를 출력합니다.
  [[Feature #15554]]

* `String.freeze`나 `Integer#+`처럼 인터프리터와 JIT이 특별히 최적화하는
  몇몇 코어 메서드를 재정의하면 성능 클래스
  경고(`-W:performance`나 `Warning[:performance] = true`)를 출력합니다.
  [[Feature #20429]]

기본 gem 또는 내장 gem에 대한 자세한 내용은 [Logger](https://github.com/ruby/logger/releases)와 같은
GitHub 릴리스 또는 변경 로그에서 확인하세요.

더 자세한 내용은 [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)나
[커밋 로그](https://github.com/ruby/ruby/compare/v3_3_0...{{ release.tag }})를
확인해 주세요.

이러한 변경사항에 따라, Ruby 3.3.0 이후로 [파일 {{ release.stats.files_changed }}개 수정, {{ release.stats.insertions }}줄 추가(+), {{ release.stats.deletions }}줄 삭제(-)](https://github.com/ruby/ruby/compare/v3_3_0...{{ release.tag }}#file_bucket)가
이루어졌습니다!


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

[Feature #13557]: https://bugs.ruby-lang.org/issues/13557
[Feature #15554]: https://bugs.ruby-lang.org/issues/15554
[Feature #16495]: https://bugs.ruby-lang.org/issues/16495
[Feature #18290]: https://bugs.ruby-lang.org/issues/18290
[Feature #18980]: https://bugs.ruby-lang.org/issues/18980
[Misc #18984]:    https://bugs.ruby-lang.org/issues/18984
[Feature #19117]: https://bugs.ruby-lang.org/issues/19117
[Bug #19918]:     https://bugs.ruby-lang.org/issues/19918
[Bug #20064]:     https://bugs.ruby-lang.org/issues/20064
[Feature #20182]: https://bugs.ruby-lang.org/issues/20182
[Feature #20205]: https://bugs.ruby-lang.org/issues/20205
[Bug #20218]:     https://bugs.ruby-lang.org/issues/20218
[Feature #20265]: https://bugs.ruby-lang.org/issues/20265
[Feature #20351]: https://bugs.ruby-lang.org/issues/20351
[Feature #20429]: https://bugs.ruby-lang.org/issues/20429
[Feature #20470]: https://bugs.ruby-lang.org/issues/20470
[Feature #20564]: https://bugs.ruby-lang.org/issues/20564
[Feature #20860]: https://bugs.ruby-lang.org/issues/20860
