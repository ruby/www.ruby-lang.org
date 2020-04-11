---
layout: news_post
title: "루비 2.4.8 릴리스"
author: "usa"
translator: "yous"
date: 2019-10-01 11:00:00 +0000
lang: ko
---

루비 2.4.8이 릴리스되었습니다.

이 릴리스는 보안 수정을 포함합니다.
자세한 사항은 아래 글을 확인해보세요.

* [CVE-2019-16255: Shell#[] 및 Shell#test의 코드 주입 취약점]({% link ko/news/_posts/2019-10-01-code-injection-shell-test-cve-2019-16255.md %})
* [CVE-2019-16254: WEBrick의 HTTP 응답 분할 취약점(추가 수정)]({% link ko/news/_posts/2019-10-01-http-response-splitting-in-webrick-cve-2019-16254.md %})
* [CVE-2019-15845: File.fnmatch 및 File.fnmatch?의 NUL 주입 취약점]({% link ko/news/_posts/2019-10-01-nul-injection-file-fnmatch-cve-2019-15845.md %})
* [CVE-2019-16201: WEBrick Digest 인증의 정규 표현식 서비스 거부 취약점]({% link ko/news/_posts/2019-10-01-webrick-regexp-digestauth-dos-cve-2019-16201.md %})

루비 2.4는 현재 보안 유지보수 단계이고, 기한은 2020년 3월입니다. 이날 이후 루비
2.4의 유지보수는 종료됩니다. 루비 2.6, 2.5 등의 새 루비 버전으로 업그레이드할
계획을 세우길 바랍니다.

__업데이트(10월 2일 4:00 UTC):__ 루비 2.4.8의 릴리스 tarball이 _루트가 아닌_ 사용자에게 설치되지 않는 문제를 해결하고 있습니다. 자세한 업데이트는 [[Bug #16197]](https://bugs.ruby-lang.org/issues/16197)에서 받아보세요.

## 다운로드

{% assign release = site.data.releases | where: "version", "2.4.8" | first %}

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

이 릴리스를 만드는 데 도움을 준 모든 분, 특히 취약점을 보고해준 분에게 감사드립니다.
