---
layout: news_post
title: Ruby 1.9.1-p376 is released
---

Ruby 1.9.1-p376 just has been released. This is a patch level release of
Ruby 1.9.1 and includes the fix of CVE-2009-4124.

#### CVE-2009-4124

The previous release, Ruby 1.9.1-p243 has a [security vulnerability that
allows heap overflow][1]. This vulnerability was found by Emmanouel
Kellinis, KPMG London.

I recommend all Ruby 1.9.1 users to upgrade to p376. But the
vulnerability does not affect Ruby 1.8 series.

#### Other fixes

In addition, 1.9.1-p376 includes &gt; 100 bug fixes.

* Irb extension commands had been broken. It was fixed.
* Ripper had not been able to parse some Ruby codes. It was fixed.
* Fixed build failures on AIX.
* Some bug fixes of Matrix.
* Can load gems which is installed in an user\'s home directory.
* Some method became returning a string with a correct encoding.

See the ChangeLog for more detail.

* [http://svn.ruby-lang.org/repos/ruby/branches/ruby\_1\_9\_1/ChangeLog][2]

#### Location

* [http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p376.tar.bz2][3]<br />
  SIZE: 7293106 bytes<br />
  MD5: e019ae9c643c5efe91be49e29781fb94<br />
  SHA256: 79164e647e23bb7c705195e0075ce6020c30dd5ec4f8c8a12a100fe0eb0d6783
* [http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p376.tar.gz][4]<br />
  SIZE: 9073007 bytes<br />
  MD5: ebb20550a11e7f1a2fbd6fdec2a3e0a3<br />
  SHA256: 58b8fc1645283fcf3d5be195dffcaf55b7c85cbc210074273b57b835409b21ca
* [http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p376.zip][5]<br />
  SIZE: 10337871 bytes<br />
  MD5: d4d5e62f65cb92a281f1569a7f25371b<br />
  SHA256: 486d3efdab269040ce7142964ba3a4e0d46f0a5b812136bcac7e5bafc726c14e

[1]: http://www.ruby-lang.org/en/news/2009/12/07/heap-overflow-in-string/ 
[2]: http://svn.ruby-lang.org/repos/ruby/branches/ruby_1_9_1/ChangeLog 
[3]: http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p376.tar.bz2 
[4]: http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p376.tar.gz 
[5]: http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p376.zip 
