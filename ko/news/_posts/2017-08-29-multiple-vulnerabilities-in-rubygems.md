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
* 악성 젬이 파일을 임의로 덮어 쓰기 하여도 루비 인스톨러가 허용하는 취약점. (CVE-2017-0901)

루비 사용자는 아래의 해결 방법 중 하나를 즉시 따를 것으로 강력히 권고합니다.

## 해당 버전

* 루비 2.2 버전대: 2.2.7 이하
* 루비 2.3 버전대: 2.3.4 이하
* 루비 2.4 버전대: 2.4.1 이하
* 리비전 59672 이전의 트렁크

## 해결 방법

지금은 RubyGems를 보완한 루비 릴리스 버전이 없습니다.
그러나 RubyGems를 최신 버전으로 업그레이드할 수 있습니다.
루비 2.6.13 이후 버전은 취약점을 보완하여 적용하였습니다.

```
gem update --system
```

RubyGems를 업그레이드를 할 수 없다면, 아래의 패치를 제2의 해결 방법으로 적용할 수 있습니다.

* [루비 2.2.7](https://bugs.ruby-lang.org/attachments/download/6690/rubygems-2613-ruby22.patch)
* [루비 2.3.4](https://bugs.ruby-lang.org/attachments/download/6691/rubygems-2613-ruby23.patch)
* 루비 2.4.1.: 패치 2개 필요. 아래 순서대로 적용:
  1. [RubyGems 2.6.11에서 2.6.12로 패치](https://bugs.ruby-lang.org/attachments/download/6692/rubygems-2612-ruby24.patch)
  2. [RubyGems 2.6.12에서 2.6.13로 패치](https://bugs.ruby-lang.org/attachments/download/6693/rubygems-2613-ruby24.patch)

개발버전에 대하여는, 최신 리비전으로 업데이트합니다.

## 도움을 준 글

이 보고서는 [RubyGems 공식 블로그](http://blog.rubygems.org/2017/08/27/2.6.13-released.html)를 바탕으로 하여 작성하였습니다.

## 수정 이력

* 2017-08-29 21:00:00 (KST) 최초 공개
* 2017-08-31 11:00:00 (KST) CVE 번호 추가
