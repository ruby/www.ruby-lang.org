---
layout: news_post
title: "Вышел Ruby 2.2.0"
author: "naruse"
translator: "arbox"
date: 2014-12-25 09:00:00 +0000
lang: ru
---

Мы рады объявить о выходе версии 2.2.0.

Релиз Ruby 2.2 включает в себя множество новых возможностей и улучшений,
отвечающих все возрастающему количеству разноплановых требований к языку Ruby.

Так, например, сборщик мусора (GC) Ruby теперь может собирать неиспользуемые
объекты класса `Symbol`, что снизит расходы оперативной памяти. Так как
фреймворк Rails 5.0 будет зависеть от сборщика для символов, он будет
поддерживать только Ruby версии 2.2 и новее. Подробности читайте в
[посте о выходе Rails 4.2](http://weblog.rubyonrails.org/2014/12/19/Rails-4-2-final/).

Кроме этого, уменьшенные интервалы при работе сборщика мусора (благодаря новому
инкрементальному алгоритму) положительно скажутся на работе существующих
приложений на Rails. Последние изменения, упоминавшиеся в
[блоге Rails](http://weblog.rubyonrails.org/),
показывают, что Rails 5.0 выиграет от применения как инкрементального
алгоритма сборщика, так и сборщика символов.

Еще одним улучшением в плане управления памятью является дополнительный ключ
при сборке в `configure.in` для использования `jemalloc`, см.
[Feature #9113](https://bugs.ruby-lang.org/issues/9113).
Это улучшение носит статус экспериментального и по умолчанию отключено, пока мы
не соберем достаточно данных о производительности и возможностях применения.
Когда мы убедимся в его преимуществах, это улучшение будет включено по умолчанию.

Мы также добавили экспериментальную поддержку `vfork(2)` для `system()` и `spawn()`.
О подробностях реализации читайте на японском языке в блоге
[tanaka-san](http://www.a-k-r.org/d/2014-09.html#a2014_09_06).
В теории это может привести к огромному ускорению работы, если процесс вызывает
внешнюю команду много раз подряд. К сожалению, работа `vfork(2)` на данный
момент не проанализирована до конца и может иметь потенциальные негативные
последствия при системных вызовах. Мы поэкспериментируем с этим вопросом и
соберем данные о производительности на реальных задачах, чтобы решить, насколько
полезным окажется это нововведение.

Попробуйте новую версию и получайте удовольствие от программирования на Ruby
2.2.0. И сообщайте о ваших успехах!

## Важные изменения в сравнении с версией 2.1

* [Инкрементальный алгоритм сборщика](https://bugs.ruby-lang.org/issues/10137)
  ([YARV Maniacs No.12](http://magazine.rubyist.net/?0048-YARVManiacs))
* [Сборщик для символов](https://bugs.ruby-lang.org/issues/9634)
  ([презентация на RubyKaigi 2014: "Incremental GC for Ruby interpreter"](http://www.atdot.net/~ko1/activities/2014_rubyconf_pub.pdf))
* configure --with-jemalloc
  [Feature #9113](https://bugs.ruby-lang.org/issues/9113)
* Ядро:
  * поддержка Unicode 7.0 [#9092](https://bugs.ruby-lang.org/issues/9092)
  * новые методы:
    * Enumerable#slice_after [#9071](https://bugs.ruby-lang.org/issues/9071),
      Enumerable#slice_when [#9826](https://bugs.ruby-lang.org/issues/9826)
    * Float#next_float, Float#prev_float
      [#9834](https://bugs.ruby-lang.org/issues/9834)
    * File.birthtime, File#birthtime
      [#9647](https://bugs.ruby-lang.org/issues/9647)
    * String#unicode_normalize [#10084](https://bugs.ruby-lang.org/issues/10084)
* Стандартная библиотека:
  * обновлена Psych 2.0.8
  * обновлена Rake 10.4.2
  * обновлена RDoc 4.2.0
  * обновлена RubyGems 2.4.5
  * обновлена test-unit 3.0.8 (удалена из репозитория, но оставлена в архиве
    на скачивание)
  * обновлена minitest 5.4.3 (удалена из репозитория, но оставлена в архиве
    на скачивание)
  * подлежит удалению mathn
* C API
  * удалены устаревшие API

Дополнительные подробности читайте в файле
[NEWS в репозитории Ruby](https://github.com/ruby/ruby/blob/v2_2_0/NEWS).

Включая эти файлы, было изменено 1557 файлов, 125039 вставок(+), 74376
удалений(-) по сравнению с v2.1.0!

## Скачать

* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0.tar.bz2>
  * SIZE:   13304042 bytes
  * MD5:    d03cd4690fec1fff81d096d1c1255fde
  * SHA256: 1c031137999f832f86be366a71155113675b72420830ce432b777a0ff4942955
  * SHA512: 04edc53e8cd1732c3ca61ebeb1d6133614beb10f77f9abb80d8d36352fe8aa205112068e460bf600b2c7e81e0ddcc3b311e7e027c320366f1bd992b3e378a6ad
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0.tar.gz>
  * SIZE:   16494584 bytes
  * MD5:    cd03b28fd0b555970f5c4fd481700852
  * SHA256: 7671e394abfb5d262fbcd3b27a71bf78737c7e9347fa21c39e58b0bb9c4840fc
  * SHA512: 1ba0c68e1c8d2b60bbd1e218cf36463edbe34cf9418d7593702b631e68d02297465f752e71395f6cfa4104f4cd70a1eb44381ffb74bc7801758b830931fdcfc6
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0.tar.xz>
  * SIZE:   10304244 bytes
  * MD5:    54b43c6c6c9dd4c4b08ceb03ad0ded7a
  * SHA256: 848714e280fc5fb44dbac3b060b206e56c1947006324ee68a174d68b483ef8ca
  * SHA512: cd7e52faa464df8aca7ccfa23a5f06248e1ad82bc8c9f1829aa1b51ff37b15973b8caaa68e914d837325b8d59427fda4f3cad82c50925e1c84e688324a2a155d
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0.zip>
  * SIZE:   18441027 bytes
  * MD5:    f8e1d0cee4f2d9535a9529ed23ae3700
  * SHA256: e06c1e2b1248cf881749833084b2bec93f7612676009190ff9bc89b8fd07c29f
  * SHA512: 364dd927b496520d95a1b06c68e1a265015f4cab08bdf3efaa323d385e7bf075eae47f2e1db78a629db0f3c0c1ed24e086603ba21e2da02ac06dd3c8b716766e
