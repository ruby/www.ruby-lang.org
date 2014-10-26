---
layout: page
title: "Ruby ядро"
lang: bg
---

С предстоящото излизане на Ruby 2.0 , сега е момента да следите
развитието на неговото разработване. Нарастващото внимание към увеличи
нуждата от талантливи програмисти, които да помогната с разработването и
подобряването на Ruby. От къде да започнем ?
{: .summary}

Темите, свързани с разработването на Ruby описани тук са:

* [Използване на Subversion за следене на процеса на
  разработка](#following-ruby)
* [Усъвършенстване на Ruby, кръпка по кръпка](#patching-ruby)
* [Правила за Core разработчиците](#coding-standards)

### Използване на Subversion за следене на процеса на разработка
{: #following-ruby}

Изтегляне на последната версия на сорс кода е въпрос на логване в
Subversion с анонимен акаунт. От командния ред:

{% highlight sh %}
$ svn co http://svn.ruby-lang.org/repos/ruby/trunk ruby
{% endhighlight %}

Директорията `ruby` съдържа последната версия на сорс кода на Ruby 1.9
(trunk), който е все още в разработка и ще бъде пуснат официално като
версия 1.9.1 в края на 2008.

Ако искате да работите над Ruby 1.8, можете да ползвате `ruby_1_8`
клона:

{% highlight sh %}
$ svn co http://svn.ruby-lang.org/repos/ruby/branches/ruby_1_8
{% endhighlight %}

По този начин ще свалите Ruby 1.8 в `ruby_1_8` директорията.

Ако искате, можете да прегледате хранилището на този адрес.

За повече информация относно Subversion, можете да посетите [the
Subversion FAQ][1] и [the Subversion book][2]. Друг вариент е книгата
[Pragmatic Version Control with Subversion][3]

### Усъвършенстване, кръпка по кръпка
{: #patching-ruby}

Основния екип поддържа [a bug tracker][4] за приемането на кръпки и
репорти за бъгове. Тези репорти се публикуват също така и в пощенския
списък [Ruby-Core mailing list][mailing-lists] за дискусия.

На кратко стъпките за изготвянето на кръпка:

1.  Ако пишете кръпка за Ruby 1.8, изтеглете копие от Subversion, като
    използвате клона `ruby_1_8`.

         $ svn co http://svn.ruby-lang.org/repos/ruby/branches/ruby_1_8

    Ако искате да добавите функционалност в Ruby, първо качете кръпката
    в trunk-а на Ruby сорс кода.

         $ svn co http://svn.ruby-lang.org/repos/ruby/trunk ruby

2.  Добавете подобренията на кода.
3.  Създайте кръпка.

         $ svn diff > ruby-changes.patch

4.  Пратете електронно писмо до [Ruby-Core mailing list][mailing-lists]
    с ChangeLog, описващ кръпката.
5.  Ако няма проблеми с кръпката, тя ще бъде предадена за одобрение.

**Забележка:** кръпките трябва да бъдат изпратени като [unified
diff][5]. За повече информация вижте [the diffutils reference][6].

Дискусията ще бъде пренесена на пощенския списък
[Ruby-Core mailing list][mailing-lists].

Помнете, че екипа, който разработва Ruby живее в Япония и въпреки, че
повечето владеят английски, има съществена часова разлика. Бъдете
търпеливи и ако имате проблем – бъдете настойчиви, опитайте пак след
няколко дни.

### Правила за Core разработчиците
{: #coding-standards}

Разработчиците на Ruby трябва да са запознати в общи линии със сорс кода
и стила на писане, използван от основния екип разработчици. За по-голяма
яснота, моля спазвайте следните правила:

* Всички промени трябва да са описани в `ChangeLog`, спазващи [GNU
  конвенциите][7]. (много рубисти ползват Emacs `add-log` mode, който е
  достъпен с командата `C-x 4 a`.)
* Промените трябва да са в японско стандартно време (UTC+9).
* Означените точки във вашия ChangeLog трябва да присъстват в Subversion
  commit съобщение, което ще бъде пратено автоматично като електронна
  поща до Ruby-CVS списъка.
* Стила на писане използва ANSI декларации на функциите в сорс кода
  на Ruby и неговите разширения.
* Моля, не ползвайте C++- стил на коментарите (`//`), а. (`/* .. */`)



[mailing-lists]: /en/community/mailing-lists/
[1]: http://subversion.apache.org/faq.html
[2]: http://svnbook.org
[3]: http://www.pragmaticprogrammer.com/titles/svn/
[4]: https://bugs.ruby-lang.org/
[5]: http://www.gnu.org/software/diffutils/manual/html_node/Unified-Format.html
[6]: http://www.gnu.org/software/diffutils/manual/html_node/Merging-with-patch.html#Merging%20with%20patch
[7]: http://www.gnu.org/prep/standards/standards.html#Change-Logs
