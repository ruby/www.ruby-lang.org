---
layout: news_post
title: "ext/openssl의 기본 설정 변경"
author: "usa"
translator: "marocchino"
date: 2014-10-27 12:00:00 +0000
tags: security
lang: ko
---

루비 2.1.4, 루비 2.0.0-p594, 루비 1.9.3-p550에서 ext/openssl의 기본 설정을
변경하였습니다.
이 수정으로 안전하지 않은 SSL/TLS 옵션이 꺼짐이 기본값이 됩니다.
하지만, 이 수정은 SSL 연결에 문제를 일으킬 수도 있습니다.

## 상세 정보

OpenSSL은 여전히 프로토콜과 암호를 구현 중이고, 역사적 상황에 의해 지금도 안전하지 않은 것으로 간주됩니다.
POODLE 취약점([CVE-2014-3566](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-3566)) 같은,
OpenSSL의 안전하지 않은 기능을 계속 사용할 경우,
네트워크 통신의 안전을 유지하지 못할 수도 있습니다.
그래서, [Bug #9424](https://bugs.ruby-lang.org/issues/9424)에서 한 토론을 바탕으로,
안전하지 않은 SSL/TLS 옵션을 꺼짐을 기본으로 변경하기로 결정했습니다.
이 수정(밑의 링크)을 되돌릴 필요가 있다면, 리버스 패치를 적용하세요.

2.1.4
: [r48098](https://git.ruby-lang.org/ruby.git)

2.0.0-p594
: [r48110](https://git.ruby-lang.org/ruby.git)

1.9.3-p550
: [r48121](https://git.ruby-lang.org/ruby.git)

하지만, 이 수정을 되돌린다면, 네트워크의 안전을 보장할 수 없는 위험이있습니다.
당신은 이 변경을 되돌리기 전에 그 점을 숙지하셔야 합니다.

### 루비에 포함된 라이브러리들

이 변경은 net/http, net/imap, net/pop에 반영됩니다.
DRb와 WEBrick은 별도의 설정을 사용하기 떄문에, 영향받지 않습니다.

### ext/openssl을 직접 사용하는 스크립트

이 변경은 `OpenSSL::SSL::SSLContext` 객체가 객체화될 때와 인스턴스 메서드 `set_params`가 불릴 때 반영됩니다.

예를 들면, 이런 코드입니다.

{% highlight ruby %}
ctx = OpenSSL::SSL::SSLContext.new
ctx.set_params  # 인증서 저장소나 확인 모드 같은 몇몇 옵션을 변경하려면, 매개 변수를 해시로 넘길 수 있습니다.
ssl = OpenSSL::SSL::SSLSocket.new(socket, ctx)
{% endhighlight %}

ext/openssl을 클라이언트 측에서 사용하는 경우, 이 변화가 아무런 문제가 없을 수도
있다고 생각합니다.
하지만, ext/openssl을 서버 측에서 사용하고 이 수정이 반영된다면, 일부 오래된
클라이언트(윈도우 XP의 인터넷 익스플로러 6, 오래된 휴대폰의 브라우저 등)는
서버에 접속할 수 없을 수도 있습니다.

이 설정을 켤지 끌지는 당신의 선택입니다. 트레이드 오프를 생각해 보세요.

## 해결 방법

루비를 업데이트할 수 없지만, 안전하지 않은 SSL/TLS 옵션에 대처해야 한다면, 이 몽키
패치를 적용하세요.

{% highlight ruby %}
module OpenSSL
  module SSL
    class SSLContext
      remove_const(:DEFAULT_PARAMS)
      DEFAULT_PARAMS = {
        :ssl_version => "SSLv23",
        :verify_mode => OpenSSL::SSL::VERIFY_PEER,
        :ciphers => %w{
          ECDHE-ECDSA-AES128-GCM-SHA256
          ECDHE-RSA-AES128-GCM-SHA256
          ECDHE-ECDSA-AES256-GCM-SHA384
          ECDHE-RSA-AES256-GCM-SHA384
          DHE-RSA-AES128-GCM-SHA256
          DHE-DSS-AES128-GCM-SHA256
          DHE-RSA-AES256-GCM-SHA384
          DHE-DSS-AES256-GCM-SHA384
          ECDHE-ECDSA-AES128-SHA256
          ECDHE-RSA-AES128-SHA256
          ECDHE-ECDSA-AES128-SHA
          ECDHE-RSA-AES128-SHA
          ECDHE-ECDSA-AES256-SHA384
          ECDHE-RSA-AES256-SHA384
          ECDHE-ECDSA-AES256-SHA
          ECDHE-RSA-AES256-SHA
          DHE-RSA-AES128-SHA256
          DHE-RSA-AES256-SHA256
          DHE-RSA-AES128-SHA
          DHE-RSA-AES256-SHA
          DHE-DSS-AES128-SHA256
          DHE-DSS-AES256-SHA256
          DHE-DSS-AES128-SHA
          DHE-DSS-AES256-SHA
          AES128-GCM-SHA256
          AES256-GCM-SHA384
          AES128-SHA256
          AES256-SHA256
          AES128-SHA
          AES256-SHA
          ECDHE-ECDSA-RC4-SHA
          ECDHE-RSA-RC4-SHA
          RC4-SHA
        }.join(":"),
        :options => -> {
          opts = OpenSSL::SSL::OP_ALL
          opts &= ~OpenSSL::SSL::OP_DONT_INSERT_EMPTY_FRAGMENTS if defined?(OpenSSL::SSL::OP_DONT_INSERT_EMPTY_FRAGMENTS)
          opts |= OpenSSL::SSL::OP_NO_COMPRESSION if defined?(OpenSSL::SSL::OP_NO_COMPRESSION)
          opts |= OpenSSL::SSL::OP_NO_SSLv2 if defined?(OpenSSL::SSL::OP_NO_SSLv2)
          opts |= OpenSSL::SSL::OP_NO_SSLv3 if defined?(OpenSSL::SSL::OP_NO_SSLv3)
          opts
        }.call
      }
    end
  end
end
{% endhighlight %}

## 이 수정에 영향 받는 버전

* 루비 1.9.3 패치레벨 550 이후의 버전
* 루비 2.0.0 패치레벨 594 이후의 버전
* 루비 2.1.4 이후의 버전
* 리비전 48097 이후의 트렁크

## 수정 이력

* 2014-10-27 12:00:00 (UTC) 최초 공개
