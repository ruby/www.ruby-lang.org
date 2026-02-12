---
layout: news_post
title: "루비 1.9.2 preview1 공개"
author: "Moru"
lang: ko
---

루비 1.9.2 preview1이 공개되었습니다.

1\.9버전의 차기 안정화 버전으로서 개발되고 있는 루비 1.9.2의 테스트 버전입니다. 몇 가지 사양개선과 라이브러리에 대한
수정이 이루어졌습니다. 1.9.2 preview1에 대한 의견(개선안, 버그 등)은 루비 메일링 리스트 등을 이용하여 루비의
개발자들에게 연락을 취하여 주십시오.

* Socket API에 대한 객체화를 개선
* Time 클래스에 대한 수정 : 최소/최대값을 가지지 않도록 변경되어 기존의 ‘2038년 문제‘가 해결됨

      2038년 문제 : Time.now + 86400*365*29 #=> RangeError

* Random 클래스 개선
* Merb 유저를 위해 Method#parameters가 반영됨

자세한 내용은 아래의 URL을 참조하십시오.

* [&lt;URL:https://git.ruby-lang.org/ruby.git/plain/NEWS&gt;][1]?id=master
* [&lt;URL:https://git.ruby-lang.org/ruby.git/plain/ChangeLog&gt;][2]?id=master

#### 내려받기

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-preview1.tar.bz2&gt;][3]
  SIZE
  : 7487008 bytes

  MD5
  : 0b8f27ea78afcdc54d5d23e569aa0150

  SHA256
  : 0681204e52207153250da80b3cc46812f94107807458a7d64b17554b6df71120

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-preview1.tar.gz&gt;][4]
  SIZE
  : 9422226 bytes

  MD5
  : e2b8cdbf300f53472be09699a5837fd1

  SHA256
  : 7f29ab3b1d5f0074bb82a6bf398f1cacd42fe508a17fc14844560c4d906786b6

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-preview1.zip&gt;][5]
  SIZE
  : 10741739 bytes

  MD5
  : 253b5845e4b0f8250ae79c328b94e049

  SHA256
  : cb132277476856535ee31e85929a3041877b0912868b7f64d1cf911a79463cdf



[1]: https://git.ruby-lang.org/ruby.git/plain/NEWS?id=master
[2]: https://git.ruby-lang.org/ruby.git/plain/ChangeLog?id=master
[3]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-preview1.tar.bz2
[4]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-preview1.tar.gz
[5]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-preview1.zip
