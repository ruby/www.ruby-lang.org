---
layout: news_post
title: "Ruby 3.1.6 릴리스"
author: "hsbt"
translator: "shia"
date: 2024-05-29 9:00:00 +0000
lang: ko
---

Ruby 3.1.6이 릴리스되었습니다.

Ruby 3.1 버전대는 지금 보안 유지보수 단계입니다. 일반적으로 이 단계에서는 보안 문제만 수정합니다. 그러나 Ruby 3.1.5 릴리스 이후 빌드 실패 문제가 여럿 발생했습니다. 이 문제들을 해결하기 위해 Ruby 3.1.6을 릴리스하기로 결정했습니다.

아래 항목에서 자세한 내용을 확인하세요.

* [Bug #20151: FreeBSD 14.0에서 Ruby 3.1을 빌드할 수 없음](https://bugs.ruby-lang.org/issues/20151)
* [Bug #20451: 잘못된 Ruby 3.1.5 백포트로 fiddle 빌드에 실패함](https://bugs.ruby-lang.org/issues/20451)
* [Bug #20431: Ruby 3.3.0 빌드 실패 make: *** \[io_buffer.o\] Error 1](https://bugs.ruby-lang.org/issues/20431)

자세한 사항은 [GitHub 릴리스](https://github.com/ruby/ruby/releases/tag/v3_1_6)를 확인해 주세요.

## 다운로드

{% assign release = site.data.releases | where: "version", "3.1.6" | first %}

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
