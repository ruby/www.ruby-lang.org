---
layout: news_post
title: "Ruby 3.2.6 릴리스"
author: nagachika
translator: shia
date: 2024-10-30 10:00:00 +0000
lang: ko
---

Ruby 3.2.6이 릴리스되었습니다.

자세한 내용은 [GitHub 릴리스](https://github.com/ruby/ruby/releases/tag/v3_2_6)를 참조하세요.

## 다운로드

{% assign release = site.data.releases | where: "version", "3.2.6" | first %}

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
