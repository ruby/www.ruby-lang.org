---
layout: news_post
title: "루비 2.1.0-preview1이 릴리스 되었습니다"
author: "nurse"
translator: "SeungKyun Nam"
date: 2013-09-23 07:00:00 +0000
lang: ko
---

루비 2.1.0-preview1 릴리스를 알리게 되어 기쁩니다.
최종 릴리스 이전에 루비 2.1의 새로운 기능들을 확인하시기 바랍니다.

## 다운로드

Fastly를 이용한 [https://cache.ruby-lang.org/pub/ruby/2.1/](https://cache.ruby-lang.org/pub/ruby/2.1/)을 사용하시길 권장합니다.

* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview1.tar.bz2](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview1.tar.bz2)

      SIZE:   11475553 bytes
      MD5:    d32d1ea23988399afadbd21c5a7a37fc
      SHA256: 860b90d28b214393fd9d77ac2ad65b384d8249cd59b658c668cf0c7bad1db341

* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview1.tar.gz](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview1.tar.gz)

      SIZE:   14449544 bytes
      MD5:    9df4f546f6b961895ba58a8afdf857da
      SHA256: 747472fb33bcc529f1000e5320605a7e166a095d3805520b989e73b33c05b046

* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview1.zip](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview1.zip)

      SIZE:   16124069 bytes
      MD5:    f9bc3f9a10174a022381ce2c60a59e64
      SHA256: 28855621f7d364277e7f258d5cc380e005896ef8ebc36e5cbf78d2bf763c291b

## 변경점

주목할 만한 변경점들은 아래와 같습니다:

* VM (메서드 캐시)
* RGenGC (ko1의 [RubyKaigi presentation](http://rubykaigi.org/2013/talk/S73)과 [EuRuKo presentation](http://www.atdot.net/~ko1/activities/Euruko2013-ko1.pdf)을 참조하십시오)
* refinements
* syntax
* Decimal Literal
* Frozen String Literal
* def의 return value
* Bignum
* 128bit
* GMP
* String#scrub
* Socket.getifaddrs
* 새로운 RubyGems

보다 상세한 변경점들은 [루비 저장소의 뉴스(작업 중)](https://github.com/ruby/ruby/blob/trunk/NEWS)를 참조하십시오.

ko1(Koichi Sasada)이 toruby에서 발표한 내용입니다: [Summary of Ruby 2.1](http://www.atdot.net/~ko1/activities/toruby05-ko1.pdf)

Konstantin Haase(@konstantinhaase)가 멋진 요약을 자신의 블로그 포스트로 작성하였습니다: [What's new in Ruby 2.1?](http://rkh.im/ruby-2.1).

## 릴리스 코멘트

알려진 이슈들:

[https://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=102](https://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=102)

릴리스 일정과 기타 정보들은 다음 링크를 참조해 주십시오:

[https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering210](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering210)
