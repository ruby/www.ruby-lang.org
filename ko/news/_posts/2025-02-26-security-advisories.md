---
layout: news_post
title: "보안 권고 CVE-2025-27219, CVE-2025-27220, CVE-2025-27221"
author: "hsbt"
translator: "shia"
date: 2025-02-26 07:00:00 +0000
tags: security
lang: ko
---

CVE-2025-27219, CVE-2025-27220 및 CVE-2025-27221에 대한 보안 권고를 발표했습니다. 아래 내용을 확인해 주세요.

## CVE-2025-27220: `CGI::Cookie.parse`에서의 서비스 거부

cgi gem에서 DoS가 발생할 수 있습니다. 이 취약점은 CVE 식별자 [CVE-2025-27219](https://www.cve.org/CVERecord?id=CVE-2025-27219)가 할당되었습니다. cgi gem을 업그레이드하기를 추천합니다.

### 세부 내용

`CGI::Cookie.parse`는 특정 쿠키 문자열을 구문 분석할 때 초선형(super-linear) 시간이 걸렸습니다. 이 메서드에 악의적으로 조작된 쿠키 문자열을 넘기면 서비스 거부가 발생할 수 있습니다.

CGI gem의 버전을 0.3.5.1, 0.3.7, 0.4.2 또는 그 이상으로 업데이트하세요.

### 해당 버전

* cgi gem 버전 <= 0.3.5, 0.3.6, 0.4.0 및 0.4.1

### 도움을 준 사람

이 문제를 발견해 준 [lio346](https://hackerone.com/lio346)에게 감사를 표합니다. 또한 이 취약점을 수정한 [mame](https://github.com/mame)에게도 감사를 표합니다.

## CVE-2025-27220: `CGI::Util#escapeElement`에서의 ReDoS

cgi gem에서 정규 표현식 거부 서비스(ReDoS)가 발생할 수 있습니다. 이 취약점은 CVE 식별자 [CVE-2025-27220](https://www.cve.org/CVERecord?id=CVE-2025-27220)가 할당되었습니다. cgi gem을 업그레이드하기를 추천합니다.

### 세부 내용

`CGI::Util#escapeElement`에서 사용된 정규 표현식이 ReDoS에 취약합니다. 정교하게 만들어진 입력은 높은 CPU 소비로 이어질 수 있습니다.

이 취약점은 Ruby 3.1 및 3.2에서만 영향을 미칩니다. 이러한 버전을 사용 중이라면 CGI gem을 버전을 0.3.5.1, 0.3.7, 0.4.2 또는 그 이상으로 업데이트하세요.

### 해당 버전

* cgi gem 버전 <= 0.3.5, 0.3.6, 0.4.0 및 0.4.1

### 도움을 준 사람

이 문제를 발견해 준 [svalkanov](https://hackerone.com/svalkanov)에게 감사를 표합니다. 또한 이 취약점을 수정한 [nobu](https://github.com/nobu)에게도 감사를 표합니다.


## CVE-2025-27221: `URI#join`, `URI#merge` 및 `URI#+`에서의 사용자 정보 유출

uri gem에서 사용자 정보 유출이 발생할 수 있습니다. 이 취약점은 CVE 식별자 [CVE-2025-27221](https://www.cve.org/CVERecord?id=CVE-2025-27221)가 할당되었습니다. uri gem을 업그레이드하기를 추천합니다.

### 세부 내용

`URI#join`, `URI#merge`, `URI#+` 메서드는 호스트 정보를 교체하더라도  `user:password`와 같은 사용자 정보를유지합니다. 이러한 메서드를 사용하여 비밀인 사용자 정보를 포함하는 URL에서 악의적인 호스트로 URL을 생성하고, 누군가가 해당 URL에 액세스하면 의도하지 않은 사용자 정보 유출이 발생할 수 있습니다.

URI gem을 버전 0.11.3, 0.12.4, 0.13.2, 1.0.3 또는 그 이상으로 업데이트하세요.

### 해당 버전

* uri gem 버전 < 0.11.3, 0.12.0부터 0.12.3까지, 0.13.0, 0.13.1 및 1.0.0부터 1.0.2까지

### 도움을 준 사람

이 문제를 발견해 준 [Tsubasa Irisawa (lambdasawa)](https://hackerone.com/lambdasawa)에게 감사를 표합니다. 또한 이 취약점을 수정한 [nobu](https://github.com/nobu)에게도 감사를 표합니다.

## 수정 이력

* 2025-02-26 7:00:00 (UTC) 최초 공개
