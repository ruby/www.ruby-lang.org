---
layout: news_post
title: "CVE-2021-31799: RDoc의 명령 주입 취약점"
author: "aycabta"
translator: "yous"
date: 2021-05-02 09:00:00 +0000
tags: security
lang: ko
---

Ruby에 포함된 RDoc에 명령 주입 취약점이 있습니다.
문제 해결을 위해 모든 Ruby 사용자는 RDoc을 최신 버전으로 업데이트하시기 바랍니다.

## 세부 내용

다음 취약점이 보고되었습니다.

* [CVE-2021-31799](https://www.cve.org/CVERecord?id=CVE-2021-31799)

RDoc은 로컬 파일을 열기 위해 `Kernel#open`을 호출했습니다. Ruby 프로젝트에 `|`로 시작하고 `tags`로 끝나는 이름을 가진 파일이 있다면, 파이프 문자 뒤의 명령이 실행되었습니다. 악의적인 Ruby 프로젝트가 `rdoc` 명령을 실행하려고 하는 사용자에 대해 임의의 명령을 실행할 수 있습니다.

이 문제에 영향을 받는 RDoc 버전을 사용 중인 Ruby 사용자는 RDoc을 최신 버전으로 업데이트해야 합니다.

## 해당 버전

* RDoc 3.11 이상 6.3.0 이하

## 업데이트 방법

취약점 해결을 위해 RDoc을 최신 버전(6.3.1 이상)으로 업데이트하려면 다음 명령을 실행하세요.

```
gem install rdoc
```

bundler를 사용한다면 `Gemfile`에 `gem "rdoc", ">= 6.3.1"`을 추가하세요.

## 도움을 준 사람

이 문제를 보고해 준 [Alexandr Savca](https://hackerone.com/sighook)에게 감사를 표합니다.

## 수정 이력

* 2021-05-02 09:00:00 UTC 최초 공개
