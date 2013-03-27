---
layout: news_post
title: "Ebb: Server Web  yang Lebih Cepat dari Mongrel dan Thin"
author: "Hendy Irawan"
lang: id
---

![](http://farm3.static.flickr.com/2131/2359133529_4ab701e173_o.jpg)

[Ebb][1] adalah sebuah web/HTTP server yang kecil, memiliki kecepatan
tinggi yang didesain khusus untuk aplikasi hosting yang dinamis seperti
halnya dalam framework pada [Rails][2] dan [Merb][3]. Desain yang serupa
digunakan oleh Ruby daemons menggunakan EventMachine. Ebb itu sendiri
ditulis dalam bahasa C dan disesuaikan dengan [Rack][4].

[Thin][5] merupakan sebuah server web yang merupakan HTTP daemon dari
Ruby yang memiliki kecepatan lebih baik dari pada Mongrel, dibuat pada
bulan Januari. Permasalahan tersebut [dibahas][6] pada Ruby Inside dan
selanjutnya muncul sistem yang lain seperti [SwitchPipe][7] pada bulan
Februari dan [Swiftiply][8] yang selanjutnya juga dilakukan inovasi.

Sumber:[Ruby Inside-Ebb: C-Powered Web Server That Uses Rack – Faster
than Mongrel **and** Thin][9]



[1]: http://ebb.rubyforge.org/
[2]: http://en.wikipedia.org/wiki/Ruby_on_rails
[3]: http://merbivore.com/
[4]: http://rack.rubyforge.org/
[5]: http://www.rubyinside.com/thin-a-ruby-http-daemon-thats-faster-than-mongrel-688.html
[6]: http://www.rubyinside.com/no-true-mod_ruby-is-damaging-rubys-viability-on-the-web-693.html
[7]: http://switchpipe.org/
[8]: http://swiftiply.swiftcore.org/
[9]: http://www.rubyinside.com/ebb-web-framework-http-server-786.html
