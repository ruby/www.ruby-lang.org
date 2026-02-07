---
layout: news_post
title: "Ruby 1.9.2 RC2 is released"
author: "Yugui"
lang: vi
---

Ruby 1.9.2 RC2 has just been released. This is the second release
candidate of Ruby 1.9.2.

The psych library has been fixed since the previous candidate, and some
minor bugs were fixed.

See the [NEWS][1] and [ChangeLog][2] files for more details.

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

Ruby 1.9.2 has gotten stable as we expected. Due to our schedule, Ruby
1.9.2 will be released in early August. The schedule of Ruby 1.9.2 has
slipped in order to ensure that 1.9.2 passes the RubySpec. It now passes
more than 99% of RubySpecs. Try out the new Ruby and let us know via
[our issue tracker][3] if you have any issues.

## Download

* [ruby-1.9.2-rc2.tar.bz2][4]
  * SIZE: 8480974 bytes
  * MD5: 4e4906d0aab711286b31f5a834860cc3
  * SHA256: 692ebae991b104482dc9f0d220c1afb6b690a338b3b815aaa4f62954d2fa1b4a

* [ruby-1.9.2-rc2.tar.gz][5]
  * SIZE: 10781884 bytes
  * MD5: d12cd39eee4d99bc54b52aba5a0ba4e1
  * SHA256: 5d523d99f928705ac1de84ade03283c468415c00f8b6755a8dd7a140828869b4

* [ruby-1.9.2-rc2.zip][6]
  * SIZE: 12161233 bytes
  * MD5: 05229b43981e4e5ce58b5fb2e98eee52
  * SHA256: 33f7f4cdd8444c2594728f70ac07477575a7cba5e7756bd3645f23e52605618c



[1]: https://svn.ruby-lang.org/repos/ruby/tags/v1_9_2_rc2/NEWS
[2]: https://svn.ruby-lang.org/repos/ruby/tags/v1_9_2_rc2/ChangeLog
[3]: https://bugs.ruby-lang.org/projects/show/ruby-19/
[4]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-rc2.tar.bz2
[5]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-rc2.tar.gz
[6]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-rc2.zip
