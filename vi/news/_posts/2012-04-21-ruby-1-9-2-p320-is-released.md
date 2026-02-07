---
layout: news_post
title: "Ruby 1.9.2-p320 is released"
author: "NARUSE, Yui"
lang: vi
---

Ruby 1.9.2-p320 is released.

This release include Security Fix for RubyGems: SSL server verification
failure for remote repository. And many bugs are fixed in this release.

## Security Fix for RubyGems: SSL server verification failure for remote repository

This release includes two security fixes in RubyGems.

* Turn on verification of server SSL certs
* Disallow redirects from https to http

Users who uses https source in .gemrc or /etc/gemrc are encouraged to
upgrade to 1.9.2-p320 or 1.9.3-p194.

Following is excerpted from RubyGems 1.8.23 release note \[1\].

\"This release increases the security used when RubyGems is talking to
an https server. If you use a custom RubyGems server over SSL, this
release will cause RubyGems to no longer connect unless your SSL cert is
globally valid.

You can configure SSL certificate usage in RubyGems through the
:ssl\_ca\_cert and :ssl\_verify\_mode options in ~/.gemrc and
/etc/gemrc. The recommended way is to set :ssl\_ca\_cert to the CA
certificate for your server or a certificate bundle containing your CA
certification.

You may also set :ssl\_verify\_mode to 0 to completely disable SSL
certificate checks, but this is not recommended.\"

Credit to John Firebaugh for reporting this issue.

\[1\]
[&lt;URL:https://github.com/rubygems/rubygems/blob/1.8/History.txt&gt;][1]

## Fixes

* Security Fix for RubyGems: SSL server verification failure for remote
  repository
* other bug fixes

See [tickets][2] and [ChangeLog][3] for details.

## Downloads

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p320.tar.bz2&gt;][4]
  * SIZE: 8981382 bytes
  * MD5: b226dfe95d92750ee7163e899b33af00
  * SHA256: 6777f865cfa21ffdc167fcc4a7da05cb13aab1bd9e59bfcda82c4b32f75e6b51

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p320.tar.gz&gt;][5]
  * SIZE: 11338691 bytes
  * MD5: 5ef5d9c07af207710bd9c2ad1cef4b42
  * SHA256: 39a1f046e8756c1885cde42b234bc608196e50feadf1d0f202f7634f4a4b1245

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p320.zip&gt;][6]
  * SIZE: 12730896 bytes
  * MD5: 0bdfd04bfeb0933c0bdcd00e4ea94c49
  * SHA256: 83db9c86d5cf20bb91e625c3c9c1da8e61d941e1bc8ff4a1b9ea70c12f2972d3



[1]: https://github.com/rubygems/rubygems/blob/1.8/History.txt
[2]: https://bugs.ruby-lang.org/projects/ruby-192/issues?set_filter=1&amp;status_id=5
[3]: https://svn.ruby-lang.org/repos/ruby/tags/v1_9_2_320/ChangeLog
[4]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p320.tar.bz2
[5]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p320.tar.gz
[6]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p320.zip
