---
layout: news_post
title: "루비 2.3.0-preview1 릴리스"
author: "naruse"
translator: "wagurano"
date: 2015-11-11 14:00:00 +0000
lang: ko
---

루비 2.3.0-preview1 출시를 발표하여 기쁩니다.

루비 2.3.0-preview1는(은) 루비 2.3.0의 첫번째 프리뷰입니다.
새로운 기능과 개선사항을 포함합니다.

[프로즌 스트링 리터럴
프라그마](https://bugs.ruby-lang.org/issues/11473)를 도입합니다.
루비 2.1에서 `"str".freeze`를 최적화하여 객체 할당을 줄였습니다.
루비 2.3은 매직 코멘트와 커맨드 라인 옵션을 새로 도입하여
소스 파일의 모든 스트링 리터럴을 프리즈(freeze)합니다.
그리고 디버깅할 때, `--enable-frozen-string-literal-debug` 옵션을 사용하면
`"can't modify frozen String"` (프로즌 스트링을 수정할 수 없음) 에러가 발생하는
객체를 생성한 위치를 알려줍니다.

[세이프 내비게이션 오퍼레이터](https://bugs.ruby-lang.org/issues/11537)는
C#, 그루비, 스위프트 언어에 있습니다.
세이프 내비게이션 오퍼레이터를 도입하여 `nil`을 `obj&.foo`와 같이 처리합니다. `Array#dig`와 `Hash#dig`도 추가합니다.

[did_you_mean 젬을
포함](https://bugs.ruby-lang.org/issues/11252). did_you_mean 젬은
`NameError`와 `NoMethodError`에 대한 이름을 추천해줘서
디버깅하기 편합니다.

루비 2.3.0-preview1(으)로 즐겁게 프로그래밍 한번 해보세요. 그리고 여러분의 느낀 점을 알려주세요!

## 2.2 이후의 주목할 만한 변경

* 미정

자세한 내용은 [뉴스](https://github.com/ruby/ruby/blob/v2_3_0_preview1/NEWS)와
[변경기록](https://github.com/ruby/ruby/blob/v2_3_0_preview1/ChangeLog)을
참고하세요.

이러한 변경사항에 따라, 루비 2.2.0 이후 파일 1036 개 수정, 81312 추가(+), 51322
삭제(-)

## 다운로드

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview1.tar.bz2>

  * SIZE:   14174035 bytes
  * SHA1:   55ad4f04d7a33ab780458ee0999de9f6124217ea
  * SHA256: 42b9c9e1740a5abe2855d11803524370bd95744c8dcb0068572ed5c969ac7f0f
  * SHA512: ae6d46c87f59e1fd3703b76dfc45bfcf208625f95ab9f4559f0b9f7050e8681f1a6e419f5fa06b704c83e56879c3a9ff1337dba443bcfca76fadb49c97d97a93

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview1.tar.gz>

  * SIZE:   17560800 bytes
  * SHA1:   6249572e5dca27d8c73a0cbf036e24e5d88fe82f
  * SHA256: dc8f9d48392a2bb226df5f4b4fd2074d81af155cdf3f3799139a6e31e012aefe
  * SHA512: 58384ef6e743dde20ea263692dab86ce9d6d22d722ef4c02a84396aa3128ce06d933d9b69078a3cd666d72320a8a6ffdc93296bc0d5338595b2a44c29d4db383

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview1.tar.xz>

  * SIZE:   11225228 bytes
  * SHA1:   85b4f631efa4b6435b2b41df6ce6c46da294c4d4
  * SHA256: a88e19d9dc001db8f49ca3986a8a4e69980affff876854585725e40de0eedcd8
  * SHA512: 3be0f3ed4de73509b2f6975fe3fbe28bb4d51df87db6e2c0019e8a107edf49be60b2127ba5b18bca91f9f5964b07f1adde3042dac6327017359eeb130760672b

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview1.zip>

  * SIZE:   19777010 bytes
  * SHA1:   3458666c250dd333ac4b537be25f1913dd311ea1
  * SHA256: 0fc1d4450e9141f541038a4433f8fb49fb929e43c7bf5985685a4fa7b213a811
  * SHA512: f53653cf11d8dce1d627f7db3a15acca29c74c78735406a5d64bbbdc39fac232ef63110eb4d83521bef40c6f3006d55bbeaf54d1ddab1d4b6e5a13cee9247e85

## 릴리스 코멘트

릴리스 일정과 다른 정보는 밑의 링크를 참조하세요.

[ReleaseEngineering23](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering23)
