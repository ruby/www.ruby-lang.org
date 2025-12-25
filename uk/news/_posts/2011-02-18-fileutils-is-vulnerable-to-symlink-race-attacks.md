---
layout: news_post
title: "FileUtils вразливий до атак symlink race"
author: "Urabe Shyouhei"
translator: "Andrii Furmanets"
lang: uk
---

Виявлено вразливість умови гонки symlink у
FileUtils.remove\_entry\_secure. Вразливість дозволяє локальним користувачам
видаляти довільні файли та директорії.

### Зачеплені версії

* Ruby 1.8.6 рівень патчу 420 та всі попередні версії
* Ruby 1.8.7 рівень патчу 330 та всі попередні версії
* Версії розробки Ruby 1.8 (1.8.8dev)
* Ruby 1.9.1 рівень патчу 430 та всі попередні версії
* Ruby 1.9.2 рівень патчу 136 та всі попередні версії
* Версії розробки Ruby 1.9 (1.9.3dev)

### Рішення

Ми виправили цю ситуацію. Всі зачеплені користувачі заохочуються
оновити їхню установку ruby.

Але будь ласка, також зверніть увагу, що атаки symlink race неминучі, коли будь-яка
з верхніх директорій, звідки ви хочете видалити, належить комусь,
кому ви не можете довіряти. Тому якщо ви хочете бути безпечними, ви повинні переконатися, що
**ВСІ** батьківські директорії не можуть бути переміщені іншими ненадійними користувачами. Наприклад,
батьківські директорії не повинні належати ненадійним користувачам, і
не повинні бути доступними для запису всім, крім випадків, коли встановлено sticky bit.

### Оновлення

* Виправлено друкарську помилку. (vulnerabile -&gt; vulnerable)
* 1\.8.7-334 випущено для виправлення цієї проблеми. Користувачів 1.8.7 заохочується
  оновитися.
  * [https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p334.tar.gz][1]
  * [https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p334.tar.bz2][2]
  * [https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p334.zip][3]

* 1\.9.1-p431 випущено для виправлення цієї проблеми. Користувачів 1.9.1 заохочується
  оновитися.
  * [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p431.tar.gz][4]
  * [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p431.tar.bz2][5]
  * [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p431.zip][6]

* 1\.9.2-p180 випущено для виправлення цієї проблеми. Користувачів 1.9.2 заохочується
  оновитися.
  * [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p180.tar.gz][7]
  * [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p180.tar.bz2][8]
  * [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p180.zip][9]

* Виправлено зачеплені версії для серії 1.9.




[1]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p334.tar.gz
[2]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p334.tar.bz2
[3]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p334.zip
[4]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p431.tar.gz
[5]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p431.tar.bz2
[6]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p431.zip
[7]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p180.tar.gz
[8]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p180.tar.bz2
[9]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p180.zip

