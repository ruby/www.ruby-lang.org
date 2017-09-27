---
layout: news_post
title: "루비 2.2.8 릴리스"
author: "usa"
translator: "wagurano"
date: 2017-09-14 12:00:00 +0000
lang: ko
---

루비 2.2.8 릴리스 되었습니다.
이번 릴리스는 다수의 보안 수정을 포함합니다.
세부 내용은 아래 주제를 확인해주세요.

* [CVE-2017-0898: Kernel.sprintf에서 버퍼 언더런 취약점 발생](/ko/news/2017/09/14/sprintf-buffer-underrun-cve-2017-0898/)
* [CVE-2017-10784: WEBrick 베이직 인증에 이스케이프 시퀀스 삽입 취약점 발생](/ko/news/2017/09/14/webrick-basic-auth-escape-sequence-injection-cve-2017-10784/)
* [CVE-2017-14033: OpenSSL ASN1 디코드할 때 버퍼 언더런 취약점 발생](/ko/news/2017/09/14/openssl-asn1-buffer-underrun-cve-2017-14033/)
* [CVE-2017-14064: JSON을 생성할 때 힙 메모리를 노출하는 취약점](/ko/news/2017/09/14/json-heap-exposure-cve-2017-14064/)
* [RubyGems의 취약점 다수 발견](/ko/news/2017/08/29/multiple-vulnerabilities-in-rubygems/)
* libyaml 버전 0.1.7로 업데이트

루비 2.2는 현재 보안 유지보수 단계이고, 기한은 2018년 3월입니다.
그날 이후, 루비 2.2의 유지보수는 끝납니다.
루비의 새 버전 2.4 또는 2.3으로 업그레이드할 계획을 세우길 바랍니다.

## 다운로드

* [https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.8.tar.bz2](https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.8.tar.bz2)

      SIZE:   13374522 bytes
      SHA1:   d851324bf783221108ce79343fabbcd559b9e60b
      SHA256: b19085587d859baf9d7763f92e34a84632fceac5cc593ca2c0efa28ed8c6e44e
      SHA512: aa1c65f76a51a57d9059a38a13a823112b53850a9e7d6f72c3f3e38d381412014521049f7065c1b00877501b3b554235135d0f308045c2a9da133c766f5b9e46

* [https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.8.tar.gz](https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.8.tar.gz)

      SIZE:   16681654 bytes
      SHA1:   15a6fca1bfe0488b24a204708a287904028aa367
      SHA256: 8f37b9d8538bf8e50ad098db2a716ea49585ad1601bbd347ef84ca0662d9268a
      SHA512: b9d355232c1ca3e17b5d4dcb70f0720da75b82787e45eb4ede281290bf42643665385e55428495eb55c17f744395130b4d64ef78ca66c5a5ecb9f4c3b732fdea

* [https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.8.tar.xz](https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.8.tar.xz)

      SIZE:   10520648 bytes
      SHA1:   3a25914aafedc81952899298a18f9c3a4881d2d1
      SHA256: 37eafc15037396c26870f6a6c5bcd0658d14b46cd5e191a3b56d89dd22d561b0
      SHA512: e21004bee537f0c706f4ac9526507b414ddb6a8d721e8fad8d7fe88992a4f048eb5eb79f8d8b8af2a8b331dcfa74b560490218a1acb3532c2cdb4fb4909da3c9

* [https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.8.zip](https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.8.zip)

      SIZE:   18521461 bytes
      SHA1:   3b0142bad47e29f429903f6c4ca84540764b5e93
      SHA256: 58bf98b62d21d6cc622e6ef5c7d024db0458c6860199ab4c1bf68cdc4b36fa9d
      SHA512: 08cadfa72713f9e3348093c96af4c53f06f681bc29ada2d80f1c55faca6a59a3b2913aa2443bf645fea6f3840b32ce8ce894b358f972b1a295ee0860b656eb02

## 릴리스 코멘트

이 릴리스를 만드는 데 도움을 준, 특별히, 취약점을 보고해준 모두에게 감사합니다.
