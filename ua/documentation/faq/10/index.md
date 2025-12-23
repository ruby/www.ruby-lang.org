---
layout: page
title: "Офіційний FAQ Ruby"
lang: ua

header: |
  <div class="multi-page">
    <a href="../" title="Зміст">Зміст</a>
    <span class="separator"> | </span>
    <a href="../1/" title="Частина 1">1</a>
    <span class="separator"> | </span>
    <a href="../2/" title="Частина 2">2</a>
    <span class="separator"> | </span>
    <a href="../3/" title="Частина 3">3</a>
    <span class="separator"> | </span>
    <a href="../4/" title="Частина 4">4</a>
    <span class="separator"> | </span>
    <a href="../5/" title="Частина 5">5</a>
    <span class="separator"> | </span>
    <a href="../6/" title="Частина 6">6</a>
    <span class="separator"> | </span>
    <a href="../7/" title="Частина 7">7</a>
    <span class="separator"> | </span>
    <a href="../8/" title="Частина 8">8</a>
    <span class="separator"> | </span>
    <a href="../9/" title="Частина 9">9</a>
    <span class="separator"> | </span>
    <strong>10</strong>
    <span class="separator"> | </span>
    <a href="../11/" title="Частина 11">11</a>
  </div>
  <h1>Офіційний FAQ Ruby</h1>

---

{% include faq-notice.md %}

## Бібліотеки розширень

### Як використовувати Ruby інтерактивно?
{: #irb}

{% include warnings/faq-out-of-date.html %}

Спробуйте використати `irb`. Далі наведено переказ зі слів Kentaro Goto
(Gotoken), який уперше з’явився у [\[ruby-talk:444\]][ruby-talk:444].

1. Завантажте найсвіжіший tarball `irb` із
   [contrib directory](ftp://ftp.netlab.co.jp/pub/lang/ruby/contrib/)
   в архіві Ruby.
2. Розпакуйте дерево каталогу `irb`.
3. Додайте шлях до каталогу `irb/` у змінну середовища `$RUBYLIB`.
4. Створіть символічне посилання з `$RUBYLIB/irb/irb.rb` на файл `irb`
   десь у вашому `PATH`.
5. `chmod +x $RUBYLIB/irb/irb.rb`
6. Можливо, використайте `rehash`, щоб повідомити вашу оболонку
   про нову команду.
7. Наберіть `irb`.

Якщо модуль розширення readline працює з вашим інтерпретатором,
`irb` стане набагато приємнішим у використанні.

У каталозі `samples/` дистрибутива Ruby також є проста програма `eval`.
Вона дозволяє вводити вирази та переглядати їхні значення.
Ви можете скопіювати `eval` у каталог `site_ruby` у дереві Ruby і
запускати так:

~~~
ruby -r eval -e0
~~~

[ruby-talk:444]: https://blade.ruby-lang.org/ruby-talk/444

### Чи є налагоджувач для Ruby?

Є налагоджувач на кшталт gdb для Ruby.

~~~
ruby -r debug your_program
~~~

### Як використовувати бібліотеку, написану на C, з Ruby?

З усіх скриптових мов Ruby, мабуть, найпростіше розширювати. Тут немає
проблем із підрахунком посилань і типами змінних, і потрібно вивчити дуже
мало інтерфейсів. Ба більше, C-код для розширення Ruby часто дивовижно
нагадує сам Ruby-код.

Спочатку прочитайте файл `doc/extension.rdoc` у вихідному коді Ruby
або перегляньте [extension.rdoc на docs.ruby-lang.org][extension-rdoc].
Це хороший документ не лише для написання бібліотек розширень, але й для
глибшого розуміння Ruby.

Далі сайт RubyGems пропонує
[гід зі створення gem із розширеннями][rubygems-guide].
Він показує, як налаштувати gem із C-розширеннями, що збираються під час
встановлення. Також там є посилання на деякі наявні gem, які обгортають
бібліотеки C, і на додаткові матеріали.

Також варто подивитися на вихідний код інтерпретатора та на різні
постачувані розширення в каталозі `ext/`
(ви можете переглянути [репозиторій Ruby на GitHub][ruby-github]).

[extension-rdoc]: https://docs.ruby-lang.org/en/master/extension_rdoc.html
[rubygems-guide]: http://guides.rubygems.org/gems-with-extensions/
[ruby-github]:    https://github.com/ruby/ruby

### Чи можу я використовувати Tcl/Tk у Ruby?

{% include warnings/faq-out-of-date.html %}

У стандартному дистрибутиві є два інтерфейси до Tcl/Tk. Один розміщений
у `ext/tcltk/` і завантажується через `require "tcltk"`. Синтаксис дуже
близький до Tcl, який передається інтерпретатору Tcl. На жаль, опис цієї
бібліотеки написаний японською.

Інший розміщений у `ext/tk/` і завантажується через `require "tk"`.
Його синтаксис ближчий до стилю інтерфейсу Tk, який надають інтерфейси
Perl і Python.

### Tk не працює. Чому?

{% include warnings/faq-out-of-date.html %}

Ваша версія Tk може бути застарілою, спробуйте новішу.

### Чи можу я використовувати інтерфейси gtk+ або xforms у Ruby?

{% include warnings/faq-out-of-date.html %}

Ви знайдете `ruby-gtk-x.xx.tar.gz` і `ruby-forms-x.x.tar.gz`
у `contrib/` на Ruby FTP-сайтах.

### Як виконувати арифметику дат?

{% include warnings/faq-out-of-date.html %}

Об’єкт `Time` може виражати лише дати між 1 січня 1970 та 19 січня 2038.

Доступні два модулі бібліотек розширень:
`require "date"`, який простий і використовує англійський календар,
і `require "date2"`, який є більш загальним.

Також дивіться `sample/cal.rb`.
