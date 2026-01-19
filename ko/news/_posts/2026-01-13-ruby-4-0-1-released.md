---
layout: news_post
title: "Ruby 4.0.1 릴리스"
author: k0kubun
translator: "shia"
date: 2026-01-13 02:28:48 +0000
lang: ko
---

Ruby 4.0.1이 릴리스되었습니다.

이번 릴리스에는 다른 스레드에서 서브 프로세스가 종료될 때 `Kernel#sleep`이 잘못 깨어나는 버그에 대한 수정과
기타 버그 수정이 포함되어 있습니다. 자세한 내용은 [GitHub 릴리스](https://github.com/ruby/ruby/releases/tag/v4.0.1)를 참조하세요.

## 릴리스 일정

Ruby의 최신 안정 버전(현재 Ruby 4.0)을 최신 릴리스 이후 2개월마다 릴리스할 계획입니다.
Ruby 4.0.2는 3월에, 4.0.3은 5월에, 4.0.4는 7월에, 4.0.5는 9월에, 4.0.6은 11월에 릴리스될 예정입니다.

만약 많은 사용자에게 영향을 미치는 변경 사항이 있을 경우, 해당 버전은 예상보다 빨리 릴리스될 수 있고, 이후 일정도 그에 따라 조정될 수 있습니다.

## 다운로드

{% assign release = site.data.releases | where: "version", "4.0.1" | first %}

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
