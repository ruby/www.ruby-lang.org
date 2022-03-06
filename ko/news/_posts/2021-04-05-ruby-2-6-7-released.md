---
layout: news_post
title: "Ruby 2.6.7 릴리스"
author: "usa"
translator: "yous"
date: 2021-04-05 12:00:00 +0000
lang: ko
---

Ruby 2.6.7이 릴리스되었습니다.

이 릴리스는 보안 수정을 포함합니다.
자세한 사항은 아래 글을 확인해보세요.

* [CVE-2020-25613: WEBrick의 잠재적인 HTTP 요청 스머글링 취약점]({%link ko/news/_posts/2020-09-29-http-request-smuggling-cve-2020-25613.md %})
* [CVE-2021-28965: REXML의 XML 왕복 변환(round-trip) 취약점]({% link ko/news/_posts/2021-04-05-xml-round-trip-vulnerability-in-rexml-cve-2021-28965.md %})

자세한 사항은 [커밋 로그](https://github.com/ruby/ruby/compare/v2_6_6...v2_6_7)를 확인해주세요.

이 릴리스 이후로 Ruby 2.6은 일반 유지보수 단계가 종료되고,
보안 유지보수 단계가 됩니다.
즉, 보안 수정을 제외한 버그 수정은 Ruby 2.6으로 백포트되지 않습니다.
보안 유지보수 단계의 기간은 1년으로 계획되어 있습니다.
이 기간이 끝나면 Ruby 2.6의 공식 지원도 종료됩니다.
그러므로 Ruby 2.7이나 3.0으로 업그레이드할 계획을 세우기 바랍니다.

## 다운로드

{% assign release = site.data.releases | where: "version", "2.6.7" | first %}

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

이 릴리스를 포함한 Ruby 2.6의 유지보수는 Ruby Association의 "Ruby 안정 버전에 관한 협의"에 기반해 이루어집니다.
