---
layout: news_post
title: "Ruby 4.0.5 릴리스"
author: k0kubun
translator: "shia"
date: 2026-05-20 00:12:20 +0000
lang: ko
---

Ruby 4.0.5가 릴리스되었습니다.

이번 릴리스는
[CVE-2026-46727: pthread 기반 getaddrinfo 타임아웃 핸들러의 use-after-free 취약점](/ko/news/2026/05/20/getaddrinfo-cve-2026-46727/)에 대한 보안 수정과
C 로케일에서 발생하는 Ruby 4.0.4의 빌드 시스템 회귀 [[Bug #22065]](https://bugs.ruby-lang.org/issues/22065)에 대한 수정만 포함되어 있습니다.

자세한 내용은 [GitHub 릴리스](https://github.com/ruby/ruby/releases/tag/v4.0.5)를 참조하세요.

## 릴리스 일정

Ruby의 최신 안정 버전(현재 Ruby 4.0)을 최신 *일반* 릴리스 이후 2개월마다 릴리스할 계획입니다. Ruby 4.0.6은 7월에, 4.0.7은 9월에, 4.0.8은 11월에 릴리스될 예정입니다.

만약 많은 사용자에게 영향을 미치는 변경 사항이 있을 경우, 해당 버전은 예상보다 빨리 릴리스될 수 있고, 이후 일정도 그에 따라 조정될 수 있습니다.

## 다운로드

{% assign release = site.data.releases | where: "version", "4.0.5" | first %}

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
