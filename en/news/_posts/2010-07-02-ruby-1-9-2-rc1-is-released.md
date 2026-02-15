---
layout: news_post
title: "Ruby 1.9.2 RC1 is released"
author: "Yugui"
lang: en
---

Ruby 1.9.2 RC has just been released. This is a release candidate of
Ruby 1.9.2.

## About Ruby 1.9.2

Ruby 1.9.2 will be mostly compatible with 1.9.1, except for the
following changes:

* many new methods
* new socket API (IPv6 support)
* new encodings
* a `Random` class that supports various random number generators
* `Time` has been reimplemented. There is no longer the year 2038 issue.
* some regexp enhancements
* `$:` no longer includes the current directory
* `dl` is reimplemented on top of `libffi`
* new `psych` library that wraps `libyaml`. You can use the library
  instead of `syck`

See the [NEWS][1] and [ChangeLog][2] files for more details.

About 130 bugs have been fixed since the 1.9.2 preview 3 release. All
major known bugs in the 1.9.2 were fixed, except for [#3462][3].

Due to our schedule, Ruby 1.9.2 will be released in early August. The
schedule of Ruby 1.9.2 has slipped in order to ensure that 1.9.2 passes
the RubySpec. It now passes more than 99% of RubySpecs. Try out the new
Ruby and let us know via [our issue tracker][4] if you have any issues.

## Download

* [ruby-1.9.2-rc1.tar.bz2][5]
  * SIZE: 8479087 bytes
  * MD5: 242dcfaed8359a6918941b55d0806bf0
  * SHA256: c2a680aa5472c8d04a71625afa2b0f75c030d3655a3063fe364cfda8b33c1480

* [ruby-1.9.2-rc1.tar.gz](URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-rc1.tar.gz)
  * SIZE: 10779309 bytes
  * MD5: fdedd5b42ae89a9a46797823ad2d9acf
  * SHA256: 3e90036728342ce8463be00d42d4a36de70dabed96216c5f8a26ec9ba4b29537

* [ruby-1.9.2-rc1.zip][6]
  * SIZE: 12158992 bytes
  * MD5: 3da59c5d3567f6e1f1697abbef71f507
  * SHA256: 4f593a3d0873cea8f371a7fc7484cad7bc03acac0ada1970cb9f83a89bc27997



[1]: https://github.com/ruby/ruby/blob//v1_9_2_rc1/NEWS
[2]: https://github.com/ruby/ruby/blob//v1_9_2_rc1/ChangeLog
[3]: https://bugs.ruby-lang.org/issues/show/3462
[4]: https://bugs.ruby-lang.org/projects/show/ruby-19/
[5]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-rc1.tar.bz2
[6]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-rc1.zip
