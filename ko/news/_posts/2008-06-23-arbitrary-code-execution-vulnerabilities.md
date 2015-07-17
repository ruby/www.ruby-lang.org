---
layout: news_post
title: "임의의 코드를 실행할 수 있는 보안 취약점"
author: "Bryan Kang"
lang: ko
---

루비에서 서비스 거부 공격(DoS)을 일으키거나 임의의 코드를 실행할 수 있는 보안 취약점이 다수 발견되었습니다.

## 파장

아래 보안 취약점으로, 공격자는 서비스 거부 공격을 하거나, 임의의 코드를 실행할 수 있습니다.

* [CVE-2008-2662][1]
* [CVE-2008-2663][2]
* [CVE-2008-2725][3]
* [CVE-2008-2726][4]
* [CVE-2008-2664][5]

## 취약한 버전

1.8 시리즈
: * 1\.8.4와 그 이전 버전
  * 1\.8.5-p230과 그 이전 버전
  * 1\.8.6-p229와 그 이전 버전
  * 1\.8.7-p21과 그 이전 버전

1.9 시리즈
: * 1\.9.0-1과 그 이전 버전

## 해결책

1.8 시리즈
: 1\.8.5-p231, 1.8.6-p230, 1.8.7-p22 버전으로 업그레이드하시기 바랍니다.

  * [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.5-p231.tar.gz&gt;][6]
    (md5sum: e900cf225d55414bffe878f00a85807c)
  * [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.6-p230.tar.gz&gt;][7]
    (md5sum: 5e8247e39be2dc3c1a755579c340857f)
  * [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p22.tar.gz&gt;][8]
    (md5sum: fc3ede83a98f48d8cb6de2145f680ef2)

1.9 시리즈
: 1\.9.0-2로 업그레이드하시기 바랍니다.

  * [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.0-2.tar.gz&gt;][9]
    (md5sum: 2a848b81ed1d6393b88eec8aa6173b75)

이 버전에서는 WEBrick의 보안 취약점도 해결되었습니다([CVE-2008-1891][10]).

현재 사용 중인 패키지 관리 소프트웨어에서 취약점을 이미 해결된 버전을 찾을 수 있는지 먼저 확인하시기 바랍니다.

## 보고자

애플 제품 보안팀의 Drew Yao 씨가 루비 보안팀에 이 사실을 보고해주었습니다.

## 변경사항

* 2008-06-21 00:29 +09:00 잘못된 CVE ID(CVE-2008-2727, CVE-2008-2728)를
  수정하였습니다.



[1]: http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2008-2662
[2]: http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2008-2663
[3]: http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2008-2725
[4]: http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2008-2726
[5]: http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2008-2664
[6]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.5-p231.tar.gz
[7]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.6-p230.tar.gz
[8]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p22.tar.gz
[9]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.0-2.tar.gz
[10]: http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2008-1891
