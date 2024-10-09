---
layout: news_post
title: "Ruby 3.4.0 preview2 릴리스"
author: "naruse"
translator: "shia"
date: 2024-10-07 00:00:00 +0000
lang: ko
---

{% assign release = site.data.releases | where: "version", "3.4.0-preview2" | first %}
Ruby {{ release.version }} 릴리스를 알리게 되어 기쁩니다.

## Prism

parse.y에서 Prism으로 기본 파서를 변경했습니다. [[Feature #20564]]

## 언어 변경

* 파일에 `frozen_string_literal` 주석이 없을 때, 문자열 리터럴이 변경되면
  폐기 예정 경고를 출력합니다.
  이 경고는 `-W:deprecated`나 `Warning[:deprecated] = true` 설정을 통해 활성화할 수 있습니다.
  이 변경을 무효화하고 싶다면 Ruby를 실행할 때 `--disable-frozen-string-literal` 커맨드라인 인수를
  사용하세요. [[Feature #20205]]

* 블록 인자를 가리키는 `it`이 추가됩니다. [[Feature #18980]]

* 메서드 호출 시에 `nil`에 키워드 스플랫을 지원합니다.
  `**nil`은 `**{}`와 비슷하게 동작하며, 키워드를 넘기지 않으며,
  어떤 변환 메서드도 호출하지 않습니다. [[Bug #20064]]

* 블록을 인덱스로 사용할 수 없게 됩니다. [[Bug #19918]]

* 키워드 인수를 인덱스로 사용할 수 없게 됩니다. [[Bug #20218]]

## 코어 클래스 변경

주의: 눈에 띄는 클래스 변경만을 포함합니다.

* Exception

  * `Exception#set_backtrace`는 이제 `Thread::Backtrace::Location`의 배열을 입력으로 받을 수 있습니다.
    `Kernel#raise`, `Thread#raise`와 `Fiber#raise`도 같은 형식의 입력을 받습니다. [[Feature #13557]]

* Range

  * `Range#size`는 이제 범위가 순회 가능하지 않다면 `TypeError`를 던집니다. [[Misc #18984]]



## 호환성 문제

주의: 기능 버그 수정은 포함되어 있지 않습니다.

* 에러 메시지와 백트레이스의 출력 결과가 변경됩니다.
  * 인용 시작 부분을 나타내던 백틱 대신 작은 따옴표를 사용합니다. [[Feature #16495]]
  * 메서드 이름 앞에 클래스 이름을 출력합니다(클래스가 불변하는 이름을 가지고 있다면). [[Feature #19117]]
  * `Kernel#caller`, `Thread::Backtrace::Location`의 메서드 등도 마찬가지로 변경됩니다.

  ```
  Old:
  test.rb:1:in `foo': undefined method `time' for an instance of Integer
          from test.rb:2:in `<main>'

  New:
  test.rb:1:in 'Object#foo': undefined method 'time' for an instance of Integer
          from test.rb:2:in '<main>'
  ```

* `Hash#inspect` 결과가 변경되었습니다. [[Bug #20433]]
  * 심볼 키는 최신 심볼 키 구문을 사용하여 표시됩니다. 예시: `"{user: 1}"`
  * 다른 키는 `=>` 주변에 공백이 추가되었습니다. 예시: `'{"user" => 1}'`. 이전에는 그렇지 않았습니다. 예시: `'{"user"=>1}'`.

## C API 변경

* `rb_newobj`와 `rb_newobj_of`(그리고 대응하는 매크로인 `RB_NEWOBJ`, `RB_NEWOBJ_OF`, `NEWOBJ`, `NEWOBJ_OF`)가 삭제됩니다. [[Feature #20265]]
* 폐기 예정인 `rb_gc_force_recycle` 함수가 삭제됩니다. [[Feature #18290]]

## 구현 개선

* `Array#each`를 더 나은 성능을 위해 Ruby로 재작성했습니다. [[Feature #20182]]

## 그 이외의 변경

* 상세 모드(`-w`)에서 메서드에 넘긴 블록이 사용되지 않았을 때
  경고를 출력합니다.
  [[Feature #15554]]

* `String.freeze`나 `Integer#+`처럼 인터프리터와 JIT이 특별히 최적화하는
  몇몇 코어 메서드를 재정의하면 성능 클래스
  경고(`-W:performance`나 `Warning[:performance] = true`)를 출력합니다.
  [[Feature #20429]]

기본 gem 또는 내장 gem에 대한 자세한 내용은 [Logger](https://github.com/ruby/logger/releases)와 같은
GitHub 릴리스 또는 변경 로그에서 확인하세요.

더 자세한 내용은 [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)나
[커밋 로그](https://github.com/ruby/ruby/compare/v3_3_0...{{ release.tag }})를
확인해 주세요.

이러한 변경사항에 따라, Ruby 3.3.0 이후로 [파일 {{ release.stats.files_changed }}개 수정, {{ release.stats.insertions }}줄 추가(+), {{ release.stats.deletions }}줄 삭제(-)](https://github.com/ruby/ruby/compare/v3_3_0...{{ release.tag }}#file_bucket)가
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

[Feature #13557]: https://bugs.ruby-lang.org/issues/13557
[Feature #15554]: https://bugs.ruby-lang.org/issues/15554
[Feature #16495]: https://bugs.ruby-lang.org/issues/16495
[Feature #18290]: https://bugs.ruby-lang.org/issues/18290
[Feature #18980]: https://bugs.ruby-lang.org/issues/18980
[Misc #18984]:    https://bugs.ruby-lang.org/issues/18984
[Feature #19117]: https://bugs.ruby-lang.org/issues/19117
[Bug #19918]:     https://bugs.ruby-lang.org/issues/19918
[Bug #20064]:     https://bugs.ruby-lang.org/issues/20064
[Feature #20182]: https://bugs.ruby-lang.org/issues/20182
[Feature #20205]: https://bugs.ruby-lang.org/issues/20205
[Bug #20218]:     https://bugs.ruby-lang.org/issues/20218
[Feature #20265]: https://bugs.ruby-lang.org/issues/20265
[Feature #20429]: https://bugs.ruby-lang.org/issues/20429
[Feature #20564]: https://bugs.ruby-lang.org/issues/20564
[Bug #20433]:     https://bugs.ruby-lang.org/issues/20433
