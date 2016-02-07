---
layout: news_post
title: "루비 1.8.7과 1.9.2의 보안 유지보수 연장"
author: "zzak"
translator: "SeungKyun Nam"
date: 2013-12-17 20:49:03 +0000
lang: ko
---

즉시 적용되는 사항으로, 2014년 6월까지 1.8.7과 1.9.2에 보안 패치가 지원될 것입니다.

* Terence Lee([@hone02](https://twitter.com/hone02))와
  Zachary Scott([@_zzak](https://twitter.com/_zzak))가
  메인테이너를 맡을 것입니다.
* 6개월 유지보수 기간이 지난 후, 추가 6개월을 연장하기 위해 더 많은 커미터들을 투입할 수 있습니다.

본 유지보수 연장은 [Heroku][heroku] 덕분에 가능해졌습니다.
더 많은 정보는 그들의 블로그 포스트 [A Patch in Time: Securing Ruby][securing-ruby]를 읽어보십시오.

### 이슈를 리포팅하는 법

본 연장된 유지보수 기간 동안 우리는 _단지_ 보안 패치만 [1.8.7][source-187]과 [1.9.2][source-192]를 위한 소스코드 저장소에 적용할 것입니다.

우리는 보안을 매우 진지하게 다루고 있습니다. 만약 취약점을 찾으셨다면 즉시 security@ruby-lang.org로 보고해 주십시오.
이 메일링 리스트는 사적인 것이며 보고된 문제는 수정본이 릴리스된 이후 공개될 것입니다.

더 많은 정보는 [ruby-lang.org/ko/security][security-ko]에서 읽어보십시오.

### 릴리스 관리에 관하여

위에서 언급한 바와 같이, 우리는 오직 보안 패치만 적용하여 패치 레벨을 높여갈 것입니다.

우리는 ruby-lang.org에 패치된 버전의 1.8.7 혹은 1.9.2를 릴리스하지 않을 것입니다.

그 이유는 다음과 같습니다. 우리는 어떠한 새로운 티켓도 받고 싶지 않습니다.
공식 릴리스가 되면 그것은 ruby-core가 유지보수해야 할 지속적인 책임이 되기 때문입니다.
우리 팀 리소스는 이미 매우 낮으며, 기간이 지난 버전을 지원하는 대신 업그레이드를 장려하고 싶습니다.

### 왜 1.8.7을 부활시켰는가?

약 6개월 전에 언급한 [루비 1.8.7 지원을 종료합니다][sunset-187-ko]를 기억하실 것입니다.

ruby-core는 더 이상 1.8.7 혹은 1.9.2의 유지보수를 재개하지 않을 것이지만,
Terence와 Zachary가 기업 후원의 일환으로 이 버전의 보안 유지보수를 지원할 것입니다.

과거에도 구 버전을 유지하고자 하는 벤더들의 지원이 있었습니다. 2009년 루비 1.8.6의 유지보수가 Engine Yard로 이전되었고
그들은 1.8.6-p369를 릴리스하였습니다.

### 격려의 말

우리는 이번 일을 여러분들이 지원되는 버전의 루비로 가능한 빨리 업그레이드 해줄 것을 격려하는 기회로 삼고자 합니다.
많은 ruby-core 멤버들은 2.0 이상 버전 루비의 성능과 기능을 향상시키기 위해 헤아릴 수 없는 시간을 투입하고 있습니다.
그리고 우리는 여러분이 그 장점을 누리시길 바랍니다.

여러분의 지속적인 지원에 감사합니다. 루비를 더 좋게 만들어 갑시다!

[heroku]:        http://heroku.com/
[securing-ruby]: https://blog.heroku.com/archives/2013/12/5/a_patch_in_time_securing_ruby/
[source-187]:    https://bugs.ruby-lang.org/projects/ruby-187/repository
[source-192]:    https://bugs.ruby-lang.org/projects/ruby-192/repository
[security-ko]:   https://www.ruby-lang.org/ko/security/
[sunset-187-ko]: https://www.ruby-lang.org/ko/news/2013/06/30/we-retire-1-8-7/
