---
layout: page
title: "수동 메일링 리스트 조작"
lang: ko
---

NOTE: 구독할 수 없는 경우 [lists.ruby-lang.org](http://lists.ruby-lang.org)를
참고하세요.

메일링 리스트를 구독하려면 다음 내용의 plain 텍스트 이메일을 제목없이
자동화된 “controller” 메일 주소로 보내면 됩니다.

    subscribe
{: .code}

Ruby-Talk
: Ruby-Talk 메일링 리스트에서 controller 메일 주소는
  [ruby-talk-request@ruby-lang.org](mailto:ruby-talk-request@ruby-lang.org),
  투고용 메일 주소는
  [ruby-talk@ruby-lang.org](mailto:ruby-talk@ruby-lang.org),
  관리자(사람)의 메일 주소는
  [ruby-talk-owner@ruby-lang.org](mailto:ruby-talk-owner@ruby-lang.org)입니다.

Ruby-Core
: Ruby-Core 메일링 리스트에서 controller 메일 주소는
  [ruby-core-request@ruby-lang.org](mailto:ruby-core-request@ruby-lang.org),
  투고용 메일 주소는
  [ruby-core@ruby-lang.org](mailto:ruby-core@ruby-lang.org),
  관리자(사람)의 메일 주소는
  [ruby-core-owner@ruby-lang.org](mailto:ruby-core-owner@ruby-lang.org)입니다.

Ruby-Doc
: Ruby-Doc 메일링 리스트에서 controller 메일 주소는
  [ruby-doc-request@ruby-lang.org](mailto:ruby-doc-request@ruby-lang.org),
  투고용 메일 주소는
  [ruby-doc@ruby-lang.org](mailto:ruby-doc@ruby-lang.org),
  관리자(사람)의 메일 주소는
  [ruby-doc-owner@ruby-lang.org](mailto:ruby-doc-owner@ruby-lang.org)입니다.

Ruby-CVS
: Ruby-CVS 메일링 리스트에서 controller 메일 주소는
  [ruby-cvs-request@ruby-lang.org](mailto:ruby-cvs-request@ruby-lang.org),
  투고용 메일 주소는
  [ruby-cvs@ruby-lang.org](mailto:ruby-cvs@ruby-lang.org),
  관리자(사람)의 메일 주소는
  [ruby-cvs-owner@ruby-lang.org](mailto:ruby-cvs-owner@ruby-lang.org)입니다.

### 해지

메일링 리스트를 구독 해지하시려면
**controller 메일 주소**로 본문에 “unsubscribe”라고 적으신 다음 보내시면 됩니다.

    unsubscribe
{: .code}

plain 텍스트 메일인지 확인하세요. HTML은 동작하지 않습니다.

### help 명령어

명렁어 리스트를 보시려면 controller 메일 주소로 본문이 “help”인 메일을 보내세요.

