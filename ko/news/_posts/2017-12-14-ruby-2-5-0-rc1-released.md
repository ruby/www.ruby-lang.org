---
layout: news_post
title: "루비 2.5.0-rc1 릴리스"
author: "naruse"
translator: "shia"
date: 2017-12-14 00:00:00 +0000
lang: ko
---

루비 2.5.0-rc1의 릴리스를 알리게 되어 기쁩니다.

루비 2.5.0-rc1은 루비 2.5.0의 첫 번째 릴리스 후보입니다.
이는 다음과 같은 여러 새 기능과 기능 향상을 포함합니다.

## 새 기능

* STDERR이 변경되지 않고, tty인 경우, 백트레이스와 에러 메시지가 역순으로 출력됩니다.
  [Feature #8661] [실험적 기능]

* 최상위 상수 탐색 기능이 삭제되었습니다. [Feature #11547]

* rescue/else/ensure가 do/end 블록 내부에서도 직접 사용할 수 있게 됩니다. [Feature #12906]

* yield\_self가 추가됩니다.  [Feature #6721]

## 성능 개선

* TracePoint의 훅에서 "trace" 명령을 미리 삽입하지 않고, 동적으로 추가합니다.
  이는 오버헤드를 줄여줍니다. [Feature #14104]

* Proc 할당을 지연시켜 블록 인수에 의한 블록 패스의 성능을 향상시킵니다.
  [Feature #14045]

* Mutex가 작고 빠르게 재작성되었습니다. [Feature #13517]

* SecureRandom은 이제 OpenSSL보다 OS가 제공하는 난수 소스를 우선합니다. [Bug #9569]

## 2.4 이후로 눈에 띄는 변경점

* Onigmo가 6.1.3으로 갱신되었습니다.
  이는 [비포함 연산자](https://github.com/k-takata/Onigmo/issues/87)를 추가합니다.
  또한 루비 2.4.1도 이 변경을 포함합니다.
* Bundler가 표준 라이브러리에 추가됩니다.
* RubyGems가 2.7.0으로 갱신되었습니다.
* RDoc이 6.0.0으로 갱신되었습니다.
  * IRB 기반이었던 문법 해석기가 Ripper 기반으로 변경되었습니다.
    이는 문서 생성의 속도를 크게 향상시킵니다.
    [https://github.com/ruby/rdoc/pull/512]
  * 근 수년동안 쌓였던 버그들이 수정됩니다.
  * 최근 루비에 추가된 새로운 문법이 지원됩니다.
* 유니코드 지원 버전이 10.0.0으로 갱신되었습니다.

[NEWS](https://github.com/ruby/ruby/blob/v2_5_0_rc1/NEWS)나 커밋 로그에서
더 자세한 설명을 확인할 수 있습니다.

이러한 변경 사항에 따라, 루비 2.4.0 이후로
[파일 6162개 수정, 339744줄 추가(+), 28699줄 삭제(-)](https://github.com/ruby/ruby/compare/v2_4_0...v2_5_0_rc1)가
이루어졌습니다!

루비 2.5.0-rc1을 즐겨보세요!

## 다운로드

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0-rc1.tar.gz>

      SIZE:   31049529 bytes
      SHA1:   15df7e8ff99f360a14f7747a07a3021447d65594
      SHA256: 46c11b347522de174566503d35d2b46e1529b979d292b1f7f7019cfedcd4b07f
      SHA512: 41cd298e99d7a25fe5f2ec42946ae5dbc4421bb18f39350ba8a1b02e999541ec1b21b5f6ce0489b3a159f47e37d409178ba7c21c00e177b0fdb410ca6e9d6142

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0-rc1.zip>

      SIZE:   35579788 bytes
      SHA1:   b7ae42eb733d4a0e3a2d135c9f8d4af043daa728
      SHA256: 9858e39fd2e7bf207cc9f8846197b11ada5f4424f433ff4df149fe3d48be8e36
      SHA512: 86c93791d312fd2175909020e448a44892740feb809a532ed706c6d850cb92722fb7ca02ecbdf7a1fbeb5b4f42f1338ce9a15b7c0a41055937bd1fdfb4be6f11

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0-rc1.tar.bz2>

      SIZE:   29238901 bytes
      SHA1:   6aad74ed3d30de63c6ff22048cd0fcbcbe123586
      SHA256: 862a8e9e52432ba383660a23d3e87af11dbc18c863a19ef6367eb8259fc47c09
      SHA512: bf0eb114097f9e505ff846f25e7556a2fb393573b4e8b773f94cf5b47998e221f3962a291db15a3cdbdf4ced5a523812937f80d95f4ee3f7b13c4e37f178d7a7

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0-rc1.tar.xz>

      SIZE:   26096412 bytes
      SHA1:   05cacd0341b7a23cc68239c2061640643a30da38
      SHA256: a479a1bce69b2cf656821f10104dcb8b426922b56d3d6cbdf48318842fae752c
      SHA512: 9f9040abf69337439a3f31b80d440d97736555b0df6533d9d34c141ce52226bc40c3f4f7e596e74b080c879e933649c17a073c893be1a304d9a883bab02e9494
