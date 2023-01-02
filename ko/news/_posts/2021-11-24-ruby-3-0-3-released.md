---
layout: news_post
title: "Ruby 3.0.3 릴리스"
author: "nagachika"
translator: "shia"
date: 2021-11-24 12:00:00 +0000
lang: ko
---

Ruby 3.0.3이 릴리스되었습니다.

이 릴리스는 보안 수정을 포함합니다.
자세한 사항은 아래 글을 확인해 보세요.

* [CVE-2021-41817: 날짜 구문 분석 메서드의 정규표현식 서비스 거부(DoS) 취약점]({%link ko/news/_posts/2021-11-15-date-parsing-method-regexp-dos-cve-2021-41817.md %})
* [CVE-2021-41816: CGI.escape_html에서의 버퍼 오버런]({%link ko/news/_posts/2021-11-24-buffer-overrun-in-cgi-escape_html-cve-2021-41816.md %})
* [CVE-2021-41819: CGI::Cookie.parse에서의 쿠키 접두사 위장]({%link ko/news/_posts/2021-11-24-cookie-prefix-spoofing-in-cgi-cookie-parse-cve-2021-41819.md %})

자세한 사항은 [커밋 로그](https://github.com/ruby/ruby/compare/v3_0_2...v3_0_3)를 확인해 주세요.

## 다운로드

{% assign release = site.data.releases | where: "version", "3.0.3" | first %}

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
