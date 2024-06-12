---
layout: news_post
title: "Ruby 3.3.3 發布"
author: "k0kubun"
translator: "Bear Su"
date: 2024-06-12 00:30:00 +0000
lang: zh_tw
---

Ruby 3.3.3 已經發布了。

本次發布版本包含：

* RubyGems 3.5.11
* Bundler 2.5.11
* REXML 3.2.8
* strscan 3.0.9
* `--dump=prism_parsetree` 已被 `--parser=prism --dump=parsetree` 取代
* 不合法的 encoding symbols 會拋出 `SyntaxError` 而不是 `EncodingError`
* 修復 Ripper parsing 的 Memory leak
* 修復 YJIT, `**{}`、`Ripper.tokenize`、`RubyVM::InstructionSequence#to_binary`、`--with-gmp`、和一些建置環境中的錯誤

詳細的變動請參閱 [GitHub 發布](https://github.com/ruby/ruby/releases/tag/v3_3_3)。

## 下載

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

## 發布紀錄

許多提交者、開發者和漏洞回報者幫助了此版本的發佈，在此感謝所有人的貢獻。
