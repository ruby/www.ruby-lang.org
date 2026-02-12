---
layout: news_post
title: "Ruby 1.9.3-p125 is released"
author: "NARUSE, Yui"
lang: en
---

Ruby 1.9.3-p125 is released.

This release include [a security fixes of the Ruby OpenSSL
extension][1]. And many bugs are fixed in this release.

== Fixes

* [Fix for Ruby OpenSSL module: Allow \"0/n splitting\" as a prevention
  for the TLS BEAST attack][1]
* Fixed: LLVM/clang support [\[Bug #5076\]][2]
* Fixed: GCC 4.7 support [\[Bug #5851\]][3]
* other bug fixes

See [tickets][4] and [ChangeLog][5] for details.

== Downloads

NOTE: Repackaged on 2012-02-17 02:04:00 UTC to fix [\[Bug #6040\]][6].

* [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p125.tar.bz2][7]

  * SIZE: 9733962 bytes
  * MD5: 702529a7f8417ed79f628b77d8061aa5
  * SHA256: c67a59443052b5a9219eb4cee3892bdfbc6f250f0c8e214e02256a4cc7ef5526

* [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p125.tar.gz][8]

  * SIZE: 12278584 bytes
  * MD5: e3ea86b9d3fc2d3ec867f66969ae3b92
  * SHA256: 8b3c035cf4f0ad6420f447d6a48e8817e5384d0504514939aeb156e251d44cce

* [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p125.zip][9]

  * SIZE: 13742164 bytes
  * MD5: 2cff031a8801d91a0a0ca8e9a83e2ec8
  * SHA256: c16423182227c765398723da2419e4e962076778ec5e39417fad564e413fde1d



[1]: {{ site.url }}/en/news/2012/02/16/security-fix-for-ruby-openssl-module/
[2]: https://bugs.ruby-lang.org/issues/show/5076
[3]: https://bugs.ruby-lang.org/issues/show/5851
[4]: https://bugs.ruby-lang.org/projects/ruby-193/issues?set_filter=1&amp;status_id=5
[5]: https://git.ruby-lang.org/ruby.git/plain/ChangeLog?id=refs/tags/v1_9_3_125
[6]: https://bugs.ruby-lang.org/issues/6040
[7]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p125.tar.bz2
[8]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p125.tar.gz
[9]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p125.zip
