---
layout: news_post
title: "Ruby 1.9.3-p194 is released"
author: "NARUSE, Yui"
lang: vi
---

Ruby 1.9.3-p194 is released.

This release include Security Fix for RubyGems: SSL server verification
failure for remote repository. And many bugs are fixed in this release.

## Security Fix for RubyGems: SSL server verification failure for remote repository

This release includes two security fixes in RubyGems.

* Turn on verification of server SSL certs
* Disallow redirects from https to http

Users who uses https source in .gemrc or /etc/gemrc are encouraged to
upgrade to 1.9.3-p194.

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

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p194.tar.bz2&gt;][4]
  * SIZE: 9841223 bytes
  * MD5: 2278eff4cfed3cbc0653bc73085caa34
  * SHA256: a9d1ea9eaea075c60048369a63b35b3b5a06a30aa214a3d990e0bb71212db8fa

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p194.tar.gz&gt;][5]
  * SIZE: 12432239 bytes
  * MD5: bc0c715c69da4d1d8bd57069c19f6c0e
  * SHA256: 46e2fa80be7efed51bd9cdc529d1fe22ebc7567ee0f91db4ab855438cf4bd8bb

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p194.zip&gt;][6]
  * SIZE: 13898712 bytes
  * MD5: 77e67b15234e442d4a3dcc450bc70fea
  * SHA256: 77474cfb92385b3a0b4c346553048bc65bfe68d4f220128329671a0234cb124d



[1]: https://github.com/rubygems/rubygems/blob/1.8/History.txt
[2]: https://bugs.ruby-lang.org/projects/ruby-193/issues?set_filter=1&amp;status_id=5
[3]: https://svn.ruby-lang.org/repos/ruby/tags/v1_9_3_194/ChangeLog
[4]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p194.tar.bz2
[5]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p194.tar.gz
[6]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p194.zip
