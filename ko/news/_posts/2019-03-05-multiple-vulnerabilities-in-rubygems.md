---
layout: news_post
title: "RubyGems의 취약점 다수 발견"
author: "hsbt"
translator: "shia"
date: 2019-03-05 00:00:00 +0000
tags: security
lang: ko
---

루비에 포함되어 있는 라이브러리인 RubyGems의 취약점이 다수 발견되었습니다.
[RubyGems 공식 블로그](http://blog.rubygems.org/2019/03/05/security-advisories-2019-03.html)에 보고되었습니다.

## 세부 내용

아래와 같은 취약점이 보고되었습니다.

* CVE-2019-8320: tar 압축 풀기 중 심볼릭 링크를 이용한 폴더 삭제
* CVE-2019-8321: `verbose`에서의 이스케이프 시퀀스 주입 취약점
* CVE-2019-8322: `gem owner`에서의 이스케이프 시퀀스 주입 취약점
* CVE-2019-8323: API 응답 처리 중의 이스케이프 시퀀스 주입 취약점
* CVE-2019-8324: 임의의 코드 실행을 유도할 수 있는 악의적인 젬 설치
* CVE-2019-8325: 에러 중 이스케이프 시퀀스 주입 취약점

루비 사용자는 가능한 빨리 루비를 업그레이드하거나 아래 해결 방법으로 조치하기 바랍니다.

## 해당 버전

* 루비 2.3 버전대: 모든 버전
* 루비 2.4 버전대: 2.4.5 이하
* 루비 2.5 버전대: 2.5.3 이하
* 루비 2.6 버전대: 2.6.1 이하
* 리비전 67168 이전의 트렁크

## 해결 방법

원칙적으로는 설치된 루비를 최신 버전으로 업그레이드해야 합니다.
RubyGems 3.0.3이나 그 이후의 버전은 취약점에 대한 패치를 포함하고 있으므로, 루비를 업그레이드할 수 없다면 RubyGems를 최신 버전으로 업그레이드해 주세요.

```
gem update --system
```

RubyGems를 업그레이드를 할 수 없다면, 차선책으로 다음 패치를 적용할 수 있습니다.

* [루비 2.4.5](https://bugs.ruby-lang.org/attachments/7669)
* [루비 2.5.3](https://bugs.ruby-lang.org/attachments/7670)
* [루비 2.6.1](https://bugs.ruby-lang.org/attachments/7671)

루비 개발 버전은 최신 리비전으로 업데이트하세요.

## 도움을 준 글

이 보고서는 [RubyGems 공식 블로그](http://blog.rubygems.org/2019/03/05/security-advisories-2019-03.html)를 바탕으로 하여 작성하였습니다.

## 수정 이력

* 2019-03-05 00:00:00 UTC 최초 공개
* 2019-03-06 05:26:27 UTC 패치에 대한 링크 추가
* 2019-04-01 06:00:00 UTC 루비 업그레이드 언급
