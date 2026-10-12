---
layout: news_post
title: "Ruby 4.1.0-preview1 Released"
author: "naruse"
translator:
date: 2026-10-12 00:00:00 +0000
lang: en
---

{% assign release = site.data.releases | where: "version", "4.1.0-preview1" | first %}
We are pleased to announce the release of Ruby {{ release.version }}.
Ruby 4.0 introduces "Ruby Box" and "ZJIT", and adds many improvements.

## Ractor

## Language changes

* `super` in a module method that was called via `super` from a refinement
  method now works correctly.
  [[Feature #22309]]

* `Module#clone` and `Module#dup` no longer rewrite the lexical scope of
  copied methods. Constants and class variables resolve through the
  original class, consistent with inheritance and mixins.
  [[Feature #21981]]

* `alias` and `Module#alias_method` in a module emit a deprecation warning
  when the original method is not a method of the module or its ancestors
  and is only found through the fallback to `Object`. The fallback will be
  removed in Ruby 4.3, and such an alias will raise a `NameError`.
  [[Bug #22276]]

* `alias` and `Module#alias_method` emit a deprecation warning when the
  original method is defined in a prepended module. This behavior will
  be removed in Ruby 4.3, and alias lookup will start at the origin
  class (after prepended modules).
  [[Bug #22273]]

## Stdlib updates



### RubyGems and Bundler


## Supported platforms



## Compatibility issues

  ```

## Stdlib compatibility issues


## C API updates


## Implementation improvements



## JIT



See [NEWS](https://docs.ruby-lang.org/en/{{ release.tag }}/NEWS_md.html)
or [commit logs](https://github.com/ruby/ruby/compare/v4_0_0...{{ release.tag }})
for more details.

With those changes, [{{ release.stats.files_changed }} files changed, {{ release.stats.insertions }} insertions(+), {{ release.stats.deletions }} deletions(-)](https://github.com/ruby/ruby/compare/v4_0_0...{{ release.tag }}#file_bucket)
since Ruby 4.0.0!

## Download

* <{{ release.url.gz }}>

      SIZE: {{ release.size.gz }}
      SHA1: {{ release.sha1.gz }}
      SHA256: {{ release.sha256.gz }}
      SHA512: {{ release.sha512.gz }}

* <{{ release.url.xz }}>

      SIZE: {{ release.size.xz }}
      SHA1: {{ release.sha1.xz }}
      SHA256: {{ release.sha256.xz }}
      SHA512: {{ release.sha512.xz }}

* <{{ release.url.zip }}>

      SIZE: {{ release.size.zip }}
      SHA1: {{ release.sha1.zip }}
      SHA256: {{ release.sha256.zip }}
      SHA512: {{ release.sha512.zip }}

## What is Ruby

Ruby was first developed by Matz (Yukihiro Matsumoto) in 1993,
and is now developed as Open Source. It runs on multiple platforms
and is used all over the world especially for web development.
