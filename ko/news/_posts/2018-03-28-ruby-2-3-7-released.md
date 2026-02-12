---
layout: news_post
title: "루비 2.3.7 릴리스"
author: "usa"
translator: "shia"
date: 2018-03-28 17:00:00 +0000
lang: ko
---

루비 2.3.7이 릴리스 되었습니다.

이번 릴리스는 70여개의 버그 수정과 다수의 보안 수정을 포함합니다.
세부 내용은 아래 주제를 확인해주세요.

* [CVE-2017-17742: WEBrick의 HTTP 응답 위장 취약점](/ko/news/2018/03/28/http-response-splitting-in-webrick-cve-2017-17742/)
* [CVE-2018-8777: WEBrick의 커다란 요청을 통한 서비스 거부 공격 취약점](/ko/news/2018/03/28/large-request-dos-in-webrick-cve-2018-8777/)
* [CVE-2018-6914: tempfile, tmpdir에서 디렉터리 순회를 동반하는 의도하지 않은 파일, 또는 디렉터리 생성 취약점](/ko/news/2018/03/28/unintentional-file-and-directory-creation-with-directory-traversal-cve-2018-6914/)
* [CVE-2018-8778: String#unpack의 범위 외 읽기 취약점](/ko/news/2018/03/28/buffer-under-read-unpack-cve-2018-8778/)
* [CVE-2018-8779: UNIXServer, UNIXSocket에서 NUL 문자 삽입을 통한 의도치 않은 소켓 생성 취약점](/ko/news/2018/03/28/poisoned-nul-byte-unixsocket-cve-2018-8779/)
* [CVE-2018-8780: Dir에서 NUL 문자 주입을 통한 의도하지 않은 디렉터리 접근 취약점](/ko/news/2018/03/28/poisoned-nul-byte-dir-cve-2018-8780/)
* [RubyGems의 취약점 다수 발견](/ko/news/2018/02/17/multiple-vulnerabilities-in-rubygems/)

[ChangeLog](https://git.ruby-lang.org/ruby.git/plain/ChangeLog?id=refs/tags/v2_3_7)를 확인해주세요.

이번 릴리스를 마지막으로 루비 2.3의 통상적인 유지보수 단계는 끝나게 되며,
보안 유지보수 단계가 시작됩니다.
다시 말하면, 2.3.7 릴리스 이후에는 버그 픽스에 대한 백포트는 없을 것이며 보안 패치만 이루어지게 되는 것입니다.
보안 유지보수 기간은 1년으로 예정되어 있습니다.
이 기간이 끝나면 공식적인 루비 2.3 유지보수가 종료됩니다.
그러므로 루비 2.5나 2.4로 업그레이드할 계획을 세우시길 추천합니다.

## 다운로드

* [https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.7.tar.bz2](https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.7.tar.bz2)

      SIZE:   14421177 bytes
      SHA1:   3bb88965405da5e4de2432eeb445fffa8a66fb33
      SHA256: 18b12fafaf37d5f6c7139c1b445355aec76baa625a40300598a6c8597fc04d8e
      SHA512: e72754f7703f0706c4b0bccd053035536053451fe069a55427984cc0bc5692b86bd51c243c5f62f78527c66b08300d2e4aa19b73e6ded13d6020aa2450e66a7d

* [https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.7.tar.gz](https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.7.tar.gz)

      SIZE:   17859100 bytes
      SHA1:   540996fec64984ab6099e34d2f5820b14904f15a
      SHA256: 35cd349cddf78e4a0640d28ec8c7e88a2ae0db51ebd8926cd232bb70db2c7d7f
      SHA512: 1ceccf00981d6d60e7587e89a04cc028f976950313ee445db5afd03e323472d3e69a35423733b24f9cbd9729f034cf80d2233b5c159764839f5bee4ca7052fe0

* [https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.7.tar.xz](https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.7.tar.xz)

      SIZE:   11438124 bytes
      SHA1:   c489248730cbce7721edd3e97de81e68eec938b2
      SHA256: c61f8f2b9d3ffff5567e186421fa191f0d5e7c2b189b426bb84498825d548edb
      SHA512: fd91c8db3d3aa4cc962a62f27b4d1a71f6b5567ab836e6dbfbbb1553eb269d11e12faf9e36af6c489c33b54fd89dab99bfe81a563158b704877f0628d6f5bc5a

* [https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.7.zip](https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.7.zip)

      SIZE:   19911423 bytes
      SHA1:   ec6870b39125238d8d57d642225592896ed3b6d9
      SHA256: ffa42eeff928624a05dc7ad39426c855c6e9a757417f17b6fe9e54664ec91012
      SHA512: c85255a7f43c7df2fb11be4f9aa96e2ae70a94d3e963ccff4d8c1349ad6d455d9a436812efb24c91e451e68b8f81e5d335c6d5811b2a0e945a7070c305054434

## 릴리스 코멘트

이 릴리스를 만드는 데 도움을 준 모든 분에게 감사합니다.

이 릴리스를 포함한 루비 2.3의 유지보수는 [Ruby Association](http://www.ruby.or.jp/)의 "루비 안정 버전에 관한 협의"에 기반해 이루어집니다.
