---
layout: news_post
title: "Ruby 4.0.3 릴리스"
author: k0kubun
translator: "shia"
date: 2026-04-21 08:45:44 +0000
lang: ko
---

Ruby 4.0.3이 릴리스되었습니다.

이번 릴리스에는 [CVE-2026-41316](https://www.ruby-lang.org/en/news/2026/04/21/erb-cve-2026-41316/)을 수정한 ERB 6.0.1.1만이 포함되어 있습니다.

애플리케이션에서 신뢰할 수 없는 데이터에 Marshal.load를 호출하고, erb와 activesupport가 모두 로드되어 있다면 ERB를 4.0.3.1, 4.0.4.1, 6.0.1.1, 6.0.4 이상으로 업데이트하시기 바랍니다. 이번 Ruby 4.0.3 릴리스를 통해 업데이트할 수 있습니다.

## 릴리스 일정

Ruby의 최신 안정 버전(현재 Ruby 4.0)을 최신 *일반* 릴리스 이후 2개월마다 릴리스할 계획입니다.
Ruby 4.0.4는 5월에, 4.0.5는 7월에, 4.0.6은 9월에, 4.0.7은 11월에 릴리스될 예정입니다.

만약 많은 사용자에게 영향을 미치는 변경 사항이 있을 경우, 해당 버전은 예상보다 빨리 릴리스될 수 있고, 이후 일정도 그에 따라 조정될 수 있습니다.

## 다운로드

{% assign release = site.data.releases | where: "version", "4.0.3" | first %}

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
