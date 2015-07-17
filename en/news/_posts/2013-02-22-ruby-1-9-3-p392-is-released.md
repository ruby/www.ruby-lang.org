---
layout: news_post
title: "Ruby 1.9.3-p392 is released"
author: "usa"
date: 2013-02-22 13:09:05 +0000
lang: en
---

Now Ruby 1.9.3-p392 is released. I apologize for updating too
frequently.

This release includes security fixes about bundled JSON and REXML.

* [Denial of Service and Unsafe Object Creation Vulnerability in JSON
  (CVE-2013-0269)][1]
* [Entity expansion DoS vulnerability in REXML (XML bomb,
  CVE-2013-1821)][2]

And some small bugfixes are also included.

See [tickets][3] and [ChangeLog][4] for details.

## Download

You can download this release from:

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p392.tar.bz2&gt;][5]

      SIZE:   10024221 bytes
      MD5:    a810d64e2255179d2f334eb61fb8519c
      SHA256: 5a7334dfdf62966879bf539b8a9f0b889df6f3b3824fb52a9303c3c3d3a58391

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p392.tar.gz&gt;][6]

      SIZE:   12557294 bytes
      MD5:    f689a7b61379f83cbbed3c7077d83859
      SHA256: 8861ddadb2cd30fb30e42122741130d12f6543c3d62d05906cd41076db70975f

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p392.zip&gt;][7]

      SIZE:   13863402 bytes
      MD5:    212fb3bc41257b41d1f8bfe0725916b7
      SHA256: f200ce4a63ce57bea64028a507350717c2a16bdbba6d9538bc69e9e7c2177c8b

## Release Comment

Many committers, testers and users who gave bug reports helped me to
make this release. Thanks for their contributions.



[1]: {{ site.url }}/en/news/2013/02/22/json-dos-cve-2013-0269/
[2]: {{ site.url }}/en/news/2013/02/22/rexml-dos-2013-02-22/
[3]: https://bugs.ruby-lang.org/projects/ruby-193/issues?set_filter=1&amp;status_id=5
[4]: http://svn.ruby-lang.org/repos/ruby/tags/v1_9_3_392/ChangeLog
[5]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p392.tar.bz2
[6]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p392.tar.gz
[7]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p392.zip
