---
layout: page
title: "Офіційний FAQ Ruby"
lang: ua

header: |
  <div class="multi-page">
    <a href="../" title="Зміст">Зміст</a>
    <span class="separator"> | </span>
    <strong>1</strong>
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
    <a href="../10/" title="Частина 10">10</a>
    <span class="separator"> | </span>
    <a href="../11/" title="Частина 11">11</a>
  </div>
  <h1>Офіційний FAQ Ruby</h1>

---

{% include faq-notice.md %}

## Загальні питання

### Що таке Ruby?

Ruby — проста й потужна об’єктно-орієнтована мова програмування, створена
Yukihiro Matsumoto (у цьому документі та в поштових розсилках він
використовує псевдонім “Matz”).

Як і Perl, Ruby добре підходить для обробки тексту. Як і Smalltalk, у Ruby
все є об’єктом, і Ruby має блоки, ітератори, метакласи та інші корисні
можливості.

Ruby можна використовувати для написання серверів, швидких прототипів і
повсякденних задач програмування. Як повністю інтегрована об’єктно-
орієнтована мова, Ruby добре масштабується.

Особливості Ruby:

* Простий синтаксис,
* Базові ООП-можливості (класи, методи, об’єкти тощо),
* Спеціальні ООП-можливості (міксини, синглтон-методи, перейменування тощо),
* Перевантаження операторів,
* Обробка винятків,
* Ітератори та замикання,
* Збирання сміття,
* Динамічне завантаження (залежно від архітектури),
* Висока портативність (працює на різних Unix, Windows, DOS, macOS, OS/2,
  Amiga тощо).

### Покажіть трохи Ruby-коду!

Давайте визначимо клас `Person` з іменем та віком. Ми протестуємо код,
створивши кілька людей і переглянувши їх.

~~~
class Person
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age  = age.to_i
  end

  def inspect
    "#{name} (#{age})"
  end
end

p1 = Person.new("Elmo", 4)
p2 = Person.new("Zoe", 7)

p1  # => Elmo (4)
p2  # => Zoe (7)
~~~

Тепер заповнимо масив людей, зчитуючи імена та вік із файлу `ages`,
який містить рядки на кшталт:

~~~
Bert:    8
Cookie: 11
Elmo:    4
Ernie:   8
Zoe:     7
~~~

Код використовує регулярні вирази, щоб парсити послідовні рядки з файлу,
створювати новий об’єкт `Person` для кожного збігу та додавати його
в кінець масиву `people`.

~~~
people = Array.new

File.foreach("ages") do |line|
  people << Person.new($1, $2) if line =~ /(.*):\s+(\d+)/
end

people  # => [Bert (8), Cookie (11), Elmo (4), Ernie (8), Zoe (7)]
~~~

Тепер відсортуймо результат за віком людини. Є багато способів це зробити.
Ми можемо визначити блок сортування, який повідомляє Ruby, як порівнювати
двох людей:

~~~
sorted = people.sort {|a, b| a.age <=> b.age }
sorted  # => [Elmo (4), Zoe (7), Bert (8), Ernie (8), Cookie (11)]
~~~

Інший спосіб — змінити метод порівняння для класу `Person`:

~~~
class Person
  def <=>(other)
    age <=> other.age
  end
end
people.sort  # => [Elmo (4), Zoe (7), Bert (8), Ernie (8), Cookie (11)]
~~~

### Чому назва “Ruby”?

Під впливом Perl Matz хотів використати назву коштовного каменю для
своєї нової мови, тож назвав Ruby на честь каменю народження колеги.

Згодом він зрозумів, що Ruby йде одразу після Perl у кількох ситуаціях.
У каменях народження: перли — для червня, рубін — для липня. У вимірюванні
розміру шрифтів: pearl — 5pt, ruby — 5.5pt. Він вважав Ruby доброю назвою
для мови програмування, новішої (і, сподіваємося, кращої) за Perl.

(На основі пояснення Matz у [\[ruby-talk:00394\]][ruby-talk:00394]
від 11 червня 1999 року.)

[ruby-talk:00394]: https://blade.ruby-lang.org/ruby-talk/394

### Яка історія Ruby?

Нижче наведено стислий виклад повідомлення Matz у
[\[ruby-talk:00382\]][ruby-talk:00382] від 4 червня 1999 року.
(День народження Ruby був уточнений у
[\[ruby-list:15977\]][ruby-list:15977].)

