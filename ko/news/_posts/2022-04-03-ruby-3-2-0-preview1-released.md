---
layout: news_post
title: "Ruby 3.2.0 Preview 1 릴리스"
author: "naruse"
translator: "shia"
date: 2022-04-03 00:00:00 +0000
lang: ko
---

{% assign release = site.data.releases | where: "version", "3.2.0-preview1" | first %}

Ruby {{ release.version }} 릴리스를 알리게 되어 기쁩니다. Ruby 3.2는 많은 기능과 성능 향상을 포함하고 있습니다.


## WASI 기반 웹어셈블리 지원

WASI에 기반해 웹어셈블리를 지원하는 첫 이식판입니다. 이를 통해 CRuby 바이너리는 웹 브라우저, 서버리스 엣지 환경, 그 이외의 웹어셈블리/WASI를 사용 가능한 환경에서 동작할 수 있습니다. 현재 이 이식판은 스레드 API를 사용하지 않는 기본적인 테스트와 부트스트랩 테스트 스위트를 통과합니다.

![](https://i.imgur.com/opCgKy2.png)

### 배경

[웹어셈블리(Wasm)](https://webassembly.org/)는 본래 웹 브라우저에서 프로그램을 안전하고 빠르게 실행하기 위해서 만들어졌습니다. 하지만 그 목적 중 하나인 프로그램을 다양한 환경에서 안전하고 효율적으로 실행하는 것은 웹뿐만이 아니라 일반적인 애플리케이션도 바라던 것입니다.

[WASI(The WebAssembly System Interface)](https://wasi.dev/)는 이러한 용도를 위해 설계되었습니다. 이러한 애플리케이션은 운영체제와 통신해야 합니다만, 웹어셈블리는 시스템 인터페이스를 가지지 않는 가상 머신 위에서 동작합니다. WASI는 이 인터페이스를 표준화합니다.

Ruby의 웹어셈블리/WASI 지원은 이러한 프로젝트들을 활용하기 위함입니다. 이를 통해 Ruby 개발자들이 약속한 플랫폼에서 움직이는 애플리케이션을 작성할 수 있습니다.

### 사용 예시

이는 개발자가 웹어셈블리 환경에서 CRuby를 활용할 수 있도록 돕습니다. 하나의 예로, [TryRuby playground](https://try.ruby-lang.org/playground/)의 CRuby 지원이 있습니다. 이제 CRuby를 웹 브라우저 상에서 직접 사용해볼 수 있습니다.

### 기술적인 부분

현재 WASI와 웹어셈블리 자체에는 Fiber, 예외 처리, GC를 구현하기 위한 일부 기능이 부족합니다. 이는 여전히 개발중이라는 점도 있지만, 보안 때문이기도 합니다. 그래서 CRuby는 사용자 공간에서의 실행을 제어하기 위한 바이너리 변환 기술인 Asyncify를 사용해 그 차이를 메꿉니다.

나아가서 Ruby 앱을 간단하게 단일 .wasm 파일로 패키징할 수 있도록 [WASI 상에 VFS](https://github.com/kateinoigakukun/wasi-vfs/wiki/Getting-Started-with-CRuby)를 구현했습니다. 이는 Ruby 앱의 배포를 쉽게 해줄 것입니다.


### 관련 링크

* [Add WASI based WebAssembly support #5407](https://github.com/ruby/ruby/pull/5407)
* [An Update on WebAssembly/WASI Support in Ruby](https://itnext.io/final-report-webassembly-wasi-support-in-ruby-4aface7d90c9)

## 정규표현식 타임아웃

정규표현식 일치 처리에 타임아웃 기능을 도입했습니다.

```ruby
Regexp.timeout = 1.0

/^a*b?a*$/ =~ "a" * 50000 + "x"
#=> 1초 후에 Regexp::TimeoutError 발생
```

정규표현식 일치는 기대와는 다르게 시간이 오래 걸리는 경우가 있습니다. 신뢰할 수 없는 입력에 대해서 비효율적일 가능성이 있는 정규표현식을 일치시키고 있다면, 공격자는 이를 이용해 효율적으로 서비스 거부 공격(이를 정규표현식 DoS, 또는 ReDoS라고 부릅니다)이 가능합니다.

Ruby 애플리케이션의 요구사항에 맞는 `Regexp.timeout`을 설정해 DoS에 대한 위험을 예방하거나 상당히 완화할 수 있습니다. 애플리케이션에 직접 설정해보세요. 피드백도 환영합니다.

`Regexp.timeout`은 전역 설정임에 주의하세요. 일부의 특수한 정규표현식에 대해서만 다른 타임아웃 설정을 사용하고 싶다면, `Regexp.new` 의 `timeout` 키워드를 사용할 수 있습니다.

```ruby
Regexp.timeout = 1.0

# 이 정규표현식은 타임아웃 설정이 없습니다.
long_time_re = Regexp.new("^a*b?a*$", timeout: nil)

long_time_re =~ "a" * 50000 + "x" # 타임아웃이 발생하지 않습니다.
```

기능 제안 티켓: https://bugs.ruby-lang.org/issues/17837


## 그 이외의 주목할 만한 새 기능

### 서드파티 소스 코드를 더이상 내장하지 않음

* `libyaml`이나 `libffi`와 같은 서드파티의 소스 코드를 내장하지 않기로 결정했습니다.

    * psych에 포함되어 있던 libyaml의 소스 코드는 삭제되었습니다. Ubuntu/Debian 환경이라면 직접 `libyaml-dev`를 설치해야합니다. 이 패키지의 이름은 각 환경마다 다를 수 있습니다.

    * `fiddle`에 포함되어 있던 libffi는 preview2에서 삭제될 예정입니다.

### 언어

* 검색 패턴은 이제 정식 기능입니다.


## 성능 향상



## 그 이외의 3.1 이후로 주목할 만한 변경

* Hash
    * Hash#shift는 이제 해시가 비어있다면
      기본 값이나 기본 프록을 호출한 결과 값을 반환하는 대신
      언제나 nil을 반환합니다. [[Bug #16908]]

* MatchData
    * MatchData#byteoffset이 추가되었습니다. [[Feature #13110]]

* Module
    * Module.used_refinements가 추가되었습니다. [[Feature #14332]]
    * Module#refinements가 추가되었습니다. [[Feature #12737]]
    * Module#const_added가 추가되었습니다. [[Feature #17881]]

* Proc
    * Proc#dup은 서브클래스의 인스턴스를 반환합니다. [[Bug #17545]]
    * Proc#parameters는 이제 람다 키워드를 받습니다. [[Feature #15357]]

* Refinement
    * Refinement#refined_class가 추가되었습니다. [[Feature #12737]]

* Set
    * Set은 이제 `require "set"`할 필요 없이 사용 가능한 내장 클래스입니다. [[Feature #16989]]
      현재는 `Set` 상수를 사용하거나 `Enumerable#to_set`을 호출하면 자동으로 로드됩니다.

* String
    * String#byteindex와 String#byterindex가 추가되었습니다. [[Feature #13110]]
    * 유니코드 버전이 14.0.0, 에모지 버전이 14.0으로 갱신되었습니다. [[Feature #18037]]
      (이는 정규표현식에도 적용됩니다)
    * String#bytesplice가 추가되었습니다. [[Feature #18598]]

* Struct
    * `keyword_init: true` 없이 `Struct.new`에 키워드 인수를 넘겨
      Struct 클래스를 초기화할 수 있습니다. [[Feature #16806]]


### 표준 라이브러리 갱신

*   다음 기본 젬이 갱신되었습니다.

    * 미정

*   다음 내장 젬이 갱신되었습니다.

    * 미정

*   다음 기본 gem은 이제 내장 gem이 됩니다. 사용하려면 bundler 환경에서 `Gemfile`에 다음 라이브러리들을 추가해야 합니다.

    * 미정

더 자세한 내용은 [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)나
[커밋 로그](https://github.com/ruby/ruby/compare/v3_1_0...{{ release.tag }})를
확인해주세요.

이러한 변경사항에 따라, Ruby 3.1.0 이후로 [파일 {{ release.stats.files_changed }}개 수정, {{ release.stats.insertions }}줄 추가(+), {{ release.stats.deletions }}줄 삭제(-)](https://github.com/ruby/ruby/compare/v3_1_0...{{ release.tag }}#file_bucket)가
이루어졌습니다!

## Download

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
