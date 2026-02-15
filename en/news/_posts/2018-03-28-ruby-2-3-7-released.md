---
layout: news_post
title: "Ruby 2.3.7 Released"
author: "usa"
translator:
date: 2018-03-28 17:00:00 +0000
lang: en
---

Ruby 2.3.7 has been released.

This release includes about 70 bug fixes after the previous release, and also includes several security fixes.
Please check the topics below for details.

* [CVE-2017-17742: HTTP response splitting in WEBrick](/en/news/2018/03/28/http-response-splitting-in-webrick-cve-2017-17742/)
* [CVE-2018-8777: DoS by large request in WEBrick](/en/news/2018/03/28/large-request-dos-in-webrick-cve-2018-8777/)
* [CVE-2018-6914: Unintentional file and directory creation with directory traversal in tempfile and tmpdir](/en/news/2018/03/28/unintentional-file-and-directory-creation-with-directory-traversal-cve-2018-6914/)
* [CVE-2018-8778: Buffer under-read in String#unpack](/en/news/2018/03/28/buffer-under-read-unpack-cve-2018-8778/)
* [CVE-2018-8779: Unintentional socket creation by poisoned NUL byte in UNIXServer and UNIXSocket](/en/news/2018/03/28/poisoned-nul-byte-unixsocket-cve-2018-8779/)
* [CVE-2018-8780: Unintentional directory traversal by poisoned NUL byte in Dir](/en/news/2018/03/28/poisoned-nul-byte-dir-cve-2018-8780/)
* [Multiple vulnerabilities in RubyGems](/en/news/2018/02/17/multiple-vulnerabilities-in-rubygems/)

See the [ChangeLog](https://github.com/ruby/ruby/blob//v2_3_7/ChangeLog) for details.

After this release, we will end the normal maintenance phase of Ruby 2.3,
and start the security maintenance phase of it.
This means that after the release of 2.3.7 we will never backport any bug fixes
to 2.3 except security fixes.
The term of the security maintenance phase is scheduled for 1 year.
By the end of this term, official support of Ruby 2.3 will be over.
Therefore, we recommend that you start planning to upgrade to Ruby 2.5 or 2.4.

## Download

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

## Release Comment

Thanks to everyone who helped with this release.

The maintenance of Ruby 2.3, including this release, is based on the “Agreement for the Ruby stable version” of the Ruby Association.
