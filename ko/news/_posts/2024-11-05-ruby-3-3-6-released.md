---
layout: news_post
title: "Ruby 3.3.6 릴리스"
author: k0kubun
translator: shia
date: 2024-11-05 04:25:00 +0000
lang: ko
---

Ruby 3.3.6이 릴리스되었습니다.

이번 릴리스는 일반적인 업데이트로, 사소한 버그 수정이 포함되어 있습니다.
또한 Ruby 3.5에서 번들된 gem으로 제공될 기본 gem 의존성이 누락되었다는 경고를 중지합니다.
자세한 내용은 [GitHub 릴리스 노트](https://github.com/ruby/ruby/releases/tag/v3_3_6)를 참조하세요.

## 릴리스 일정

이전에 [발표했던 것](https://www.ruby-lang.org/ko/news/2024/07/09/ruby-3-3-4-released/)처럼, 앞으로 최신 안정 버전의 Ruby(현재 Ruby 3.3)를 `.1` 릴리스 이후 2개월마다 릴리스할 계획입니다.

3.3.7은 1월 7일에 릴리스될 예정입니다. 많은 사람들에게 영향을 미치는 변경 사항이 있을 경우, 예상보다 빨리 새 버전을 릴리스할 수 있습니다.

## 다운로드

{% assign release = site.data.releases | where: "version", "3.3.6" | first %}

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
