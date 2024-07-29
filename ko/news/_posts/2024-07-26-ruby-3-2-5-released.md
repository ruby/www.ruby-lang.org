---
layout: news_post
title: "Ruby 3.2.5 릴리스"
author: "nagachika"
translator: "shia"
date: 2024-07-26 10:00:00 +0000
lang: ko
---

Ruby 3.2.5가 릴리스되었습니다.

이번 릴리스에는 많은 버그 수정이 포함되어 있습니다.
그리고 내장된 `rexml` gem을 다음 보안 수정을 포함하는 버전으로 업데이트했습니다.
[CVE-2024-39908: REXML의 DoS 취약점]({%link ko/news/_posts/2024-07-16-dos-rexml-cve-2024-39908.md %}).

자세한 내용은 [GitHub 릴리스](https://github.com/ruby/ruby/releases/tag/v3_2_5)를 참조하세요.

## 다운로드

{% assign release = site.data.releases | where: "version", "3.2.5" | first %}

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
