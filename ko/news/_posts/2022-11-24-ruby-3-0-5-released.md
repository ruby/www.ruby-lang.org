---
layout: news_post
title: "Ruby 3.0.5 릴리스"
author: "usa"
translator: "shia"
date: 2022-11-24 12:00:00 +0000
lang: ko
---

Ruby 3.0.5가 릴리스되었습니다.

이 릴리스는 보안 수정을 포함합니다.
자세한 사항은 아래 글을 확인해 보세요.

* [CVE-2021-33621: CGI에서의 HTTP 응답 분할]({%link ko/news/_posts/2022-11-22-http-response-splitting-in-cgi-cve-2021-33621.md %})

이 릴리스는 몇몇 버그 수정을 포함합니다.
자세한 사항은 [GitHub 릴리스](https://github.com/ruby/ruby/releases/tag/v3_0_5)를 확인해 주세요.

## 다운로드

{% assign release = site.data.releases | where: "version", "3.0.5" | first %}

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

이 릴리스를 포함한 Ruby 3.0의 유지보수는 Ruby Association의 "Ruby 안정 버전에 관한 협의"에 기반해 이루어집니다.
