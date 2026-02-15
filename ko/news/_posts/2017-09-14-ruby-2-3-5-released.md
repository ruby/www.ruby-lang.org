---
layout: news_post
title: "루비 2.3.5 릴리스"
author: "usa"
translator: "wagurano"
date: 2017-09-14 12:00:00 +0000
lang: ko
---

루비 2.3.5가 릴리스 되었습니다.

이번 릴리스는 이전 릴리스의 버그 70개를 수정하고 다수의 보안 수정을 포함합니다.
세부 내용은 아래 주제를 확인해주세요.

* [CVE-2017-0898: Kernel.sprintf에서 버퍼 언더런 취약점 발생](/ko/news/2017/09/14/sprintf-buffer-underrun-cve-2017-0898/)
* [CVE-2017-10784: WEBrick 베이직 인증에 이스케이프 시퀀스 삽입 취약점 발생](/ko/news/2017/09/14/webrick-basic-auth-escape-sequence-injection-cve-2017-10784/)
* [CVE-2017-14033: OpenSSL ASN1 디코드할 때 버퍼 언더런 취약점 발생](/ko/news/2017/09/14/openssl-asn1-buffer-underrun-cve-2017-14033/)
* [CVE-2017-14064: JSON을 생성할 때 힙 메모리를 노출하는 취약점](/ko/news/2017/09/14/json-heap-exposure-cve-2017-14064/)
* [RubyGems의 취약점 다수 발견](/ko/news/2017/08/29/multiple-vulnerabilities-in-rubygems/)
* libyaml 버전 0.1.7로 업데이트

[ChangeLog](https://github.com/ruby/ruby/blob//v2_3_5/ChangeLog)를 확인해주세요.

## 알려진 문제점

_(2017년 9월 15일 추가)_

루비 2.3.5에서 호환되지 않는 문제점이 발견되었습니다.
루비 2.3.5는 libgmp, jemalloc을 링크하지 못 합니다.
우리는 이 문제를 다음 릴리스에서 고치겠습니다. 그러나 이 문제를 맞닥뜨려서 빨리 해결해야 하는 경우, 아래 링크에서 패치합니다:

* [루비 2.4.2와 2.3.5는 libgmp, jemalloc를 링크하지 못 함](https://bugs.ruby-lang.org/issues/13899)

## 다운로드

* [https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.5.tar.bz2](https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.5.tar.bz2)

      SIZE:   14439326 bytes
      SHA1:   48302800c78ef9bbfc293ffcc4b6e2c728705bca
      SHA256: f71c4b67ba1bef424feba66774dc9d4bbe02375f5787e41596bc7f923739128b
      SHA512: 3ecc7c0ac10672166e1a58cfcd5ae45dfc637c22cec549a30975575cbe59ec39945d806e47661f45071962ef9404566007a982aedccb7d4241b4459cb88507df

* [https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.5.tar.gz](https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.5.tar.gz)

      SIZE:   17836997 bytes
      SHA1:   3247e217d6745c27ef23bdc77b6abdb4b57a118f
      SHA256: 5462f7bbb28beff5da7441968471ed922f964db1abdce82b8860608acc23ddcc
      SHA512: cd6bbba4fb5a0ab5ce7aa6f3b89d021ea742c5aa7934e24b87554d10e2a3233d416051c11aee90f3d8714d168db523a7bf56ef4dafdd256fc8595169c2db496a

* [https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.5.tar.xz](https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.5.tar.xz)

      SIZE:   11437868 bytes
      SHA1:   ef388992fa71cd77c5be960dd7e3bec1280c4441
      SHA256: 7d3a7dabb190c2da06c963063342ca9a214bcd26f2158e904f0ec059b065ffda
      SHA512: c55e3b71241f505b6bbad78b3bd40235064faae3443ca14b77b6356556caed6a0d055dc2e2cd7ebdb5290ab908e06d2b7d68f72469af5017eda4b29664b0d889

* [https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.5.zip](https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.5.zip)

      SIZE:   19887946 bytes
      SHA1:   09c80f9021fa2bfc04ae30a1939faad03b0f5b14
      SHA256: c9971e1ccb6e2f1ab32b1fe05416fce0b19a1cd9ba8fa095c77c4bdf2058e514
      SHA512: 6f14d0cc48d6eaf6168316cb45e22af8d2118ba058fd888ce930f12a22cf7e849e2e185cc7c516fe980f30ee9a942accf9d9e2d4b8a2e79c97b87d4bab704495

## 릴리스 코멘트

이 릴리스를 만드는 데 도움을 준 모두에게 감사드립니다.

이 릴리스를 포함한 루비 2.3의 유지보수는 [Ruby Association](http://www.ruby.or.jp/)의 "루비 안정 버전에 관한 협의"에 기반해 이루어집니다.
