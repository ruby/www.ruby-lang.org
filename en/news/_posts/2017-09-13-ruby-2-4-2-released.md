---
layout: news_post
title: "Ruby 2.4.2 Released"
author: "nagachika"
translator:
date: 2017-09-14 00:00:00 +0000
lang: en
---

We are pleased to announce the release of Ruby 2.4.2.
This release contains some security fixes.

* [CVE-2017-0898: Buffer underrun vulnerability in Kernel.sprintf](/en/news/2017/09/13/sprintf-buffer-underrun-cve-2017-0898/)
* [CVE-2017-10784: Escape sequence injection vulnerability in the Basic authentication of WEBrick](/en/news/2017/09/13/webrick-basic-auth-escape-sequence-injection-cve-2017-10784/)
* [CVE-2017-14033: Buffer underrun vulnerability in OpenSSL ASN1 docod](/en/news/2017/09/13/openssl-asn1-buffer-underrun-cve-2017-14033/)
* [CVE-2017-14064: Heap exposure in generating JSON](/en/news/2017/09/13/json-heap-exposure-cve-2017-14064/)
* [Multiple vulnerabilities in RubyGems](/en/news/2017/08/29/multiple-vulnerabilities-in-rubygems/)
* Update bundled libyaml to version 0.1.7.

There are also many bug-fixes.
See [commit logs](https://github.com/ruby/ruby/compare/v2_4_0...v2_4_1) for more details.

## Download

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.2.tar.bz2>

      SIZE:   11830222 bytes
      SHA1:   ecd2d709d62905692ce5010e804c29a9bee045e0
      SHA256: f98170527209e94c74c5d6f24f0c0bf2d91e325c003fa133c7e7a2dcf7ec7623
      SHA512: 05cb129dee72ac8e2aa3a330e347bd8e895379cb0c460a5d745f6af3151c8030eb2ae4657c283f1e97f457c682606f88535b938d97579148bfb3573db5b37577

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.2.tar.gz>

      SIZE:   13253704 bytes
      SHA1:   0abd787c8d675505bee047f5e2abc8294fdd03cf
      SHA256: a7fc9c7ea65f28262e4a3d62bb2ed0c6b089d6cc415f307093bd8fd03c1a6ecc
      SHA512: a05351625fa21f30b6bbdd9ceb63821a1e65c42fe1349e9e3b7468ca7f6e3b97306cb49afbb61b7ded679b1099b31b4b35b392c236248529f651121f863e9c69

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.2.tar.xz>

      SIZE:   9448724 bytes
      SHA1:   9a14ac6ee2c75849bbce2daadb76272344ab7513
      SHA256: 03b62335f71a54b0868c49cd097eaa0597cc75855da7261ab32cd4e7dd58d8d7
      SHA512: f8159c2d912f6937927f2d74fa7f72e33b941aeb895ff55dc7386cff66f8b892a46a387cfcf8d756ea2ea8e12d6a878f150e622353d9f559fe5fe9308d69d762

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.2.zip>

      SIZE:   14466329 bytes
      SHA1:   a098be69d81d8a584049bdc483523fb4a0e8b29f
      SHA256: e541547e82bfd03b05a2ec486c146b4c3a762be35bd402d30995920d9a5880f7
      SHA512: 3e4ec635adb512b0891225b7be4d2df0c714de89fbb9835cd8b0fc36d0328bbcb7ac5d67e8295126ebaf2c6c15497d2e1f49c7dc98bb4be79eca3f9cd11cf6e3

## Release Comment

Many committers, developers, and users who provided bug reports helped
us to make this release.
Thanks for their contributions.
