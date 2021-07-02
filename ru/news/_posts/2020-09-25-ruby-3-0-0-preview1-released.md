---
layout: news_post
title: "Вышел Ruby 3.0.0 preview 1"
author: "naruse"
translator: "nakilon"
date: 2020-09-25 00:00:00 +0000
lang: ru
---

Мы рады объявить о выходе Ruby 3.0.0-preview1.

Новая версия несет множество новых фич и улучшений производительности.

## RBS

RBS -- это язык описания типов в программах на Ruby.
Тайп-чекеры, включая тайп-профайлеры и другие инструменты, поддерживающие RBS, смогут понимать программы на Ruby гораздо лучше при наличии определений RBS.

Вы можете составить определения классов и модулей: методы, определенные в классе, переменные экземпляра и их типы, а также отношения наследования и примесей.
RBS нацелен на поддержку часто встречающихся паттернов в программах на Ruby, а также позволяет описывать такие сложные типы, как объединения, перегрузка методов и дженерики. Он также поддерживает утиную типизацию с _интерфейсами_.

Ruby 3.0 поставляется вместе с гемом `rbs`, который позволяет парсить и обрабатывать определения типов на языке RBS.

Вот небольшой пример RBS.

``` rbs
module ChatApp
  VERSION: String

  class Channel
    attr_reader name: String
    attr_reader messages: Array[Message]
    attr_reader users: Array[User | Bot]              # `|` means union types, `User` or `Bot`.

    def initialize: (String) -> void

    def post: (String, from: User | Bot) -> Message   # Method overloading is supported.
            | (File, from: User | Bot) -> Message
  end
end
```

