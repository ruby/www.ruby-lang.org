---
layout: news_post
title: "루비 2.1.0부터의 버전 정책 변경에 관하여"
author: "zzak"
translator: "marocchino"
date: 2013-12-21 2:00:00 +0000
lang: ko
---

루비 2.1.0의 릴리스와 함께 루비의 버전 정책을 좀 더
[Semantic Versioning](http://semver.org/)([번역](http://semver.org/lang/ko/))에 가깝게 하기로
결정했습니다.

루비에 보다 명확하고 적절한 버저닝 스키마를 제공하기위해,
이하의 정책를 단계적으로 적용하기로 하였습니다.

## 정책의 변경

이 정책은, ruby-lang.org의 관리자인 히로시 시바타([@hsbt](https://twitter.com/hsbt))의
제안을 기초로 합니다.

### 버저닝 스키마

* `MAJOR`: `MINOR` 릴리스에서 대응 할 수 없는 호환성이 없는 변경이 있을때 증가합니다.
  * 특별한 이벤트를 위해 예약됩니다.
* `MINOR`: 매년 크리스마스에 증가합니다. API 레벨의 비호환이 발생할 수도 있습니다.
* `TEENY`: API의 호환성이 보장되는 보안, 버그 픽스
  * (`2.1.11`처럼) 10 이상까지 증가할 수 있고, 2-3개월마다 릴리스됩니다.
* `PATCH`: 직전의 `MINOR`부터의 커밋 수. (`MINOR` 릴리스 후에 0으로 초기화됩니다.)

### 브랜칭 스키마

이하의 브랜치를 계속 관리하도록 하겠습니다.

* trunk
* `ruby_{MAJOR}_{MINOR}_{TEENY}`

### API 호환성

이하의 경우 비호환이 발생하므로, `MINOR` 버전을 증가 시키도록
하겠습니다.

* C 레벨 API 기능의 삭제
* 하위호환성이 없는 기능 추가

### ABI 호환성

ABI는 `{MAJOR}.{MINOR}.0`의 스키마를 사용하도록 합니다.

`MINOR` 레벨의 릴리스에 ABI 호환성이 유지되도록 최대한 주의를 기울일 생각입니다.
따라서 `TEENY`는 0으로 고정됩니다.

## 참조

이 제안에 관한 좀 더 자세한 정보는 밑의 링크를 참고하여 주십시오.

* [Introducing a semantic versioning scheme and branching policy](https://bugs.ruby-lang.org/issues/8835)
* [Accepted proposal in English](https://gist.github.com/sorah/7803201)
* [Accepted proposal in Japanese](https://gist.github.com/hsbt/7719305)

## 감사합니다!

이 논의에 참가해주신 모든 분들에게 감사드립니다. 우리가 한발 한발
내딛을 때마다, 루비가 더 안정화되고 효율적이 되리라 생각합니다.
