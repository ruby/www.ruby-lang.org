---
layout: news_post
title: "Ruby 3.1.1 릴리스"
author: "naruse"
translator: "shia"
date: 2022-02-18 12:00:00 +0000
lang: ko
---

Ruby 3.1.1이 릴리스되었습니다.

3.1 안정 버전 시리즈의 첫 TEENY 버전입니다.

* [error_highlight가 -e 옵션과 함께 동작하지 않음](https://bugs.ruby-lang.org/issues/18434)
* [YJIT 이 메서드 기본 인수와 키워드 인수를 함께 사용할 때 잘못된 순서로 메서드 인수를 넘기는 문제 수정](https://bugs.ruby-lang.org/issues/18453)
* [Warning#warn 메서드를 찾을 수 없을 때 세그멘테이션 폴트가 발생함](https://bugs.ruby-lang.org/issues/18458)
* [Pathname이 디렉터리 글로빙에서 ".."를 반환하지 않음](https://bugs.ruby-lang.org/issues/18436)
* [ruby --help의 --jit-max-cache 기본값 설명을 변경](https://bugs.ruby-lang.org/issues/18469)
* [3.1.0-dev `include`를 호출하면 Module이 초기화 완료로 취급됨](https://bugs.ruby-lang.org/issues/18292)
* [Optionparser의 튜토리얼 링크가 깨짐](https://bugs.ruby-lang.org/issues/18468)
* [다른 스레드에서 Enumerator의 요소를 yield로 호출하면 세그멘테이션 폴트가 발생함](https://bugs.ruby-lang.org/issues/18475)
* [`active_decorator`가 Ruby 3.1.0에서 세그멘테이션 폴트가 발생함](https://bugs.ruby-lang.org/issues/18489)
* [Fiber에서 Process.daemon을 호출하면 세그멘테이션 폴트가 발생함](https://bugs.ruby-lang.org/issues/18497)
* [0 << (2\*\*40)는 NoMemoryError가 발생하지만 0 << (2\*\*80)는 0을 반환함](https://bugs.ruby-lang.org/issues/18517)
* [IO read/write/wait 훅 버그 수정](https://bugs.ruby-lang.org/issues/18443)
* [자기 자신을 별칭으로 지정할 때의 메모리 누수](https://bugs.ruby-lang.org/issues/18516)
* [에러: 선언하지 않은 식별자 'MAP_ANONYMOUS' 사용](https://bugs.ruby-lang.org/issues/18556)
* [\[버그\] RubyVM::InstructionSequence.load_from_binary에서 T_NONE 객체에 마킹을 시도](https://bugs.ruby-lang.org/issues/18501)
* [require를 통해 던져진 throw_data의 예외 처리](https://bugs.ruby-lang.org/issues/18562)
* [`IpAddr` 인스턴스의 `IpAddr#to_range` 호출을 수정](https://bugs.ruby-lang.org/issues/18570)
* [ipaddr.rb의 경로 수정](https://github.com/ruby/ruby/pull/5533)
* [RubyGems-3.3.7, Bundler-2.3.7을 병합](https://github.com/ruby/ruby/pull/5543)
* [비어있는 해시에 Hash#shift를 반복해서 호출하면 Ruby가 무응답 상태에 빠짐](https://bugs.ruby-lang.org/issues/18578)

자세한 사항은 [커밋 로그](https://github.com/ruby/ruby/compare/v3_1_0...v3_1_1)를 확인해 주세요.

## 다운로드

{% assign release = site.data.releases | where: "version", "3.1.1" | first %}

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

## 릴리스 코멘트

많은 커미터, 개발자, 버그를 보고해 준 사용자들이 이 릴리스를 만드는 데 도움을 주었습니다.
그들의 기여에 감사드립니다.
