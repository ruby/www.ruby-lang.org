---
layout: news_post
title: "FileUtils is vulnerable to symlink race attacks"
author: "Urabe Shyouhei"
lang: vi
---

A symlink race condition vulnerability was found in
FileUtils.remove\_entry\_secure. The vulnerability allows local users to
delete arbitrary files and directories.

### Affected versions

* Ruby 1.8.6 patchlevel 420 and all prior versions
* Ruby 1.8.7 patchlevel 330 and all prior versions
* Development versions of Ruby 1.8 (1.8.8dev)
* Ruby 1.9.1 patchlevel 430 and all prior versions
* Ruby 1.9.2 patchlevel 136 and all prior versions
* Development versions of Ruby 1.9 (1.9.3dev)

### Solutions

We have fixed this situation. All affected users are encouraged to
upgrade their ruby installation.

But please also note, that symlink race attacks are unavoidable when any
of upper directories from where you want to delete are owned by someone
you cannot trust. So if you want to be secure, you must ensure that
**ALL** parent directories cannot be moved by other untrusted users. For
example, parent directories should not be owned by untrusted users, and
should not be world writable except when the sticky bit set.

### Updates

* Fixed typo. (vulnerabile -&gt; vulnerable)
* 1\.8.7-334 was released to fix this issue. 1.8.7 users are encouraged
  to upgrade.
  * [https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p334.tar.gz][1]
  * [https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p334.tar.bz2][2]
  * [https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p334.zip][3]

* 1\.9.1-p431 was released to fix this issue. 1.9.1 users are encouraged
  to upgrade.
  * [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p431.tar.gz][4]
  * [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p431.tar.bz2][5]
  * [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p431.zip][6]

* 1\.9.2-p180 was released to fix this issue. 1.9.2 users are encouraged
  to upgrade.
  * [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p180.tar.gz][7]
  * [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p180.tar.bz2][8]
  * [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p180.zip][9]

* Fixed affected versions for 1.9 series.



[1]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p334.tar.gz
[2]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p334.tar.bz2
[3]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p334.zip
[4]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p431.tar.gz
[5]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p431.tar.bz2
[6]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p431.zip
[7]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p180.tar.gz
[8]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p180.tar.bz2
[9]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p180.zip
