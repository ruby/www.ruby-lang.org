---
layout: news_post
title: "루비 2.5.0-preview1 릴리스"
author: "naruse"
translator: "wagurano"
date: 2017-10-10 00:00:00 +0000
lang: ko
---

루비 2.5.0-preview1 릴리스를 알리게 되어 기쁘게 생각합니다.

루비 2.5.0-preview1은 루비 2.5.0의 첫번째 프리뷰입니다.
아래와 같이 성능을 개선하고 새로운 기능 몇 가지를 도입했습니다.

## 새로운 기능

* STDERR가 변경되지 않았고 tty일 때 백트레이스와 에러 메시지를 역순으로 출력했습니다.
  [기능 #8661] [실험적인 기능]

* 최상위 상수 검색 기능을 삭제했습니다. [기능 #11547]

* do/end 블록 안에 rescue/else/ensure 사용할 수 있습니다. [기능 #12906]

* yield\_self [기능 #6721]

## 2.4 이후 주목할 만한 변경

* Onigmo를 6.1.1로 병합했습니다.
  [absence operator](https://github.com/k-takata/Onigmo/issues/87)를 추가했습니다.
  루비 2.4.1은 이미 이 사항을 포함하였습니다.
* bundler를 표준 라이브러리로 병합했습니다.
* rubygems-2.6.13 병합했습니다.
* rdoc-6.0.0.beta2 병합했습니다.
  IRB 구문 분석기를 Ripper로 교체,
  문서 생성 속도가 크게 향상되었습니다.
  https://github.com/ruby/rdoc/pull/512
  아래 사항도 포함합니다.
  * 지난 수년간의 많은 버그를 보완했습니다.
  * 지난 몇 년간의 루비 새로운 구문을 지원합니다.
* 유니코드 지원 버전을 10.0.0으로 업데이트했습니다.

자세한 내용은 [뉴스](https://github.com/ruby/ruby/blob/v2_5_0_preview1/NEWS)와
커밋 로그를 참고하세요.

이러한 변경사항에 따라,
루비 2.4.0 이후 [파일 6162개 수정, 339744줄 추가(+), 28699줄 삭제(-)](https://github.com/ruby/ruby/compare/v2_4_0...v2_5_0_preview1)
하였습니다!

루비 2.5.0-preview1을 즐겨주시기 바랍니다!

## 다운로드

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0-preview1.tar.gz>

      SIZE:   16088348 bytes
      SHA1:   8d1bad4faea258ac7f97ae2b4c7d76335b044c37
      SHA256: 30994fe5efbf4759a2a616f288121857c69b45665926174680387e286bb83b05
      SHA512: bcca05333e0aa09c75492ec09e4a82bf7aebef1b96e1c40000b92fa654fd96ae1d70e4f92ecf619b199cba73d754be6c6d97fc488d1e47831bc671f64ce0ab6d

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0-preview1.zip>

      SIZE:   20036401 bytes
      SHA1:   e1ad073a17dc814fc8ddb3cbbed761a2278dcc12
      SHA256: 1a61196a845cb9d9b5a71fd66cb77fbc215f82cb6f90371e309ceddb25e7107b
      SHA512: 35033b5426142e271d95d438b8442e73cade9462b02014371866882a4a90911b98805b7199b15bedc9847fd2560e211f015fa09b0b1d9efc31a947e41e088b30

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0-preview1.tar.bz2>

      SIZE:   14110768 bytes
      SHA1:   0b664c41b75d54ff88c70b5437b20b90675e3348
      SHA256: 1158e0eac184a1d8189fae985f58c9be185d6e7074b022e66567aec798fa3446
      SHA512: 2d39ef64aaf7a52014905f4ad59b53e83b71433e50a9227f9f50cbb7a2c9a5db9cd69fa7dbe01234819f7edd2216b3d915f21676f07d12bb5f0f3276358bce7f

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0-preview1.tar.xz>

      SIZE:   11383812 bytes
      SHA1:   eef2901270c235a97d132ebcfb275f130ba368fd
      SHA256: c2f518eb04b38bdd562ba5611abd2521248a1608fc466368563dd794ddeddd09
      SHA512: 1153a1fc4eb1a9556af2d392743998eb9cffd2a07e4648bf124dea1044bb378c7f4534dd87c0d30563ec438d2995ba1832faaaf4261db5d0840ca32ae7ea65d9
