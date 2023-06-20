---
layout: news_post
title: "Ruby 2.4.0-preview3 リリース"
author: "naruse"
translator:
date: 2016-11-09 09:00:00 +0000
lang: ja
---

Ruby 2.4.0-preview3がリリースされました.

これはRuby 2.4.0に向けた3番目のプレビューリリースになります。
プレビューリリースとはRubyコミュニティのフィードバックを得るためにリリースされています。
何かお気づきの際は、Ruby 2.4.0をよりよくするために[Ruby バグレポートガイドライン](https://github.com/ruby/ruby/wiki/How-To-Report-Ja)を参考にしてバグレポートや提案を送ってください。

## [Introduce hash table improvement by Vladimir Makarov](https://bugs.ruby-lang.org/issues/12142)

従来Rubyのハッシュテーブルの内部実装 (st_table) ではに双方向連結リストとチェイン法を用いた実装が使われていましたが、挿入順の配列にオープンアドレス法を用いることによる高速化が行われました。
この改善に際しては多くの方による議論が行われ、とりわけ Yura Sokolov 氏によって多大な貢献がありました。

## Binding#irb: Start a REPL session like `binding.pry`

[pry](https://github.com/pry/pry) を用いると `binding.pry` とアプリケーションに書くことで、その場で対話型実行環境を起動することができ、デバッグの際に便利です。
[r56624](https://github.com/ruby/ruby/commit/493e48897421d176a8faf0f0820323d79ecdf94a) にて `binding.irb` と書くことで同様なことをirbを用いて行える機能が入りました。

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

Try and enjoy programming with Ruby 2.4.0-preview3, and
[send us feedback](https://github.com/ruby/ruby/wiki/How-To-Report)!

## Other notable changes since 2.3

* Support OpenSSL 1.1.0
* ext/tk is now removed from stdlib [Feature #8539](https://bugs.ruby-lang.org/issues/8539)
* XMLRPC is now removed from stdlib [Feature #12160](https://bugs.ruby-lang.org/issues/12160)

See [NEWS](https://github.com/ruby/ruby/blob/v2_4_0_preview3/NEWS)
and [ChangeLog](https://github.com/ruby/ruby/blob/v2_4_0_preview3/ChangeLog)
for details.

With those changes,
[2470 files changed, 283051 insertions(+), 64902 deletions(-)](https://github.com/ruby/ruby/compare/v2_3_0...v2_4_0_preview3)
since Ruby 2.3.0!

## Download

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview3.tar.bz2>

      SIZE:   12615328 bytes
      SHA1:   fefe49f6a7d5b642936c324f3b05aaac827355db
      SHA256: 305a2b2c627990e54965393f6eb1c442eeddfa149128ccdd9f4334e2e00a2a52
      SHA512: 6602c65a7b1e3bc680acc48217108f4335e84fdd74a9cf06f2e2f9ad00a2fccacf9fa035a912bc9d5cc3f0c7a5e21475971dfac37b0364311ef3645f25c7ddf9

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview3.tar.gz>

      SIZE:   15758023 bytes
      SHA1:   f6a6ec9f7fedad0bf4efee2e42801cc963f60dca
      SHA256: c35fe752ccfabf69bf48e6aab5111c25a05938b428936f780638e2111934c9dd
      SHA512: 68556d5252b6813b4c8eeba32733e940207f80694b5c5d20e69bf01eb52929ed2466496b05a895a5ad4831d430695e17624eb35b728b2d4d7cf02df756ac48b4

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview3.tar.xz>

      SIZE:   9957596 bytes
      SHA1:   66592b1a52f985638d639e7c3dd6bdda4e0569d0
      SHA256: b14be2b5c80bff0d6894ae2b37afdb17a968413e70236ec860f3e2d670b4c317
      SHA512: 5be20f0b2609745790c2b22f2228e69a840f63c34a117a1f95fd5436af211f0a6db2758d513d3e095a2d97c53c80793579cb2a1e00e70cf72c487a88c4a40d33

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview3.zip>

      SIZE:   17579012 bytes
      SHA1:   15d08cff952da3844ae54887b7f74b12d47c9ee2
      SHA256: b95a8f67fb7d6e852db77c5660c8878c14d68eb72c5501dac164a7e640ecb06e
      SHA512: fa15e1b7ab0cab56c9a580e1b1e2fee250ee0b9c59546079675a1931a36e37131bd37d64033c75e05d8e9d9fcc33ce7850254d3acaca2136cf3bd08b070244f0

## Release Comment

See also the release schedule and other information:

[ReleaseEngineering24](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering24)
