---
layout: news_post
title: "Ruby 4.0.0 preview2 릴리스"
author: "naruse"
translator: "Yonghyun Kim"
date: 2025-11-17 00:00:00 +0000
lang: ko
---

{% assign release = site.data.releases | where: "version", "4.0.0-preview2" | first %}
Ruby {{ release.version }} 릴리스를 알리게 되어 기쁩니다. Ruby 4.0은 유니코드 버전을 17.0.0으로 업데이트했으며, 더 많은 것들이 있습니다.

## 언어 변경

* `**nil`이 `nil.to_hash`를 호출하지 않는 것과 마찬가지로, `*nil`은 더 이상 `nil.to_a`를 호출하지 않습니다.
  [[Feature #21047]]

## 코어 클래스 변경

주의: 주목할 만한 코어 클래스 변경만을 포함합니다.

* Binding

    * `Binding#local_variables`는 더 이상 번호가 매겨진 매개변수를 포함하지 않습니다.
      또한, `Binding#local_variable_get`과 `Binding#local_variable_set`은 번호가 매겨진 매개변수를 처리하지 않습니다.
      [[Bug #21049]]

* IO

    * `IO.select`는 타임아웃 인자로 +Float::INFINITY+를 허용합니다.
      [[Feature #20610]]

* String

    * 유니코드 17.0.0 및 이모지 버전 17.0으로 업데이트합니다. [[Feature #19908]][[Feature #20724]][[Feature #21275]]
        (Regexp에도 적용됩니다)


## 표준 라이브러리 변경

주의: 주목할 만한 표준 라이브러리 변경만을 포함합니다.

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


## JIT

* YJIT
    * YJIT 통계
        * `ratio_in_yjit`은 더 이상 기본 빌드에서 작동하지 않습니다.
          `--yjit-stats`에서 활성화하려면 `configure`에서 `--enable-yjit=stats`를 사용하세요.
        * 기본 통계에 `invalidate_everything`이 추가되었습니다. TracePoint에 의해 모든 코드가 무효화될 때 증가합니다.
    * `RubyVM::YJIT.enable`에 `mem_size:`와 `call_threshold:` 옵션을 추가합니다.
* ZJIT
    * 실험적인 메서드 기반 JIT 컴파일러를 추가합니다.
      `--zjit` 지원을 활성화하려면 `configure`에서 `--enable-zjit`을 사용하세요.
    * Ruby 4.0.0-preview2 기준으로 ZJIT은 아직 대부분의 벤치마크에서 속도 향상을 제공할 준비가 되어 있지 않습니다.
      아직 ZJIT을 평가하지 마시고, Ruby 4.0 릴리스를 기다려 주세요.
* RJIT
    * `--rjit`이 제거되었습니다. 서드파티 JIT API 구현은
      [ruby/rjit](https://github.com/ruby/rjit) 저장소로 이동할 예정입니다.

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

## Ruby란

Ruby는 1993년에 Matz(마츠모토 유키히로) 씨가 처음 개발했고,
현재는 오픈 소스로서 개발되고 있습니다. 여러 플랫폼에서 동작하며,
특히 웹 개발에서 전 세계적으로 이용되고 있습니다.

[Feature #21047]: https://bugs.ruby-lang.org/issues/21047
[Bug #21049]: https://bugs.ruby-lang.org/issues/21049
[Feature #20610]: https://bugs.ruby-lang.org/issues/20610
[Feature #19908]: https://bugs.ruby-lang.org/issues/19908
[Feature #20724]: https://bugs.ruby-lang.org/issues/20724
[Feature #21275]: https://bugs.ruby-lang.org/issues/21275
