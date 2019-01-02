---
layout: news_post
title: "루비 2.3.0 릴리스"
author: "naruse"
translator: "Shia Sim"
date: 2015-12-25 17:00:00 +0000
lang: ko
---

루비 2.3.0의 릴리스를 발표할 수 있게 되어 기쁘게 생각합니다.

이것은 루비 2.3.x의 첫 번째 안정판 릴리스입니다.
여기에서는 많은 새 기능들이 도입되었습니다.

[프로즌 스트링 리터럴 프라그마](https://bugs.ruby-lang.org/issues/11473)가
도입되었습니다. 루비 2.1에서는 객체 할당을 줄이기 위해 `"str".freeze`가 최적화 되었습니다.
루비 2.3에서는 모든 리터럴 문자열을 얼리는 새 매직 코멘트와 커맨드 라인 옵션이 추가 되었습니다.
추가로 디버깅을 위해서 `--debug=frozen-string-literal` 옵션을 통해 `"can't modify frozen String"` 에러와 함께 객체가 어디에서 생성되었는지에 대한 정보를 얻을 수 있게 되었습니다.

C#, Groovy, Swift의 [세이프 내비게이션 연산자](https://bugs.ruby-lang.org/issues/11537)([외톨이 연산자라고도 불리는](https://instagram.com/p/-M9l6mRPLR/)) `&.`가 도입되어서 `obj&.foo`처럼 `nil` 처리가 한결 쉬워졌습니다. `Array#dig`와 `Hash#dig`도 추가되었습니다. 이 연산자는 [ActiveSupport의 try!](http://api.rubyonrails.org/v4.2.5/classes/Object.html#method-i-try-21)처럼 동작하지만, `nil`만을 처리합니다.

[`did_you_mean` gem이 기본으로 내장됩니다.](https://bugs.ruby-lang.org/issues/11252) did_you_mean gem은 디버깅이 편리하도록 `NameError`와 `NoMethodError`가 발생했을 때 잘못 입력했을 가능성이 있는 이름의 후보군을 보여줍니다.

[RubyVM::InstructionSequence#to_binary와 .load_from_binary](https://bugs.ruby-lang.org/issues/11788)가 실험적으로 도입되었습니다. 이 기능을 통해서 ISeq(bytecode) 사전 컴파일 기능을 만들 수 있습니다.

더불어 많은 성능 개선이 있었습니다. 예를 들어, [메서드 엔트리 데이터 구조의 변경](https://bugs.ruby-lang.org/issues/11278), [새 테이블 데이터 구조의 도입](https://bugs.ruby-lang.org/issues/11420), [Proc#call 최적화](https://bugs.ruby-lang.org/issues/11569), 기계 코드 레벨의 객체 할당 및 함수 호출 방법의 개선, [더 영리한 인스턴스 변수 데이터 구조](https://bugs.ruby-lang.org/issues/11170), [소켓과 I/O에서 고성능 논블로킹 I/O를 위해 "exception:" 키워드 사용을 허용](https://bugs.ruby-lang.org/issues/11229)하는 등의 변경이 있었습니다. NEWS 파일의 "Implementation improvements"를 확인하세요.

새 기능과 호환성의 전체 목록은 [NEWS](https://github.com/ruby/ruby/blob/v2_3_0/NEWS)와 [ChangeLog](https://github.com/ruby/ruby/blob/v2_3_0/ChangeLog)를 확인해주세요.

이외에도 루비 2.2.0 이후로 [2946개의 파일이 변경되었으며, 104057줄이 추가되고, 59478줄이 제거](https://github.com/ruby/ruby/compare/v2_2_0...v2_3_0)되었습니다!

즐거운 성탄절, 행복한 휴일을 보내시고, 루비 2.3 코딩을 즐겨주세요!

## 다운로드

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0.tar.bz2>

      SIZE:   14185617 bytes
      SHA1:   6c8a832d49d22755ea8c45b6d53faf2ccc6d6ac9
      SHA256: ec7579eaba2e4c402a089dbc86c98e5f1f62507880fd800b9b34ca30166bfa5e
      SHA512: 77b707359e754c3616699d21697752741497c719dc3d6fdfb55ed639e76d52560d293ae54cbe5c63be78dc73fbe60f1b8615d704d017bdfe1994aa9747d26a6c

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0.tar.gz>

      SIZE:   17648682 bytes
      SHA1:   2dfcf7f33bda4078efca30ae28cb89cd0e36ddc4
      SHA256: ba5ba60e5f1aa21b4ef8e9bf35b9ddb57286cb546aac4b5a28c71f459467e507
      SHA512: 914d0201ecefaeb67aca0531146d2e89900833d8d2a597ec8a19be94529ab6b4be367f9b0cee2868b407288896cc14b64d96150223cac0aef8aafc46fc3dd7cc

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0.tar.xz>

      SIZE:   11294412 bytes
      SHA1:   96e620e38af351c8da63e40cfe217ec79f912ba1
      SHA256: 70125af0cfd7048e813a5eecab3676249582bfb65cfd57b868c3595f966e4097
      SHA512: d893c5e6db5a0533e0da48d899c619964388852ef90e7d1b92a4363d5f189cd2dba32a009581f62b9f42a8e6027975fc3c18b64faf356f5e3ac43a8d69ec5327

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0.zip>

      SIZE:   19840511 bytes
      SHA1:   3f88617568d9a4f491e8b32dca532363f73eaa71
      SHA256: 8270bdcbc6b62a18fdf1b75bd28d5d6fc0fc26b9bd778d422393a1b98006020a
      SHA512: a3f397bb3c9c19d9b797552c5d60bb01c82db884cfa966df84881125bea35713cffd99f88fb86b271bae72d9cfb09ad9b33838cffcf6365c091459479914fdef