> Отже, Ruby народився 24 лютого 1993 року. Я обговорював з колегою
> можливість об’єктно-орієнтованої скриптової мови. Я знав Perl
> (Perl4, не Perl5), але насправді мені він не подобався, бо мав відтінок
> “іграшкової мови” (і досі має). Об’єктно-орієнтована скриптова мова
> здавалася дуже перспективною.

> Я тоді знав Python. Але він мені не подобався, бо я не вважав його
> справжньою об’єктно-орієнтованою мовою — ООП-можливості виглядали як
> надбудова над мовою. Як маніяк мов і прихильник ООП протягом 15 років,
> я дуже хотів справжню об’єктно-орієнтовану, просту у використанні
> скриптову мову. Я шукав, але не міг знайти.

> Тож я вирішив створити її. На те, щоб інтерпретатор запрацював, пішло
> кілька місяців. Я додав туди можливості, які хотів бачити у своїй мові,
> такі як ітератори, обробка винятків, збирання сміття.

> Потім я reorganізував можливості Perl у бібліотеку класів і
> реалізував їх. Я опублікував Ruby 0.95 у японських внутрішніх
> групах новин у грудні 1995 року.

> Відтоді були створені дуже активні поштові розсилки та вебсторінки.

[ruby-talk:00382]: https://blade.ruby-lang.org/ruby-talk/382
[ruby-list:15977]: https://blade.ruby-lang.org/ruby-list/15977

### Де головна сторінка Ruby?

Офіційна головна сторінка Ruby — [www.ruby-lang.org](/ua/).
Окрім англійської та японської версій, існують переклади багатьма іншими
мовами.

Хороші стартові точки для пошуку інформації про Ruby —
[Документація](/ua/documentation/) і [Спільнота](/ua/community/).

### Чи є група новин Ruby?

comp.lang.ruby була створена в травні 2000 року (завдяки зусиллям
[Conrad Schneiker](mailto:schneiker@jump.net)).

### Чи є поштові розсилки Ruby?

Є кілька поштових розсилок про Ruby. Дивіться сторінку
[Поштові розсилки](/ua/community/mailing-lists/)
для додаткової інформації.

