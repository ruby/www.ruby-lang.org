---
layout: news_post
title: "Ruby 2.5.7 Yayınlandı"
author: "usa"
translator: "İsmail Arılık"
date: 2019-10-01 11:00:00 +0000
lang: tr
---

Ruby 2.5.7 yayınlandı.

Bu sürüm güvenlik düzeltmeleri içermektedir.
Ayrıntılar için lütfen aşağıdaki konulara bakın.

* [CVE-2019-16255: Shell#[] ve Shell#test'in bir kod enjeksiyonu güvenlik açığı]({% link tr/news/_posts/2019-10-01-code-injection-shell-test-cve-2019-16255.md %})
* [CVE-2019-16254: WEBrick'te HTTP yanıtı ayırma (Ek düzeltme)]({% link tr/news/_posts/2019-10-01-http-response-splitting-in-webrick-cve-2019-16254.md %})
* [CVE-2019-15845: File.fnmatch ve File.fnmatch?'in bir NUL enjeksiyonu güvenlik açığı]({% link tr/news/_posts/2019-10-01-nul-injection-file-fnmatch-cve-2019-15845.md %})
* [CVE-2019-16201: WEBrick'in Özet erişim kimlik doğrulamasında Düzenli İfade Hizmet Reddi güvenlik açığı]({% link tr/news/_posts/2019-10-01-webrick-regexp-digestauth-dos-cve-2019-16201.md %})

Ayrıntılar için [işleme logu](https://github.com/ruby/ruby/compare/v2_5_6...v2_5_7)na bakın.

## İndirin

{% assign release = site.data.releases | where: "version", "2.5.7" | first %}

* <{{ release.url.bz2 }}>

      SIZE: {{ release.size.bz2 }}
      SHA1: {{ release.sha1.bz2 }}
      SHA256: {{ release.sha256.bz2 }}
      SHA512: {{ release.sha512.bz2 }}

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

## Yayın Yorumu

Bu yayında emeği geçen herkese teşekkür ederiz.

Ruby 2.5'in sürdürülmesi, bu sürüm de dahil, Ruby Derneği'nin “Ruby kararlı sürümü için Anlaşma”ya dayalıdır.
