---
layout: news_post
title: "Ruby 3.3.3 릴리스"
author: "k0kubun"
translator: "shia"
date: 2024-06-12 00:30:00 +0000
lang: ko
---

Ruby 3.3.3이 릴리스되었습니다.

이번 릴리스는 아래 항목을 포함합니다.

* RubyGems 3.5.11
* Bundler 2.5.11
* REXML 3.2.8
* strscan 3.0.9
* `--dump=prism_parsetree`는 `--parser=prism --dump=parsetree`로 대체되었습니다.
* 잘못된 인코딩 기호는 이제 `EncodingError` 대신 `SyntaxError`를 던집니다.
* Ripper 파싱 중의 메모리 누수 문제 수정
* YJIT, `**{}`, `Ripper.tokenize`, `RubyVM::InstructionSequence#to_binary`, `--with-gmp`, 몇몇 빌드 환경의 버그 수정

자세한 내용은 [GitHub 릴리스](https://github.com/ruby/ruby/releases/tag/v3_3_3)를 참조하세요.

## 다운로드

{% assign release = site.data.releases | where: "version", "3.3.3" | first %}

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
