---
layout: news_post
title: "루비 2.5.2 릴리스"
author: "nagachika"
translator: "shia"
date: 2018-10-17 14:00:00 +0000
lang: ko
---

루비 2.5.2가 릴리스 되었습니다.

이번 릴리스는 몇몇 버그 수정과 보안 수정을 포함합니다.

* [CVE-2018-16396: tainted 플래그가 Array#pack, String#unpack의 일부 형식에서 전파되지 않는 취약점](/ko/news/2018/10/17/not-propagated-taint-flag-in-some-formats-of-pack-cve-2018-16396/)
* [CVE-2018-16395: OpenSSL::X509::Name 비교가 올바르게 동작하지 않는 취약점](/ko/news/2018/10/17/openssl-x509-name-equality-check-does-not-work-correctly-cve-2018-16395/)


이번 릴리스는 몇몇 버그 수정 또한 포함됩니다.
[커밋 로그](https://github.com/ruby/ruby/compare/v2_5_1...v2_5_2)를 확인해주세요.

## 다운로드

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.2.tar.bz2>

      SIZE:   13592827 bytes
      SHA1:   562d6b8be5a0804ed7617bb0465b288d44b2defc
      SHA256: ea3bcecc3b30cee271b4decde5e9ff3e17369d5fd1ed828d321c198307c9f0df
      SHA512: 9f9388a162a3ae9c14ec8999fa3b12ff5397de14f55996cc8761d21c757113db37ace4d326b9606de7ad3a5875aa94fec900dd9b81b2fb0dff558c39422f4aa1

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.2.tar.gz>

      SIZE:   15600481 bytes
      SHA1:   7e503e75621b69cedb1d8b3fa2bee5aef2f1a714
      SHA256: b32340e64a0c7ecbf31486c41fe429a55c7984d980eca7a78138367d9209f471
      SHA512: 9aee69d2ac6aefe2d81649055ba7b99e4e58cf203ac75083ba1b35b3a4fd7f72ee257e26ca80460da5c2a7817fd507aecec9c143f170e16980625e95eeb31686

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.2.tar.xz>

      SIZE:   11071052 bytes
      SHA1:   ea352c9bcaa47ab094cdec0f4946c62b1a1769d7
      SHA256: 8be6b6afdf09957a6e2c2a6ada4b1982a391a828b34e49072c4beb60febb678d
      SHA512: b6b805b18ba6da7b28c7e2bdf3da7eaf1dcc15ae22744228d032e8ddec2fbba4cc4fb822b9ef7f6b561052113a4f28dc50ccfa4f00e3728a35ce27137f4a70e6

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.2.zip>

      SIZE:   18786735 bytes
      SHA1:   98fdbae195bbbc3f131d49d9e60bf3fbb8b56111
      SHA256: f148947fee070f30826ef0bda77228b9c374b388050db81ad07f5cd8608e3624
      SHA512: 1b804337099ecfa045eecf1a4e3f35fa786bd6e835dc50267d6a3792a782b193ec9708564e3ac5169a95ef4afc2c131782af937dafd8122117e8cff577736c0f

## 릴리스 코멘트

많은 커미터, 개발자, 버그를 신고해 준 사용자들이 이 릴리스를 만드는 데 도움을
주었습니다.
그들의 기여에 감사드립니다.
