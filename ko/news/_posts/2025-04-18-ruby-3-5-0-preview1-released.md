---
layout: news_post
title: "Ruby 3.5.0-preview1 릴리스"
author: "naruse"
translator: "shia"
date: 2025-04-18 00:00:00 +0000
lang: ko
---

{% assign release = site.data.releases | where: "version", "3.5.0-preview1" | first %}
Ruby {{ release.version }} 릴리스를 알리게 되어 기쁩니다. Ruby 3.5는 유니코드 버전을 15.1.0으로 업데이트했으며, 더 많은 것들이 있습니다.

## 언어 변경

* `**nil`과 비슷하게 `*nil`은 더 이상 `nil.to_a`를 호출하지 않습니다.
  [[Feature #21047]]

## 코어 클래스 변경

주의: 눈에 띄는 클래스 변경만을 포함합니다.

* Binding

    * `Binding#local_variables`는 더 이상 번호가 매겨진 매개변수를 포함하지 않습니다.
      또한, `Binding#local_variable_get`과 `Binding#local_variable_set`은 번호가 매겨진 매개변수를 처리하지 않습니다.
      [[Bug #21049]]

* IO

    * `IO.select`는 타임아웃 인수로 +Float::INFINITY+를 허용합니다.
      [[Feature #20610]]

* String

    * Unicode 15.1.0 및 이모지 버전 15.1로 업데이트합니다. [[Feature #19908]]
        (Regexp에도 적용됩니다)


## 표준 라이브러리 변경

주의: 눈에 띄는 표준 라이브러리 변경만을 포함합니다.

* ostruct 0.6.1
* pstore 0.2.0
* benchmark 0.4.0
* logger 1.7.0
* rdoc 6.13.1
* win32ole 1.9.2
* irb 1.15.2
* reline 0.6.1
* readline 0.0.4
* fiddle 1.1.6

## 호환성 문제

주의: 기능 버그 수정은 포함되어 있지 않습니다.



## 표준 라이브러리 호환성 문제


## C API 변경



## 그 이외의 변경



더 자세한 내용은 [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)나
[커밋 로그](https://github.com/ruby/ruby/compare/v3_4_0...{{ release.tag }})를
확인해 주세요.

이러한 변경사항에 따라, Ruby 3.4.0 이후로 [파일 {{ release.stats.files_changed }}개 수정, {{ release.stats.insertions }}줄 추가(+), {{ release.stats.deletions }}줄 삭제(-)](https://github.com/ruby/ruby/compare/v3_4_0...{{ release.tag }}#file_bucket)가
이루어졌습니다!

## 다운로드

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

## Ruby는

Ruby는 1993년에 Matz(마츠모토 유키히로) 씨가 처음 개발했고,
현재는 오픈 소스로서 개발되고 있습니다. 여러 플랫폼에서 동작하며,
특히 웹 개발에서 전 세계적으로 이용되고 있습니다.

[Feature #21047]: https://bugs.ruby-lang.org/issues/21047
[Bug #21049]: https://bugs.ruby-lang.org/issues/21049
[Feature #20610]: https://bugs.ruby-lang.org/issues/20610
[Feature #19908]: https://bugs.ruby-lang.org/issues/19908
