---
layout: news_post
title: "Perubahan Pengaturan Default dari ext/openssl"
author: "usa"
translator: "kuntoaji"
date: 2014-10-27 12:00:00 +0000
tags: security
lang: id
---

Kami telah mengubah pengaturan default dari ext/openssl di Ruby 2.1.4, Ruby 2.0.0-p594, dan Ruby 1.9.3-p550.
Dengan perubahan ini, opsi SSL/TLS yang tidak aman saat ini dinonaktifkan secara default.
Namun, dengan adanya perubahan ini, terdapat sebuah kemungkinan adanya masalah dalam koneksi SSL.

## Detil

OpenSSL masih menerapkan protokol dan cipher yang dianggap tidak aman saat ini dari keadaan historisnya.
Seperti celah keamanan POODLE ([CVE-2014-3566](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-3566)), jika Anda tetap menggunakan OpenSSL dengan fitur yang tidak aman tersebut, Anda mungkin tidak dapat menjaga keamanan jaringan komunikasi.
Jadi, berdasarkan diskusi di [Bug #9424](https://bugs.ruby-lang.org/issues/9424), kami harus memutuskan untuk menonaktifkan opsi tidak aman SSL/TLS tersebut secara default.
Jika anda perlu membatalkan perubahan ini (tersedia dibawah), terapkan patch reverse untuk mencabutnya.

2.1.4
: [r48098](https://git.ruby-lang.org/ruby.git)

2.0.0-p594
: [r48110](https://git.ruby-lang.org/ruby.git)

1.9.3-p550
: [r48121](https://git.ruby-lang.org/ruby.git)

Meski begitu, jika Anda membatalkan perubahan ini, terdapat risiko dimana Anda tidak dapat menjamin keamanan jaringan komunikasi.
Anda harus memahami implikasi dari perubahan ini sebelum menghilangkannya.

### Kumpulan library - library dari Ruby

Perubahan ini terlihat di dalam net/http, net/imap, dan net/pop.
Semenjak DRb dan WEBrick mendapat pengaturan terpisah, perubahan ini tidak memiliki efek terhadap keduanya.

### Script yang menggunakan secara langsung ext/openssl

Perubahan ini dapat terlihat ketika sebuah instance dari object `OpenSSL::SSL::SSLContext` dibuat dan instance method yang bernama `set_params` dipanggil.

Khususnya, kode seperti berikut:

{% highlight ruby %}
ctx = OpenSSL::SSL::SSLContext.new
ctx.set_params  # Jika Anda ingin mengubah beberapa opsi seperti cert store, verify mode dan lain - lain, Anda dapat mengirimkan parameter tersebut dalam sebuah hash.
ssl = OpenSSL::SSL::SSLSocket.new(socket, ctx)
{% endhighlight %}

Ketika menggunakan ext/openssl sebagai sebuah client side, kami berasumsi bahwa mungkin tidak ada masalah dengan perubahan ini.
Namun, jika Anda menggunakan ext/openssl sebagai sebuah server side dan menyesuaikan dengan perubahan ini, beberapa old client(Internet Explorer 6 di Windows XP, browser - browser di ponsel tua, dan lain - lain.) mungkin tidak dapat melakukan koneksi ke server.

Keputusan ada di tangan Anda untuk mengaktifkan perubahan ini atau tidak, mohon perhatikan trade-off masing - masing pilihan.

## Solusi

Jika Anda tidak dapat melakukan update Ruby tetapi harus mengatasi opsi tidak aman SSL/TLS, terapkan monkey-patch berikut:

{% highlight ruby %}
module OpenSSL
  module SSL
    class SSLContext
      remove_const(:DEFAULT_PARAMS)
      DEFAULT_PARAMS = {
        :ssl_version => "SSLv23",
        :verify_mode => OpenSSL::SSL::VERIFY_PEER,
        :ciphers => %w{
          ECDHE-ECDSA-AES128-GCM-SHA256
          ECDHE-RSA-AES128-GCM-SHA256
          ECDHE-ECDSA-AES256-GCM-SHA384
          ECDHE-RSA-AES256-GCM-SHA384
          DHE-RSA-AES128-GCM-SHA256
          DHE-DSS-AES128-GCM-SHA256
          DHE-RSA-AES256-GCM-SHA384
          DHE-DSS-AES256-GCM-SHA384
          ECDHE-ECDSA-AES128-SHA256
          ECDHE-RSA-AES128-SHA256
          ECDHE-ECDSA-AES128-SHA
          ECDHE-RSA-AES128-SHA
          ECDHE-ECDSA-AES256-SHA384
          ECDHE-RSA-AES256-SHA384
          ECDHE-ECDSA-AES256-SHA
          ECDHE-RSA-AES256-SHA
          DHE-RSA-AES128-SHA256
          DHE-RSA-AES256-SHA256
          DHE-RSA-AES128-SHA
          DHE-RSA-AES256-SHA
          DHE-DSS-AES128-SHA256
          DHE-DSS-AES256-SHA256
          DHE-DSS-AES128-SHA
          DHE-DSS-AES256-SHA
          AES128-GCM-SHA256
          AES256-GCM-SHA384
          AES128-SHA256
          AES256-SHA256
          AES128-SHA
          AES256-SHA
          ECDHE-ECDSA-RC4-SHA
          ECDHE-RSA-RC4-SHA
          RC4-SHA
        }.join(":"),
        :options => -> {
          opts = OpenSSL::SSL::OP_ALL
          opts &= ~OpenSSL::SSL::OP_DONT_INSERT_EMPTY_FRAGMENTS if defined?(OpenSSL::SSL::OP_DONT_INSERT_EMPTY_FRAGMENTS)
          opts |= OpenSSL::SSL::OP_NO_COMPRESSION if defined?(OpenSSL::SSL::OP_NO_COMPRESSION)
          opts |= OpenSSL::SSL::OP_NO_SSLv2 if defined?(OpenSSL::SSL::OP_NO_SSLv2)
          opts |= OpenSSL::SSL::OP_NO_SSLv3 if defined?(OpenSSL::SSL::OP_NO_SSLv3)
          opts
        }.call
      }
    end
  end
end
{% endhighlight %}

## Versi - versi yang terpengaruh terhadap perubahan ini

* Ruby 1.9.3 patchlevel 550 dan selanjutnya
* Ruby 2.0.0 patchlevel 594 dan selanjutnya
* Ruby 2.1.4 dan selanjutnya
* revision 48097 dan trunk selanjutnya

## Histori

* Awal diterbitkan pada 2014-10-27 12:00:00 (UTC)
