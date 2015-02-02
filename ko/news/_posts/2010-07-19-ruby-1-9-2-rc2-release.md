---
layout: news_post
title: "Ruby 1.9.2 RC2 릴리즈"
author: "Moru"
date: 2010-07-19 07:43:48 +0000
lang: ko
---

Ruby 1.9.2 RC2가 공개되었습니다.

RC1 공개 후 psych라이브러리 수정과 몇가지 버그 수정이 이루어졌습니다. 자세한 사항은 [NEWS][1] 및
[ChangeLog][2]을 참고하시기 바랍니다.

### Ruby 1.9.2

Ruby 1.9.2는 아래의 몇가지 항목을 제외하고, 1.9.1과의 호환성을 유지하고 있습니다.

* 다수의 추가 메서드
* 새로운 socket API(IPv6 지원)
* 새로운 인코딩
* 난수 생성을 위한 Random 클래스
* 새롭게 쓰여진 Time 클래스。2038년 문제가 해결됨.
* 몇 가지 정규식 확장
* $:는 현재 디렉터리를 포함하지 않도록 됨.
* dl은 libffi 상에서 새롭게 쓰여짐.
* libyaml의 wrapper인 psych 라이브러리. syck의 대용으로 사용가능.

Ruby 1.9.2은 8월초 릴리즈될 예정입니다. 1.9.2 릴리즈 스케쥴은 RubySpec 호환성을 위해 취소된 적이 있으나,
현재는 RubySpec 99%이상의 호환성을 보장하고 있습니다.

사용중 문제가 발생하였을 때에는 [Ruby Issue Tracking System][3]을 통해 문제점을 알려주시기 바랍니다.

### 다운로드

* [&lt;URL:http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-rc2.tar.bz2&gt;][4]
  SIZE
  : 8480974 bytes

  MD5
  : 4e4906d0aab711286b31f5a834860cc3

  SHA256
  : 692ebae991b104482dc9f0d220c1afb6b690a338b3b815aaa4f62954d2fa1b4a

* [&lt;URL:http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-rc2.tar.gz&gt;][5]
  SIZE
  : 10781884 bytes

  MD5
  : d12cd39eee4d99bc54b52aba5a0ba4e1

  SHA256
  : 5d523d99f928705ac1de84ade03283c468415c00f8b6755a8dd7a140828869b4

* [&lt;URL:http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-rc2.zip&gt;][6]
  SIZE
  : 12161233 bytes

  MD5
  : 05229b43981e4e5ce58b5fb2e98eee52

  SHA256
  : 33f7f4cdd8444c2594728f70ac07477575a7cba5e7756bd3645f23e52605618c



[1]: http://svn.ruby-lang.org/repos/ruby/tags/v1_9_2_rc2/NEWS
[2]: http://svn.ruby-lang.org/repos/ruby/tags/v1_9_2_rc2/ChangeLog
[3]: https://bugs.ruby-lang.org/projects/show/ruby-19/
[4]: http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-rc2.tar.bz2
[5]: http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-rc2.tar.gz
[6]: http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-rc2.zip
