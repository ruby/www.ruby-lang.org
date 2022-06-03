---
layout: news_post
title: "Ruby 2.5.9 릴리스"
author: "usa"
translator: "yous"
date: 2021-04-05 12:00:00 +0000
lang: ko
---

Ruby 2.5.9가 릴리스되었습니다.

이 릴리스는 보안 수정을 포함합니다.
자세한 사항은 아래 글을 확인해보세요.

* [CVE-2020-25613: WEBrick의 잠재적인 HTTP 요청 스머글링 취약점]({%link ko/news/_posts/2020-09-29-http-request-smuggling-cve-2020-25613.md %})
* [CVE-2021-28965: REXML의 XML 왕복 변환(round-trip) 취약점]({% link ko/news/_posts/2021-04-05-xml-round-trip-vulnerability-in-rexml-cve-2021-28965.md %})

자세한 사항은 [커밋 로그](https://github.com/ruby/ruby/compare/v2_5_8...v2_5_9)를 확인해주세요.

이 릴리스 이후로 Ruby 2.5의 지원이 종료됩니다. 즉, 이는 Ruby 2.5 버전대의 마지막 릴리스입니다.
보안 취약점이 발견되어도 Ruby 2.5.10이 릴리스되지 않습니다.
모든 Ruby 2.5 사용자는 Ruby 3.0, 2.7, 2.6으로 즉시 업그레이드하기 바랍니다.

## 다운로드

{% assign release = site.data.releases | where: "version", "2.5.9" | first %}

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

이 릴리스를 만드는 데 도움을 준 모든 분, 특히 취약점을 보고해 준 분에게 감사드립니다.
