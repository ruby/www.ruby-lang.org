---
layout: news_post
title: "Вышел Ruby 4.0.0 preview2"
author: "naruse"
translator: "ablzh"
date: 2025-11-17 00:00:00 +0000
lang: ru
---

{% assign release = site.data.releases | where: "version", "4.0.0-preview2" | first %}
Мы рады сообщить о выпуске Ruby {{ release.version }}. Ruby 4.0 обновляет версию Unicode до 17.0.0, и так далее.

## Изменения в языке

* `*nil` больше не вызывает `nil.to_a`, аналогично тому, как `**nil` не вызывает `nil.to_hash`.  [[Feature #21047]]

## Обновления классов ядра

Примечание: Мы перечисляем только заметные обновления классов ядра.
* Binding

    * `Binding#local_variables`больше не включает нумерованные параметры.
      Также, `Binding#local_variable_get` и `Binding#local_variable_set` отказываются обрабатывать нумерованные параметры.
      [[Bug #21049]]

* IO

    * `IO.select` принимает +Float::INFINITY+ в качестве аргумента тайм-аута.
      [[Feature #20610]]

* String

    * Обновлен Unicode до версии 17.0.0 и Emoji до версии 17.0. [[Feature #19908]][[Feature #20724]][[Feature #21275]]
        (также относится к Regexp)


## Обновления стандартной библиотеки

Примечание: Мы перечисляем только заметные обновления стандартных библиотек.

* ostruct 0.6.1
* pstore 0.2.0
* benchmark 0.4.0
* logger 1.7.0
* rdoc 6.13.1
* win32ole 1.9.2
* irb 1.15.2
* reline 0.6.1
* readline 0.0.4
* fiddle 1.1.6

## Проблемы совместимости

Примечание: За исключением исправлений ошибок функциональности.


## Проблемы совместимости стандартных библиотек


## Обновления C API


## JIT

* YJIT
    * Статистика YJIT
        * `ratio_in_yjit` больше не работает в сборке по умолчанию.
          Используйте `--enable-yjit=stats` в `configure` чтобы включить её в `--yjit-stats`.
        * Добавлен `invalidate_everything` в статистику по умолчанию, который
          увеличивается, когда весь код инвалидируется через TracePoint.
    * Добавлены опции `mem_size:` и `call_threshold:` в `RubyVM::YJIT.enable`.
* ZJIT
    * Добавлен экспериментальный JIT-компилятор на основе методов.
      Используйте `--enable-zjit` в `configure` для включения поддержки `--zjit`.
    * На момент выхода Ruby 4.0.0-preview2, ZJIT ещё не готов к ускорению большинства бенчмарков.
      Пожалуйста, пока воздержитесь от оценки ZJIT. Следите за новостями о релизе Ruby 4.0.
* RJIT
    * `--rjit` удалён. Мы перенесем реализацию стороннего JIT API
     в репозиторий [ruby/rjit](https://github.com/ruby/rjit).

## Другие изменения



Смотрите [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
или [историю коммитов](https://github.com/ruby/ruby/compare/v3_4_0...{{ release.tag }})
для получения дополнительной информации.

В эти изменения вошли [{{ release.stats.files_changed }} fизмененных файлов, {{ release.stats.insertions }} добавлений(+), {{ release.stats.deletions }} удалений(-)](https://github.com/ruby/ruby/compare/v3_4_0...{{ release.tag }}#file_bucket)
с момента выхода Ruby 3.4.0!

## Скачать

* <{{ release.url.gz }}>

      SIZE: {{ release.size.gz }}
      SHA1: {{ release.sha1.gz }}
      SHA256: {{ release.sha256.gz }}
      SHA512: {{ release.sha512.gz }}

* <{{ release.url.xz }}>

      SIZE: {{ release.size.xz }}
      SHA1: {{ release.sha1.xz }}
      SHA256: {{ release.sha256.xz }}
      SHA512: {{ release.sha512.xz }}

* <{{ release.url.zip }}>

      SIZE: {{ release.size.zip }}
      SHA1: {{ release.sha1.zip }}
      SHA256: {{ release.sha256.zip }}
      SHA512: {{ release.sha512.zip }}

## Что такое Ruby

Ruby был впервые разработан Matz (Yukihiro Matsumoto) в 1993,
и сейчас разрабатывается как Open Source. Он работает на множестве платформ
и используется по всему миру, особенно для веб-разработки.

[Feature #21047]: https://bugs.ruby-lang.org/issues/21047
[Bug #21049]: https://bugs.ruby-lang.org/issues/21049
[Feature #20610]: https://bugs.ruby-lang.org/issues/20610
[Feature #19908]: https://bugs.ruby-lang.org/issues/19908
[Feature #20724]: https://bugs.ruby-lang.org/issues/20724
[Feature #21275]: https://bugs.ruby-lang.org/issues/21275
