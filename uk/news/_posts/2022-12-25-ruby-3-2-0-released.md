---
layout: news_post
title: "Вийшов Ruby 3.2.0"
author: "naruse"
translator: "Andrii Furmanets"
date: 2022-12-25 00:00:00 +0000
lang: uk
---

{% assign release = site.data.releases | where: "version", "3.2.0" | first %}

Раді повідомити про вихід Ruby {{ release.version }}. Ruby 3.2 додає багато можливостей та покращень продуктивності.


## Підтримка WebAssembly на основі WASI

Це початковий порт підтримки WebAssembly на основі WASI. Це дозволяє бінарному файлу CRuby бути доступним у веб-браузері, середовищі Serverless Edge або інших вбудовувачах WebAssembly/WASI. Зараз цей порт проходить базові та bootstrap тестові набори, що не використовують Thread API.

![](https://i.imgur.com/opCgKy2.png)

### Передумови

[WebAssembly (Wasm)](https://webassembly.org/) спочатку було впроваджено для безпечного та швидкого запуску програм у веб-браузерах. Але його мета — ефективне виконання програм з безпекою у різних середовищах — довго бажана не лише для веб, але й загальними застосунками.

[WASI (The WebAssembly System Interface)](https://wasi.dev/) розроблено для таких випадків використання. Хоча такі застосунки потребують спілкування з операційними системами, WebAssembly працює на віртуальній машині, яка не мала системного інтерфейсу. WASI стандартизує це.

Підтримка WebAssembly/WASI в Ruby має на меті використати ці проекти. Це дозволяє розробникам Ruby писати застосунки, які працюють на таких обіцяних платформах.

### Випадок використання

Ця підтримка заохочує розробників використовувати CRuby в середовищі WebAssembly. Приклад використання — підтримка CRuby в [TryRuby playground](https://try.ruby-lang.org/playground/). Тепер ви можете спробувати оригінальний CRuby у вашому веб-браузері.

### Технічні моменти

Сьогоднішні WASI та WebAssembly самі по собі не мають деяких можливостей для реалізації Fiber, винятків та GC, оскільки вони все ще розвиваються, а також з міркувань безпеки. Тому CRuby заповнює прогалину, використовуючи Asyncify, який є технікою бінарного перетворення для контролю виконання в userland.

Крім того, ми побудували [VFS поверх WASI](https://github.com/kateinoigakukun/wasi-vfs/wiki/Getting-Started-with-CRuby), щоб ми могли легко упакувати застосунки Ruby в один .wasm файл. Це робить розповсюдження застосунків Ruby трохи простішим.

### Пов'язані посилання

* [Add WASI based WebAssembly support #5407](https://github.com/ruby/ruby/pull/5407)
* [An Update on WebAssembly/WASI Support in Ruby](https://itnext.io/final-report-webassembly-wasi-support-in-ruby-4aface7d90c9)


## YJIT готовий до виробництва

![](https://i.imgur.com/X9ulfac.png)

* YJIT більше не експериментальний
    * Протестовано на виробничих навантаженнях більше року та доведено, що він досить стабільний.
* YJIT тепер підтримує як x86-64, так і arm64/aarch64 процесори на Linux, MacOS, BSD та інших платформах UNIX.
    * Цей реліз приносить підтримку для Apple M1/M2, AWS Graviton, Raspberry Pi 4 та інших.
* Збірка YJIT тепер потребує Rust 1.58.0+. [[Feature #18481]]
    * Щоб забезпечити збірку CRuby з YJIT, будь ласка, встановіть `rustc` >= 1.58.0
      перед запуском скрипта `./configure`.
    * Будь ласка, зверніться до команди YJIT, якщо у вас виникнуть проблеми.
* Реліз YJIT 3.2 швидший за 3.1 і має приблизно в 1/3 менше накладних витрат пам'яті.
  * Загалом YJIT на 41% швидший (геометричне середнє) за інтерпретатор Ruby на [yjit-bench](https://github.com/Shopify/yjit-bench).
  * Фізична пам'ять для JIT коду виділяється ліниво. На відміну від Ruby 3.1,
    RSS процесу Ruby мінімізовано, оскільки віртуальні сторінки пам'яті,
    виділені `--yjit-exec-mem-size`, не будуть відображені на фізичні
    сторінки пам'яті, поки вони не будуть фактично використані JIT кодом.
  * Впроваджено Code GC, який звільняє всі сторінки коду, коли споживання пам'яті
    JIT кодом досягає `--yjit-exec-mem-size`.
  * `RubyVM::YJIT.runtime_stats` повертає метрики Code GC на додаток до
    існуючих ключів `inline_code_size` та `outlined_code_size`:
    `code_gc_count`, `live_page_count`, `freed_page_count` та `freed_code_size`.
* Більшість статистики, створеної `RubyVM::YJIT.runtime_stats`, тепер доступна в release збірках.
    * Просто запустіть ruby з `--yjit-stats`, щоб обчислити та вивести статистику (спричиняє деякі накладні витрати під час виконання).
* YJIT тепер оптимізовано для використання переваг форм об'єктів. [[Feature #18776]]
* Використовуйте переваги дрібнозернистої інвалідації констант, щоб інвалідувати менше коду при визначенні нових констант. [[Feature #18589]]
* Типове значення `--yjit-exec-mem-size` змінено на 64 (MiB).
* Типове значення `--yjit-call-threshold` змінено на 30.

## Покращення Regexp проти ReDoS

Відомо, що зіставлення Regexp може займати неочікувано довго. Якщо ваш код намагається зіставити можливо неефективний Regexp з ненадійним вводом, зловмисник може використати це для ефективної Denial of Service (так звана Regular expression DoS, або ReDoS).

Ми впровадили два покращення, які значно пом'якшують ReDoS.

### Покращений алгоритм зіставлення Regexp

Починаючи з Ruby 3.2, алгоритм зіставлення Regexp значно покращено за допомогою техніки мемоїзації.

```
# Це зіставлення займає 10 сек. у Ruby 3.1, і 0.003 сек. у Ruby 3.2

/^a*b?a*$/ =~ "a" * 50000 + "x"
```

![](https://cache.ruby-lang.org/pub/media/ruby320_regex_1.png)
![](https://cache.ruby-lang.org/pub/media/ruby320_regex_2.png)

Покращений алгоритм зіставлення дозволяє більшості зіставлень Regexp (близько 90% у наших експериментах) завершуватися за лінійний час.

Ця оптимізація може споживати пам'ять, пропорційну довжині вводу для кожного зіставлення. Ми не очікуємо виникнення практичних проблем, оскільки це виділення пам'яті зазвичай відкладене, і нормальне зіставлення Regexp повинно споживати максимум у 10 разів більше пам'яті, ніж довжина вводу. Якщо у вас закінчується пам'ять під час зіставлення Regexps у реальному застосунку, будь ласка, повідомте про це.

Оригінальна пропозиція: <https://bugs.ruby-lang.org/issues/19104>

### Таймаут Regexp

Оптимізацію вище не можна застосувати до деяких видів регулярних виразів, таких як ті, що включають розширені можливості (наприклад, зворотні посилання або look-around), або з великою фіксованою кількістю повторень. Як запасна міра, також впроваджено функцію таймауту для зіставлень Regexp.

```ruby
Regexp.timeout = 1.0

/^a*b?a*()\1$/ =~ "a" * 50000 + "x"
#=> Regexp::TimeoutError викликається через одну секунду
```

Зверніть увагу, що `Regexp.timeout` є глобальною конфігурацією. Якщо ви хочете використовувати різні налаштування таймауту для деяких спеціальних Regexps, ви можете використати ключове слово `timeout` для `Regexp.new`.

```ruby
Regexp.timeout = 1.0

# Цей regexp не має таймауту
long_time_re = Regexp.new('^a*b?a*()\1$', timeout: Float::INFINITY)

long_time_re =~ "a" * 50000 + "x" # ніколи не переривається
```

Оригінальна пропозиція: <https://bugs.ruby-lang.org/issues/17837>.

## Інші помітні нові можливості

### SyntaxSuggest

* Функція `syntax_suggest` (раніше `dead_end`) інтегрована в Ruby. Це допомагає вам знайти позицію помилок, таких як відсутні або зайві `end`, щоб швидше повернутися на правильний шлях, наприклад, у наступному прикладі:

  ```
  Unmatched `end', missing keyword (`do', `def`, `if`, etc.) ?

    1  class Dog
  > 2    defbark
  > 3    end
    4  end
  ```

  [[Feature #18159]]


### ErrorHighlight

* Тепер він вказує на відповідні аргументи для TypeError та ArgumentError

```
test.rb:2:in `+': nil can't be coerced into Integer (TypeError)

sum = ary[0] + ary[1]
               ^^^^^^
```

### Мова

* Анонімні rest та keyword rest аргументи тепер можна передавати як
  аргументи, замість того, щоб просто використовувати їх у параметрах методів.
  [[Feature #18351]]

    ```ruby
    def foo(*)
      bar(*)
    end
    def baz(**)
      quux(**)
    end
    ```

* Proc, який приймає один позиційний аргумент та ключові слова, більше
  не буде автоматично розпаковуватися. [[Bug #18633]]

  ```ruby
  proc{|a, **k| a}.call([1, 2])
  # Ruby 3.1 та раніше
  # => 1
  # Ruby 3.2 та пізніше
  # => [1, 2]
  ```

* Порядок оцінки присвоєння констант для констант, встановлених на явних
  об'єктах, зроблено узгодженим з порядком оцінки присвоєння одного атрибута.
  З цим кодом:

    ```ruby
    foo::BAR = baz
    ```

  `foo` тепер викликається перед `baz`. Аналогічно, для множинних присвоєнь
  констант використовується порядок оцінки зліва направо. З цим
  кодом:

    ```ruby
      foo1::BAR1, foo2::BAR2 = baz1, baz2
    ```

  Тепер використовується наступний порядок оцінки:

  1. `foo1`
  2. `foo2`
  3. `baz1`
  4. `baz2`

  [[Bug #15928]]

* Паттерн find більше не є експериментальним.
  [[Feature #18585]]

* Методи, які приймають rest параметр (як `*args`) та бажають делегувати ключові
  аргументи через `foo(*args)`, тепер повинні бути позначені `ruby2_keywords`
  (якщо це ще не зроблено). Іншими словами, всі методи, які бажають делегувати
  ключові аргументи через `*args`, тепер повинні бути позначені `ruby2_keywords`,
  без винятків. Це полегшить перехід до інших способів
  делегації, коли бібліотека може потребувати Ruby 3+. Раніше прапорець `ruby2_keywords`
  зберігався, якщо метод, що приймає, приймав `*args`, але це була помилка та
  неузгодженість. Хороша техніка для пошуку потенційно відсутніх `ruby2_keywords`
  — запустити тестовий набір, знайти останній метод, який повинен
  отримувати ключові аргументи для кожного місця, де тестовий набір не проходить, і використати `puts nil, caller, nil` там. Потім перевірте, що кожен
  метод/блок у ланцюжку викликів, який повинен делегувати ключові слова, правильно позначений
  `ruby2_keywords`. [[Bug #18625]] [[Bug #16466]]

    ```ruby
    def target(**kw)
    end

    # Випадково працювало без ruby2_keywords у Ruby 2.7-3.1, ruby2_keywords
    # потрібен у 3.2+. Так само, як (*args, **kwargs) або (...) були б потрібні на
    # обох #foo та #bar при міграції від ruby2_keywords.
    ruby2_keywords def bar(*args)
      target(*args)
    end

    ruby2_keywords def foo(*args)
      bar(*args)
    end

    foo(k: 1)
    ```

## Покращення продуктивності

### MJIT

* Компілятор MJIT реалізовано в Ruby як `ruby_vm/mjit/compiler`.
* Компілятор MJIT виконується під форкованим процесом замість
  виконання в нативному потоці, званому MJIT worker. [[Feature #18968]]
    * В результаті Microsoft Visual Studio (MSWIN) більше не підтримується.
* MinGW більше не підтримується. [[Feature #18824]]
* Перейменовано `--mjit-min-calls` на `--mjit-call-threshold`.
* Змінено типове значення `--mjit-max-cache` назад з 10000 на 100.

### PubGrub

* Bundler 2.4 тепер використовує резолвер [PubGrub](https://github.com/jhawthorn/pub_grub) замість [Molinillo](https://github.com/CocoaPods/Molinillo).

  * PubGrub — це алгоритм вирішення наступного покоління, використовуваний менеджером пакетів `pub` для мови програмування Dart.
  * Ви можете отримати інший результат резолюції після цієї зміни. Будь ласка, повідомте про такі випадки до [RubyGems/Bundler issues](https://github.com/rubygems/rubygems/issues)

* RubyGems все ще використовує резолвер Molinillo в Ruby 3.2. Ми плануємо замінити його на PubGrub у майбутньому.

## Інші помітні зміни з версії 3.1

* Data
    * Новий основний клас для представлення простого незмінного об'єкта значення. Клас
      схожий на Struct і частково ділить реалізацію, але має більш
      мінімальний та суворий API. [[Feature #16122]]

        ```ruby
        Measure = Data.define(:amount, :unit)
        distance = Measure.new(100, 'km')            #=> #<data Measure amount=100, unit="km">
        weight = Measure.new(amount: 50, unit: 'kg') #=> #<data Measure amount=50, unit="kg">
        weight.with(amount: 40)                      #=> #<data Measure amount=40, unit="kg">
        weight.amount                                #=> 50
        weight.amount = 40                           #=> NoMethodError: undefined method `amount='
        ```

* Hash
    * `Hash#shift` тепер завжди повертає nil, якщо хеш
      порожній, замість повернення значення за замовчуванням або
      виклику default proc. [[Bug #16908]]

* MatchData
    * Додано `MatchData#byteoffset`. [[Feature #13110]]

* Module
    * Додано `Module.used_refinements`. [[Feature #14332]]
    * Додано `Module#refinements`. [[Feature #12737]]
    * Додано `Module#const_added`. [[Feature #17881]]

* Proc
    * `Proc#dup` повертає екземпляр підкласу. [[Bug #17545]]
    * `Proc#parameters` тепер приймає ключове слово lambda. [[Feature #15357]]

* Refinement
    * Додано `Refinement#refined_class`. [[Feature #12737]]

* RubyVM::AbstractSyntaxTree
    * Додано опцію `error_tolerant` для `parse`, `parse_file` та `of`. [[Feature #19013]]
      З цією опцією
        1. SyntaxError пригнічується
        2. AST повертається для недійсного вводу
        3. `end` доповнюється, коли парсер досягає кінця вводу, але `end` недостатньо
        4. `end` розглядається як ключове слово на основі відступу

        ```ruby
        # Без опції error_tolerant
        root = RubyVM::AbstractSyntaxTree.parse(<<~RUBY)
        def m
          a = 10
          if
        end
        RUBY
        # => <internal:ast>:33:in `parse': syntax error, unexpected `end' (SyntaxError)

        # З опцією error_tolerant
        root = RubyVM::AbstractSyntaxTree.parse(<<~RUBY, error_tolerant: true)
        def m
          a = 10
          if
        end
        RUBY
        p root # => #<RubyVM::AbstractSyntaxTree::Node:SCOPE@1:0-4:3>

        # `end` розглядається як ключове слово на основі відступу
        root = RubyVM::AbstractSyntaxTree.parse(<<~RUBY, error_tolerant: true)
        module Z
          class Foo
            foo.
          end

          def bar
          end
        end
        RUBY
        p root.children[-1].children[-1].children[-1].children[-2..-1]
        # => [#<RubyVM::AbstractSyntaxTree::Node:CLASS@2:2-4:5>, #<RubyVM::AbstractSyntaxTree::Node:DEFN@6:2-7:5>]
        ```

    * Додано опцію `keep_tokens` для `parse`, `parse_file` та `of`. [[Feature #19070]]

        ```ruby
        root = RubyVM::AbstractSyntaxTree.parse("x = 1 + 2", keep_tokens: true)
        root.tokens # => [[0, :tIDENTIFIER, "x", [1, 0, 1, 1]], [1, :tSP, " ", [1, 1, 1, 2]], ...]
        root.tokens.map{_1[2]}.join # => "x = 1 + 2"
        ```

* Set
    * Set тепер доступний як вбудований клас без необхідності `require "set"`. [[Feature #16989]]
      Зараз він автоматично завантажується через константу `Set` або виклик `Enumerable#to_set`.

* String
    * Додано `String#byteindex` та `String#byterindex`. [[Feature #13110]]
    * Оновлено Unicode до версії 15.0.0 та Emoji версії 15.0. [[Feature #18639]]
      (також застосовується до Regexp)
    * Додано `String#bytesplice`.  [[Feature #18598]]

* Struct
    * Клас Struct також може ініціалізуватися ключовими аргументами
      без `keyword_init: true` на `Struct.new` [[Feature #16806]]

        ```ruby
        Post = Struct.new(:id, :name)
        Post.new(1, "hello") #=> #<struct Post id=1, name="hello">
        # Починаючи з Ruby 3.2, наступний код також працює без keyword_init: true.
        Post.new(id: 1, name: "hello") #=> #<struct Post id=1, name="hello">
        ```

## Проблеми сумісності

Примітка: Виключаючи виправлення помилок функцій.

### Видалені константи

Наступні застарілі константи видалено.

* `Fixnum` та `Bignum` [[Feature #12005]]
* `Random::DEFAULT` [[Feature #17351]]
* `Struct::Group`
* `Struct::Passwd`

### Видалені методи

Наступні застарілі методи видалено.

* `Dir.exists?` [[Feature #17391]]
* `File.exists?` [[Feature #17391]]
* `Kernel#=~` [[Feature #15231]]
* `Kernel#taint`, `Kernel#untaint`, `Kernel#tainted?`
  [[Feature #16131]]
* `Kernel#trust`, `Kernel#untrust`, `Kernel#untrusted?`
  [[Feature #16131]]

## Проблеми сумісності стандартної бібліотеки

### Більше не bundle сторонніх джерел

* Ми більше не bundle сторонні джерела, такі як `libyaml`, `libffi`.

    * Джерело libyaml видалено з psych. Вам може знадобитися встановити `libyaml-dev` на платформі Ubuntu/Debian. Назва пакета відрізняється для кожної платформи.

    * Bundled джерело libffi також видалено з `fiddle`

* Psych та fiddle підтримували статичні збірки з конкретними версіями джерел libyaml та libffi. Ви можете зібрати psych з libyaml-0.2.5 так:

    ```bash
    $ ./configure --with-libyaml-source-dir=/path/to/libyaml-0.2.5
    ```

    І ви можете зібрати fiddle з libffi-3.4.4 так:

    ```bash
    $ ./configure --with-libffi-source-dir=/path/to/libffi-3.4.4
    ```

  [[Feature #18571]]

## Оновлення C API

### Оновлені C API

Наступні API оновлено.

* Оновлення PRNG
  * `rb_random_interface_t` оновлено та версіоновано.
    Бібліотеки розширень, які використовують цей інтерфейс та зібрані для старіших версій.
    Також потрібно визначити функцію `init_int32`.

### Видалені C API

Наступні застарілі API видалено.

* Змінна `rb_cData`.
* Функції "taintedness" та "trustedness". [[Feature #16131]]

## Оновлення стандартної бібліотеки

* Bundler

    * Додано підтримку --ext=rust до bundle gem для створення простих gems з розширеннями Rust.
      [[GH-rubygems-6149]]
    * Пришвидшено клонування git репозиторіїв [[GH-rubygems-4475]]

* RubyGems

    * Додано підтримку mswin для cargo builder. [[GH-rubygems-6167]]

* ERB

    * `ERB::Util.html_escape` зроблено швидшим за `CGI.escapeHTML`.
        * Він більше не виділяє об'єкт String, коли немає символів, які потрібно екранувати.
        * Він пропускає виклик методу `#to_s`, коли аргумент вже є String.
        * `ERB::Escape.html_escape` додано як псевдонім для `ERB::Util.html_escape`,
          який не був monkey-patched Rails.

* IRB

    * Додано команди інтеграції debug.gem: `debug`, `break`, `catch`,
      `next`, `delete`, `step`, `continue`, `finish`, `backtrace`, `info`
        * Вони працюють навіть якщо у вас немає `gem "debug"` у вашому Gemfile.
        * Див. також: [Що нового в IRB Ruby 3.2?](https://st0012.dev/whats-new-in-ruby-3-2-irb)
    * Додано більше команд та можливостей, подібних до Pry.
        * Додано `edit` та `show_cmds` (як `help` у Pry).
        * `ls` приймає опцію `-g` або `-G` для фільтрації виводу.
        * `show_source` є псевдонімом від `$` та приймає нецитовані входи.
        * `whereami` є псевдонімом від `@`.

*   Оновлено наступні default gems.

    * RubyGems 3.4.1
    * abbrev 0.1.1
    * benchmark 0.2.1
    * bigdecimal 3.1.3
    * bundler 2.4.1
    * cgi 0.3.6
    * csv 3.2.6
    * date 3.3.3
    * delegate 0.3.0
    * did_you_mean 1.6.3
    * digest 3.1.1
    * drb 2.1.1
    * english 0.7.2
    * erb 4.0.2
    * error_highlight 0.5.1
    * etc 1.4.2
    * fcntl 1.0.2
    * fiddle 1.1.1
    * fileutils 1.7.0
    * forwardable 1.3.3
    * getoptlong 0.2.0
    * io-console 0.6.0
    * io-nonblock 0.2.0
    * io-wait 0.3.0
    * ipaddr 1.2.5
    * irb 1.6.2
    * json 2.6.3
    * logger 1.5.3
    * mutex_m 0.1.2
    * net-http 0.3.2
    * net-protocol 0.2.1
    * nkf 0.1.2
    * open-uri 0.3.0
    * open3 0.1.2
    * openssl 3.1.0
    * optparse 0.3.1
    * ostruct 0.5.5
    * pathname 0.2.1
    * pp 0.4.0
    * pstore 0.1.2
    * psych 5.0.1
    * racc 1.6.2
    * rdoc 6.5.0
    * readline-ext 0.1.5
    * reline 0.3.2
    * resolv 0.2.2
    * resolv-replace 0.1.1
    * securerandom 0.2.2
    * set 1.0.3
    * stringio 3.0.4
    * strscan 3.0.5
    * syntax_suggest 1.0.2
    * syslog 0.1.1
    * tempfile 0.1.3
    * time 0.2.1
    * timeout 0.3.1
    * tmpdir 0.1.3
    * tsort 0.1.1
    * un 0.2.1
    * uri 0.12.0
    * weakref 0.1.2
    * win32ole 1.8.9
    * yaml 0.2.1
    * zlib 3.0.0

*   Оновлено наступні bundled gems.

    * minitest 5.16.3
    * power_assert 2.0.3
    * test-unit 3.5.7
    * net-ftp 0.2.0
    * net-imap 0.3.3
    * net-pop 0.1.2
    * net-smtp 0.3.3
    * rbs 2.8.2
    * typeprof 0.21.3
    * debug 1.7.1

Див. GitHub releases, такі як [GitHub Releases of logger](https://github.com/ruby/logger/releases), або changelog для деталей default gems або bundled gems.

Див. [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
або [журнали комітів](https://github.com/ruby/ruby/compare/v3_1_0...{{ release.tag }})
для подробиць.

Унаслідок цих змін [{{ release.stats.files_changed }} файлів змінено, {{ release.stats.insertions }} вставок(+), {{ release.stats.deletions }} видалень(-)](https://github.com/ruby/ruby/compare/v3_1_0...{{ release.tag }}#file_bucket)
з часу Ruby 3.1.0!

З Різдвом, зі святами, і приємного програмування з Ruby 3.2!

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

[Feature #12005]:     https://bugs.ruby-lang.org/issues/12005
[Feature #12084]:     https://bugs.ruby-lang.org/issues/12084
[Feature #12655]:     https://bugs.ruby-lang.org/issues/12655
[Feature #12737]:     https://bugs.ruby-lang.org/issues/12737
[Feature #13110]:     https://bugs.ruby-lang.org/issues/13110
[Feature #14332]:     https://bugs.ruby-lang.org/issues/14332
[Feature #15231]:     https://bugs.ruby-lang.org/issues/15231
[Feature #15357]:     https://bugs.ruby-lang.org/issues/15357
[Bug #15928]:         https://bugs.ruby-lang.org/issues/15928
[Feature #16122]:     https://bugs.ruby-lang.org/issues/16122
[Feature #16131]:     https://bugs.ruby-lang.org/issues/16131
[Bug #16466]:         https://bugs.ruby-lang.org/issues/16466
[Feature #16663]:     https://bugs.ruby-lang.org/issues/16663
[Feature #16806]:     https://bugs.ruby-lang.org/issues/16806
[Bug #16889]:         https://bugs.ruby-lang.org/issues/16889
[Bug #16908]:         https://bugs.ruby-lang.org/issues/16908
[Feature #16989]:     https://bugs.ruby-lang.org/issues/16989
[Feature #17351]:     https://bugs.ruby-lang.org/issues/17351
[Feature #17391]:     https://bugs.ruby-lang.org/issues/17391
[Bug #17545]:         https://bugs.ruby-lang.org/issues/17545
[Bug #17767]:         https://bugs.ruby-lang.org/issues/17767
[Feature #17837]:     https://bugs.ruby-lang.org/issues/17837
[Feature #17881]:     https://bugs.ruby-lang.org/issues/17881
[Feature #18033]:     https://bugs.ruby-lang.org/issues/18033
[Feature #18159]:     https://bugs.ruby-lang.org/issues/18159
[Feature #18239]:     https://bugs.ruby-lang.org/issues/18239#note-17
[Feature #18351]:     https://bugs.ruby-lang.org/issues/18351
[Feature #18367]:     https://bugs.ruby-lang.org/issues/18367
[Bug #18435]:         https://bugs.ruby-lang.org/issues/18435
[Feature #18462]:     https://bugs.ruby-lang.org/issues/18462
[Feature #18481]:     https://bugs.ruby-lang.org/issues/18481
[Bug #18487]:         https://bugs.ruby-lang.org/issues/18487
[Feature #18564]:     https://bugs.ruby-lang.org/issues/18564
[Feature #18571]:     https://bugs.ruby-lang.org/issues/18571
[Feature #18585]:     https://bugs.ruby-lang.org/issues/18585
[Feature #18589]:     https://bugs.ruby-lang.org/issues/18589
[Feature #18595]:     https://bugs.ruby-lang.org/issues/18595
[Feature #18598]:     https://bugs.ruby-lang.org/issues/18598
[Bug #18625]:         https://bugs.ruby-lang.org/issues/18625
[Feature #18630]:     https://bugs.ruby-lang.org/issues/18630
[Bug #18633]:         https://bugs.ruby-lang.org/issues/18633
[Feature #18639]:     https://bugs.ruby-lang.org/issues/18639
[Feature #18685]:     https://bugs.ruby-lang.org/issues/18685
[Bug #18729]:         https://bugs.ruby-lang.org/issues/18729
[Bug #18751]:         https://bugs.ruby-lang.org/issues/18751
[Feature #18774]:     https://bugs.ruby-lang.org/issues/18774
[Feature #18776]:     https://bugs.ruby-lang.org/issues/18776
[Bug #18782]:         https://bugs.ruby-lang.org/issues/18782
[Feature #18788]:     https://bugs.ruby-lang.org/issues/18788
[Feature #18798]:     https://bugs.ruby-lang.org/issues/18798
[Feature #18809]:     https://bugs.ruby-lang.org/issues/18809
[Feature #18821]:     https://bugs.ruby-lang.org/issues/18821
[Feature #18822]:     https://bugs.ruby-lang.org/issues/18822
[Feature #18824]:     https://bugs.ruby-lang.org/issues/18824
[Feature #18832]:     https://bugs.ruby-lang.org/issues/18832
[Feature #18875]:     https://bugs.ruby-lang.org/issues/18875
[Feature #18925]:     https://bugs.ruby-lang.org/issues/18925
[Feature #18944]:     https://bugs.ruby-lang.org/issues/18944
[Feature #18949]:     https://bugs.ruby-lang.org/issues/18949
[Feature #18968]:     https://bugs.ruby-lang.org/issues/18968
[Feature #19008]:     https://bugs.ruby-lang.org/issues/19008
[Feature #19013]:     https://bugs.ruby-lang.org/issues/19013
[Feature #19026]:     https://bugs.ruby-lang.org/issues/19026
[Feature #19036]:     https://bugs.ruby-lang.org/issues/19036
[Feature #19060]:     https://bugs.ruby-lang.org/issues/19060
[Feature #19070]:     https://bugs.ruby-lang.org/issues/19070
[Feature #19071]:     https://bugs.ruby-lang.org/issues/19071
[Feature #19078]:     https://bugs.ruby-lang.org/issues/19078
[Bug #19087]:         https://bugs.ruby-lang.org/issues/19087
[Bug #19100]:         https://bugs.ruby-lang.org/issues/19100
[Feature #19104]:     https://bugs.ruby-lang.org/issues/19104
[Feature #19135]:     https://bugs.ruby-lang.org/issues/19135
[Feature #19138]:     https://bugs.ruby-lang.org/issues/19138
[Feature #19194]:     https://bugs.ruby-lang.org/issues/19194
[Molinillo]:          https://github.com/CocoaPods/Molinillo
[PubGrub]:            https://github.com/jhawthorn/pub_grub
[GH-net-protocol-14]: https://github.com/ruby/net-protocol/pull/14
[GH-pathname-20]:     https://github.com/ruby/pathname/pull/20
[GH-6791]:            https://github.com/ruby/ruby/pull/6791
[GH-6868]:            https://github.com/ruby/ruby/pull/6868
[GH-rubygems-4475]:   https://github.com/rubygems/rubygems/pull/4475
[GH-rubygems-6149]:   https://github.com/rubygems/rubygems/pull/6149
[GH-rubygems-6167]:   https://github.com/rubygems/rubygems/pull/6167
[sec-156615]:         https://hackerone.com/reports/156615
[CVE-2021-33621]:     https://www.ruby-lang.org/en/news/2022/11/22/http-response-splitting-in-cgi-cve-2021-33621/
[wasm/README.md]:     https://github.com/ruby/ruby/blob/master/wasm/README.md
[ruby.wasm]:          https://github.com/ruby/ruby.wasm