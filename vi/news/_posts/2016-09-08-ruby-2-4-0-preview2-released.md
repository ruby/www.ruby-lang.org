---
layout: news_post
title: "Ruby 2.4.0-preview2 Released"
author: "naruse"
translator:
date: 2016-09-08 09:00:00 +0000
lang: vi
---

We are pleased to announce the release of Ruby 2.4.0-preview2.

Ruby 2.4.0-preview2 is the second preview of Ruby 2.4.0.
This preview2 is released to get feedback from the community.
Feel free to
[send feedback](https://github.com/ruby/ruby/wiki/How-To-Report)
since you can still influence the features.

## [Unify Fixnum and Bignum into Integer](https://bugs.ruby-lang.org/issues/12005)

Though [ISO/IEC 30170:2012](http://www.iso.org/iso/iso_catalogue/catalogue_tc/catalogue_detail.htm?csnumber=59579)
doesn't specify details of the Integer class,
Ruby had two visible Integer classes: Fixnum and Bignum.
Ruby 2.4 unifies them into Integer.
All C extensions which touch the Fixnum or Bignum class need to be fixed.

See also [the ticket](https://bugs.ruby-lang.org/issues/12005) and [akr's slides](http://www.a-k-r.org/pub/2016-09-08-rubykaigi-unified-integer.pdf).

## [String supports Unicode case mappings](https://bugs.ruby-lang.org/issues/10085)

`String/Symbol#upcase/downcase/swapcase/capitalize(!)` now handle
Unicode case mappings instead of only ASCII case mappings.

## Performance improvements

Ruby 2.4 also contains the following performance improvements including
language changes:

### [Array#max, Array#min](https://bugs.ruby-lang.org/issues/12172)

`[x, y].max` and `[x, y].min` are optimized to not create a temporary array
under certain conditions.

### [Regexp#match?](https://bugs.ruby-lang.org/issues/8110)

Added `Regexp#match?`, which executes a regexp match without creating
a back reference object and changing `$~` to reduce object allocation.

### Other performance improvements

* [speed up instance variable access](https://bugs.ruby-lang.org/issues/12274)

## Debugging

### [Thread#report_on_exception and Thread.report_on_exception](https://bugs.ruby-lang.org/issues/6647)

Ruby ignores exceptions in threads unless another thread explicitly joins them.
With `report_on_exception = true`,
you can notice if a thread has died due to an unhandled exception.

Send us feedback what should be the default for `report_on_exception`
and about report-on-GC, which shows a report when a thread is
garbage collected without join.

### [Thread deadlock detection now shows threads with their backtrace and dependency](https://bugs.ruby-lang.org/issues/8214)

Ruby has deadlock detection around waiting threads, but its report doesn't
include enough information for debugging.
Ruby 2.4's deadlock detection shows threads with their backtrace and
dependent threads.

Try and enjoy programming with Ruby 2.4.0-preview2, and
[send us feedback](https://github.com/ruby/ruby/wiki/How-To-Report)!

## Other notable changes since 2.3

* Support OpenSSL 1.1.0
* ext/tk is now removed from stdlib [Feature #8539](https://bugs.ruby-lang.org/issues/8539)

See [NEWS](https://github.com/ruby/ruby/blob/v2_4_0_preview2/NEWS)
and [ChangeLog](https://github.com/ruby/ruby/blob/v2_4_0_preview2/ChangeLog)
for details.

With those changes,
[2353 files changed, 289057 insertions(+), 73847 deletions(-)](https://github.com/ruby/ruby/compare/v2_3_0...v2_4_0_preview2)
since Ruby 2.3.0!

## Download

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview2.tar.bz2>

  * SIZE:   12463225 bytes
  * SHA1:   95a501624f1cf4bb0785d3e17afd0ad099f66385
  * SHA256: 2224c55b2d87b5c0f08d23a4618e870027dbc1cffbfb4a05efd19eac4ff4cf1d
  * SHA512: 0c9a59a2f57a99c4ee8539a30f41da1de7547566203f89d856e1be9dbb44365754e6c470145dc9336eb324e0feb2f53d9fef18a1564968ac21f9ee528905949f

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview2.tar.gz>

  * SIZE:   15586514 bytes
  * SHA1:   492a13c4ddc1c0c218433acb00dcf7ddeef96fe0
  * SHA256: fec544836428aada2dc593a8cc42ce330798a805e49ecb807a0e21b386fd0b14
  * SHA512: 5a3de852a7611e79f38219ed7bb13772aaabb25538ca843d38743180a0cc939a4e34c008b61d578da785285196b6b8882270bddc17cbed481237db8afa4c54e4

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview2.tar.xz>

  * SIZE:   9886832 bytes
  * SHA1:   95d5fd7d54d86497194f69ec433755a517dcde8f
  * SHA256: 6c2d25bedc50c2f19b0e349f0ffd9b9a83000d9cb6a677bf5372fb493d33e16a
  * SHA512: b9bd898d17583103ee61b4764ac86eb62c9661fca1f41ff0d06a15965a0a1ba581491d4b8a342e527d63e102b6ddcb2acebdabe5b246409ce9711e13f9428d5b

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview2.zip>

  * SIZE:   17401564 bytes
  * SHA1:   5f3a5b2fd03f70d49e74ec36be3e0c110f6c17cc
  * SHA256: 4d0e466148283ad52208b1e1b70b018aefb7fa95b490fc862d5ea4ca284ecdd2
  * SHA512: 0ef2098d995238580245a4bcee843641199c1194189be13614611e2ffec329278072319a799d409eaf13b1cff45f05a0eae02d9ea8ccc69058fa49e03eca0130

## Release Comment

See also the release schedule and other information:

[ReleaseEngineering24](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering24)
