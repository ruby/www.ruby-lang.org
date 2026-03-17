---
layout: news_post
title: "Ruby 3.4.9 릴리스"
author: nagachika
translator: "shia"
date: 2026-03-11 11:00:00 +0000
lang: ko
---

Ruby 3.4.9가 릴리스되었습니다.

이번 릴리스에는 [CVE-2026-27820을 해결하는 zlib gem의 업데이트](https://www.ruby-lang.org/ko/news/2026/03/05/buffer-overflow-zlib-cve-2026-27820/)와
기타 버그 수정이 포함되어 있습니다.
자세한 내용은 [GitHub 릴리스](https://github.com/ruby/ruby/releases/tag/v3_4_9)를 참조하세요.

zlib gem을 업데이트하는 것을 권장합니다. 이번 릴리스는 기본 gem으로 계속 사용하고자 하는 분들의 편의를 위해 만들어졌습니다.


## 다운로드

{% assign release = site.data.releases | where: "version", "3.4.9" | first %}

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
