---
layout: news_post
title: "Ruby 문서의 새로운 모습"
author: "Stan Lo"
translator: "shia"
date: 2025-12-23 00:00:00 +0000
lang: ko
---

[ruby-lang.org 재디자인](https://www.ruby-lang.org/ko/news/2025/12/22/redesign-site-identity/)에 이어, Ruby의 30주년을 기념하는 또 다른 소식을 전합니다. [docs.ruby-lang.org][ruby-doc]가 [RDoc](https://github.com/ruby/rdoc)의 새로운 기본 테마인 Aliki와 함께 완전히 새로운 모습으로 탈바꿈했습니다.

## Ruby 문서의 새로운 외관

Ruby는 항상 작성하기 즐거운 언어였으며, 이제 Ruby 문서를 읽는 경험도 그에 맞춰 개선되었습니다. Aliki는 [docs.ruby-lang.org][ruby-doc]와 RDoc v7.0+로 문서를 생성하는 모든 gem에 현대적이고 깔끔한 디자인을 제공합니다.

## 주요 기능

- **개선된 검색**: 대소문자 인식 랭킹, 퍼지 매칭, 상수 검색 지원
- **다크 모드**: OS 설정을 따르며 수동 토글 지원
- **3단 레이아웃**: 왼쪽 사이드바는 탐색, 중앙은 콘텐츠, 오른쪽 사이드바는 목차
- **코드 블록 개선**: 코드 블록에 복사 버튼 추가 및 C 문법 하이라이팅
- **커스터마이징 가능한 하단**: Gem 관리자가 저장소, 이슈 트래커 및 기타 리소스에 대한 링크를 추가할 수 있습니다

## Gem 작성자를 위한 안내

RDoc 7.0+로 문서를 생성하는 경우, 사용자는 자동으로 Aliki를 보게 됩니다. `.rdoc_options` 파일에서 하단 링크를 커스터마이징하거나 Darkfish 테마로 되돌릴 수 있습니다.

## 직접 확인해 보세요

[docs.ruby-lang.org][ruby-doc]에서 새로운 모습을 직접 확인해 보세요.

문제를 발견하거나 제안 사항이 있으시면, GitHub에 [이슈를 등록](https://github.com/ruby/rdoc/issues)해 주세요.

[ruby-doc]: https://docs.ruby-lang.org/en/master/
