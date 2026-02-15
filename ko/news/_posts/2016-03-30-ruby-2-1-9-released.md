---
layout: news_post
title: "루비 2.1.9 릴리스"
author: "usa"
translator: "yous"
date: 2016-03-30 12:00:00 +0000
lang: ko
---

루비 2.1.9가 릴리스 되었습니다.

이번 릴리스는 많은 버그 수정을 포함하고 있습니다.
자세한 사항은
[ChangeLog](https://github.com/ruby/ruby/blob//v2_1_9/ChangeLog)를
확인해주세요.

[이전에 공지했듯이](https://www.ruby-lang.org/en/news/2016/02/24/support-plan-of-ruby-2-0-0-and-2-1/),
이는 루비 2.1의 마지막 일반 릴리스입니다.
이 릴리스 이후로는 보안 수정을 제외한 어떤 버그 수정도 백포트되지 않을 것입니다.
루비 2.3이나 2.2로 업그레이드할 계획을 세우시길 추천합니다.

한편 우리는 루비 2.1.10의 릴리스를 계획하고 있습니다.
루비 2.1.10은 버전 번호를 제외하면 2.1.9에서 변경된 어떠한 사항도 포함하고 있지 않습니다.
프로덕션 환경에서 사용할 필요는 없지만 두 글자짜리 버전 번호를 갖고 있으므로 테스트 해보셔야 합니다.

## 다운로드

* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.9.tar.bz2](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.9.tar.bz2)

      SIZE:   12016421 bytes
      SHA1:   39524185b580a3390a3b5019819c8b28d3249766
      SHA256: 4f21376aa11e09b499c3254bbd839e68e053c0d18e28d61c428a32347269036e
      SHA512: a86422132e4c64007a84a91696f4557bdcbc8716fbfe1962f1eef3754ee7f994f4de0b5b7e7231c25057515767040d5c4af33339750b6db15744662e9bd24f38

* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.9.tar.gz](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.9.tar.gz)

      SIZE:   15166126 bytes
      SHA1:   dd68afc652fe542f83a9a709a74f4da2662054bf
      SHA256: 034cb9c50676d2c09b3b6cf5c8003585acea05008d9a29fa737c54d52c1eb70c
      SHA512: 1e03aa720e932f019c4651c355e8ef35b87fdf69b054c9d39a319467d2a8e5bfe4995cbacd9add36b832c77761a47c9d1040f00e856ad5888d69ec7221455e35

* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.9.tar.xz](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.9.tar.xz)

      SIZE:   9395648 bytes
      SHA1:   5e89efa5189c3def8ee8de18ce750a7e4a20ac32
      SHA256: 39f203f7498aed2456fb500147fada5adcbf102d89d4f6aca773ebcadd8ea82a
      SHA512: 1f331a8910fd7a9ab9c41bf56aef12041dd413ad49c696f6df2c9a7ec3a3d5cdf383f2a3d30949ea37b8ecb39f50355e526412b36ed4e07b60733d9db4d2bd14

* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.9.zip](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.9.zip)

      SIZE:   16696728 bytes
      SHA1:   4aa288b65fbf12692ac53577adc561c9a0f6a6ca
      SHA256: 8610fdb1836d493c19600cfed4828083f85197096c0aea3f73fa1ed532cbb5a7
      SHA512: a212b6a58637f6bf4f456d7ecc7bbd8ceaa0c3f16cb844b872eb62eaf261b5874fdb79705241d05a356fcdc1d3fdd8a94fcd8e6ca62190e9f544c8f45a9f41af

## 릴리스 코멘트

이 릴리스를 만드는 데 도움을 준 모두에게 감사드립니다.

이 릴리스를 포함한 루비 2.1의 유지보수는 [Ruby Association](http://www.ruby.or.jp/)의
"루비 안정 버전에 관한 협의"에 기반해 이루어집니다.
