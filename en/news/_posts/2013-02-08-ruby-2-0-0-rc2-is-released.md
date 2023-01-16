---
layout: news_post
title: "Ruby 2.0.0-rc2 is released"
author: "Yusuke Endoh"
date: 2013-02-08 14:34:17 +0000
lang: en
---

Ruby 2.0.0-rc2 is released. This will be the last release candidate of
Ruby 2.0.0.

Please give it a try, and report any issue if you notice.

## Locations

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-rc2.tar.bz2&gt;][1]

      SIZE:   10822239 bytes
      MD5:    e92420131bd7994513e0bf09a3e2a19b
      SHA256: d55f897bb04283c5fa80223d96d990fe8ecb598508dd59443b356cbba1f66145

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-rc2.tar.gz&gt;][2]

      SIZE:   13616756 bytes
      MD5:    9d5e6f26db7c8c3ddefc81fdb19bd41a
      SHA256: 87072ab3e6d393d47f7402682364e4f24efe1c518969795cc01fcdeeb0e646f3

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-rc2.zip&gt;][3]

      SIZE:   15118480 bytes
      MD5:    1a2d33f1c50e32ca1532f8dea4790d53
      SHA256: c28e9baf3aa00b41b8823c16df436ae143e8a63e43e7a53302f23119e13d0ebf

## New features in 2.0.0

* Keyword arguments
* Enumerable#lazy
* Module#prepend
* \#to\_h: Convention for conversion to Hash
* %i: a literal for symbol array
* Updated regexp engine: Onigmo (a fork of Oniguruma)
* Enumerator#size and Range#size were introduced
* DTrace support
* TracePoint
* Optimized require performance (especially, on Windows)
* NativeClient support
* Documentation improvement
* Enhanced asynchronous interrupt handling
* Launch-time stack size tuning parameters
* Refinements \[experimental\]

... and more improvements. See NEWS for details.

Here are some introductory articles by third parties:

* [&lt;URL:https://speakerdeck.com/a\_matsuda/ruby-2-dot-0-on-rails&gt;][4]
* [&lt;URL:http://globaldev.co.uk/2012/11/ruby-2-0-0-preview-features/&gt;][5]
* [&lt;URL:http://www.infoq.com/news/2012/11/ruby-20-preview1&gt;][6]
* [&lt;URL:http://timelessrepo.com/refinements-in-ruby&gt;][7]
  (Refinements)
* [&lt;URL:http://el.jibun.atmarkit.co.jp/rails/2012/11/ruby-20-8256.html&gt;][8]
  (in Japanese)
* [&lt;URL:https://speakerdeck.com/nagachika/rubyist-enumeratorlazy&gt;][9]
  (Enumerator::Lazy, in Japanese)

(If you volunteer to provide additional articles, we may cite or refer
to them in the next release announcement.)

## Notes

### Incompatibility

There are three notable incompatibilities we know of:

* The default encoding for ruby scripts is now UTF-8 [\[#6679\]][10].
  Some people report that it affects existing programs, such as some
  benchmark programs becoming very slow [\[ruby-dev:46547\]][11]. The
  spec may change for the official release.
* iconv was removed, which had already been deprecated when M17N was
  introduced in ruby 1.9. Use String#encode, etc. instead.
* There is ABI breakage [\[ruby-core:48984\]][12]. We think that normal
  users can/should just reinstall extension libraries. You should be
  aware: \"DO NOT COPY .so OR .bundle FILES FROM 1.9\".

There are some comparatively small incompatibilities.
[\[ruby-core:49119\]][13] Please report any other incompatibility you
notice.

FYI: We are creating upgrade notes, but some parts are already outdated.

* [&lt;URL:https://bugs.ruby-lang.org/projects/ruby/wiki/200UpgradeNotesDraft&gt;][14]

### Status of Refinements

2\.0.0 will include refinements as an \"experimental feature\" because we
could not agree on its detailed spec. Note that the behavior may change
in future versions of Ruby.

### Special thanks

I appreciate all who try preview and rc1 release! I\'m grateful for all
the contributors\' hard work to fix many bugs. I\'m really thankful to
all the people who helped me do this release.



[1]: https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-rc2.tar.bz2
[2]: https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-rc2.tar.gz
[3]: https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-rc2.zip
[4]: https://speakerdeck.com/a_matsuda/ruby-2-dot-0-on-rails
[5]: http://globaldev.co.uk/2012/11/ruby-2-0-0-preview-features/
[6]: http://www.infoq.com/news/2012/11/ruby-20-preview1
[7]: http://timelessrepo.com/refinements-in-ruby
[8]: http://el.jibun.atmarkit.co.jp/rails/2012/11/ruby-20-8256.html
[9]: https://speakerdeck.com/nagachika/rubyist-enumeratorlazy
[10]: https://bugs.ruby-lang.org/issues/6679
[11]: https://blade.ruby-lang.org/ruby-dev/46547
[12]: https://blade.ruby-lang.org/ruby-core/48984
[13]: https://blade.ruby-lang.org/ruby-core/49119
[14]: https://bugs.ruby-lang.org/projects/ruby/wiki/200UpgradeNotesDraft
