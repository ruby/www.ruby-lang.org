---
layout: news_post
title: "Ruby 3.4.1 릴리스"
author: "naruse"
translator: "shia"
date: 2024-12-25 00:00:00 +0000
lang: ko
---

Ruby 3.4.1이 릴리스되었습니다.

이번 릴리스는 버전 설명을 수정합니다.

자세한 내용은 [GitHub 릴리스](https://github.com/ruby/ruby/releases/tag/v3_4_1)를 참조하세요.

## 다운로드

{% assign release = site.data.releases | where: "version", "3.4.1" | first %}

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
