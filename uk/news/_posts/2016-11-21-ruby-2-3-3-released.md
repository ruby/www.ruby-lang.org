---
layout: news_post
title: "Вийшов Ruby 2.3.3"
author: "nagachika"
translator: "Andrii Furmanets"
date: 2016-11-21 10:30:00 +0000
lang: uk
---

Ruby 2.3.3 випущено.

Цей випуск містить виправлення помилки, що стосується Refinements та Module#prepend.
Комбіноване використання Module#refine та Module#prepend для того самого класу
могло спричинити неочікуваний `NoMethodError`.
Це регресія на Ruby 2.3.2, випущеному минулого тижня.
Див. [Помилка #12920](https://bugs.ruby-lang.org/issues/12920) для деталей.

Також є деякі інші виправлення помилок.
Див. [ChangeLog](https://svn.ruby-lang.org/repos/ruby/tags/v2_3_3/ChangeLog)
для деталей.

## Завантаження

* [https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.3.tar.bz2](https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.3.tar.bz2)

      РОЗМІР:   14433673 байтів
      SHA1:   a8db9ce7f9110320f33b8325200e3ecfbd2b534b
      SHA256: 882e6146ed26c6e78c02342835f5d46b86de95f0dc4e16543294bc656594cc5b
      SHA512: 88f7782effd35bfe0b4c33140b5eb147d09b63fbb35b9c42d2200c010f387e2b70984ead1eca86569e8ec31f08b35289d440c0ca76b662dadb760f848e863d91

* [https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.3.tar.gz](https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.3.tar.gz)

      РОЗМІР:   17813577 байтів
      SHA1:   1014ee699071aa2ddd501907d18cbe15399c997d
      SHA256: 241408c8c555b258846368830a06146e4849a1d58dcaf6b14a3b6a73058115b7
      SHA512: 80d9f3aaf1d60b9b2f4a6fb8866713ce1e201a3778ef9e16f1bedb7ccda35aefdd7babffbed1560263bd95ddcfe948f0c9967b5077a89db8b2e18cacc7323975

* [https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.3.tar.xz](https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.3.tar.xz)

      РОЗМІР:   11444164 байтів
      SHA1:   f2318460606d410e80dd5c82862a93e5736534de
      SHA256: 1a4fa8c2885734ba37b97ffdb4a19b8fba0e8982606db02d936e65bac07419dc
      SHA512: 73dd6ed896ff52d953b153b2cab359c87953ea77521878f1ee16c1e217cc46bcb253100debe61ba631e6ffa0bc773e592d603a374508ed5189a311136ccd8d20

* [https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.3.zip](https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.3.zip)

      РОЗМІР:   19862248 байтів
      SHA1:   f0723ce176a829c9c33c31cdab6eca6ce0aef73e
      SHA256: cbffda17fdb1bbd86dd36de093524b0a9b5c92e007fd60acac1c9804b429886e
      SHA512: 5f75b77962c9d01fe591d87e20900d71a54c737e0d1198fae437729f21a9af84278a91ee73e850b5f49361b3cbf48af7a0a3ed9920cce932b58fd8e2420d5b26

## Коментар до випуску

Багато комітерів, розробників та користувачів, які надали звіти про помилки, допомогли нам зробити цей випуск.
Дякую за їхній внесок.
