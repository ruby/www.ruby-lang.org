---
layout: news_post
title: "Ruby version policy changes starting with Ruby 2.1.0"
author: "zzak"
translator:
date: 2013-12-21 2:00:00 +0000
lang: vi
---

We've decided to change the Ruby versioning policy to a more
[Semantic Versioning](http://semver.org/) type starting with
the release of Ruby 2.1.0.

In order to provide a more well defined and properly utilized versioning scheme
for Ruby, we've decided to gradually switch to the following policy.

## Policy Changes

This policy is based off a proposal by ruby-lang.org system administrator
Hiroshi Shibata ([@hsbt](https://twitter.com/hsbt)).

### Version Schema

* `MAJOR`: increased when incompatible change which can't be released in MINOR
  * Reserved for special events
* `MINOR`: increased every christmas, may be API incompatible
* `TEENY`: security or bug fix which maintains API compatibility
  * May be increased more than 10 (such as `2.1.11`), and will be released every 2-3 months.
* `PATCH`: number of commits since last `MINOR` release (will be reset at 0 when releasing `MINOR`)

### Branching Schema

We will continue to maintain the following branches:

* trunk
* `ruby_{MAJOR}_{MINOR}_{TEENY}`

### API Compatibility

The following traits can be marked as an incompatible change, requiring an
increase in the `MINOR` version:

* Removal of C-level api features
* Backwards incompatible changes or additions

### ABI Compatibility

ABI will comply with the following scheme: `{MAJOR}.{MINOR}.0`

We will give our best effort to keep ABI compatibility within the same `MINOR`
level releases, so `TEENY` will be fixed at 0.

## References

To read up more on this proposal please see the following links:

* [Introducing a semantic versioning scheme and branching policy](https://bugs.ruby-lang.org/issues/8835)
* [Accepted proposal in English](https://gist.github.com/sorah/7803201)
* [Accepted proposal in Japanese](https://gist.github.com/hsbt/7719305)

## Thank you!

I'd like to personally thank everyone who contributed to this discussion.
Each step we take is closer to a more stable and effective Ruby.
