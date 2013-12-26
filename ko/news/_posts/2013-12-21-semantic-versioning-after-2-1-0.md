---
layout: news_post
title: "루비 2.1.0 부터 시맨틱 버저닝을 시작합니다"
author: "zzak"
translator: "SeungKyun Nam"
date: 2013-12-21 2:00:00 UTC
lang: en
---

루비 2.1.0의 릴리즈와 함께 시작하는 [Semantic Versioning](http://semver.org/)-형식 정책으로 옮겨가기로 결정했습니다.

루비를 위한 보다 잘 정의되고 적절히 활용될 버저닝 스키마를 제공하기 위해, 점진적으로 이하 정책으로 전환하기로 결정했습니다.

## 정책 변경점

본 정책은 ruby-lang.org 시스템 관리자 Hiroshi Shibata ([@hsbt](https://twitter.com/hsbt))의 제안에 기초하고 있습니다.

### 버전 스키마

* `MAJOR`: MINOR 로 릴리즈할 수 없는 호환되지 않는 변경점이 생길 때 증가
  * 스페셜 이벤트를 위해 예약됨
* `MINOR`: 매 크리스마스에 증가됨, API가 호환되지 않을 수 있음
* `TEENY`: API 호환성을 유지한 보안 혹은 버그 수정
  * 10 이상으로 (예를 들어 `2.1.11`) 증가할 수 있으며, 매 2-3개월마다 릴리즈될 것입니다.
* `PATCH`: number of commits since last `MINOR` release (will be reset at 0 when releasing `MINOR`)
* `PATCH`: 최종 `MINOR` 릴리즈 이후의 커밋된 횟수 (`MINOR` 릴르지시 0으로 재설정됨) 

### 브랜치 스키마

우리는 다음과 같은 브랜치들을 유지보수할 것입니다:

* trunk
* `ruby_{MAJOR}_{MINOR}`

`ruby_{MAJOR}_{MINOR}` 브린치는 `TEENY` 릴리즈를 통해 유지보수될 것입니다.
각 릴리즈마다 태그(tag)를 사용할 것입니다.

### API 호환성

다음 특성들은 `MINOR` 버전의 증가가 요구되는 호환되지 않는 변경으로 표시될 수 있습니다.

* C-레벨 api 기능의 제거
* 이전 버전과 호환되지 않는 변경이나 추가

### ABI 호환성

ABI는 다음과 같은 스키마를 준수할 것입니다: `{MAJOR}.{MINOR}.0`

우리는 동일 `MINOR` 레벨의 릴리즈 내에서 ABI 호환성을 유지하기 위해 최선의 노력을 다할 것입니다.
그러므로 `TEENY`는 0으로 고정됩니다.

## 참조

본 제안에 관해 더 많은 것을 읽고 싶으시다면, 다음 링크들을 참조하십시오:

* [Introducing a semantic versioning scheme and branching policy](http://bugs.ruby-lang.org/issues/8835)
* [Accepted proposal in English](https://gist.github.com/sorah/7803201)
* [Accepted proposal in Japanese](https://gist.github.com/hsbt/7719305)

## 감사합니다!

개인적으로 본 토론에 기여해 주신 모든 분들께 감사를 드립니다. 우리가 취하는 각각의 단계는 보다 안정적이고 효과적인 루비에 근접해 갑니다.