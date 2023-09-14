---
layout: news_post
title: "Ruby 3.3.0-preview1 릴리스"
author: "naruse"
translator: "shia"
date: 2023-05-12 00:00:00 +0000
lang: ko
---

{% assign release = site.data.releases | where: "version", "3.3.0-preview1" | first %}

Ruby {{ release.version }} 릴리스를 알리게 되어 기쁩니다. Ruby 3.3은 RJIT으로 명명된 새로운 순수 Ruby JIT 컴파일러를 추가하고, 파서 생성기로 Lrama를 사용하며, 특히 YJIT에서 많은 성능 향상이 있습니다.

## RJIT

* 순수 Ruby JIT 컴파일러 RJIT을 도입하고 MJIT을 대체했습니다.
  * RJIT은 Unix 플랫폼에서 x86\_64 아키텍처만 지원합니다.
  * MJIT과 달리 런타임에 C 컴파일러가 필요하지 않습니다.
* RJIT은 실험 목적으로 존재합니다.
  * 프로덕션 환경에서는 YJIT을 계속 사용해야 합니다.
* Ruby용 JIT 개발에 관심이 있다면 [RubyKaigi 2023 3일차에 있었던 k0kubun의 발표](https://rubykaigi.org/2023/presentations/k0kubun.html#day3)를 확인하세요.

## Bison을 Lrama로 대체

* Bison 대신 [Lrama LALR 파서 생성기](https://github.com/yui-knk/lrama)를 사용하도록 변경했습니다. [Feature #19637](https://bugs.ruby-lang.org/issues/19637)
  * 관심이 있다면 [Ruby 파서의 미래 비전](https://rubykaigi.org/2023/presentations/spikeolaf.html)을 참고하세요.

## YJIT

* 3.2 버전 대비 성능 대폭 향상
  * 스플랫과 나머지 인자 지원이 개선되었습니다.
  * 가상 머신의 스택 연산을 위해 레지스터가 할당됩니다.
  * 선택적 인수가 포함된 더 많은 호출이 컴파일됩니다.
  * `Integer#!=`, `String#!=`, `Kernel#block_given?`, `Kernel#is_a?`,
    `Kernel#instance_of?`, `Module#===`은 특별히 최적화되었습니다.
  * 클래스의 인스턴스 변수가 가지는 객체 형상의 조합이 매우 복잡한 경우에도
    컴파일되기 전의 바이트 코드로 전환되지 않습니다.
* 컴파일된 코드의 메타데이터가 훨씬 적은 메모리를 사용합니다.
* ARM64에서의 코드 생성 개선
* 일시 중지 모드에서 YJIT을 시작한 다음 나중에 수동으로 재개하는 옵션 추가
  * `--yjit-pause`와 `RubyVM::YJIT.resume`
  * 애플리케이션 부팅이 완료된 후에만 YJIT을 재개할 수 있습니다.
* 종료 추적 옵션이 이제 샘플링을 지원합니다.
  * `--trace-exits-sample-rate=N`
* 여러 버그 수정



## 그 이외의 주목할 만한 새 기능

### 언어



## 성능 향상

* `defined?(@ivar)`가 객체 형상에 맞게 최적화되었습니다.

## 그 이외의 3.2 이후로 주목할 만한 변경



## 호환성 문제

주의: 기능 버그 수정은 포함되어 있지 않습니다.

### 삭제된 상수

폐기 예정이었던 상수가 삭제됩니다.



### 삭제된 메서드

폐기 예정이었던 메서드가 삭제됩니다.



## Stdlib 호환성 문제

### `ext/readline` 폐기

* 우리는 `ext/readline` API와 호환되는 순수 Ruby 구현인 `reline`을 가지고 있습니다. 앞으로는 `reline`에 의존할 것입니다. `ext/readline`을 사용해야 하는 경우, `gem install readline-ext`를 사용하여 rubygems.org를 통해 `ext/readline`을 설치할 수 있습니다.
* 이제 더 이상 `libreadline` 또는 `libedit`과 같은 라이브러리를 설치할 필요가 없습니다.

## C API 변경

### 갱신된 C API

다음 API가 갱신됩니다.



### 삭제된 C API

다음 폐기 예정인 API가 삭제됩니다.



### 표준 라이브러리 갱신



다음 기본 gem이 갱신되었습니다.

* RubyGems 3.5.0.dev
* bigdecimal 3.1.4
* bundler 2.5.0.dev
* csv 3.2.7
* fiddle 1.1.2
* fileutils 1.7.1
* irb 1.6.4
* optparse 0.4.0.pre.1
* psych 5.1.0
* reline 0.3.3
* stringio 3.0.7
* strscan 3.0.7
* syntax_suggest 1.0.4
* time 0.2.2
* timeout 0.3.2
* uri 0.12.1

다음 내장 gem이 갱신되었습니다.

* minitest 5.18.0
* rbs 3.1.0
* typeprof 0.21.7
* debug 1.8.0

기본 gem 또는 내장 gem에 대한 자세한 내용은 [Logger](https://github.com/ruby/logger/releases)와 같은
GitHub 릴리스 또는 변경 로그에서 확인하세요.

더 자세한 내용은 [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)나
[커밋 로그](https://github.com/ruby/ruby/compare/v3_2_0...{{ release.tag }})를
확인해 주세요.

이러한 변경사항에 따라, Ruby 3.2.0 이후로 [파일 {{ release.stats.files_changed }}개 수정, {{ release.stats.insertions }}줄 추가(+), {{ release.stats.deletions }}줄 삭제(-)](https://github.com/ruby/ruby/compare/v3_2_0...{{ release.tag }}#file_bucket)가
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
