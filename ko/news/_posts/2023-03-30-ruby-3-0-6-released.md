---
layout: news_post
title: "Ruby 3.0.6 릴리스"
author: "usa"
translator: "marocchino"
date: 2023-03-30 12:00:00 +0000
lang: ko
---

Ruby 3.0.6가 릴리스되었습니다.

이번 릴리스에는 보안 수정 사항이 포함되어 있습니다.
자세한 내용은 아래 항목을 참조하세요.

* [CVE-2023-28755: URI의 ReDoS 취약점]({%link ko/news/_posts/2023-03-28-redos-in-uri-cve-2023-28755.md %})
* [CVE-2023-28756: Time의 ReDoS 취약점]({%link ko/news/_posts/2023-03-30-redos-in-time-cve-2023-28756.md %})

이번 릴리스에는 몇 가지 버그 수정도 포함되어 있습니다.
자세한 내용은 [GitHub 릴리스](https://github.com/ruby/ruby/releases/tag/v3_0_6)를 참조하세요.

이 릴리스 이후에는 Ruby 3.0의 일반 유지 관리 단계가 종료되고 Ruby 3.0은 보안 유지 관리 단계에 들어갑니다.
즉, 보안 수정을 제외한 모든 버그 수정을 Ruby 3.0으로 더 이상 백포트하지 않습니다.

보안 유지 관리 단계의 기간은 1년으로 예정되어 있습니다.
Ruby 3.0은 보안 유지 관리 단계가 끝나면 EOL에 도달하고 공식 지원이 종료됩니다.
따라서 Ruby 3.1, 3.2로 업그레이드할 계획을 세우는 것을 권장합니다.

## 다운로드

{% assign release = site.data.releases | where: "version", "3.0.6" | first %}

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

이번 릴리스를 포함한 Ruby 3.0의 유지 관리는 Ruby 협회의 "Ruby 안정 버전에 대한 계약"을 기반으로 합니다.
