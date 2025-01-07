---
layout: news_post
title: "Ruby 3.4.0 릴리스"
author: "naruse"
translator: "shia"
date: 2024-12-25 00:00:00 +0000
lang: ko
---

{% assign release = site.data.releases | where: "version", "3.4.0" | first %}
Ruby {{ release.version }} 릴리스를 알리게 되어 기쁩니다.
Ruby 3.4는 `it` 블록 파라미터 참조, Prism을 기본 파서로 변경, 소켓 라이브러리에
Happy Eyeballs Version 2 지원 추가, YJIT 개선, 모듈러 GC 추가 등을 포함하고 있습니다.

## `it` 추가

`it`은 변수 이름 없이 블록 파라미터를 참조하기 위해 추가되었습니다. [[Feature #18980]]

```ruby
ary = ["foo", "bar", "baz"]

p ary.map { it.upcase } #=> ["FOO", "BAR", "BAZ"]
```

`it`은 `_1`과 거의 동일하게 동작합니다. 블록에서 `_1`만 사용할 때 다른 번호 파라미터인 `_2` 등이 나타날 가능성이 읽는 사람에게 추가적인 인지 부담을 주게 됩니다. 따라서 `it`은 편리한 별칭으로 추가되었습니다. `it`은 `it` 자체로 충분히 명확한 경우에 사용하세요. 예를 들어, 한 줄짜리 블록에서 사용하세요.

## 기본 파서를 Prism으로 변경

parse.y에서 Prism으로 기본 파서를 변경했습니다. [[Feature #20564]]

이는 내부적인 개선이며 사용자에게는 거의 변화가 없어야 합니다. 호환성 문제가 발생하면 보고해 주세요.

기존 파서를 사용하려면 `--parser=parse.y` 커맨드 라인 인수를 사용하세요.

## 소켓 라이브러리가 Happy Eyeballs Version 2 (RFC 8305) 대응

소켓 라이브러리는 이제 [Happy Eyeballs Version 2(RFC 8305)](https://datatracker.ietf.org/doc/html/rfc8305)를 지원합니다. 이는 `TCPSocket.new`(`TCPSocket.open`)와 `Socket.tcp`에서 네트워크 연결을 효율적이고 안정적으로 제공하기 위해 많은 언어에서 널리 사용되는 방법의 최신 표준화 버전입니다.
이 개선 사항은 Ruby가 현대적인 인터넷 환경에 적응된 효율적이고 신뢰할 수 있는 네트워크 연결을 제공할 수 있도록 합니다.

Ruby 3.3까지 이러한 메서드는 이름 해석과 연결 시도를 직렬로 수행했습니다. 해당 알고리즘 도입으로 이제 다음과 같이 작동합니다.

1. IPv6와 IPv4 이름 해석을 동시에 수행
2. IPv6를 우선하며 병렬로 연결을 시도하되 250ms 간격으로 떨어뜨려 시도
3. 성공한 연결을 반환하고 다른 연결을 취소

이는 특정 프로토콜이나 IP 주소가 지연되거나 사용할 수 없는 경우에도 연결 지연을 최소화합니다.
이 기능은 기본적으로 활성화되어 있으므로 추가 구성은 필요하지 않습니다. 전역으로 비활성화하려면 환경 변수 `RUBY_TCP_NO_FAST_FALLBACK=1`을 설정하거나 `Socket.tcp_fast_fallback=false`를 호출하세요. 또는 메서드별로 비활성화하려면 키워드 인수 `fast_fallback: false`를 사용하세요.

## YJIT

### TL;DR

* x86-64와 arm64 플랫폼에서 대부분의 벤치마크에서 성능이 향상되었습니다.
* 메타 데이터 압축과 통합 메모리 제한을 통해 메모리 사용량이 줄었습니다.
* 여러 버그가 수정되었습니다. YJIT는 이제 더 견고하고 잘 테스트되었습니다.

### 새 기능

* 커맨드 라인 옵션
    * `--yjit-mem-size` 커맨드 라인 옵션(기본값 128MiB)을 통해 YJIT의 통합 메모리 제한을 추가했습니다.
      이는 이전 `--yjit-exec-mem-size`보다 직관적이며, YJIT의 전체 메모리 사용량을 추적합니다.
    * `--yjit-log`를 통해 무엇이 컴파일되었는지 추적하는 컴파일 로그를 추가했습니다.
* Ruby API
    * `RubyVM::YJIT.log`로 런타임에서 컴파일 로그의 마지막 부분을 확인할 수 있습니다.
* YJIT 통계 정보
    * `RubyVM::YJIT.runtime_stats`는 이제 언제나 무효화, 인라인, 메타 정보 인코딩에 대한
       추가 통계 정보를 제공합니다.

### 새 최적화

* YJIT 메타 데이터를 저장하는 데 필요한 메모리를 줄이는 콘텍스트 압축
* 로컬 변수와 Ruby 메서드 인수를 위한 레지스터를 할당합니다.
* YJIT을 사용할 때 Ruby로 작성된 더 많은 코어 프리미티브를 사용합니다.
    * 성능을 높이기 위해 Ruby로 다시 작성된 `Array#each`, `Array#select`, `Array#map` [[Feature #20182]]
* 작고 사소한 메서드를 인라인으로 변환하는 능력
    * 빈 메서드
    * 상수를 반환하는 메서드
    * `self`를 반환하는 메서드
    * 인수를 직접 반환하는 메서드
* 더 많은 런타임 메서드에 대한 특별한 코드 생성
* `String#getbyte`, `String#setbyte` 및 다른 문자열 메서드를 최적화
* 저레벨 비트/바이트 조작을 빠르게 하기 위한 비트 연산 최적화
* 멀티 Ractor 모드에서 공유 가능한 상수 지원
* 다양한 다른 점진적 최적화

## 모듈러 GC

* 다른 가비지 컬렉터(GC) 구현을 모듈러 가비지 컬렉터 기능을 통해 동적으로
  로드할 수 있습니다. 이 기능을 활성화하려면 Ruby 빌드 시에
  `--with-modular-gc`를 설정하세요. GC 라이브러리는 환경 변수 `RUBY_GC_LIBRARY`를
  사용하여 런타임에 로드할 수 있습니다.
  [[Feature #20351]]

* Ruby의 내장 가비지 컬렉터는 `gc/default/default.c`에 분리되어 있으며,
  `gc/gc_impl.h`에 정의된 API를 사용하여 Ruby와 상호 작용합니다.
  내장 가비지 컬렉터는 `make modular-gc MODULAR_GC=default`를 사용하여
  라이브러리로서 빌드하고 환경 변수 `RUBY_GC_LIBRARY=default`를
  사용하여 활성화할 수 있습니다. [[Feature #20470]]

* [MMTk](https://www.mmtk.io/)를 기반으로 한 실험적인 GC 라이브러리가 제공됩니다.
  이 GC 라이브러리는 `make modular-gc MODULAR_GC=mmtk`를 사용하여 빌드하고
  환경 변수 `RUBY_GC_LIBRARY=mmtk`를 사용하여 활성화할 수 있습니다.
  이는 빌드 머신에 Rust 툴체인이 필요합니다. [[Feature #20860]]

## 언어 변경

* 파일에 `frozen_string_literal` 주석이 없을 때, 문자열 리터럴이 변경되면
  폐기 예정 경고를 출력합니다.
  이 경고는 `-W:deprecated`나 `Warning[:deprecated] = true` 설정을 통해 활성화할 수 있습니다.
  이 변경을 무효화하고 싶다면 Ruby를 실행할 때 `--disable-frozen-string-literal`
  커맨드 라인 인수를 사용하세요. [[Feature #20205]]

* 메서드 호출 시에 `nil`에 키워드 스플랫을 지원합니다.
  `**nil`은 `**{}`와 비슷하게 동작하며, 키워드를 넘기지 않으며,
  어떤 변환 메서드도 호출하지 않습니다. [[Bug #20064]]

* 블록을 인덱스로 사용할 수 없게 됩니다. [[Bug #19918]]

* 키워드 인수를 인덱스로 사용할 수 없게 됩니다. [[Bug #20218]]

* 최상위 이름 `::Ruby`은 예약되었으며, 이를 정의할 경우 `Warning[:deprecated]`가 발생합니다. [[Feature #20884]]

## 코어 클래스 변경

주의: 눈에 띄는 코어 클래스 변경만을 포함합니다.

* Exception

  * `Exception#set_backtrace`는 이제 `Thread::Backtrace::Location`의 배열을 입력으로 받을 수 있습니다.
    `Kernel#raise`, `Thread#raise`와 `Fiber#raise`도 같은 형식의 입력을 받습니다. [[Feature #13557]]

* GC

    * `GC.config`가 추가되어 가비지 컬렉터(GC)의 설정을 변경할 수 있습니다.
      [[Feature #20443]]

    * GC 설정 파라미터 `rgengc_allow_full_mark`가 추가되었습니다. `false`일 때
      GC는 젊은 객체만 마킹합니다. 기본값은 `true`입니다. [[Feature #20443]]

* Ractor

    * Ractor 내부에서 `require`가 허용됩니다. 해당 처리는 주 Ractor에서
      실행됩니다. 불러오는 처리를 주 Ractor에서 실행하는
      `Ractor._require(feature)`가 추가되었습니다.
      [[Feature #20627]]

    * `Ractor.main?`이 추가되었습니다. [[Feature #20627]]

    * 현재 Ractor의 Ractor 로컬 저장소에 접근하는 `Ractor.[]`와 `Ractor.[]=`가 추가되었습니다.
      [[Feature #20715]]

    * Ractor 로컬 변수를 스레드 안전하게 초기화하는 `Ractor.store_if_absent(key){ init }`가
      추가되었습니다. [[Feature #20875]]

* Range

  * `Range#size`는 이제 범위가 순회 가능하지 않다면 `TypeError`를 던집니다. [[Misc #18984]]


## 표준 라이브러리 변경

주의: 눈에 띄는 표준 라이브러리 변경만을 포함합니다.

* RubyGems
    * `--attestation` 옵션을 gem push에 추가했습니다. [sigstore.dev]에 서명을 저장할 수 있습니다.

* Bundler
    * 새 lockfile 생성 시에 체크섬을 포함하는 `lockfile_checksums` 설정을 추가합니다.
    * 기존 lockfile에 체크섬을 추가하는 `--add-checksums`를 추가합니다.

* JSON

    * `JSON.parse`의 성능이 json-2.7.x보다 약 1.5배 빨라졌습니다.

* Tempfile

    * `Tempfile.create`에 `anonymous: true` 키워드 인수가 구현되었습니다.
      `Tempfile.create(anonymous: true)`는 즉시 생성된 임시 파일을 제거합니다.
      따라서 애플리케이션에서 파일을 제거할 필요가 없습니다.
      [[Feature #20497]]

* win32/sspi.rb

    * 이 라이브러리는 이제 Ruby 저장소에서 [ruby/net-http-sspi]로 추출되었습니다.
      [[Feature #20775]]

## 호환성 문제

주의: 기능 버그 수정은 포함되어 있지 않습니다.

* 에러 메시지와 백트레이스의 출력 결과가 변경됩니다.
  * 여는 따옴표로 백틱 대신 작은따옴표를 사용합니다. [[Feature #16495]]
  * 메서드 이름 앞에 클래스 이름을 출력합니다(클래스가 불변하는 이름을 가지고 있는 경우만). [[Feature #19117]]
  * `Kernel#caller`, `Thread::Backtrace::Location`의 메서드 등도 마찬가지로 변경됩니다.

  ```
  Old:
  test.rb:1:in `foo': undefined method `time' for an instance of Integer
          from test.rb:2:in `<main>'

  New:
  test.rb:1:in 'Object#foo': undefined method 'time' for an instance of Integer
          from test.rb:2:in '<main>'
  ```

* `Hash#inspect` 렌더링이 변경되었습니다. [[Bug #20433]]

    * 심볼 키는 최신 심볼 키 구문을 사용하여 표시됩니다. 예시: `"{user: 1}"`
    * 다른 키는 `=>` 주변에 공백이 표시됩니다. 예시: `'{"user" => 1}'`. 이전에는 없었습니다. 예시: `'{"user"=>1}'`

* `Kernel#Float()`는 이제 소수 부분이 생략된 소수 문자열을 허용합니다. [[Feature #20705]]

  ```rb
  Float("1.")    #=> 1.0 (이전에는 ArgumentError가 발생했습니다)
  Float("1.E-1") #=> 0.1 (이전에는 ArgumentError가 발생했습니다)
  ```

* `String#to_f`는 이제 소수 부분이 생략된 소수 문자열을 허용합니다. 지수가 지정된 경우 결과가 변경됩니다. [[Feature #20705]]

  ```rb
  "1.".to_f    #=> 1.0
  "1.E-1".to_f #=> 0.1 (이전에는 1.0이 반환되었습니다)
  ```

* `Refinement#refined_class`가 삭제되었습니다. [[Feature #19714]]

## 표준 라이브러리 호환성 문제

* DidYouMean

    * `DidYouMean::SPELL_CHECKERS[]=`과 `DidYouMean::SPELL_CHECKERS.merge!`가 삭제됩니다.

* Net::HTTP

    * 폐기 예정이었던 상수가 삭제됩니다.
        * `Net::HTTP::ProxyMod`
        * `Net::NetPrivate::HTTPRequest`
        * `Net::HTTPInformationCode`
        * `Net::HTTPSuccessCode`
        * `Net::HTTPRedirectionCode`
        * `Net::HTTPRetriableCode`
        * `Net::HTTPClientErrorCode`
        * `Net::HTTPFatalErrorCode`
        * `Net::HTTPServerErrorCode`
        * `Net::HTTPResponseReceiver`
        * `Net::HTTPResponceReceiver`

      이 상수들은 2012년부터 폐기 예정이었습니다.

* Timeout

    * `Timeout.timeout`은 음수 값을 거부합니다. [[Bug #20795]]

* URI

    * 기본 파서를 RFC 2396 호환에서 RFC 3986 호환으로 변경했습니다.
      [[Bug #19266]]

## C API 변경

* `rb_newobj`와 `rb_newobj_of`(그리고 대응하는 매크로인 `RB_NEWOBJ`, `RB_NEWOBJ_OF`, `NEWOBJ`, `NEWOBJ_OF`)가 삭제됩니다. [[Feature #20265]]
* 폐기 예정이던 `rb_gc_force_recycle` 함수를 삭제했습니다. [[Feature #18290]]

## 그 이외의 변경

* 상세 모드(`-w`)에서 메서드에 넘긴 블록이 사용되지 않았을 때
  경고를 출력합니다.
  [[Feature #15554]]

* `String.freeze`나 `Integer#+`처럼 인터프리터와 JIT이 특별히 최적화하는
  몇몇 코어 메서드를 재정의하면 성능 클래스
  경고(`-W:performance`나 `Warning[:performance] = true`)를 출력합니다.
  [[Feature #20429]]

더 자세한 내용은 [NEWS](https://docs.ruby-lang.org/en/3.4/NEWS_md.html)나
[커밋 로그](https://github.com/ruby/ruby/compare/v3_3_0...{{ release.tag }})를
확인해 주세요.

이러한 변경사항에 따라, Ruby 3.3.0 이후로 [파일 {{ release.stats.files_changed }}개 수정, {{ release.stats.insertions }}줄 추가(+), {{ release.stats.deletions }}줄 삭제(-)](https://github.com/ruby/ruby/compare/v3_3_0...{{ release.tag }}#file_bucket)가
이루어졌습니다!

메리 크리스마스, 해피 홀리데이, 그리고 Ruby 3.4와 함께 프로그래밍을 즐겨보세요!

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
[Bug #19266]:     https://bugs.ruby-lang.org/issues/19266
[Feature #19714]: https://bugs.ruby-lang.org/issues/19714
[Bug #19918]:     https://bugs.ruby-lang.org/issues/19918
[Bug #20064]:     https://bugs.ruby-lang.org/issues/20064
[Feature #20182]: https://bugs.ruby-lang.org/issues/20182
[Feature #20205]: https://bugs.ruby-lang.org/issues/20205
[Bug #20218]:     https://bugs.ruby-lang.org/issues/20218
[Feature #20265]: https://bugs.ruby-lang.org/issues/20265
[Feature #20351]: https://bugs.ruby-lang.org/issues/20351
[Feature #20429]: https://bugs.ruby-lang.org/issues/20429
[Feature #20443]: https://bugs.ruby-lang.org/issues/20443
[Feature #20470]: https://bugs.ruby-lang.org/issues/20470
[Feature #20497]: https://bugs.ruby-lang.org/issues/20497
[Feature #20564]: https://bugs.ruby-lang.org/issues/20564
[Bug #20620]: https://bugs.ruby-lang.org/issues/20620
[Feature #20627]: https://bugs.ruby-lang.org/issues/20627
[Feature #20705]: https://bugs.ruby-lang.org/issues/20705
[Feature #20715]: https://bugs.ruby-lang.org/issues/20715
[Feature #20775]: https://bugs.ruby-lang.org/issues/20775
[Bug #20795]: https://bugs.ruby-lang.org/issues/20795
[Bug #20433]: https://bugs.ruby-lang.org/issues/20433
[Feature #20860]: https://bugs.ruby-lang.org/issues/20860
[Feature #20875]: https://bugs.ruby-lang.org/issues/20875
[Feature #20884]: https://bugs.ruby-lang.org/issues/20884
[sigstore.dev]: https://www.sigstore.dev
[ruby/net-http-sspi]: https://github.com/ruby/net-http-sspi
