---
layout: news_post
title: "Вийшов Ruby 3.3.0"
author: "naruse"
translator: "Andrii Furmanets"
date: 2023-12-25 00:00:00 +0000
lang: uk
---

{% assign release = site.data.releases | where: "version", "3.3.0" | first %}
Раді повідомити про вихід Ruby {{ release.version }}. Ruby 3.3 додає новий парсер під назвою Prism, використовує Lrama як генератор парсерів, додає новий чистий Ruby JIT компілятор під назвою RJIT та багато покращень продуктивності, особливо YJIT.

## Prism

* Впроваджено [парсер Prism](https://github.com/ruby/prism) як gem за замовчуванням
    * Prism — це портативний, стійкий до помилок та підтримуваний рекурсивний нисхідний парсер для мови Ruby
* Prism готовий до виробництва та активно підтримується, ви можете використовувати його замість Ripper
    * Є [детальна документація](https://ruby.github.io/prism/) про те, як використовувати Prism
    * Prism є одночасно бібліотекою C, яка буде використовуватися внутрішньо CRuby, та Ruby gem, який може використовуватися будь-яким інструментом, що потребує парсингу коду Ruby
    * Помітні методи в API Prism:
        * `Prism.parse(source)`, який повертає AST як частину об'єкта результату парсингу
        * `Prism.parse_comments(source)`, який повертає коментарі
        * `Prism.parse_success?(source)`, який повертає true, якщо немає помилок
* Ви можете створювати pull requests або issues безпосередньо в [репозиторії Prism](https://github.com/ruby/prism), якщо зацікавлені у внеску
* Тепер ви можете використовувати `ruby --parser=prism` або `RUBYOPT="--parser=prism"` для експериментів з компілятором Prism. Зверніть увагу, що цей прапорець призначений лише для налагодження.

## Використання Lrama замість Bison

* Заміна Bison на [генератор парсерів Lrama LALR](https://github.com/ruby/lrama) [[Feature #19637]](https://bugs.ruby-lang.org/issues/19637)
  * Якщо зацікавлені, будь ласка, перегляньте [Майбутнє бачення Ruby Parser](https://rubykaigi.org/2023/presentations/spikeolaf.html)
  * Внутрішній парсер Lrama замінено на LR парсер, згенерований Racc для підтримуваності
  * Підтримуються параметризуючі правила `(?, *, +)`, вони будуть використовуватися в Ruby parse.y

## YJIT

* Значні покращення продуктивності порівняно з Ruby 3.2
  * Підтримка splat та rest аргументів покращена.
  * Регістри виділяються для операцій стеку віртуальної машини.
  * Більше викликів з опціональними аргументами компілюється. Обробники винятків також компілюються.
  * Непідтримувані типи викликів та мегаморфні місця викликів більше не виходять до інтерпретатора.
  * Базові методи, такі як Rails `#blank?` та
    [спеціалізований `#present?`](https://github.com/rails/rails/pull/49909), інлайняться.
  * `Integer#*`, `Integer#!=`, `String#!=`, `String#getbyte`,
    `Kernel#block_given?`, `Kernel#is_a?`, `Kernel#instance_of?` та `Module#===`
    спеціально оптимізовані.
  * Швидкість компіляції тепер трохи швидша, ніж у Ruby 3.2.
  * Тепер більш ніж у 3 рази швидше за інтерпретатор на Optcarrot!
* Значно покращене використання пам'яті порівняно з Ruby 3.2
    * Метадані для скомпільованого коду використовують набагато менше пам'яті.
    * `--yjit-call-threshold` автоматично підвищується з 30 до 120
      коли застосунок має більше 40,000 ISEQs.
    * Додано `--yjit-cold-threshold` для пропуску компіляції холодних ISEQs.
    * Генерується більш компактний код на Arm64.
* Code GC тепер вимкнено за замовчуванням
  * `--yjit-exec-mem-size` розглядається як жорстка межа, де компіляція нового коду зупиняється.
  * Немає раптових падінь продуктивності через code GC.
    Краща поведінка copy-on-write на серверах, що перефорковуються з
    [Pitchfork](https://github.com/shopify/pitchfork).
  * Ви все ще можете увімкнути code GC, якщо потрібно, за допомогою `--yjit-code-gc`
* Додано `RubyVM::YJIT.enable`, який може увімкнути YJIT під час виконання
  * Ви можете запустити YJIT без зміни аргументів командного рядка або змінних середовища.
    Rails 7.2 [увімкне YJIT за замовчуванням](https://github.com/rails/rails/pull/49947)
    використовуючи цей метод.
  * Це також може використовуватися для увімкнення YJIT лише після того, як ваш застосунок
    завершить завантаження. `--yjit-disable` може використовуватися, якщо ви хочете використовувати інші
    опції YJIT, вимикаючи YJIT під час завантаження.
* Більше статистики YJIT доступно за замовчуванням
  * `yjit_alloc_size` та кілька інших статистик, пов'язаних з метаданими, тепер доступні за замовчуванням.
  * Статистика `ratio_in_yjit`, створена `--yjit-stats`, тепер доступна в release збірках,
    більше не потрібна спеціальна stats або dev збірка для доступу до більшості статистик.
* Додано більше можливостей профілювання
  * `--yjit-perf` додано для полегшення профілювання з Linux perf.
  * `--yjit-trace-exits` тепер підтримує вибірку з `--yjit-trace-exits-sample-rate=N`
* Більш ретельне тестування та кілька виправлень помилок

## RJIT

* Впроваджено чистий Ruby JIT компілятор RJIT та замінено MJIT.
  * RJIT підтримує лише архітектуру x86-64 на платформах Unix.
  * На відміну від MJIT, він не потребує компілятора C під час виконання.
* RJIT існує лише для експериментальних цілей.
  * Ви повинні продовжувати використовувати YJIT у виробництві.
* Якщо зацікавлені у розробці JIT для Ruby, будь ласка, перегляньте [презентацію k0kubun на День 3 RubyKaigi](https://rubykaigi.org/2023/presentations/k0kubun.html#day3).

## Планувальник потоків M:N

* Впроваджено планувальник потоків M:N. [[Feature #19842]](https://bugs.ruby-lang.org/issues/19842)
  * M потоків Ruby керуються N нативними потоками (потоками ОС), тому витрати на створення та керування потоками зменшуються.
  * Це може порушити сумісність C-розширень, тому планувальник потоків M:N вимкнено на основному Ractor за замовчуванням.
      * Змінна середовища `RUBY_MN_THREADS=1` увімкнює потоки M:N на основному Ractor.
      * Потоки M:N завжди увімкнені на неосновних Ractors.
  * Змінна середовища `RUBY_MAX_CPU=n` встановлює максимальну кількість `N` (максимальна кількість нативних потоків). Типове значення — 8.
      * Оскільки лише один потік Ruby на Ractor може виконуватися одночасно, буде використовуватися кількість нативних потоків, яка є меншою з числа, вказаного в `RUBY_MAX_CPU`, та кількості запущених Ractors. Тому застосунки з одним Ractor (більшість застосунків) використовуватимуть лише 1 нативний потік.
      * Для підтримки блокуючих операцій може використовуватися більше ніж `N` нативних потоків.

## Покращення продуктивності

* `defined?(@ivar)` оптимізовано з Object Shapes.
* Розв'язання імен, таке як `Socket.getaddrinfo`, тепер може бути перервано (у середовищах, де доступні pthreads). [[Feature #19965]](https://bugs.ruby-lang.org/issues/19965)
* Кілька покращень продуктивності збирача сміття
  * Молоді об'єкти, на які посилаються старі об'єкти, більше не одразу
      підвищуються до старого покоління. Це значно зменшує частоту
      великих зборів GC. [[Feature #19678]](https://bugs.ruby-lang.org/issues/19678)
  * Введено нову змінну налаштування `REMEMBERED_WB_UNPROTECTED_OBJECTS_LIMIT_RATIO`
      для контролю кількості незахищених об'єктів, що викликають великий збір
      GC. Типове значення встановлено на `0.01` (1%). Це значно
      зменшує частоту великих зборів GC. [[Feature #19571]](https://bugs.ruby-lang.org/issues/19571)
  * Write Barriers реалізовано для багатьох основних типів, яким їх не вистачало,
      зокрема `Time`, `Enumerator`, `MatchData`, `Method`, `File::Stat`, `BigDecimal`
      та кілька інших. Це значно зменшує час малих зборів GC та частоту
      великих зборів GC.
  * Більшість основних класів тепер використовують Variable Width Allocation, зокрема `Hash`, `Time`,
      `Thread::Backtrace`, `Thread::Backtrace::Location`, `File::Stat`, `Method`.
      Це робить ці класи швидшими для виділення та звільнення, використовують менше пам'яті та зменшують
      фрагментацію купи.
  * Додано підтримку слабких посилань до збирача сміття. [[Feature #19783]](https://bugs.ruby-lang.org/issues/19783)


## Інші помітні зміни з версії 3.2

### IRB

IRB отримав кілька покращень, включаючи, але не обмежуючись:

* Розширена інтеграція `irb:rdbg`, яка забезпечує еквівалентний досвід налагодження до `pry-byebug` ([doc](https://github.com/ruby/irb#debugging-with-irb)).
* Підтримка пейджера для команд `ls`, `show_source` та `show_cmds`.
* Більш точна та корисна інформація, надана командами `ls` та `show_source`.
* Експериментальне автодоповнення з використанням аналізу типів ([doc](https://github.com/ruby/irb#type-based-completion)).
* Тепер можна змінити колір шрифту та стиль шрифту в діалозі доповнення за допомогою нового класу Reline::Face ([doc](https://github.com/ruby/ruby/blob/master/doc/reline/face.md))

Крім того, IRB також пройшов значний рефакторинг та отримав десятки виправлень помилок для полегшення майбутніх покращень.

Для більш детальних оновлень, будь ласка, зверніться до [Розкриття великого стрибка в IRB Ruby 3.3](https://railsatscale.com/2023-12-19-irb-for-ruby-3-3/).

## Проблеми сумісності

Примітка: Виключаючи виправлення помилок функцій.

* Виклики `it` без аргументів у блоці без звичайних параметрів
  застарілі. `it` буде посиланням на перший параметр блоку в Ruby 3.4.
  [[Feature #18980]](https://bugs.ruby-lang.org/issues/18980)

* `Regexp::new` тепер приймає лише до 2 аргументів замість 3. Це було
   застарілим у Ruby 3.2. [[Bug #18797]](https://bugs.ruby-lang.org/issues/18797)

### Видалені змінні середовища

Наступні застарілі методи видалено.

* Змінна середовища `RUBY_GC_HEAP_INIT_SLOTS` застаріла та не працює. Будь ласка, використовуйте змінні середовища `RUBY_GC_HEAP_{0,1,2,3,4}_INIT_SLOTS` замість цього. [[Feature #19785]](https://bugs.ruby-lang.org/issues/19785)

## Проблеми сумісності стандартної бібліотеки

### `ext/readline` виведено з експлуатації

* У нас є `reline`, яка є чистою реалізацією Ruby, сумісною з API `ext/readline`. Ми покладаємося на `reline` у майбутньому. Якщо вам потрібно використовувати `ext/readline`, ви можете встановити `ext/readline` через rubygems.org за допомогою `gem install readline-ext`.
* Нам більше не потрібно встановлювати бібліотеки, такі як `libreadline` або `libedit`.

## Оновлення стандартної бібліотеки

RubyGems та Bundler попереджають, якщо користувачі роблять `require` наступних gems без додавання їх до Gemfile або gemspec. Це тому, що вони стануть bundled gems у майбутній версії Ruby.

Це попередження пригнічується, якщо ви використовуєте gem bootsnap. Ми рекомендуємо запускати ваш застосунок зі змінною середовища `DISABLE_BOOTSNAP=1` принаймні один раз. Це обмеження цієї версії.

Цільові бібліотеки:
  * abbrev
  * base64
  * bigdecimal
  * csv
  * drb
  * getoptlong
  * mutex_m
  * nkf
  * observer
  * racc
  * resolv-replace
  * rinda
  * syslog

Додано наступний default gem.

* prism 0.19.0

Оновлено наступні default gems.

* RubyGems 3.5.3
* abbrev 0.1.2
* base64 0.2.0
* benchmark 0.3.0
* bigdecimal 3.1.5
* bundler 2.5.3
* cgi 0.4.1
* csv 3.2.8
* date 3.3.4
* delegate 0.3.1
* drb 2.2.0
* english 0.8.0
* erb 4.0.3
* error_highlight 0.6.0
* etc 1.4.3
* fcntl 1.1.0
* fiddle 1.1.2
* fileutils 1.7.2
* find 0.2.0
* getoptlong 0.2.1
* io-console 0.7.1
* io-nonblock 0.3.0
* io-wait 0.3.1
* ipaddr 1.2.6
* irb 1.11.0
* json 2.7.1
* logger 1.6.0
* mutex_m 0.2.0
* net-http 0.4.0
* net-protocol 0.2.2
* nkf 0.1.3
* observer 0.1.2
* open-uri 0.4.1
* open3 0.2.1
* openssl 3.2.0
* optparse 0.4.0
* ostruct 0.6.0
* pathname 0.3.0
* pp 0.5.0
* prettyprint 0.2.0
* pstore 0.1.3
* psych 5.1.2
* rdoc 6.6.2
* readline 0.0.4
* reline 0.4.1
* resolv 0.3.0
* rinda 0.2.0
* securerandom 0.3.1
* set 1.1.0
* shellwords 0.2.0
* singleton 0.2.0
* stringio 3.1.0
* strscan 3.0.7
* syntax_suggest 2.0.0
* syslog 0.1.2
* tempfile 0.2.1
* time 0.3.0
* timeout 0.4.1
* tmpdir 0.2.0
* tsort 0.2.0
* un 0.3.0
* uri 0.13.0
* weakref 0.1.3
* win32ole 1.8.10
* yaml 0.3.0
* zlib 3.1.0

Наступний bundled gem підвищено зі статусу default gems.

* racc 1.7.3

Оновлено наступні bundled gems.

* minitest 5.20.0
* rake 13.1.0
* test-unit 3.6.1
* rexml 3.2.6
* rss 0.3.0
* net-ftp 0.3.3
* net-imap 0.4.9
* net-smtp 0.4.0
* rbs 3.4.0
* typeprof 0.21.9
* debug 1.9.1

Див. GitHub releases, такі як [Logger](https://github.com/ruby/logger/releases), або
changelog для деталей default gems або bundled gems.

Див. [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
або [журнали комітів](https://github.com/ruby/ruby/compare/v3_2_0...{{ release.tag }})
для подробиць.

Унаслідок цих змін [{{ release.stats.files_changed }} файлів змінено, {{ release.stats.insertions }} вставок(+), {{ release.stats.deletions }} видалень(-)](https://github.com/ruby/ruby/compare/v3_2_0...{{ release.tag }}#file_bucket)
з часу Ruby 3.2.0!

З Різдвом, зі святами, і приємного програмування з Ruby 3.3!

## Завантаження

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

## Що таке Ruby

Ruby уперше розробив Matz (Yukihiro Matsumoto) у 1993 році,
і зараз вона розвивається як Open Source. Вона працює на багатьох платформах
і використовується по всьому світу, особливо для веброзробки.