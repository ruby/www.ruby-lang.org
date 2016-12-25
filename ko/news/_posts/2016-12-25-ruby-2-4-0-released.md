---
layout: news_post
title: "루비 2.4.0 릴리스"
author: "naruse"
translator: "shia"
date: 2016-12-25 00:00:00 +0000
lang: ko
---

루비 2.4.0의 릴리스를 알리게 되어 기쁘게 생각합니다.

루비 2.4.0은 루비 2.4의 첫 번째 릴리스입니다.
이는 다음과 같은 많은 새 기능을 포함하고 있습니다.

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

## [Unify Fixnum and Bignum into Integer](https://bugs.ruby-lang.org/issues/12005)

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

## Debugging

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

## 그 밖의 중요한 2.3 이후의 변경 사항

* OpenSSL 1.1.0을 지원합니다.(0.9.7과 그 이전 버전의 지원을 중단합니다)
* stdlib에서 ext/tk가 제거됩니다. [Feature #8539](https://bugs.ruby-lang.org/issues/8539)
* stdlib에서 XMLRPC가 제거됩니다. [Feature #12160](https://bugs.ruby-lang.org/issues/12160)

자세한 사항은 [NEWS](https://github.com/ruby/ruby/blog/v2_4_0/NEWS)나 커밋
로그를 참조하세요.

이러한 변경 사항에 따라, 루비 2.3.0 이후로
[파일 2523개 수정, 289129줄 추가(+), 84670줄 삭제(-)](https://github.com/ruby/ruby/compare/v2_3_0...v2_4_0)가
이루어졌습니다!

메리 크리스마스, 행복한 휴일 보내시고, 루비 2.4와 함께 즐거운 프로그래밍 하세요!

## 다운로드

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0.tar.bz2>

      SIZE:   12572424 bytes
      SHA1:   944d2588308391b20a89642472454d1dfe7b2360
      SHA256: 440bbbdc49d08d3650f340dccb35986d9399177ad69a204def56e5d3954600cf
      SHA512: bef7bb53f63fb74073d071cc125fb67b273ed0779ef43c2d2969089b9ca21fff1bd012281c5b748f7a3c24dd26e71730d7248c05a01cb23ab2089eb4d02115fe

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0.tar.gz>

      SIZE:   14104044 bytes
      SHA1:   d44a3c50a0e742341ed3033d5db79d865151a4f4
      SHA256: 152fd0bd15a90b4a18213448f485d4b53e9f7662e1508190aa5b702446b29e3d
      SHA512: 21c9f596b42dd9cba7a53963a59fed0c2e0c1eb960a4ac7087ea3eaa991ce9252d32639e1edcb75b1d709bc07c4820a6dc336ab427d0643c6e6498e0eacdbc8b

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0.tar.xz>

      SIZE:   9906880 bytes
      SHA1:   038804bbd0e77508dd2510b729a9f3b325489b2e
      SHA256: 3a87fef45cba48b9322236be60c455c13fd4220184ce7287600361319bb63690
      SHA512: 975a5388592adc038461e0acebb6c0efee242891b2ea8621476401458efe2bc0fdd317d3bf99beb745b0b3808410efdff33862da29c95c027f457943721e3ab6

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0.zip>

      SIZE:   15758757 bytes
      SHA1:   29e1bab11551011718c35a51827edcb55bd656fc
      SHA256: 5c2bbfa26fd6a15a2d70961874b0f3a386206fcc5f698e240dd8b0c9f0f18c5e
      SHA512: 31d932372ce490eeac0a70bc8dcf842909a90435422398d069c05cf01d994936064b8f4e60879e28a8655c1296eb8e180e348cb95e001ed6ca73cda0ff77de23
