---
layout: news_post
title: "Ruby 3.2.8 릴리스"
author: hsbt
translator: shia
date: 2025-03-26 04:45:01 +0000
lang: ko
---

Ruby 3.2.8이 릴리스되었습니다. 이 릴리스에는 [CVE-2025-27219, CVE-2025-27220 및 CVE-2025-27221 수정 사항](https://www.ruby-lang.org/ko/news/2025/02/26/security-advisories/)이 포함되어 있습니다.

자세한 사항은 [GitHub 릴리스](https://github.com/ruby/ruby/releases/tag/v3_2_8)를 확인해 주세요.

이 버전은 Ruby 3.2 시리즈의 일반 유지보수 마지막 버전입니다. Ruby 3.2 시리즈는 2026년 3월 말까지 보안 문제만 수정될 것입니다.

Ruby 3.3 또는 3.4 시리즈로 업그레이드하는 것을 권장합니다.

## 다운로드

{% assign release = site.data.releases | where: "version", "3.2.8" | first %}

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
