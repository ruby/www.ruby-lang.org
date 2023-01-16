---
layout: news_post
title: "Вышел Ruby 2.0.0-rc2"
author: "Yusuke Endoh"
translate: "gazay"
date: 2013-02-08 14:34:17 +0000
lang: ru
---

Вышел Ruby 2.0.0-rc2. Это будет последний релиз-кандидат
Ruby 2.0.0.

Пожалуйста, попробуйте его и сообщите о любой ошибке, какую заметите.

## Скачать

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-rc2.tar.bz2&gt;][1]

      SIZE:   10822239 bytes
      MD5:    e92420131bd7994513e0bf09a3e2a19b
      SHA256: d55f897bb04283c5fa80223d96d990fe8ecb598508dd59443b356cbba1f66145

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-rc2.tar.gz&gt;][2]

      SIZE:   13616756 bytes
      MD5:    9d5e6f26db7c8c3ddefc81fdb19bd41a
      SHA256: 87072ab3e6d393d47f7402682364e4f24efe1c518969795cc01fcdeeb0e646f3

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-rc2.zip&gt;][3]

      SIZE:   15118480 bytes
      MD5:    1a2d33f1c50e32ca1532f8dea4790d53
      SHA256: c28e9baf3aa00b41b8823c16df436ae143e8a63e43e7a53302f23119e13d0ebf

## Новые фичи в 2.0.0

* Keyword arguments
* Enumerable#lazy
* Module#prepend
* \#to\_h: конвенция для перевода в Hash
* %i: литер для символьного массива
* Обновленный движок регулярных выражений: Onigmo (форк Oniguruma)
* Enumerator#size и Range#size
* Поддержка DTrace
* TracePoint
* Оптимизирована производительность require (особенно, на Windows)
* Поддержка NativeClient
* Улучшена документация
* Расширенный асинхронный обработчик прерываний
* Refinements \[эксперимент\]

... И многие другие улучшения. Читайте НОВОСТИ, чтобы быть в курсе.

Ниже несколько вступительных статей от сторонних разработчиков:

* [&lt;URL:https://speakerdeck.com/a\_matsuda/ruby-2-dot-0-on-rails&gt;][4]
* [&lt;URL:http://globaldev.co.uk/2012/11/ruby-2-0-0-preview-features/&gt;][5]
* [&lt;URL:http://www.infoq.com/news/2012/11/ruby-20-preview1&gt;][6]
* [&lt;URL:http://timelessrepo.com/refinements-in-ruby&gt;][7]
  (Refinements)
* [&lt;URL:http://el.jibun.atmarkit.co.jp/rails/2012/11/ruby-20-8256.html&gt;][8]
  (на японском)
* [&lt;URL:https://speakerdeck.com/nagachika/rubyist-enumeratorlazy&gt;][9]
  (Enumerator::Lazy, на японском)

(Если вы хотите предоставить дополнительные статьи, мы можем добавить их
в следующей новости о релизе)

## Заметки

### Incompatibility

Существует три заметных несовместимости, о которых мы знаем:

* Кодировка по-умолчанию для скриптов ruby теперь UTF-8 \[#6679\].
  Некоторые люди присылают сообщения, что это затрагивает существующие
  программы. Например некоторые программы бенчмаркинга стали слишком
  медленными \[ruby-dev:46547\]. Спецификация может измениться к
  официальному релизу.
* Iconv был убран. Он был уже отмечен как устаревший, когда M17N был
  представлен в ruby 1.9. Используйте String#encode и другие методы
  вместо Iconv.
* Был сбой ABI \[ruby-core:48984\]. Мы думаем, что обычные пользователи
  могут/должны просто переустановить библиотеки расширений. Вы должны
  быть осторожны: НЕ КОПИРУЙТЕ .so ИЛИ .bundle ФАЙЛЫ ИЗ 1.9.

Также есть несколько сравнительно небольших несовместимостей:
\[ruby-core:49119\]
Пожалуйста, сообщайте о любых несовместимостях, которые вы замечаете.

FYI: Мы добавляем записи с обновлениями, но часть их уже устарела

* [&lt;URL:https://bugs.ruby-lang.org/projects/ruby/wiki/200UpgradeNotesDraft&gt;][14]

### Статус Refinements

2\.0.0 будет включать новую фичу refinements как \"эксперементальную
фичу\", потому что мы не можем прийти к согласию в ее спецификации.
Заметьте, что поведение может измениться в следующих версиях Ruby.

### Благодарности

Я очень ценю помощь всех, кто пробовал preview и rc1 релиз! Я очень
благодарен всем участникам за их тяжелую работу по исправлению кучи
багов. Я говорю спасибо всем тем людям, кто помог мне сделать этот
релиз.



[1]: https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-rc2.tar.bz2
[2]: https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-rc2.tar.gz
[3]: https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-rc2.zip
[4]: https://speakerdeck.com/a_matsuda/ruby-2-dot-0-on-rails
[5]: http://globaldev.co.uk/2012/11/ruby-2-0-0-preview-features/
[6]: http://www.infoq.com/news/2012/11/ruby-20-preview1
[7]: http://timelessrepo.com/refinements-in-ruby
[8]: http://el.jibun.atmarkit.co.jp/rails/2012/11/ruby-20-8256.html
[9]: https://speakerdeck.com/nagachika/rubyist-enumeratorlazy
[10]: https://bugs.ruby-lang.org/issues/6679
[11]: https://blade.ruby-lang.org/ruby-dev/46547
[12]: https://blade.ruby-lang.org/ruby-core/48984
[13]: https://blade.ruby-lang.org/ruby-core/49119
[14]: https://bugs.ruby-lang.org/projects/ruby/wiki/200UpgradeNotesDraft
