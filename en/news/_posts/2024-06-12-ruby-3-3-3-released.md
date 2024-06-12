---
layout: news_post
title: "Ruby 3.3.3 Released"
author: "k0kubun"
translator:
date: 2024-06-12 00:30:00 +0000
lang: en
---

Ruby 3.3.3 has been released.

This release includes:

* RubyGems 3.5.11
* Bundler 2.5.11
* REXML 3.2.8
* strscan 3.0.9
* `--dump=prism_parsetree` is replaced by `--parser=prism --dump=parsetree`
* Invalid encoding symbols raise `SyntaxError` instead of `EncodingError`
* Memory leak fix in Ripper parsing
* Bugfixes for YJIT, `**{}`, `Ripper.tokenize`, `RubyVM::InstructionSequence#to_binary`, `--with-gmp`, and some build environments

Please see the [GitHub releases](https://github.com/ruby/ruby/releases/tag/v3_3_3) for further details.

## Download

{% assign release = site.data.releases | where: "version", "3.3.3" | first %}

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

## Release Comment

Many committers, developers, and users who provided bug reports helped us make this release.
Thanks for their contributions.
