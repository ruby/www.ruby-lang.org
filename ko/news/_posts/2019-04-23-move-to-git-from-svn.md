---
layout: news_post
title: "루비 저장소가 Subversion에서 Git으로 이동했습니다"
author: "hsbt"
translator: "yous"
date: 2019-04-23 00:00:00 +0000
lang: ko
---

오늘, 루비 프로그래밍 언어의 표준 저장소가 Subversion에서 Git으로 이동했습니다.

새 저장소의 웹 인퍼테이스는 <https://git.ruby-lang.org>이며, cgit을 통해
제공됩니다. 루비 저장소에서 바로 기여자의 커밋 해시를 볼 수 있습니다.

## 개발 정책

* cgit에서 토픽 브랜치를 사용하지 않습니다.
* GitHub 저장소는 미러 저장소일 뿐입니다. '풀 리퀘스트 머지' 기능을 사용하지 않습니다.
* ruby_2_4, ruby_2_5, ruby_2_6 브랜치는 계속 SVN을 사용합니다. 이 브랜치에는 cgit을 통해 그 어떤 것도 푸시하지 않습니다.
* ruby_2_7 브랜치부터 cgit을 사용해 안정 브랜치를 개발합니다.
* 머지 커밋을 사용하지 않습니다.

## 감사의 말

* k0kubun

  k0kubun은 릴리스와 백포트 워크플로에 관련된 툴체인을 활발히 개발했고, Git을 위한 훅 스크립트를 업데이트했습니다.

* naruse

  naruse는 루비 CI와 Redmine(bugs.ruby-lang.org)의 기능 변경 사항을 업데이트했습니다.

* mame

  mame는 Slack을 위한 커밋 알림 스크립트를 만들었습니다.

## 향후 계획

아직 몇 가지 작업이 남았습니다. Git 마이그레이션과 관련한 이슈를 찾았다면
<https://bugs.ruby-lang.org/issues/14632>로 제보해주시기 바랍니다.

감사합니다!
