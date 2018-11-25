---
layout: news_post
title: "RubyGems의 취약점 다수 발견"
author: "usa"
translator: "shia"
date: 2018-02-17 03:00:00 +0000
tags: security
lang: ko
---

루비 부가 라이브러리인 RubyGems의 취약점 다수가 발견되었습니다.
[RubyGems 공식 블로그](http://blog.rubygems.org/2018/02/15/2.7.6-released.html)에 보고되었습니다.

## 세부 내용

아래와 같은 취약점이 보고되었습니다.

* 최상위 디렉터리 외부에 걸려있는 심볼릭 링크에 쓰기를 수행할 때 경로 순회를 하지 않습니다.
* 젬의 소유자의 안전하지 않은 객체 역직렬화 취약점을 수정합니다.
* tar 헤더의 8진수 필드 해석이 엄격해집니다.
* 패키지에 중복되는 파일이 존재하는 경우 보안 에러를 발생시킵니다.
* spec의 homepage 속성의 URL 검증이 강화됩니다.
* 젬 서버를 통해 표시되는 homepage 속성에 대한 XSS 취약점이 완화됩니다.
* 젬 설치 중의 경로 순회 문제를 방지합니다.

루비 사용자는 가능한 빨리 업그레이드하거나 아래 해결 방법으로 조치하기 바랍니다.

## 해당 버전

* 루비 2.2 버전대: 2.2.9 이하
* 루비 2.3 버전대: 2.3.6 이하
* 루비 2.4 버전대: 2.4.3 이하
* 루비 2.5 버전대: 2.5.0 이하
* 리비전 62422 이전의 트렁크

## 해결 방법

원칙적으로는 루비를 업그레이드해야 합니다.
루비를 업그레이드할 수 없는 상황이라면 RubyGems를 최신 버전으로 업그레이드하세요.
RubyGems 2.7.6 이후 버전은 취약점을 보완하였습니다.

```
gem update --system
```

RubyGems를 업그레이드를 할 수 없다면, 차선책으로 다음 패치를 적용할 수 있습니다.

* [루비 2.2.9](https://bugs.ruby-lang.org/attachments/download/7030/rubygems-276-for-ruby22.patch)
* [루비 2.3.6](https://bugs.ruby-lang.org/attachments/download/7029/rubygems-276-for-ruby23.patch)
* [루비 2.4.3](https://bugs.ruby-lang.org/attachments/download/7028/rubygems-276-for-ruby24.patch)
* [루비 2.5.0](https://bugs.ruby-lang.org/attachments/download/7027/rubygems-276-for-ruby25.patch)

개발버전에 대하여는, 최신 리비전으로 업데이트합니다.

## 도움을 준 글

이 보고서는 [RubyGems 공식 블로그](http://blog.rubygems.org/2018/02/15/2.7.6-released.html)를 바탕으로 하여 작성하였습니다.

## 수정 이력

* 2018-02-17 12:00:00 (KST) 최초 공개
* 2018-03-29 10:00:00 (KST) 루비 업그레이드 언급
