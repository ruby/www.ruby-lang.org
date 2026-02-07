---
layout: news_post
title: "Ruby 2.0.0-p0 is released"
author: "Yusuke Endoh"
date: 2013-02-24 09:06:22 +0000
lang: vi
---

We are pleased to announce the release of Ruby 2.0.0-p0.

Ruby 2.0.0 is the first stable release of the Ruby 2.0 series, with many
new features and improvements in response to the increasingly diverse
and expanding demands for Ruby.

Enjoy programming with Ruby 2.0.0!

## Download

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.tar.bz2&gt;][1]

      SIZE:   10814890 bytes
      MD5:    895c1c581f8d28e8b3bb02472b2ccf6a
      SHA256: c680d392ccc4901c32067576f5b474ee186def2fcd3fcbfa485739168093295f

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.tar.gz&gt;][2]

      SIZE:   13608925 bytes
      MD5:    50d307c4dc9297ae59952527be4e755d
      SHA256: aff85ba5ceb70303cb7fb616f5db8b95ec47a8820116198d1c866cc4fff151ed

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.zip&gt;][3]

      SIZE:   15037340 bytes
      MD5:    db5af5d6034646ad194cbdf6e50f49ee
      SHA256: 0d0af6a9c8788537efd8d7d2358ce9468e6e2b7703dacba9ebd064d8b7da5f99

## What is Ruby 2.0.0

### New Features

Some of the highlights:

* Language core features
  * Keyword arguments, which give flexibility to API design
  * Module#prepend, which is a new way to extend a class
  * A literal %i, which creates an array of symbols easily
  * \_\_dir\_\_, which returns the dirname of the file currently being
    executed
  * The UTF-8 default encoding, which make many magic comments omissible

* Built-in libraries
  * Enumerable#lazy and Enumerator::Lazy, for (possibly infinite) lazy
    stream
  * Enumerator#size and Range#size, for lazy size evaluation
  * \#to\_h, which is a new convention for conversion to Hash
  * Onigmo, which is a new regexp engine (a fork of Oniguruma)
  * Asynchronous exception handling API

* Debug support
  * DTrace support, which enables run-time diagnosis in production
  * TracePoint, which is an improved tracing API

* Performance improvements
  * GC optimization by bitmap marking
  * Kernel#require optimization which makes Rails startup very fast
  * VM optimization such as method dispatch
  * Float operation optimization

In addition, albeit as an experimental feature, 2.0.0 includes
Refinements, which adds a new concept to Ruby\'s modularity.

See also NEWS for more features, improvements and details.

### Compatibility

We have also taken care with the 2.0.0 design to make it compatible with
1.9. It will be easier to migrate from 1.9 to 2.0 than it was from 1.8
to 1.9. (The notable incompatibilities are described later.)

In fact, thanks to the dedicated work of third parties, some popular
applications such as Rails and tDiary have been reported to work on the
release candidate version of 2.0.0.

### Documentation

We have also made documentation improvements which many rubyists have
requested. We have added a huge amount of rdoc for modules and methods.
2.0.0 will be around 75% documented while 1.9.3 was about 60%. Also, we
have added a description of Ruby\'s syntax. You can see:

{% highlight sh %}
ri ruby:syntax
{% endhighlight %}

### Stability

Note that unlike 1.9.0, 2.0.0 IS a stable release, even though its TEENY
is 0. All library authors are strongly recommended to support 2.0.0. As
mentioned above, it will be comparatively easy to migrate from 1.9 to
2.0.

Ruby 2.0.0 is ready for practical use, and will absolutely improve your
Ruby life.

## Notes

### Introductory articles

Here are some introductory articles of 2.0.0 features by third parties:

