---
layout: news_post
title: "루비 2.1.0-preview2 릴리스"
author: "nurse"
translator: "SeungKyun Nam"
date: 2013-11-22 22:00:00 +0000
lang: ko
---

루비 2.1.0-preview2의 릴리스를 발표하게 되어 기쁩니다.
최종 릴리스 전에 루비 2.1의 새로운 기능들을 테스트해 주십시오.

## preview 1 이후의 주목할 만한 변화

* [부동소수점 파싱할 때 힙 오버플로 발생 (CVE-2013-4164)](https://www.ruby-lang.org/ko/news/2013/11/22/heap-overflow-in-floating-point-parsing-cve-2013-4164/) 수정함
* "literal".freeze 최적화 [#9042](https://bugs.ruby-lang.org/issues/9042)
* 문자열의 f 접미사 제거 [#9042](https://bugs.ruby-lang.org/issues/9042)
* RGenGC에서 메모리 소모 이슈 ([r43532](https://git.ruby-lang.org/ruby.git) 그리고 [r43755](https://git.ruby-lang.org/ruby.git)) 수정
* Exception#cause [#8257](https://bugs.ruby-lang.org/issues/8257) 추가
* json, nkf, rake, RubyGems, 그리고 RDoc 등의 라이브러리 업데이트

## 다운로드

* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview2.tar.bz2](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview2.tar.bz2)

      SIZE:   11432454 bytes
      MD5:    9d566a9b2d2e7e35ad6125e2a14ce672
      SHA256: 780fddf0e3c8a219057d578e83367ecfac5e945054b9f132b3b93ded4802d1ce

* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview2.tar.gz](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview2.tar.gz)

      SIZE:   14416029 bytes
      MD5:    ba2b95d174e156b417a4d580a452eaf5
      SHA256: a9b1dbc16090ddff8f6c6adbc1fd0473bcae8c69143cecabe65d55f95f6dbbfb

* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview2.zip](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview2.zip)

      SIZE:   16110720 bytes
      MD5:    2ad1aa3d89ae32607cf14fc73b192de1
      SHA256: cc2f7f8e05daed716489e5480e6365a711a13ed7747dbc59e989a41fe2805076

## 2.0 이후의 변화들

주목할만한 변화는 아래와 같습니다:

* VM (메서드 캐시)
* RGenGC (ko1의 [RubyKaigi presentation](http://rubykaigi.org/2013/talk/S73)과 [RubyConf 2013 presentation](http://www.atdot.net/~ko1/activities/rubyconf2013-ko1_pub.pdf)을 참조하십시오)
* refinements [#8481](https://bugs.ruby-lang.org/issues/8481) [#8571](https://bugs.ruby-lang.org/issues/8571)
* 문법 변화
  * Rational/Complex Literal [#8430](https://bugs.ruby-lang.org/issues/8430)
  * def의 return value [#3753](https://bugs.ruby-lang.org/issues/3753)
* Bignum
  * 128비트 정수 사용 [#8509](https://bugs.ruby-lang.org/issues/8509)
  * GMP 사용 [#8796](https://bugs.ruby-lang.org/issues/8796)
* String#scrub [#8414](https://bugs.ruby-lang.org/issues/8414)
* Socket.getifaddrs [#8368](https://bugs.ruby-lang.org/issues/8368)
* RDoc 4.1.0.preview.2와 RubyGems 2.2.0.preview.2

보다 상세한 변경점들은 [루비 저장소의 뉴스(작업 중)](https://github.com/ruby/ruby/blob/v2_1_0_preview2/NEWS)를 참조하십시오.

ko1이 toruby에서 루비 2.1의 새로운 기능들에 대해 언급했습니다: [All about Ruby 2.1](http://www.atdot.net/~ko1/activities/toruby05-ko1.pdf)

Konstantin Haase(@konstantinhaase)가 자신의 블로그 포스트에 멋진 요약본을 작성하였습니다: [What's new in Ruby 2.1?](http://rkh.im/ruby-2.1).

## 릴리스 코멘트

알려진 이슈들:

[https://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=102](https://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=102)

릴리스 일정과 기타 정보들은 다음 링크를 참조하십시오:

[https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering210](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering210)
