---
layout: news_post
title: "Ruby 3.0.7 릴리스"
author: "hsbt"
translator: "shia"
date: 2024-04-23 10:00:00 +0000
lang: ko
---

Ruby 3.0.7이 릴리스되었습니다.

이번 릴리스에는 보안 수정 사항이 포함되어 있습니다.
자세한 내용은 아래 항목을 참조하세요.

* [CVE-2024-27282: 정규표현식 검색의 임의의 메모리 주소 읽기 취약점]({%link ko/news/_posts/2024-04-23-arbitrary-memory-address-read-regexp-cve-2024-27282.md %})
* [CVE-2024-27281: RDoc에서 .rdoc_options 사용 시의 RCE 취약점]({%link ko/news/_posts/2024-03-21-rce-rdoc-cve-2024-27281.md %})
* [CVE-2024-27280: StringIO에서 버퍼 초과 읽기 취약점]({%link ko/news/_posts/2024-03-21-buffer-overread-cve-2024-27280.md %})

자세한 내용은 [GitHub 릴리스](https://github.com/ruby/ruby/releases/tag/v3_0_7)를 참조하세요.

이 릴리스 후에 Ruby 3.0은 EOL에 도달합니다. 즉, 이번 릴리스가 Ruby 3.0 버전대의 마지막 릴리스가 될 것입니다.
보안 취약점이 발견되더라도 Ruby 3.0.8은 릴리스되지 않을 것입니다. (심각한 회귀 버그가 발생하는 경우는 예외입니다.)
모든 Ruby 3.0 사용자는 즉시 Ruby 3.3, 3.2, 3.1로 마이그레이션할 것을 권장합니다.

## 다운로드

{% assign release = site.data.releases | where: "version", "3.0.7" | first %}

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