* [&lt;URL:http://blog.marc-andre.ca/2013/02/23/ruby-2-by-example&gt;][4]
  (comprehensive, recommended)
* [&lt;URL:https://speakerdeck.com/shyouhei/whats-new-in-ruby-2-dot-0&gt;][5]
  (comprehensive, recommended)
* [&lt;URL:http://el.jibun.atmarkit.co.jp/rails/2012/11/ruby-20-8256.html&gt;][6]
  (brief, in Japanese)
* [&lt;URL:https://speakerdeck.com/nagachika/rubyist-enumeratorlazy&gt;][7]
  (only Enumerator::Lazy, in Japanese)

The following articles are also helpful, but outdated with regards to
refinement:

* [&lt;URL:http://rubysource.com/a-look-at-ruby-2-0/&gt;][8]
* [&lt;URL:https://speakerdeck.com/a\_matsuda/ruby-2-dot-0-on-rails&gt;][9]
* [&lt;URL:http://globaldev.co.uk/2012/11/ruby-2-0-0-preview-features/&gt;][10]
* [&lt;URL:http://www.infoq.com/news/2012/11/ruby-20-preview1&gt;][11]

Also, the recent issue of \"Rubyist Magazine\" includes some articles
that were written by the feature authors themselves for introducing some
new 2.0.0 features.

* [&lt;URL:http://jp.rubyist.net/magazine/?0041-200Special&gt;][12]

Though they will be written in Japanese, English translations are
planned for the future.

### Incompatibility

There are five notable incompatibilities we know of:

* The default encoding for ruby scripts is now UTF-8 \[#6679\]. Some
  people report that it affects existing programs, such as some
  benchmark programs becoming very slow \[ruby-dev:46547\].
* Iconv was removed, which had already been deprecated when M17N was
  introduced in ruby 1.9. Use String#encode, etc. instead.
* There is ABI breakage \[ruby-core:48984\]. We think that normal users
  can/should just reinstall extension libraries. You should be aware: DO
  NOT COPY .so OR .bundle FILES FROM 1.9.
* \#lines, #chars, #codepoints, #bytes now returns an Array instead of an
  Enumerator \[#6670\]. This change allows you to avoid the common idiom
  \"lines.to\_a\". Use #each\_line, etc. to get an Enumerator.
* Object#inspect does always return a string like
  #&lt;ClassName:0x...&gt; instead of delegating to #to\_s. \[#2152\]

There are some comparatively small incompatibilities.
\[ruby-core:49119\]

### Status of Refinements

We have added a feature called Refinements, which adds a new concept to
Ruby\'s modularity. However, please be aware that Refinements is still
an experimental feature: we may change its specification in the future.
Despite that, we would like you to play with it and give us your
thoughts. Your feedback will help to forge this interesting feature.

## Acknowledgment

A great many people contributed to 2.0.0. Even an incomplete
acknowledgment for only a few parts of contributions became too big to
insert here. Sorry but let me just add a link to the special thanks
page.

* [&lt;URL:https://bugs.ruby-lang.org/projects/ruby/wiki/200SpecialThanks&gt;][13]

Thank you all!



[1]: https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.tar.bz2
[2]: https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.tar.gz
[3]: https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.zip
[4]: http://blog.marc-andre.ca/2013/02/23/ruby-2-by-example
[5]: https://speakerdeck.com/shyouhei/whats-new-in-ruby-2-dot-0
[6]: http://el.jibun.atmarkit.co.jp/rails/2012/11/ruby-20-8256.html
[7]: https://speakerdeck.com/nagachika/rubyist-enumeratorlazy
[8]: http://rubysource.com/a-look-at-ruby-2-0/
[9]: https://speakerdeck.com/a_matsuda/ruby-2-dot-0-on-rails
[10]: http://globaldev.co.uk/2012/11/ruby-2-0-0-preview-features/
[11]: http://www.infoq.com/news/2012/11/ruby-20-preview1
[12]: http://jp.rubyist.net/magazine/?0041-200Special
[13]: https://bugs.ruby-lang.org/projects/ruby/wiki/200SpecialThanks
