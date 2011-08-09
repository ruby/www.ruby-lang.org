---
layout: news_post
title: "Излезе Ruby 1.9.2"
lang: bg
---

 Излезе Ruby 1.9.2. Това е последната стабилна версия от серията 1.9. ### 

Новата версия 1.9.2 e почти изцяло съвместима с 1.9.1, изключение правят
следните промени:

* Много нови методи
* Ново socket API (подобрена поддръжка на IPv6)
* Нови кодирания
* Random клас, който поддържа няколко генератори на случайни числа
* Time класа е реимплементиран. Липсва проблема с 2038 година.
* подобрения в обработката на регулярни изрази
* $: не включва текущата директория.
* dl е реимплементиран на основата на libffi.
* нова psych библиотека на базата на libyaml, която може да замени
  успешно syck.

Виж [NEWS][1] и [ChangeLog][2] за повече детайли.

Ruby 1.9.2 покрива повече от 99% от [RubySpec][3].

### 

Ruby 1.9 има четири нива на поддръжка.


: Поверили сме, че Ruby 1.9.2 работи добре на тези платформи.
  * Debian GNU/Linux 5.0 на IA32.


: Поверили сме, че Ruby 1.9.2 работи добре на повечето от тях.
  * mswin32, x64-mswin64, mingw32
  * MacOS X 10.5 (Intel) и 10.6
  * FreeBSD 6 и следващи amd64, IA32)
  * Solaris 10
  * Symbian OS


: Мислим, че Ruby 1.9.2 ще работи добре на тези платформи с леки
  модификации.
  * Други Linux дистрибуции
  * Други версии на MacOS X.
  * cygwin
  * AIX 5
  * Други POSIX-съвместими операционни системи
  * BeOS (Haiku)

### 


: Тази версия е съвместима на ниво библиотеки. Ruby 1.9.2 е почти
  напълно съвместима с 1.9.1, за това библиотеките се инсталират в
  директорията на 1.9.1.


: `$:` не включва вече текущата директория. По тази причина някои
  скриптове трябва да бъдат модифицирани за да работят коректно.

### 

* [&lt;URL:http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p0.tar.bz2&gt;][4]
  
  : 8495472 bytes
  
  
  : d8a02cadf57d2571cd4250e248ea7e4b
  
  
  : e9710990ed8c2e794123aba509010471915fb13c27dae0118831d2001a9c8d3b

* [&lt;URL:http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p0.tar.gz&gt;][5]
  
  : 10787899 bytes
  
  
  : 755aba44607c580fddc25e7c89260460
  
  
  : 8c0c4e261a921b5c406bf9e76ac23bf3c915651534e9d1b9e8c5d0bee4a7285c

* [&lt;URL:http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p0.zip&gt;][6]
  
  : 12159728 bytes
  
  
  : e57a393ccd62ddece4c63bd549d8cf7f
  
  
  : e61521af06da71fde9f0c7c08baaf7415614d00c86ec5a7ab08b60a4f3185b2a



[1]: http://svn.ruby-lang.org/repos/ruby/tags/v1_9_2_0/NEWS 
[2]: http://svn.ruby-lang.org/repos/ruby/tags/v1_9_2_0/ChangeLog 
[3]: http://www.rubyspec.org 
[4]: http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p0.tar.bz2 
[5]: http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p0.tar.gz 
[6]: http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p0.zip 
