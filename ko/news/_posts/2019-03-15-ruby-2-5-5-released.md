---
layout: news_post
title: "루비 2.5.5 릴리스"
author: "nagachika"
translator: "shia"
date: 2019-03-15 02:00:00 +0000
lang: ko
---

루비 2.5.5가 릴리스 되었습니다.

이 릴리스는 Puma와 같은 (멀티 스레드를 쓰는 부모 프로세스가 `Process.fork`를 사용하는) 멀티 스레드나 멀티 프로세스 애플리케이션에서 데드록이 발생하는 버그 수정을 포함합니다.

자세한 내용은 [커밋 로그](https://github.com/ruby/ruby/compare/v2_5_4...v2_5_5)를 확인해주세요.

## 다운로드

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.5.tar.bz2>

      SIZE:   14165422 bytes
      SHA1:   1932db85ace80ecdbc5cfc7aada5b5123f7ad739
      SHA256: 1f2567a55dad6e50911ce42fcc705cf686924b897f597cabf803d88192024dcb
      SHA512: 1b56aa79569b818446440b9f2d13122bf7c2976ab9b2865f5fb62d247d7768dd4ac5b5e463709ffec0f757bff7088afd293c2a8c5349c3780763b6444bb354a8

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.5.tar.gz>

      SIZE:   15996436 bytes
      SHA1:   e6a063728950762925108abbdbf68968ec1ab5bb
      SHA256: 28a945fdf340e6ba04fc890b98648342e3cccfd6d223a48f3810572f11b2514c
      SHA512: 82d0ae019c02822668f7e8c7ad7f62170b059ea70a95a7a7cb26f809e2f2f0f5d25b5bb0ca147413ae42cf0fc5bf60329b56609c266556b1e9f04813c33bb4c9

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.5.tar.xz>

      SIZE:   11459832 bytes
      SHA1:   85cee62e47f0707808ff3d7cb68b6cd075a65509
      SHA256: 9bf6370aaa82c284f193264cc7ca56f202171c32367deceb3599a4f354175d7d
      SHA512: 06b1d58536ebfacb7b56c1e6ed4b8ab816fadc4f48c845a452554cd262e7908199a30e5793f3cbaec2db56a8803aa5c6089abf7bf06c8fc47867e97870b7dfec

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.5.zip>

      SIZE:   19186230 bytes
      SHA1:   c0b2bd2b09b40d098b1295303c820d7dd8d97d38
      SHA256: be630e814c796f3750bd892f1250851e67fc4379f75508a4cb7ca7ceb718ddef
      SHA512: 95604d47f3436e0be3a59742a89ac5f1c5c9493ddab8b53b154098b876b2fa12418d2adfc1c71e039a6876d209a7832efd88c0e297df5be56b8f7e92094eb487

## 릴리스 코멘트

sorah와 k0kubun의 보고와 조사에 감사를 표합니다. 고맙습니다.