Архіви розсилок можна шукати за адресою
[https://ml.ruby-lang.org/archives/list/ruby-talk@ml.ruby-lang.org/](https://ml.ruby-lang.org/archives/list/ruby-talk@ml.ruby-lang.org/).
(Це URL для розсилки ruby-talk; для інших змінюйте за аналогією).

### Як зробити thread у mutt?

{% include warnings/faq-out-of-date.html %}

Для деяких розсилок Ruby програмне забезпечення додає префікс до тем,
наприклад `ruby-core:1234`. Це може збивати threading у деяких
поштових клієнтах.

У mutt можна налаштувати threading за допомогою такого параметра:

~~~
# reply regexp, to support MLs like ruby-talk.
set reply_regexp="^(\[[a-z0-9:-]+\][[:space:]]*)?(re([\[0-9\]+])*|aw):[[:space:]]*"
~~~

### Як правильно: “Ruby” чи “ruby”?

Офіційно мова називається “Ruby”. На більшості систем вона запускається
командою `ruby`. Використовувати “ruby” замість “Ruby” — нормально.

Будь ласка, не використовуйте “RUBY” як назву мови.

Спочатку, історично, вона називалася “ruby”.

### Чи є книги про Ruby?

{% include warnings/faq-out-of-date.html %}

* Programming Ruby: The Pragmatic Programmer's Guide,
  (the Pickaxe Book) by David Thomas and Andrew Hunt: ISBN 0-20171-089-7,
  Addison-Wesley, October 2000.

* A Japanese language Ruby reference book by Matz et al. and published by
  ASCII is available in Japan (ISBN 4-7561-3254-5). An English translation,
  “The Ruby Programming Language”, is available from O'Reilly & Associates
  (ISBN 978-0596516178).

* A Japanese language “Ruby Pocket Reference” is published by O'Reilly Japan
  (ISBN 4-87311-023-8). Let O'Reilly in the US know if you'd like to see a
  translation.

* In addition, “Mastering Regular Expressions”, by Jeffrey Friedl,
  (the Hip Owl Book): ISBN 1-56592-257-3 from O'Reilly & Associates,
  is a reference work that covers the art and implementation of regular
  expressions in various programming languages. Most of it is highly
  relevant to Ruby regular expressions.

### Які редактори підтримують Ruby?

{% include warnings/faq-out-of-date.html %}

* [Emacs](http://www.gnu.org/software/emacs/emacs.html)
  або [XEmacs](http://www.xemacs.org/): `ruby-mode.el` постачається в
  дистрибутиві Ruby. У деяких версіях XEmacs може знадобитися додати
  `(load "font-lock")` до файлу `.emacs`, щоб дозволити `ruby-mode.el`
  виявляти пакет підсвічування синтаксису, який ви використовуєте.
* [Vim](http://www.vim.org/): Vim 5.7 і новіші мають файли синтаксису Ruby
  як стандарт у пакеті runtime. Для попередніх версій файл синтаксису Ruby
  доступний за адресою
  [http://www.xs4all.nl/~hipster/lib/ruby/ruby.vim](http://www.xs4all.nl/~hipster/lib/ruby/ruby.vim).
* [Jedit](http://jedit.sourceforge.net/): портативний редактор, написаний на Java,
  має підтримку Ruby.
* [Nedit](http://www.nedit.org): Eric Santonacci написав підтримку Ruby для
  Nedit, доступну за адресою
  [ftp://ftp.talc.fr/pub/ruby/ruby.nedit-0.1.tar.gz](ftp://ftp.talc.fr/pub/ruby/ruby.nedit-0.1.tar.gz).
* Barry Shultz написав файл визначення Ruby для TextPad, доступний за адресою
  [https://www.textpad.com/add-ons/synn2t.html](https://www.textpad.com/add-ons/synn2t.html).

### Як додавати до Ruby-коду результати виконання?

{% include warnings/faq-out-of-date.html %}

Зазвичай результати виконання Ruby-коду додають як коментарі до кожного
рядка. Наприклад, у наступному коді показано, що присвоєння створює
рядок "Billy Bob", а потім результат витягування підрядків.

~~~
str = "Billy" + " Bob"           # => "Billy Bob"
str[0,1] + str[2,1] + str[-2,2]  # => "Blob"
~~~

Користувачі Emacs і vim можуть інтегрувати це зі своїм середовищем редагування,
що корисно, якщо ви хочете надсилати людям електронні листи з анотованим
Ruby-кодом. Встановивши `xmp`, користувачі Emacs можуть додати таке до
свого `.emacs` файлу:

~~~
(defun ruby-xmp-region (reg-start reg-end)
  "Pipe the region through Ruby's xmp utility and replace the region with
   the result."
  (interactive "r")
  (shell-command-on-region reg-start reg-end
                           "ruby -r xmp -n -e 'xmp($_, \"%l\t\t# %r\n\")'"
                           t))
(global-set-key [(meta f10)] 'ruby-xmp-region)
~~~

Користувачі Vim можуть використати мапінг (дякуємо hipster):

~~~
map <M-F10> :!ruby -r xmp -n -e 'xmp($_, "\%l\t\t\# \%r\n")'<CR>
~~~

У обох випадках виділіть фрагмент коду й натисніть Meta-F10, щоб додати
анотації.

### Я не можу зрозуміти Ruby навіть після прочитання мануалу!

{% include warnings/faq-out-of-date.html %}

Синтаксис Ruby доволі стабільний із Ruby 1.0, але нові можливості
час від часу додаються. Тому книги та онлайн-документація можуть
відставати.

Якщо у вас є проблема, сміливо запитуйте в поштовій розсилці
(див. [сторінку поштових розсилок](/ua/community/mailing-lists/)).
Зазвичай ви швидко отримаєте відповіді від самого Matz, автора мови,
від інших гуру та від тих, хто вже вирішував подібні проблеми.

Будь ласка, включайте вивід `ruby -v` разом із проблемним вихідним кодом.

Якщо у вас проблема з [`irb`](../10/#irb),
майте на увазі, що він має певні обмеження.
Спробуйте запустити скрипт з `irb --single-irb` або безпосередньо
командою `ruby`.

Можливо, схожі питання вже є в розсилці, і хорошою практикою netiquette
є переглянути останні листи (RFC1855:3.1.1, 3.1.2) перед тим, як питати.
Але все ж запитуйте — і правильну відповідь буде отримано.
