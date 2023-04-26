---
layout: news_post
title: "CVE-2021-32066: Net::IMAP의 StartTLS 스트립 취약점"
author: "shugo"
translator: "yous"
date: 2021-07-07 09:00:00 +0000
tags: security
lang: ko
---

Net::IMAP에서 StartTLS 스트립 취약점이 발견되었습니다.
이 취약점은 CVE 번호 [CVE-2021-32066](https://www.cve.org/CVERecord?id=CVE-2021-32066)에 할당되었습니다.
Ruby를 업그레이드하시길 강력히 권합니다.

net-imap은 Ruby 3.0.1의 기본 gem이지만, 패키징 문제가 있으므로 Ruby 자체를 업그레이드하시기 바랍니다.

## 세부 내용

Net::IMAP은 StartTLS가 알 수 없는 응답과 함께 실패할 경우 예외를 발생시키지 않는데,
이는 중간자(man-in-the-middle) 공격자가 TLS 보호를 우회할 수 있도록 합니다.
일명 'StartTLS 스트립 공격'으로, 클라이언트와 레지스트리 사이에서 네트워크 위치를 이용해 StartTLS 명령을 차단합니다.

## 해당 버전

* Ruby 2.6 버전대: 2.6.7 이하
* Ruby 2.7 버전대: 2.7.3 이하
* Ruby 3.0 버전대: 3.0.1 이하

## 도움을 준 사람

이 문제를 보고해 준 [Alexandr Savca](https://hackerone.com/chinarulezzz)에게 감사를 표합니다.

## 수정 이력

* 2021-07-07 09:00:00 UTC 최초 공개
