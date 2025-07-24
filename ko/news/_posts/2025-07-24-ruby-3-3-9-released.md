---
layout: news_post
title: "Ruby 3.3.9 릴리스"
author: nagachika
translator: "shia"
date: 2025-07-24 11:00:00 +0000
lang: ko
---

Ruby 3.3.9가 릴리스되었습니다.

이 릴리스는 다음 기본 gem의 보안 수정 사항을 포함하고 있습니다.

* [CVE-2025-24294: resolv gem의 DoS 가능성](https://www.ruby-lang.org/ko/news/2025/07/08/dos-resolv-cve-2025-24294/)

그리고 다음과 같은 빌드 문제 수정 사항이 포함되어 있습니다.

* GCC 15.1
* Visual Studio 2022 Version 17.14

자세한 내용은 [GitHub 릴리스 노트](https://github.com/ruby/ruby/releases/tag/v3_3_9)를 참조하세요.

## 다운로드

{% assign release = site.data.releases | where: "version", "3.3.9" | first %}

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
