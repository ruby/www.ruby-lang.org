---
layout: page
title: "보안이슈"
lang: ko
---

Ruby와 관련한 보안이슈에 대해 정보를 공유하는 곳입니다.

### 문제점 알리기

보안상 취약한 부분이나 심각한 문제를 야기할 수 있는 부분에 대해서는
[security@ruby-lang.org](mailto:security@ruby-lang.org)를 통해 알려주십시오. 이는
비공개 메일링 리스트로서 운영되고 있으며 보고된 문제에 대한 확인과 해결책이 이루어진 다음 일반에게 정보를 공개하고 있습니다.

여러분께서 알려주신 문제점은 더욱 향상된 Ruby를 개발하는데 있어 중요한 자료가 됩니다. 혹 문제점이 발견되었을 경우에는
개인적인 블로그나 기타 게시판을 이용하기 보다는 비공개 메일링 리스트
[security@ruby-lang.org](mailto:security@ruby-lang.org)를 통해 알려주시면
감사하겠습니다.

보고 방식에 관해서는 [redmine wiki][1] 를 참고하시기 바랍니다.

### 알려진 취약점

다음과 같은 보안 취약점이 보고된 바 있습니다.

* [WEBrick XSS취약점][2] 2010년 8월 16일 공개
* [WEBrick::이스케이프 시퀀스 취약점][3] 2010년 1월 10일 공개
* [임의의 코드를 실행할 수 있는 보안 취약성][4] 2008년 6월 20일 공개

이외의 좀 더 자세한 사항은 [영문 홈페이지][5]를 참조하시기 바랍니다.



[1]: http://redmine.ruby-lang.org/projects/ruby/wiki
[2]: /ko/news/2010/08/16/webrick-xss-cve-2010-0541/ "CVE-2010-0541"
[3]: /ko/news/2010/01/15/webrick-escape-sequence-injection/
[4]: /ko/news/2008/06/23/arbitrary-code-execution-vulnerabilities/
[5]: /en/security
