---
layout: news_post
title: "루비 2.4.9 릴리스"
author: "usa"
translator: "yous"
date: 2019-10-02 09:00:00 +0000
lang: ko
---

루비 2.4.9가 릴리스되었습니다.

이 릴리스는 이전 루비 2.4.8 릴리스 tarball이 설치되지 않아서 2.4.8을 다시 패키징한 것입니다.
(자세한 사항은 [[Bug #16197]](https://bugs.ruby-lang.org/issues/16197)을 참조하세요.)
버전 숫자 2.4.8과 2.4.9 이외의 중요한 변경 사항은 없습니다.

루비 2.4는 현재 보안 유지보수 단계이고, 기한은 2020년 3월입니다. 이날 이후 루비
2.4의 유지보수는 종료됩니다. 루비 2.6, 2.5 등의 새 루비 버전으로 업그레이드할
계획을 세우길 바랍니다.

## 다운로드

{% assign release = site.data.releases | where: "version", "2.4.9" | first %}

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

이 릴리스를 만드는 데 도움을 준 모든 분에게 감사드립니다.
