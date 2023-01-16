---
layout: page
title: "Ruby ядро"
lang: bg
---

Сега е моментът да започнете да следите развитието на Ruby. С огромното
внимание, което езикът получава през последните години, се увеличава и
търсенето на талантливи разработчици, които да подпомагат развитието на езика и
документацията. От къде да започнем?
{: .summary}

Темите, свързани с разработването на Ruby, описани тук са:

* [Използване на Subversion за следене на процеса на разработка](#following-ruby)
* [Използването на git с основното хранилище](#git-ruby)
* [Усъвършенстване на Ruby, кръпка по кръпка](#patching-ruby)
* [Правила за Core разработчиците](#coding-standards)

### Използване на Subversion за следене на процеса на разработка
{: #following-ruby}

Изтегляне на последната версия на изходният код е въпрос на влизане в
[Subversion][1] с анонимен акаунт. От командния ред:

{% highlight sh %}
$ svn co https://svn.ruby-lang.org/repos/ruby/trunk ruby
{% endhighlight %}

Директорията `ruby` съдържа актуалният изходен код на Ruby (ruby-trunk).
Пачовете, които се прилагат върху trunk се backport-ват към стабилните
{{ site.svn.stable.version }}, {{ site.svn.previous.version }}
и {{ site.svn.old.version }} branch-ове (виж по-долу).

Ако желаете да следите пачването на Ruby {{ site.svn.stable.version }},
трябва да използвате `{{ site.svn.stable.branch }}` branch-a:

{% highlight sh %}
$ svn co https://svn.ruby-lang.org/repos/ruby/branches/{{ site.svn.stable.branch }}
{% endhighlight %}

Подобно за {{ site.svn.previous.version }}:

{% highlight sh %}
$ svn co https://svn.ruby-lang.org/repos/ruby/branches/{{ site.svn.previous.branch }}
{% endhighlight %}

Това ще свали желанaта версия в директорията `{{ site.svn.stable.branch }}` или
`{{ site.svn.previous.branch }}`. Често branch-овете са много близки с
изключението на подобренията, направени от Matz и Nobu към самият език.

Ако желаeте, може да прегледате [Subversion хранилището на Ruby][2].

За повече информация относно Subversion, можете да посетите [Често задавани
въпроси за Subversion][3] и [книгата за Subversion][4]. Друг вариaнт
е книгата [Pragmatic Version Control with Subversion][5].

### Използване на git с основното хранилище
{: #git-ruby}

Ако предпочитате [Git][6] пред Subversion, можете да откриете инструкции
на [GitHub хранилището][7], както за [хора с commit достъп][8], така и за
[всички останали][9].

### Усъвършенстване, кръпка по кръпка
{: #patching-ruby}

Основния екип поддържа [issue tracker][10] за приемането на кръпки и
репорти за бъгове. Тези репорти се публикуват също така и в пощенския
списък [Ruby-Core mailing list][mailing-lists] за дискусия.

Моля прегледайте [Инструкции за писане на кръпки][11] за съвети от Matz
как кръпката ви да бъде разгледана.

На кратко стъпките за изготвянето на кръпка:

1.  Издърпайте копие на изходният код на Ruby от Subversion. Обикновено
    кръпките и фиксовете на бъгове трябва да бъдат качени в trunk. Дори
    ако желаете да добавите нещо към Ruby {{ site.svn.previous.version }},
    трябва първо то да мине през trunk.

        $ svn co https://svn.ruby-lang.org/repos/ruby/trunk ruby

    Ако желаете да оправите проблем по специфична версия, дръпнете само нея,
    например `{{ site.svn.previous.branch }}`.

        $ svn co https://svn.ruby-lang.org/repos/ruby/branches/{{ site.svn.previous.branch }}

2.  Добавете подобренията на кода.

3.  Създайте кръпка.

        $ svn diff > ruby-changes.patch

4.  Създайте ticket в [issue tracker-а][10] или изпратете email с кръпката
    на [Ruby-Core пощенският списък][mailing-lists] със списък и описание
    на промените.

5.  Ако няма проблеми с кръпката, тя ще бъде предадена за одобрение.

**Забележка:** кръпките трябва да бъдат изпратени като [unified diff][12].
За повече информация вижте [the diffutils reference][13].

Дискусията ще бъде пренесена на пощенския списък
[Ruby-Core mailing list][mailing-lists].

Помнете, че екипа, който разработва Ruby, живее в Япония и въпреки, че
повечето владеят английски, има съществена часова разлика. Бъдете
търпеливи и ако имате проблем – бъдете настойчиви, опитайте пак след
няколко дни.

### Правила за Core разработчиците
{: #coding-standards}

Разработчиците на Ruby трябва да са запознати в общи линии с изходния код
и стила на писане, използван от основния екип разработчици. За по-голяма
яснота, моля спазвайте следните правила:

* Всички промени трябва да са описани в `ChangeLog`, спазващи
  [GNU конвенциите][14]. (Много рубисти ползват Emacs `add-log` mode,
  който е достъпен с командата `C-x 4 a`.)
* Промените трябва да са в японско стандартно време (UTC+9).
* Означените точки във вашия ChangeLog трябва да присъстват в Subversion
  commit съобщение, което ще бъде пратено автоматично като електронна
  поща до Ruby-CVS списъка.
* Стила на писане използва ANSI декларации на функциите в изходния код
  на Ruby и неговите разширения.
* Моля, не ползвайте C++ стил на коментарите (`//`), а. (`/* .. */`).

Повече информация може да намерите в [Ruby’s issue tracker][10].



[mailing-lists]: /bg/community/mailing-lists/
[1]: http://subversion.apache.org/
[2]: https://svn.ruby-lang.org/cgi-bin/viewvc.cgi/
[3]: http://subversion.apache.org/faq.html
[4]: http://svnbook.org
[5]: http://www.pragmaticprogrammer.com/titles/svn/
[6]: http://git-scm.com/
[7]: https://github.com/ruby/ruby
[8]: https://github.com/shyouhei/ruby/wiki/committerhowto
[9]: https://github.com/shyouhei/ruby/wiki/noncommitterhowto
[10]: https://bugs.ruby-lang.org/
[11]: https://blade.ruby-lang.org/ruby-core/25139
[12]: http://www.gnu.org/software/diffutils/manual/html_node/Unified-Format.html
[13]: http://www.gnu.org/software/diffutils/manual/html_node/Merging-with-patch.html#Merging%20with%20patch
[14]: http://www.gnu.org/prep/standards/standards.html#Change-Logs
