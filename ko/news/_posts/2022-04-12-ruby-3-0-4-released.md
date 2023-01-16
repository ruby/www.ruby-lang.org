---
layout: news_post
title: "Ruby 3.0.4 릴리스"
author: "nagachika and mame"
translator: "shia"
date: 2022-04-12 12:00:00 +0000
lang: ko
---

Ruby 3.0.4가 릴리스되었습니다.

이 릴리스는 보안 수정을 포함합니다.
자세한 사항은 아래 글을 확인해보세요.

* [CVE-2022-28738: 정규표현식 컴파일에서의 중복 할당 해제]({%link ko/news/_posts/2022-04-12-double-free-in-regexp-compilation-cve-2022-28738.md %})
* [CVE-2022-28739: String에서 Float로 변환할 때의 버퍼 오버런]({%link ko/news/_posts/2022-04-12-buffer-overrun-in-string-to-float-cve-2022-28739.md %})

자세한 사항은 [커밋 로그](https://github.com/ruby/ruby/compare/v3_0_3...v3_0_4)를 확인해주세요.

## 다운로드

{% assign release = site.data.releases | where: "version", "3.0.4" | first %}

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
