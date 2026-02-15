---
layout: news_post
title: "루비 1.9.3 p0 릴리스"
author: "Moru"
date: 2011-11-06 14:01:45 +0000
lang: ko
---

루비 1.9버전의 최신판인 1.9.3 p0이 릴리스되었습니다.

## 내려받기

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p0.tar.bz2&gt;][1]
  * SIZE: 9554576 bytes
  * MD5: 65401fb3194cdccd6c1175ab29b8fdb8
  * SHA256: ca8ba4e564fc5f98b210a5784e43dfffef9471222849e46f8e848b37e9f38acf

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p0.tar.gz&gt;][2]
  * SIZE: 12223217 bytes
  * MD5: 8e2fef56185cfbaf29d0c8329fc77c05
  * SHA256: 3b910042e3561f4296fd95d96bf30322e53eecf083992e5042a7680698cfa34e

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p0.zip&gt;][3]
  * SIZE: 13691314 bytes
  * MD5: 437ac529a7872c8dcc956eab8e7e6f76
  * SHA256: 1be16d0172e9cf9e5078a7bee2465a9f3af431920e1e3d9417a4fc2ee074bca4

## 1.9.2와의 차이점

### 라이센스

라이센스가 아래와 같이 변경되었습니다.

* 지금까지 루비는 \"GPLv2\"과 \"루비\" 라이센스 하에 배포되었습니다. 하지만 루비 1.9.3부터는
  [2-clause BSDL][4]과 [루비 라이센스][5]로 변경됩니다.

### 인코딩

* 루비 1.9.\[0-2\]에서 SJIS는 Shift\_JIS의 alias였지만, 1.9.3부터는 Windows-31J의
  alias로 변경되었습니다.
* 새로운 인코딩인 UTF-16, UTF-32, CP950, CP951이 추가되었습니다.
* Regexps는 Unicode 6.0의 새로운 문자와 스크립트를 지원합니다.

### Core클래스

* ARGF: ARGF.print와 ARGF.read\_nonblock 등 새로운 메서드가 추가되었습니다.
* Array#pack, String#unpack: 엔디안을 명시적으로 지정할 수 있게 되었습니다.
* Bignum: 내부표현으로 자릿수가 150 이상인 정수의 곱셈을 Toom-3 알고리즘으로 처리하도록 변경되었습니다. 이에 따라
  성능 향상이 이루어졌습니다.
* 정수 File::NULL과 File::DIRECT가 추가되었습니다.
* IO#putc: 멀티바이트 문자를 지원합니다.
* IO: IO#advise, IO.write, IO.binwrite가 추가되었습니다.
* \#\_\_id\_\_가 BasicObject의 메서드로 변경되었습니다.
* Kernel#rand의 인수로 Range 객체를 지정할 수 있습니다.
* Module#private\_constant, Module#public\_constant 메서드가 추가되었습니다.
* String#prepend, String#byteslice가 추가되었습니다.
* Time#strftime: %:z와 %::z.를 지원합니다.
* Process#maxgroups와 Process#maxgroups: 보조 그룹을 지원하지 않는 환경에서
  NotImplementedError를 던지도록 변경되었습니다.

### Standard 라이브러리

* io/console: 새롭게 추가되었습니다.
* openssl: 새로운 메인테이너의 활약으로 많은 부분이 개선되었습니다.
* test/unit: 병렬실행이 가능하게 되었습니다.

### 기타

* pathname 및 date가 C로 다시 쓰여졌으며, 이에 따라 성능 향상이 이루어지게 되었습니다.
* VM Lock의 전략이 변경되었습니다.

### 버그 및 호환성

* 변경된 Rational#to\_d는 정수 0 또는 음수를 에러로 처리합니다.

자세한 사항은 [뉴스][6]와 [변경로그][7]를 참고하시기 바랍니다.



[1]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p0.tar.bz2
[2]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p0.tar.gz
[3]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p0.zip
[4]: http://en.wikipedia.org/wiki/BSD_licenses#2-clause_license_.28.22Simplified_BSD_License.22_or_.22FreeBSD_License.22.29
[5]: {{ site.url }}{{ site.license.url }}
[6]: https://github.com/ruby/ruby/blob//v1_9_3_0/NEWS
[7]: https://github.com/ruby/ruby/blob//v1_9_3_0/ChangeLog
