---
layout: news_post
title: "Ruby 3.3.4 릴리스"
author: "k0kubun"
translator: "shia"
date: 2024-07-09 00:30:00 +0000
lang: ko
---

Ruby 3.3.4가 릴리스되었습니다.

이번 릴리스에는 Ruby 3.3.3의 내장 gem인 `net-pop`, `net-ftp`, `net-imap`, `prime`의
gemspec에서 의존성이 누락된 회귀 버그를 해결했습니다
[[Bug #20581]](https://bugs.ruby-lang.org/issues/20581).
이 수정으로 Bundler가 Heroku와 같은 플랫폼에서 해당 gem을 성공적으로 설치할 수 있습니다.
만약 `bundle install`이 정상적으로 작동한다면, 이 문제는 해결된 것입니다.

나머지 변경 사항은 대부분 사소한 버그 수정입니다.
자세한 내용은 [GitHub 릴리스](https://github.com/ruby/ruby/releases/tag/v3_3_4)를 참조하세요.

## 릴리스 일정

앞으로, 최신 안정 버전의 Ruby(현재 Ruby 3.3)를 `.1` 릴리스 이후 2개월마다 릴리스할 계획입니다.
Ruby 3.3의 경우, 3.3.5는 9월 3일에, 3.3.6은 11월 5일에, 3.3.7은 1월 7일에 릴리스될 예정입니다.

Ruby 3.3.3 사용자 중 Heroku 사용자에 영향을 미치는 릴리스처럼 많은 사람들에게 영향을 미치는 변경 사항이 있을 경우,
예상보다 빨리 새 버전을 릴리스할 수 있습니다.

## 다운로드

{% assign release = site.data.releases | where: "version", "3.3.4" | first %}

* <{{ release.url.gz }}>

      SIZE: {{ release.size.gz }}
      SHA1: {{ release.sha1.gz }}
      SHA256: {{ release.sha256.gz }}
      SHA512: {{ release.sha512.gz }}

* <{{ release.url.xz }}>

      SIZE: {{ release.size.xz }}
      SHA1: {{ release.sha1.xz }}
      SHA256: {{ release.sha256.xz }}
      SHA512: {{ release.sha512.xz }}

* <{{ release.url.zip }}>

      SIZE: {{ release.size.zip }}
      SHA1: {{ release.sha1.zip }}
      SHA256: {{ release.sha256.zip }}
      SHA512: {{ release.sha512.zip }}

## 릴리스 코멘트

많은 커미터, 개발자, 버그를 보고해 준 사용자들이 이 릴리스를 만드는 데 도움을 주었습니다.
그들의 기여에 감사드립니다.
