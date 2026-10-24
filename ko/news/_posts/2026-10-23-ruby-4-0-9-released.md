---
layout: news_post
title: "Ruby 4.0.9 릴리스"
author: k0kubun
translator: "shia"
date: 2026-10-23 03:11:22 +0000
lang: ko
---

Ruby 4.0.9가 릴리스되었습니다.

이번 릴리스는 GitLab의 CVE-2026-110264의 원인이 된 정규표현식 컴파일 버그 수정을 포함합니다.
자세한 내용은 아래 항목을 참조하세요.

* [GitLab의 CVE-2026-89078, CVE-2026-93577, CVE-2026-97229, CVE-2026-110264와 관련된 정규표현식 컴파일 수정]({% link ko/news/_posts/2026-10-23-regexp-fixes-for-gitlab-cves.md %})

자세한 내용은 [GitHub 릴리스](https://github.com/ruby/ruby/releases/tag/v4.0.9)를 참조하세요.

## 다운로드

{% assign release = site.data.releases | where: "version", "4.0.9" | first %}

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
