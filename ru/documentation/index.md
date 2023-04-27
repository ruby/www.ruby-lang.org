---
layout: page
title: "Документация"
lang: ru
---

Здесь вы найдете отсылки к руководствам, урокам и ссылкам, которые могут
быть полезны, если вы почувствуете, что хотите программировать на Ruby.
{: .summary}

### Установка Ruby

Если вы хотите попробовать Ruby не только в браузере (смотрите ссылки ниже),
но и локально – вам нужно установить Ruby на ваш компьютер.
Вы можете проверить, установлен ли Ruby на ваш компьютер, набрав в терминале

{% highlight sh %}
ruby -v
{% endhighlight %}

Это должно вывести некоторую информацию об установленной версии Ruby.
Если нет, смотрите страницу [установки](installation/) с различными
способами получить Ruby.

### С чего начать

[Try Ruby!][1]
: Интерактивное введение, которое даст вам возможность попробовать Ruby
  прямо в вашем браузере. 15-ти минутная вводная часть нацелена на
  начинающих, кто хочет почувствовать возможности языка.

[Ruby Koans][2]
: Данный ресурс поведет вас по пути просвещения к знаниям о Ruby. Цель
  ресурса – изучить язык Ruby, его синтаксис, структуру и несколько
  стандартных функций и библиотек. Так же он обучит вас культуре.

[Why’s (Poignant) Guide to Ruby][5]
: Необычная, но интересная книга, которая научит вас Ruby посредством
  историй, шуток и комиксов. Созданное программистом *why the lucky stiff*,
  данное руководство является классикой для изучения Ruby.

[Ruby за двадцать минут](/ru/documentation/quickstart/)
: Неплохое введение, покрывающее основы Ruby. Прохождение его от начала
  до конца не должно занять у вас более двадцати минут.

[В Ruby из других языков](/ru/documentation/ruby-from-other-languages/)
: Пришли в мир Ruby из другого языка? Будь это C, C++, Java, Perl, PHP
  или Python – этот раздел вам поможет!

[Ruby Essentials][7]
: Бесплатная онлайн-книга, предоставляющая краткое и легкое руководство
  для изучения Ruby.

[Learn to Program][8]
: Замечательное маленькое руководство от Chris Pine для новичков в
  программировании. Если вы не знаете как программировать - начните
  отсюда.

[Learn Ruby the Hard Way][38]
: Отличный набор упражнений с объяснениями, который поможет вам пройти
  путь от абсолютно базовых понятий Ruby до ООП и веб-разработки.

### Руководства

[Programming Ruby][9]
: Основополагающая работа по Ruby на английском в первом издании,
  [книга от Pragmatic Programmers][10], доступна бесплатно онлайн.

[The Ruby Programming Wikibook][12]
: Бесплатное онлайн-руководство для начинающих и продвинутых, плюс
  полная документация языка.

### Документация языка

[Ruby Core Reference][13]
: Полученная прямиком из исходного кода при помощи [RDoc][14], эта
  документация охватывает все классы и модули ядра (такие как String,
  Array, Symbol и так далее).

[Ruby Standard Library Reference][15]
: Так же полученная прямо из исходного кода при помощи RDoc, эта
  документация охватывает стандартные библиотеки.

[RubyDoc.info][16]
: Веб-сайт содержащий в себе документацию о гемах Ruby и Ruby проектах,
  расположенных на GitHub.

[Ruby & Rails Searchable API Docs][17]
: Rails и Ruby документация с умным поиском.

[APIdock][18]
: Ruby, Rails и RSpec документация с комментариями и заметками
  пользователей.

[RubyAPI.org][rubyapi-org]
: Легко находите и просматривайте классы, модули и методы Ruby.

### Редакторы и среды разработки

Для программирования на Ruby вы можете использовать стандартный
редактор вашей операционной системы. Кстати, для более эффективного
написания кода, стоит использовать редактор с поддержкой Ruby (например,
подсветка синтаксиса, просмотр файлов) или среду разработки с
продвинутыми функциями (например, code completion, рефакторинг,
поддержка тестирования).

Далее следует список популярных инструментов, используемых рубистами:

* Инструменты для Linux и кросс-платформенные инструменты:
  * [Aptana Studio][19]
  * [Emacs][20] с [Ruby режимом][21] и [Rsense][22]
  * [Geany][23]
  * [gedit][24]
  * [Vim][25] с [vim-ruby][26] плагином и [Rsense][22]
  * [RubyMine][27]
  * [SciTe][28]
  * [NetBeans][36]
  * [Sublime Text][37]

* На Windows:
  * [Notepad++][29]
  * [E-TextEditor][30]
  * [Ruby In Steel][31]

* На macOS:
  * [TextMate][32]
  * [BBEdit][33]

### Дальнейшее чтение

[Ruby-Doc.org][34] поддерживает актуальный список англоязычных источников.
Если у вас есть
вопросы по Ruby, [почтовая рассылка](/ru/community/mailing-lists/) – отличное место их задать.



[1]: https://try.ruby-lang.org/
[2]: https://github.com/edgecase/ruby_koans
[5]: https://poignant.guide
[7]: http://www.techotopia.com/index.php/Ruby_Essentials
[8]: http://pine.fm/LearnToProgram/
[9]: http://www.ruby-doc.org/docs/ProgrammingRuby/
[10]: http://pragmaticprogrammer.com/titles/ruby/index.html
[12]: http://en.wikibooks.org/wiki/Ruby_programming_language
[13]: http://www.ruby-doc.org/core
[14]: https://ruby.github.io/rdoc/
[15]: http://www.ruby-doc.org/stdlib
[16]: http://www.rubydoc.info/
[17]: http://rubydocs.org/
[18]: http://apidock.com/
[rubyapi-org]: https://rubyapi.org/
[19]: http://www.aptana.com/
[20]: http://www.gnu.org/software/emacs/
[21]: http://www.emacswiki.org/emacs/RubyMode
[22]: http://rsense.github.io/
[23]: http://www.geany.org/
[24]: http://projects.gnome.org/gedit/screenshots.html
[25]: http://www.vim.org/
[26]: https://github.com/vim-ruby/vim-ruby
[27]: http://www.jetbrains.com/ruby/
[28]: http://www.scintilla.org/SciTE.html
[29]: http://notepad-plus-plus.org/
[30]: http://www.e-texteditor.com/
[31]: http://www.sapphiresteel.com/
[32]: http://macromates.com/
[33]: https://www.barebones.com/products/bbedit/
[34]: http://ruby-doc.org
[36]: https://netbeans.org/
[37]: http://www.sublimetext.com/
[38]: https://learncodethehardway.org/ruby/
