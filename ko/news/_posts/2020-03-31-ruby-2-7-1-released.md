---
layout: news_post
title: "루비 2.7.1 릴리스"
author: "naruse"
translator: "yous"
date: 2020-03-31 12:00:00 +0000
lang: ko
---

루비 2.7.1이 릴리스되었습니다.

이 릴리스는 보안 수정을 포함합니다.
자세한 사항은 아래 글을 확인해보세요.

* [CVE-2020-10663: JSON의 안전하지 않은 객체 생성 취약점(추가 수정)]({% link ko/news/_posts/2020-03-19-json-dos-cve-2020-10663.md %})
* [CVE-2020-10933: 소켓 라이브러리의 힙 메모리 노출 취약점]({% link ko/news/_posts/2020-03-31-heap-exposure-in-socket-cve-2020-10933.md %})

자세한 내용은 [커밋 로그](https://github.com/ruby/ruby/compare/v2_7_0...v2_7_1)를 확인해주세요.

## 다운로드

{% assign release = site.data.releases | where: "version", "2.7.1" | first %}

* <{{ release.url.bz2 }}>

      SIZE: {{ release.size.bz2 }}
      SHA1: {{ release.sha1.bz2 }}
      SHA256: {{ release.sha256.bz2 }}
      SHA512: {{ release.sha512.bz2 }}

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
