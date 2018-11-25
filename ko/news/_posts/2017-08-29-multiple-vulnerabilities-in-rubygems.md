---
layout: news_post
title: "RubyGems의 취약점 다수 발견"
author: "usa"
translator: "wagurano"
date: 2017-08-29 12:00:00 +0000
tags: security
lang: ko
---

루비 부가 라이브러리인 RubyGems의 취약점 다수가 발견되었습니다.
[RubyGems 공식 블로그](http://blog.rubygems.org/2017/08/27/2.6.13-released.html)에 보고되었습니다.

## 세부 내용

아래와 같은 취약점이 보고되었습니다.

* DNS 요청 하이재킹 취약점. (CVE-2017-0902)
* ANSI 이스케이프 시퀀스 취약점. (CVE-2017-0899)
* 질의 명령의 DoS 취약점. (CVE-2017-0900)
* 악성 젬이 임의의 파일을 덮어 써도 루비 인스톨러가 허용하는 취약점. (CVE-2017-0901)

루비 사용자는 가능한 빨리 업그레이드하거나 아래 해결 방법으로 조치하기 바랍니다.

## 해당 버전

* 루비 2.2 버전대: 2.2.7 이하
* 루비 2.3 버전대: 2.3.4 이하
* 루비 2.4 버전대: 2.4.1 이하
* 리비전 59672 이전의 트렁크

## 해결 방법

루비를 업그레이드할 수 없는 상황이라면 RubyGems를 최신 버전으로
업그레이드하세요.
RubyGems 2.6.13 이후 버전은 취약점을 보완하였습니다.

```
gem update --system
```

RubyGems를 업그레이드를 할 수 없다면, 차선책으로 다음 패치를 적용할 수 있습니다.

* [루비 2.2.7](https://bugs.ruby-lang.org/attachments/download/6690/rubygems-2613-ruby22.patch)
* [루비 2.3.4](https://bugs.ruby-lang.org/attachments/download/6691/rubygems-2613-ruby23.patch)
* 루비 2.4.1: 패치 2개 필요. 아래 순서대로 적용:
  1. [RubyGems 2.6.11에서 2.6.12로 패치](https://bugs.ruby-lang.org/attachments/download/6692/rubygems-2612-ruby24.patch)
  2. [RubyGems 2.6.12에서 2.6.13으로 패치](https://bugs.ruby-lang.org/attachments/download/6693/rubygems-2613-ruby24.patch)

개발버전에 대하여는, 최신 리비전으로 업데이트합니다.

## 도움을 준 글

이 보고서는 [RubyGems 공식 블로그](http://blog.rubygems.org/2017/08/27/2.6.13-released.html)를 바탕으로 하여 작성하였습니다.

## 수정 이력

* 2017-08-29 21:00:00 (KST) 최초 공개
* 2017-08-31 11:00:00 (KST) CVE 번호 추가
* 2017-09-15 21:00:00 (KST) 루비 업그레이드 언급
