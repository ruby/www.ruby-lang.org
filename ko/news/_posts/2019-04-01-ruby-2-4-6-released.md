---
layout: news_post
title: "루비 2.4.6 릴리스"
author: "usa"
translator: "yous"
date: 2019-04-01 06:00:00 +0000
lang: ko
---

루비 2.4.6이 릴리스되었습니다.

이 릴리스는 지난 릴리스 이후로 약 20개의 버그 수정과 몇 개의 보안 수정을 포함합니다.
자세한 사항은 아래 글을 확인해보세요.

* [RubyGems의 취약점 다수 발견](/ko/news/2019/03/05/multiple-vulnerabilities-in-rubygems/)

자세한 내용은 [커밋 로그](https://github.com/ruby/ruby/compare/v2_4_5...v2_4_6)를 확인해주세요.

이 릴리스 이후로 루비 2.4의 일반 유지보수는 종료되고, 보안 유지보수 단계가 시작됩니다.
2.4.6의 릴리스 이후로 보안 수정을 제외한 어떤 버그 수정도 2.4로 백포트되지 않습니다.
보안 유지보수 단계의 기간은 1년으로 계획되어 있습니다.
이 기간이 끝나면 루비 2.4의 공식 지원은 종료됩니다.
루비 2.6이나 2.5로 업그레이드할 계획을 세우길 바랍니다.

## 다운로드

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.6.tar.bz2>

      SIZE:   12623913 bytes
      SHA1:   b44b5c6637a69b3b95971b1937ecb583dc1de568
      SHA256: 909f360debed1f22fdcfc9f5335c6eaa0713198db4a6c13bab426f8b89b28b02
      SHA512: 292802984e5cff6d526d817bde08216fe801d255c4cede0646e450f22d4a3a81ae612ec5d193dcc2a888e3e98b2531af845b6b863a2952bcf3fb863f95368bcf

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.6.tar.gz>

      SIZE:   15880585 bytes
      SHA1:   3bc2d9ab3381887c57e0fb7937dc14e9f419f06c
      SHA256: de0dc8097023716099f7c8a6ffc751511b90de7f5694f401b59f2d071db910be
      SHA512: 7eb7720961e98e22e4335c38eeead9db96d049ef3ac1da437769b98fee7a10feb092643ce75822a2fe3bd5fd94938417ab5c2de7c6056afe0abf6e4cf03ca282

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.6.tar.xz>

      SIZE:   10005544 bytes
      SHA1:   86a4fa22cb3547005ec4bfcf77489a4254226187
      SHA256: 25da31b9815bfa9bba9f9b793c055a40a35c43c6adfb1fdbd81a09099f9b529c
      SHA512: eafb2257747f99e2ed262af142e71175b70f7cceaa4d1253b92c8337f075a9a58a2d93b029d75e11a9b124f112a8f0983273b2b30afc147b5cf71a8dbb5fa0ba

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.6.zip>

      SIZE:   17469891 bytes
      SHA1:   0e55d231c0e119304e077e42923ce6a1c3daa1d1
      SHA256: c5de9f11d4b7608d57139b96f7bc94899bb2fc9dee2e192c8951f6647a9d60f7
      SHA512: cfa779cdb970dfd35dc2a97951310cb3cde1d380b040c283fda6609c591039817a2847ab7174f7a9ee7f7adbb610709b57914bb26e5c015a20d5fe880c569855

## 릴리스 코멘트

긴 시간을 기다리게 하여 죄송합니다.
이 릴리스를 만드는 데 도움을 준 모든 분에게 감사합니다.

이 릴리스를 포함한 루비 2.4의 유지보수는 Ruby Association의 "루비 안정 버전에 관한 협의"에 기반해 이루어집니다.
