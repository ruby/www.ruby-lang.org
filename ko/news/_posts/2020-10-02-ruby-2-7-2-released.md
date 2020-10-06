---
layout: news_post
title: "루비 2.7.2 릴리스"
author: "nagachika"
translator: "shia"
date: 2020-10-02 11:00:00 +0000
lang: ko
---

루비 2.7.2가 릴리스되었습니다.

이 릴리스는 의도적인 비호환이 있습니다. 2.7.2 이후로 기본 설정에서는 폐기 예정 경고를 출력하지 않습니다.
폐기 예정 경고를 활성화하려면 실행시에 `-w`나 `-W:deprecated`를 넘기세요.
자세한 내용은 다음 티켓을 참고하세요.

* [Feature #17000 2.7.2 turns off deprecation warnings by default](https://bugs.ruby-lang.org/issues/17000)
* [Feature #16345 Don't emit deprecation warnings by default.](https://bugs.ruby-lang.org/issues/16345)

이 릴리스는 다음 글이 소개하고 있는 보안 수정이 적용된 webrick의 새 버전을 포함합니다.

* [CVE-2020-25613: WEBrick의 잠재적인 HTTP 요청 스머글링 취약점](/ko/news/2020/09/29/http-request-smuggling-cve-2020-25613/)

이 이외의 변경 사항은 [커밋 로그](https://github.com/ruby/ruby/compare/v2_7_1...v2_7_2)를 확인해주세요.

## 다운로드

{% assign release = site.data.releases | where: "version", "2.7.2" | first %}

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
