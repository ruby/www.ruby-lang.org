---
layout: news_post
title: "보안 권고: Regexp와 String 대소문자 변환에서 발견된 여러 취약점"
author: "mame"
translator: "shia"
date: 2026-11-18 22:00:00 +0000
tags: security
lang: ko
---

Ruby의 정규표현식 엔진과 문자열 대소문자 변환에서 취약점 7건이 발견되었습니다. 그중 일부는 원격 코드 실행에 악용될 수 있다는 것을 입증하는 PoC가 있음을 확인했습니다. 이 취약점들을 수정한 Ruby 4.0.10, 3.4.13, 3.3.14를 릴리스했습니다. 업그레이드를 강력히 권장합니다.

이 취약점들에 대한 CVE 번호를 요청했지만 아직 할당되지 않았으므로, 이 보안 권고에서는 GitHub Security Advisory(GHSA) 번호로 각 취약점을 표기합니다.

## [GHSA-34m4-m9fh-gqp5](https://github.com/ruby/ruby/security/advisories/GHSA-34m4-m9fh-gqp5): 문자열 대소문자 변환의 힙 버퍼 오버플로

Ruby의 문자열 대소문자 변환에 1바이트 힙 버퍼 오버플로가 있습니다. 조작된 문자열의 대소문자를 변환하면 원격 코드가 실행될 수 있습니다. 특정 상황에서 이 결함을 악용해 원격 코드를 실행할 수 있다는 것을 입증하는 PoC가 있음을 확인했습니다.

## [GHSA-7x2q-68qv-6p8x](https://github.com/ruby/ruby/security/advisories/GHSA-7x2q-68qv-6p8x): 정규표현식 컴파일의 중복 할당 해제

Ruby의 정규표현식 엔진에 중복 할당 해제 문제가 있습니다. 공격자가 조작할 수 있는 패턴을 컴파일하는 애플리케이션에서는 조작된 정규표현식 패턴을 컴파일하면 원격 코드가 실행될 수 있습니다. 특정 상황에서 이 결함을 악용해 원격 코드를 실행할 수 있다는 것을 입증하는 PoC가 있음을 확인했습니다.

## [GHSA-87fm-7w84-j2px](https://github.com/ruby/ruby/security/advisories/GHSA-87fm-7w84-j2px): 문자열 대소문자 변환의 정수 오버플로

Ruby의 문자열 대소문자 변환에 정수 오버플로가 있으며, 이로 인해 힙 버퍼 오버플로가 발생합니다. 조작된 문자열의 대소문자를 변환하면 원격 코드가 실행될 수 있습니다. 특정 상황에서 이 결함을 악용해 원격 코드를 실행할 수 있다는 것을 입증하는 PoC가 있음을 확인했습니다.

## [GHSA-wpqw-5qxg-m68r](https://github.com/ruby/ruby/security/advisories/GHSA-wpqw-5qxg-m68r): 대소문자를 구분하지 않는 정규표현식 매칭의 범위 밖 읽기

Ruby의 정규표현식 엔진에 범위 밖 읽기 문제가 있습니다. 공격자가 조작할 수 있는 패턴을 사용하는 애플리케이션에서는 조작된 정규표현식 패턴으로 매칭하면 원격 코드가 실행될 수 있습니다. 이 결함을 악용해 공격자가 의도한 방식으로 메모리를 손상시킬 수 있다는 것을 입증하는 PoC가 있음을 확인했습니다.

## [GHSA-3p8q-wmhx-vm2w](https://github.com/ruby/ruby/security/advisories/GHSA-3p8q-wmhx-vm2w): 정규표현식 컴파일의 힙 버퍼 오버플로

Ruby의 정규표현식 엔진에 정수 오버플로가 있으며, 이로 인해 힙 버퍼 오버플로가 발생합니다. 공격자가 조작할 수 있는 패턴을 컴파일하는 애플리케이션에서는 조작된 정규표현식 패턴을 컴파일하면 원격 코드가 실행될 수 있습니다. 특정 상황에서 이 결함을 악용해 원격 코드를 실행할 수 있다는 것을 입증하는 PoC가 있음을 확인했습니다.

## [GHSA-7whj-cfh7-xgm4](https://github.com/ruby/ruby/security/advisories/GHSA-7whj-cfh7-xgm4): Regexp#to_s의 힙 버퍼 오버플로

Ruby의 `Regexp#to_s`에 힙 버퍼 오버플로가 있습니다. 공격자가 조작할 수 있는 패턴을 컴파일하는 애플리케이션에서는 조작된 정규표현식을 문자열로 변환하면 정보가 유출되거나 원격 코드가 실행될 수 있습니다. 특정 상황에서 이 결함을 악용해 원격 코드를 실행할 수 있다는 것을 입증하는 PoC가 있음을 확인했습니다.

## [GHSA-pvgc-g7gj-pv6h](https://github.com/ruby/ruby/security/advisories/GHSA-pvgc-g7gj-pv6h): 대소문자를 구분하지 않는 역참조 매칭의 범위 밖 읽기

Ruby의 정규표현식 엔진에 범위 밖 읽기 문제가 있습니다. 조작된 문자열로 매칭하면 메모리 내용이 유출되거나 프로세스가 비정상 종료될 수 있습니다.

## 해당 버전

* Ruby 3.3.13 이하
* Ruby 3.4.0부터 3.4.12까지
* Ruby 4.0.0부터 4.0.9까지

## 권장 조치

Ruby 4.0.10, 3.4.13 또는 3.3.14로 업그레이드하는 것을 강력히 권장합니다.

Ruby 3.3은 보안 유지보수 단계입니다. Ruby 3.2 이하는 지원이 종료(EOL)되었으므로 이 수정이 제공되지 않습니다.

## 도움을 준 사람

* GHSA-34m4-m9fh-gqp5: Stephan Lipp (Ada Logics), Anthropic
* GHSA-7x2q-68qv-6p8x: Stephan Lipp (Ada Logics), Anthropic
* GHSA-87fm-7w84-j2px: [baba__yaga](https://hackerone.com/baba__yaga)
* GHSA-wpqw-5qxg-m68r: Stephan Lipp (Ada Logics), Anthropic
* GHSA-3p8q-wmhx-vm2w: [aphantom](https://hackerone.com/aphantom)
* GHSA-7whj-cfh7-xgm4: Stephan Lipp (Ada Logics), Anthropic
* GHSA-pvgc-g7gj-pv6h: Hiroya Fujinami, Hiroshi SHIBATA

## 수정 이력

* 2026-11-19 00:00:00 (UTC) 최초 공개
