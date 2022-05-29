---
layout: news_post
title: "Ruby 2.6.8 릴리스"
author: "usa"
translator: "yous"
date: 2021-07-07 09:00:00 +0000
lang: ko
---

Ruby 2.6.8이 릴리스되었습니다.

이 릴리스는 보안 수정을 포함합니다.
자세한 사항은 아래 글을 확인해보세요.

* [CVE-2021-31810: Net::FTP의 FTP PASV 응답 신뢰 취약점]({%link en/news/_posts/2021-07-07-trusting-pasv-responses-in-net-ftp.md %})
* [CVE-2021-32066: Net::IMAP의 StartTLS 스트립 취약점]({%link en/news/_posts/2021-07-07-starttls-stripping-in-net-imap.md %})
* [CVE-2021-31799: RDoc의 명령 주입 취약점]({%link en/news/_posts/2021-05-02-os-command-injection-in-rdoc.md %})

Ruby 2.6은 보안 수정 외에는 수정하지 않지만, 이 릴리스는 몇 가지 회귀 버그와 빌드 문제 수정을 포함하고 있습니다.
자세한 사항은 [커밋 로그](https://github.com/ruby/ruby/compare/v2_6_7...v2_6_8)를 확인해주세요.

Ruby 2.6은 현재 보안 유지보수 단계이고, 기한은 2022년 3월입니다.
이날 이후 Ruby 2.6의 유지보수는 종료됩니다.
Ruby 3.0, 2.7 등의 새 루비 버전으로 업그레이드할 계획을 세우기 바랍니다.

## 다운로드

{% assign release = site.data.releases | where: "version", "2.6.8" | first %}

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
