---
layout: news_post
title: "HotRuby: JavaScript dan Flash Firtual Machine dalam Ruby"
author: "Hendy Irawan"
lang: id
---

![](http://farm4.static.flickr.com/3143/2365756846_de8c743a45_o.jpg)

[HotRuby][1] merupakan gabungan dari JavaScript dan Flash virtual
machine yang dapat dijalankan dengan menggunakan kode Ruby untuk di
compile ke opcode oleh YARV (Yet Another Ruby VM).

Anda dapat menulis script Ruby dalam sebuah halaman web diantara
`<script type="text/ruby"> .. </script>` tag,
kemudian HotRuby akan mengekstraknya, lakukan perintah kirim agar
bisa dicompile oleh remote script, kemudian return ke gabungan
JavaScript dan Flash virtual machine untuk melihat tampilan pada
halaman. Terdapat banyak penjelasan, termasuk [physics Flash
application][2] (seperti yang tampak pada screenshot diatas), sebuah
[permainan pinball][3] yang seru dan [benchmarking script][4] (yang
menunjukkan bahwa HotRuby menjadi lebih cepat daripada Ruby 1.9).

Tersedia juga [Live “do it yourself” coding environment][5] jika anda
ingin melakukan tes dengan menulis beberapa kode yang anda miliki.

Sumber: [Ruby Inside-HotRuby: A JavaScript &amp; Flash Virtual Machine
That Runs Ruby][6]



[1]: http://hotruby.accelart.jp/
[2]: http://hotruby.accelart.jp/test-web/Box2DFlashAS3.html
[3]: http://hotruby.accelart.jp/test-web/pinball.html
[4]: http://hotruby.accelart.jp/test-web/bm_loop_times.html
[5]: http://hotruby.accelart.jp/test-web/diy.html
[6]: http://www.rubyinside.com/hotruby-a-javascript-flash-virtual-machine-that-runs-ruby-821.html