См. [README гема](https://github.com/ruby/rbs).

## Рактор (экспериментально)

Рактор -- это абстракция параллельных вычислений, реализующая модель акторов, призванная дать возможность параллельных вычислений без заботы о потоковой безопасности.

Вы можете создать несколько ракторов и запустить их параллельно. Рактор обеспечивает потоковую безопасность параллельных вычислений тем, что не может иметь общих объектов с другими ракторами в обычном понимании. Коммуникация между ракторами обеспечивается передачей сообщений.

Рактор синтаксически ограничивает возможность совместного использования объектов (в случае одного Рактора разницы не будет).

Спецификация и реализация еще не устаканились и могут быть изменены в будущем, поэтому фича обозначена как экспериментальная и выдает предупреждение, когда создается Рактор.

Следующая небольшая программа вычисляет `prime?` двумя ракторами параллельно и делает это примерно в 2 раза быстрее на многоядерных машин.

``` ruby
require 'prime'

# n.prime? with sent integers in r1, r2 run in parallel
r1, r2 = *(1..2).map do
  Ractor.new do
    n = Ractor.recv
    n.prime?
  end
end

# send parameters
r1.send 2**61 - 1
r2.send 2**61 + 15

# wait for the results of expr1, expr2
p r1.take #=> true
p r2.take #=> true
```

см. [doc/ractor.md](https://github.com/ruby/ruby/blob/master/doc/ractor.md).

## Планировщик (экспериментально)

`Thread#scheduler` перехватывает блокирующие операции. Это обеспечивает легковесный параллелизм без изменения существующего кода.

Поддерживаемые на данный момент классы/методы:

- `Mutex#lock`, `Mutex#unlock`, `Mutex#sleep`
- `ConditionVariable#wait`
- `Queue#pop`, `SizedQueue#push`
- `Thread#join`
- `Kernel#sleep`
- `IO#wait`, `IO#read`, `IO#write` и смежные (`#wait_readable`, `#gets`, `#puts` и пр.).
- `IO#select` *не поддерживается*.

На данный момент точкой входа является `Fiber.schedule{...}`, но это может измениться к моменту выхода Ruby 3.

В [`Async::Scheduler`](https://github.com/socketry/async/pull/56) можете видеть тестовый планировщик. См. [`doc/scheduler.md`](https://github.com/ruby/ruby/blob/master/doc/scheduler.md). [Feature #16786]

**ОСТОРОЖНО**: Эта фича строго экспериментальна. Как сама она, так и ее имя будут меняться в пререлизах.

## Другие значимые фичи

* Правостороннее присваивание.

  ``` ruby
  fib(10) => x
  p x #=> 55
  ```

* Объявление метода без `end`.

  ``` ruby
  def square(x) = x * x
  ```

* Поиск по образцу.

  ``` ruby
  case ["a", 1, "b", "c", 2, "d", "e", "f", 3]
  in [*pre, String => x, String => y, *post]
    p pre  #=> ["a", 1]
    p x    #=> "b"
    p y    #=> "c"
    p post #=> [2, "d", "e", "f", 3]
  end
  ```

* `Hash#except` теперь в stdlib.

  ``` ruby
  h = { a: 1, b: 2, c: 3 }
  p h.except(:a) #=> {:b=>2, :c=>3}
  ```

* Просмотр памяти (экспериментально)

    * Это новое C-API для прямого обмена участками памяти, такими как числовой массив или битмап, между библиотеками нативных расширений.  Библиотеки расширений также могут делиться метаданными об участках памяти, таких как форма, формат и пр.  С помощью этих метаданных библиотеки расширений могут делиться даже многомерными массивами.  Дизайн этой фичи был вдохновлен буферным протоколом Python.

## Улучшения производительности

* Много улучшений содержатся в MJIT. См. NEWS.

## Другие важные изменения после 2.7

* Именованные параметры отделены от остальных.
  * Код, который выдавал предупреждение на Ruby 2.7, больше работать не будет.  См. [новость](https://www.ruby-lang.org/ru/news/2019/12/12/separation-of-positional-and-keyword-arguments-in-ruby-3-0/).
  * Кстати, появилась возможность брать только ведущие аргументы.

    ``` ruby
    def method_missing(meth, ...)
      send(:"do_#{ meth }", ...)
    end
    ```

* Фича `$SAFE` полностью убрана из языка; теперь это просто глобальная переменная.

* Порядок отображения бектрейса был обращен в Ruby 2.5, но вернули как было.  Теперь он как в Ruby 2.4; сначала пишется сообщение об ошибке и номер строки, где она произошла, а уже далее стек вызовов.

* Обновлены некоторые стандартные библиотеки.
  * RubyGems 3.2.0.rc.1
  * Bundler 2.2.0.rc.1
  * IRB 1.2.6
  * Reline 0.1.5

* Следующие гемы более не поставляются с языком.
  Устанавливайте их явным образом.
  * net-telnet
  * xmlrpc

* Следующие гемы более не встроены в язык, а поставляются вместе с ним.
  * rexml
  * rss

* Стандартные библиотеки переведены в вид встроенных гемов. Следующие гемы опубликованы на rubygems.org
  * abbrev
  * base64
  * English
  * erb
  * find
  * io-nonblock
  * io-wait
  * net-ftp
  * net-http
  * net-imap
  * net-protocol
  * nkf
  * open-uri
  * optparse
  * resolv
  * resolv-replace
  * rinda
  * securerandom
  * set
  * shellwords
  * tempfile
  * time
  * tmpdir
  * tsort
  * weakref

См. [NEWS](https://github.com/ruby/ruby/blob/v3_0_0_preview1/NEWS.md)
или [коммиты](https://github.com/ruby/ruby/compare/v2_7_0...v3_0_0_preview1).

{% assign release = site.data.releases | where: "version", "3.0.0-preview1" | first %}

В ходе этого [{{ release.stats.files_changed }} файлов было изменено, {{ release.stats.insertions }} вставок(+), {{ release.stats.deletions }} удалений(-)](https://github.com/ruby/ruby/compare/v2_7_0...v3_0_0_preview1)
после Ruby 2.7.0!

Пожалуйста, попробуйте Ruby 3.0.0-preview1 и дайте обратную связь!

## Скачать

* <{{ release.url.bz2 }}>

      SIZE: {{ release.size.bz2 }}
      SHA1: {{ release.sha1.bz2 }}
      SHA256: {{ release.sha256.bz2 }}
      SHA512: {{ release.sha512.bz2 }}

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

## Немного рекламы 3.0.0-preview2

Мы планируем включить ["тайп-профайлер"](https://github.com/mame/ruby-type-profiler), который представляет собой фичу статического анализа типов.  Ожидайте!

## Что такое Ruby

Matz (Yukihiro Matsumoto) разработал первую версию Ruby в 1993,
и на сегодня язык разрабатывается как Open Source. Он работает
на множестве платформ и используется по всему миру, особенно в веб разработке.
