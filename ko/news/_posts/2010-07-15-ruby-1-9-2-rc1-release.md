---
layout: news_post
title: "루비 1.9.2 RC1 릴리스"
author: "Moru"
date: 2010-07-15 14:14:15 +0000
lang: ko
---

루비 1.9.2 RC1이 릴리스되었습니다. 이번 릴리스는 1.9.2의 첫번째 릴리스 후보입니다.

루비 1.9.2는 아래의 몇 가지 항목을 제외하고, 1.9.1과의 호환성을 유지하고 있습니다.

* 다수의 추가 메서드
* 새로운 socket API(IPv6 지원)
* 새로운 인코딩
* 난수 생성을 위한 Random 클래스
* 새롭게 쓰여진 Time 클래스. 2038년 문제가 해결됨.
* 몇 가지 정규식 확장
* $:는 현재 디렉터리를 포함하지 않도록 됨.
* dl은 libffi 상에서 새롭게 쓰여짐.
* libyaml의 wrapper인 psych 라이브러리. syck의 대용으로 사용가능.

자세한 사항은 [뉴스][1] 및 [변경로그][2]를 참조하여 주십시오.

루비 1.9.2 preview 3 이후 약 130건의 버그가 수정되었습니다. 루비 1.9.2의 알려진 버그는
[#3462][3]를 제외하고 모두 수정되었습니다.

루비 1.9.2는 8월 초 릴리스될 예정입니다. 1.9.2 릴리스 일정은 RubySpec 호환성을 위해 취소된 적이 있으나,
현재는 RubySpec 99%의 호환성을 보장하고 있습니다.

사용 중 문제가 발생하였을 때에는 [루비 이슈 트래킹 시스템][4]을 통해 문제점을 알려주시기 바랍니다.

### 다운로드

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-rc1.tar.bz2&gt;][5]
  SIZE
  : 8479087 bytes

  MD5
  : 242dcfaed8359a6918941b55d0806bf0

  SHA256
  : c2a680aa5472c8d04a71625afa2b0f75c030d3655a3063fe364cfda8b33c1480

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-rc1.tar.gz&gt;][6]
  SIZE
  : 10779309 bytes

  MD5
  : fdedd5b42ae89a9a46797823ad2d9acf

  SHA256
  : 3e90036728342ce8463be00d42d4a36de70dabed96216c5f8a26ec9ba4b29537

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-rc1.zip&gt;][7]
  SIZE
  : 12158992 bytes

  MD5
  : 3da59c5d3567f6e1f1697abbef71f507

  SHA256
  : 4f593a3d0873cea8f371a7fc7484cad7bc03acac0ada1970cb9f83a89bc27997



[1]: https://git.ruby-lang.org/ruby.git/plain/NEWS?id=refs/tags/v1_9_2_rc1
[2]: https://git.ruby-lang.org/ruby.git/plain/ChangeLog?id=refs/tags/v1_9_2_rc1
[3]: https://bugs.ruby-lang.org/issues/show/3462
[4]: https://bugs.ruby-lang.org/projects/show/ruby-19/
[5]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-rc1.tar.bz2
[6]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-rc1.tar.gz
[7]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-rc1.zip
