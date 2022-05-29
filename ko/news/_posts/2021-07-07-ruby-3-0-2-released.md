---
layout: news_post
title: "Ruby 3.0.2 릴리스"
author: "nagachika"
translator: "yous"
date: 2021-07-07 09:00:00 +0000
lang: ko
---

Ruby 3.0.2가 릴리스되었습니다.

이 릴리스는 보안 수정을 포함합니다.
자세한 사항은 아래 글을 확인해보세요.

* [CVE-2021-31810: Net::FTP의 FTP PASV 응답 신뢰 취약점]({%link ko/news/_posts/2021-07-07-trusting-pasv-responses-in-net-ftp.md %})
* [CVE-2021-32066: Net::IMAP의 StartTLS 스트립 취약점]({%link ko/news/_posts/2021-07-07-starttls-stripping-in-net-imap.md %})
* [CVE-2021-31799: RDoc의 명령 주입 취약점]({%link ko/news/_posts/2021-05-02-os-command-injection-in-rdoc.md %})

자세한 사항은 [커밋 로그](https://github.com/ruby/ruby/compare/v3_0_1...v3_0_2)를 확인해주세요.

## 다운로드

{% assign release = site.data.releases | where: "version", "3.0.2" | first %}

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
