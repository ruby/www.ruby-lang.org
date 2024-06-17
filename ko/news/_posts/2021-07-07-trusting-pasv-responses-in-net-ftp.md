---
layout: news_post
title: "CVE-2021-31810: Net::FTP의 FTP PASV 응답 신뢰 취약점"
author: "shugo"
translator: "yous"
date: 2021-07-07 09:00:00 +0000
tags: security
lang: ko
---

Net::FTP에서 FTP PASV 응답 신뢰 취약점이 발견되었습니다.
이 취약점에 CVE 번호 [CVE-2021-31810](https://www.cve.org/CVERecord?id=CVE-2021-31810)이 할당되었습니다.
Ruby를 업그레이드하시길 강력히 권합니다.

net-ftp는 Ruby 3.0.1의 기본 gem이지만, 패키징 문제가 있으므로 Ruby 자체를 업그레이드하시기 바랍니다.

## 세부 내용

악의적인 FTP 서버에서 PASV 응답을 사용해 Net::FTP를 속여 주어진 IP 주소와 포트로 연결해 오도록 할 수 있습니다.
이를 통해 Net::FTP가 공개되지 않은 서비스의 정보를 추출하도록 할 수 있습니다.
(예를 들어, 공격자가 포트 스캔을 하거나 서비스 배너를 추출할 수 있습니다.)

## 해당 버전

* Ruby 2.6 버전대: 2.6.7 이하
* Ruby 2.7 버전대: 2.7.3 이하
* Ruby 3.0 버전대: 3.0.1 이하

## 도움을 준 사람

이 문제를 보고해 준 [Alexandr Savca](https://hackerone.com/sighook)에게 감사를 표합니다.

## 수정 이력

* 2021-07-07 09:00:00 UTC 최초 공개
