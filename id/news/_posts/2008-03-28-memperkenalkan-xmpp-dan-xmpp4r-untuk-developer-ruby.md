---
layout: news_post
title: "Memperkenalkan XMPP dan XMPP4R Untuk Developer Ruby"
author: "Hendy Irawan"
lang: id
---

Sebagaimana yang [disebutkan oleh Wikipedia][1], XMPP merupakan sebuah
software opensource, XML merupakan sebuah protocol yang diharapkan dalam
waktu dekat dapat dikembangkan untuk instant messaging dan memperbaiki
informasi. Digunakan pada project Gizmo, Google Talk, Pidgin, Kopete,
dan masih banyak lagi aplikasi opensource Instan messaging yang lain.
Bisa juga digunakan pada aplikasi lain yang Anda inginkan, misalnya
untuk kembali memperbaiki pesan yang lama dan akan datang.

XMPP dapat digunakan dalam Ruby, yang pada dasarnya berasal dari [XMPP4R
library][2] (Jabber4R dan Net::XMPP keduanya semi-abandoned), dan Frank
Lamontagne (dari [Ruby Fleebie][3]) telah menuliskan sebuah
tutorial/guide yang terdiri dari 2 bagian untuk menggunakan XMPP4R
dengan sistem Instant Messaging. Pada [bagian pertama][4] merupakan
penjelasan dasar, dan [bagian kedua][5] merupakan praktek dasar pada
pembuatan sebuah client XMPP. Frank melanjutkan pembuatan tutorialnya
tersebut dalam [blog nya][3].

Anda mungkin juga akan tertarik dengan [Jabber::Simple][6], sebuah
Wrapper tentang XMPP4R oleh Blaine Cook yang membuat hal ini menjadi
lebih sederhana. Aplikasi ini telah di update selama satu tahun, tetapi
dengan mengurangi banyak operasi. seperti pembuatan sebuah object
client, pengiriman pesan, dan penerimaan pesan pada sebuah single method
call.

more resources: [Ruby Inside: Introduction to XMPP and XMPP4R for Ruby
Developers][7]



[1]: http://en.wikipedia.org/wiki/Extensible_Messaging_and_Presence_Protocol
[2]: http://home.gna.org/xmpp4r/
[3]: http://www.rubyfleebie.com/
[4]: http://www.rubyfleebie.com/im-integration-with-xmpp4r
[5]: http://www.rubyfleebie.com/im-integration-with-xmpp4r-part-2/
[6]: http://xmpp4r-simple.rubyforge.org/
[7]: http://www.rubyinside.com/introduction-to-xmpp-and-xmpp4r-for-ruby-developers-709.html
