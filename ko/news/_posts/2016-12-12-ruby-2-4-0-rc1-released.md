---
layout: news_post
title: "루비 2.4.0-rc1 릴리스"
author: "naruse"
translator: "yous"
date: 2016-12-12 09:00:00 +0000
lang: ko
---

루비 2.4.0-rc1의 릴리스를 알리게 되어 기쁘게 생각합니다.

루비 2.4.0-rc1은 루비 2.4.0의 첫 번째 릴리스 후보입니다.
rc1은 커뮤니티의 피드백을 받기 위해 릴리스되었습니다.
아직 기능을 고칠 수 있으니 자유롭게
[피드백을 보내주세요](https://github.com/ruby/ruby/wiki/How-To-Report).

## [해시 테이블의 성능을 향상시켰습니다(Vladimir Makarov)](https://bugs.ruby-lang.org/issues/12142)

해시 테이블(st_table)에 열린 주소 방식을 사용하고 추가순 배열을 추가함으로써
내부 구조를 개선했습니다.
이 개선 사항에 대해 많은 사람들이 토론했고, 특히 Yura Sokolov와 많은 토론이
이루어졌습니다.

## Binding#irb: `binding.pry`같은 REPL 세션을 시작합니다

디버깅 중에 변수의 값을 보려고 `p` 사용하는 경우가 많을 겁니다.
[pry](https://github.com/pry/pry)를 사용하면 애플리케이션 내에서
`binding.pry`를 사용해 REPL을 시작하고 원하는 루비 코드를 실행할 수 있습니다.
[r56624](https://github.com/ruby/ruby/commit/493e48897421d176a8faf0f0820323d79ecdf94a)에서
이와 비슷하게 irb에서 작동하는 `binding.irb`를 추가했습니다.

## [Fixnum과 Bignum을 Integer로 통합했습니다](https://bugs.ruby-lang.org/issues/12005)

[ISO/IEC 30170:2012](http://www.iso.org/iso/iso_catalogue/catalogue_tc/catalogue_detail.htm?csnumber=59579)에서
Integer 클래스의 세부 사항을 규정하고 있지 않지만,
루비에는 두 개의 Integer 클래스, Fixnum과 Bignum이 포함되어 있었습니다.
루비 2.4는 이 둘을 Integer로 통합합니다.
Fixnum이나 Bignum 클래스를 변경하는 모든 C 확장을 고쳐야 합니다.

[해당 이슈](https://bugs.ruby-lang.org/issues/12005)와
[akr의 슬라이드](http://www.a-k-r.org/pub/2016-09-08-rubykaigi-unified-integer.pdf)를
참조하세요.

## [String이 Unicode 대소문자 매핑을 지원합니다](https://bugs.ruby-lang.org/issues/10085)

`String/Symbol#upcase/downcase/swapcase/capitalize(!)`가 이제 ASCII 대소문자
매핑 대신 Unicode 대소문자 매핑을 다룹니다.

## 성능 향상

루비 2.4는 다음과 같은 언어 변경 및 성능 향상을 포함합니다.

### [Array#max, Array#min](https://bugs.ruby-lang.org/issues/12172)

`[x, y].max` 및 `[x, y].min`은 특정 조건에서 임시 배열을 만들지 않도록
최적화되었습니다.

### [Regexp#match?](https://bugs.ruby-lang.org/issues/8110)

객체 할당을 줄이기 위해, 역참조 객체를 만들거나 `$~`를 변경하지 않은 채 정규식
매칭을 수행하는 `Regexp#match?`를 추가했습니다.

### 그 외의 성능 향상

* [인스턴스 변수 접근 속도 향상](https://bugs.ruby-lang.org/issues/12274)

## 디버깅

### [Thread#report_on_exception 및 Thread.report_on_exception](https://bugs.ruby-lang.org/issues/6647)

루비는 다른 스레드가 명시적으로 조인하지 않는 이상 해당 스레드에서 발생한 예외는
무시합니다.
`report_on_exception = true`를 설정하면 스레드가 처리되지 않은 예외에 의해
끝났는지 알 수 있게 됩니다.

`report_on_exception`의 기본값이 무엇이 되어야 할지, 또 스레드가 조인 없이
가비지 컬렉션되었을 때 알려주는 report-on-GC에 대한 의견을 보내주세요.

### [스레드의 교착 상태가 감지되었을 때 해당 스레드의 백트레이스와 의존성을 표시합니다](https://bugs.ruby-lang.org/issues/8214)

루비는 기다리고 있는 스레드의 교착 상태를 감지하지만, 이는 충분한 디버깅 정보를
포함하고 있지 않았습니다.
루비 2.4는 교착 상태를 감지하면 스레드의 백트레이스와 해당 스레드가 의존하는
스레드를 보여줍니다.

루비 2.4.0-rc1로 프로그래밍 해보고
[의견을 보내주세요](https://github.com/ruby/ruby/wiki/How-To-Report)!

## 그 외의 중요한 2.3 이후의 변경 사항

* OpenSSL 1.1.0을 지원합니다.(0.9.7과 그 이전 버전의 지원을 중단합니다)
* stdlib에서 ext/tk가 제거됩니다. [Feature #8539](https://bugs.ruby-lang.org/issues/8539)
* stdlib에서 XMLRPC가 제거됩니다. [Feature #12160](https://bugs.ruby-lang.org/issues/12160)

자세한 사항은 [NEWS](https://github.com/ruby/ruby/blog/v2_4_0_rc1/NEWS)나 커밋
로그를 참조하세요.

이러한 변경 사항에 따라, 루비 2.3.0 이후로
[파일 2519개 수정, 288606줄 추가(+), 83896줄 삭제(-)](https://github.com/ruby/ruby/compare/v2_3_0...v2_4_0_rc1)가
이루어졌습니다!

## 다운로드

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-rc1.tar.bz2>

      SIZE:   12512729 bytes
      SHA1:   a0439652a97a2406b691e8a1e586e2cf08c258ba
      SHA256: 3b156b20f9df0dd62cbeeb8e57e66ea872d2a5b55fabdef1889650122bcc2ea7
      SHA512: b43902ac7794487197df55a45256819d2e7540b77f1ed4eb68def3e0473ee98860a400862075bafadbde74f242e1dfe36a18cd6fe05ac42aae1ea6dddc9978ce

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-rc1.tar.gz>

      SIZE:   14098505 bytes
      SHA1:   6b242f9ec7b908c9aa26e497440684ba06d86927
      SHA256: e41ada7650eed2a5800534d1201ba7c88f1627085659df994f47ab4c5e327745
      SHA512: 26d3c60483ce2d6eaabd7077085102fad6633f18cf5d772bacf6f563670030cb7bba22d54d8b7dfa5eac8b52990371c4a6ad1c095dff6f6b3a7bbe1a8ffb3754

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-rc1.tar.xz>

      SIZE:   9930088 bytes
      SHA1:   7c404e8bec9859f708927f7203d4f42187e678b7
      SHA256: 3f014b3186d10676da6c512d14c65db23ccc4bf200fed9d7c6f9a58fd1e3295b
      SHA512: 22e209e28da1f2394f50c0a7dd5d0d4d4c0c5a6b5b0b02260fad0267a0940b98f0e2b0f36a44f87d1612555cb3022f43cd136a5186c7f87650aa20264408d415

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-rc1.zip>

      SIZE:   15785968 bytes
      SHA1:   7d82386434ccbb1701f2995286bf29c8b9179e01
      SHA256: 14e6910e36618cddffeb22bad5f1052f907dc31ec93d4aa945bca0905d8a52c4
      SHA512: 5dd89320d429e5bd5faf3709be7e5b70f7355304d6324d7ac13a69187e5f1446ad5988c8186bc33f4fea8934288294f9d16fea173f39b2b39967746c4b03d1d4

## 릴리스 코멘트

릴리스 일정과 다른 정보는 아래 링크를 참조하세요.

[ReleaseEngineering24](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering24)
