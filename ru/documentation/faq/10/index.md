---
layout: page
title: "Официальный FAQ по Ruby"
lang: ru

header: |
  <div class="multi-page">
    <a href="../" title="Оглавление">Оглавление</a>
    <span class="separator"> | </span>
    <a href="../1/" title="Часть 1">1</a>
    <span class="separator"> | </span>
    <a href="../2/" title="Часть 2">2</a>
    <span class="separator"> | </span>
    <a href="../3/" title="Часть 3">3</a>
    <span class="separator"> | </span>
    <a href="../4/" title="Часть 4">4</a>
    <span class="separator"> | </span>
    <a href="../5/" title="Часть 5">5</a>
    <span class="separator"> | </span>
    <a href="../6/" title="Часть 6">6</a>
    <span class="separator"> | </span>
    <a href="../7/" title="Часть 7">7</a>
    <span class="separator"> | </span>
    <a href="../8/" title="Часть 8">8</a>
    <span class="separator"> | </span>
    <a href="../9/" title="Часть 9">9</a>
    <span class="separator"> | </span>
    <strong>10</strong>
    <span class="separator"> | </span>
    <a href="../11/" title="Часть 11">11</a>
  </div>
  <h1>Официальный FAQ по Ruby</h1>

---

{% include faq-notice.md %}

## Библиотека расширений

### Как я могу использовать Ruby интерактивно?
{: #irb}

{% include warnings/faq-out-of-date.html %}

Вы можете попробовать использовать `irb`. Ниже приведено переложение текста Kentaro Goto (Gotoken), который изначально появился в [\[ruby-talk:444\]][ruby-talk:444].

1. Получите последний тарбол `irb` из [директории contrib](ftp://ftp.netlab.co.jp/pub/lang/ruby/contrib/) в архиве Ruby.
2. Распакуйте дерево директорий `irb`.
3. Добавьте путь к директории `irb/` в переменную окружения `$RUBYLIB`.
4. Создайте символическую ссылку из `$RUBYLIB/irb/irb.rb` на файл с именем `irb` где-нибудь в вашем пути PATH.
5. `chmod +x $RUBYLIB/irb/irb.rb`
6. Возможно, используйте `rehash`, чтобы сообщить вашей оболочке о новой команде.
7. Введите `irb`.

Если модуль расширения readline работает с вашим интерпретатором, это сделает использование `irb` гораздо приятнее.

В директории `samples/` дистрибутива Ruby также есть простая программа `eval`. Она позволяет вводить выражения и просматривать их значения. Вы можете скопировать `eval` в директорию `site_ruby` в дереве Ruby, а затем вызывать её с помощью:

~~~
ruby -r eval -e0
~~~

[ruby-talk:444]: https://blade.ruby-lang.org/ruby-talk/444

### Есть ли отладчик для Ruby?

Для Ruby существует gdb-подобный отладчик.

~~~
ruby -r debug your_program
~~~

### Как я могу использовать библиотеку, написанную на C, из Ruby?

Из всех скриптовых языков Ruby, вероятно, проще всего расширять. Здесь нет проблем с подсчетом ссылок и типами переменных, и нужно изучить совсем немного интерфейсов. На самом деле код на C, используемый для расширения Ruby, часто в итоге выглядит удивительно похожим на сам код Ruby.

Сначала прочитайте файл `doc/extension.rdoc` в исходниках Ruby или прочитайте [extension.rdoc на docs.ruby-lang.org][extension-rdoc]. Это отличный документ не только если вы пишете библиотеку расширения, но и если вы хотите глубже понять Ruby.

Затем сайт RubyGems предоставляет [руководство по созданию гемов с расширениями][rubygems-guide]. В нем показано, как настроить гем с расширениями на C, которые собираются во время установки. Там также есть ссылки на некоторые существующие гемы, которые оборачивают библиотеки на C, и материалы для дальнейшего чтения.

Вы также можете взглянуть на исходный код самого интерпретатора и на различные поставляемые расширения в директории `ext/` (вы можете просмотреть [репозиторий Ruby на GitHub][ruby-github]).

[extension-rdoc]: https://docs.ruby-lang.org/en/master/extension_rdoc.html
[rubygems-guide]: http://guides.rubygems.org/gems-with-extensions/
[ruby-github]:    https://github.com/ruby/ruby

### Могу ли я использовать Tcl/Tk в Ruby?

{% include warnings/faq-out-of-date.html %}

В стандартный дистрибутив включены два интерфейса к Tcl/Tk. Один находится в `ext/tcltk/` и загружается с помощью `require "tcltk"`. Синтаксис очень близок к синтаксису Tcl, который передается интерпретатору Tcl. К сожалению, описание этой библиотеки написано на японском языке.

Другой находится в `ext/tk/` и загружается с помощью `require "tk"`. Его синтаксис ближе к стилю интерфейса Tk, предоставляемого интерфейсами Perl и Python.

### Tk не работает. Почему?

{% include warnings/faq-out-of-date.html %}

Ваша версия Tk может быть старой, попробуйте более новую версию.

### Могу ли я использовать интерфейсы gtk+ или xforms в Ruby?

{% include warnings/faq-out-of-date.html %}

Вы найдете `ruby-gtk-x.xx.tar.gz` и `ruby-forms-x.x.tar.gz` в директории `contrib/` на ftp-сайтах Ruby.

### Как я могу выполнять арифметические операции с датами?

{% include warnings/faq-out-of-date.html %}

Объект `Time` может выражать только даты между 1 января 1970 года и 19 января 2038 года.

Предоставляются два стандартных модуля библиотеки расширений: `require "date"`, который прост и использует английский календарь, и `require "date2"`, который более универсален.

Также смотрите `sample/cal.rb`.
