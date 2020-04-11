---
layout: news_post
title: "Вышел Ruby 2.2.0-rc1"
author: "naruse"
translator: "arbox"
date: 2014-12-18 09:00:00 +0000
lang: ru
---

Мы рады объявить о выходе версии Ruby `2.2.0-rc1`!
Все изменения после выхода RC1 будут ограничиваться исправлениями ошибок.
Выход финальной версии Ruby `2.2.0` запланирован на 25 декабря 2014.

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
[блоге Rails](http://weblog.rubyonrails.org/2014/12/19/Rails-4-2-final/),
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
2.2.0-rc-1. И сообщайте о ваших успехах!

## Важные изменения в сравнении с версией 2.1

* [Инкрементальный алгоритм сборщика](https://bugs.ruby-lang.org/issues/10137)
  ([YARV Maniacs No.12](http://magazine.rubyist.net/?0048-YARVManiacs))
* [Сборщик для символов](https://bugs.ruby-lang.org/issues/9634)
  ([презентация на RubyKaigi 2014](http://www.slideshare.net/authorNari/symbol-gc))
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
  * обновлена Rake 10.4.0
  * обновлена RDoc 4.2.0.alpha (21b241a)
  * обновлена RubyGems 2.4.5
  * обновлена test-unit 3.0.8 (удалена из репозитория, но оставлена в архиве
    на скачивание)
  * обновлена minitest 5.4.3 (удалена из репозитория, но оставлена в архиве
    на скачивание)
  * подлежит удалению mathn
* C API
  * удалены устаревшие API

Дополнительные подробности читайте в файле
[NEWS в репозитории Ruby (WIP)](https://github.com/ruby/ruby/blob/v2_2_0_rc1/NEWS).

Включая эти файлы, было изменено 1548 файлов, 123659 вставок(+), 74306
удалений(-) по сравнению с v2.1.0!

## Скачать

* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-rc1.tar.bz2>
  * SIZE:   12475612 bytes
  * MD5:    7144732d30dd4547c0a59862b3345d54
  * SHA256: e6a1f8d45ea749bdc92eb1269b77ec475bc600b66039ff90d77db8f50820a896
  * SHA512: 181201168360bee37dceeef3481a69e8a333a5d329680031fd9d371d30ac64460bbdf4db07546133024f541774e51301f1630cfd988c5e5bf2464834f3abe6bf
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-rc1.tar.gz>
  * SIZE:   15531233 bytes
  * MD5:    51f218fabc3ceb7bf3fe5f4f87ddebd3
  * SHA256: a59c8db71b967015ad7c259ba8ef638c7943ec78580412bb86e97791a9322b6b
  * SHA512: 4a35e78c4c0747f9c79e506e98acc117efb0be72fc103d6f9c13d5eb5efa5c6d6748f491526fc7ebb24397f25238f06d552f841e9e898be30aa7cd6c2df38494
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-rc1.tar.xz>
  * SIZE:   9675108 bytes
  * MD5:    3f482b88eda45c1bc6bab1921763ce52
  * SHA256: dcfad9bb6e0b513b03f08f86b195da6a6a7045559b558d3493decac0e0abb86c
  * SHA512: 3ec8955d8a269a1e5f28c3e0e6023bd613f244c83914a4a8c96d2761b11914c21ce67cfadb2bcebc480d9c0b9c7b54da6dfa67cdf4b4350db2a85d379265ffed
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-rc1.zip>
  * SIZE:   17219660 bytes
  * MD5:    49f5aae44c00f4d57be47576c29a53bd
  * SHA256: 1bd3e83d44b4e5879b4ecdc496d19905bc03637a8c88027c2dc98a369f1ebb83
  * SHA512: bf0e39e5add532ca338095ad6eaaafbe4f84cc9df1e8d4bad986c44e17614623430c2670d9751865e8d645cb483007d5473be82536b985ccab40a7dde72c4161

## Комментарии к релизу

* [Известные ошибки в 2.2.0](https://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=115)

Другая информация и график релизов:

[ReleaseEngineering22](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering22)
