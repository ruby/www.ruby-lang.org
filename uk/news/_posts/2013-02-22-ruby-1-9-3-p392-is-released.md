---
layout: news_post
title: "Вийшов Ruby 1.9.3-p392"
author: "usa"
date: 2013-02-22 13:09:05 +0000
translator: "Andrii Furmanets"
lang: uk
---

Тепер Ruby 1.9.3-p392 випущено. Вибачте за занадто часті
оновлення.

Цей випуск включає виправлення безпеки щодо включених JSON та REXML.

* [Вразливість відмови в обслуговуванні та небезпечного створення об'єктів у JSON
  (CVE-2013-0269)][1]
* [Вразливість DoS розширення сутності в REXML (XML бомба,
  CVE-2013-1821)][2]

І деякі невеликі виправлення помилок також включені.

Див. [тікети][3] та [ChangeLog][4] для деталей.

## Завантаження

Ви можете завантажити цей випуск з:

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p392.tar.bz2&gt;][5]

      РОЗМІР:   10024221 байтів
      MD5:    a810d64e2255179d2f334eb61fb8519c
      SHA256: 5a7334dfdf62966879bf539b8a9f0b889df6f3b3824fb52a9303c3c3d3a58391

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p392.tar.gz&gt;][6]

      РОЗМІР:   12557294 байтів
      MD5:    f689a7b61379f83cbbed3c7077d83859
      SHA256: 8861ddadb2cd30fb30e42122741130d12f6543c3d62d05906cd41076db70975f

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p392.zip&gt;][7]

      РОЗМІР:   13863402 байтів
      MD5:    212fb3bc41257b41d1f8bfe0725916b7
      SHA256: f200ce4a63ce57bea64028a507350717c2a16bdbba6d9538bc69e9e7c2177c8b

## Коментар до випуску

Багато комітерів, тестувальників та користувачів, які надали звіти про помилки, допомогли мені
зробити цей випуск. Дякую за їхній внесок.




[1]: {{ site.url }}/uk/news/2013/02/22/json-dos-cve-2013-0269/
[2]: {{ site.url }}/uk/news/2013/02/22/rexml-dos-2013-02-22/
[3]: https://bugs.ruby-lang.org/projects/ruby-193/issues?set_filter=1&amp;status_id=5
[4]: https://git.ruby-lang.org/ruby.git/plain/ChangeLog?id=refs/tags/v1_9_3_392
[5]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p392.tar.bz2
[6]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p392.tar.gz
[7]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p392.zip
