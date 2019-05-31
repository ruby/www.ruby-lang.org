---
layout: news_post
title: "آسیب پذیری‌های متعددی در RubyGems"
author: "hsbt"
translator: "Goudarz Jafari"
date: 2019-03-05 00:00:00 +0000
tags: security
lang: fa
---

RubyGems همراه با روبی دارای چندین آسیب پذیری است.
این در [وبلاگ رسمی RubyGems گزارش شده است](http://blog.rubygems.org/2019/03/05/security-advisories-2019-03.html).

## جزئیات

آسیب پذیری‌های زیر گزارش شده است.

* CVE-2019-8320: Delete directory using symlink when decompressing tar
* CVE-2019-8321: Escape sequence injection vulnerability in `verbose`
* CVE-2019-8322: Escape sequence injection vulnerability in `gem owner`
* CVE-2019-8323: Escape sequence injection vulnerability in API response handling
* CVE-2019-8324: Installing a malicious gem may lead to arbitrary code execution
* CVE-2019-8325: Escape sequence injection vulnerability in errors

به شدت به کاربران روبی توصیه می‌شود که یکی از راه حل‌های زیر را در اسرع وقت انجام دهید.

## نسخه‌های آسیب دیده

* سری روبی ۲٫۴: ۲٫۴٫۵ و قبل از آن
* سری روبی ۲٫۵: ۲٫۵٫۳ و قبل از آن
* سری روبی ۲٫۶: ۲٫۶٫۱ و قبل از آن
* قبل از بازنگری trunk ۶۷۱۶۸

## راه حل‌ها

RubyGems ۲٫۷٫۶/۲٫۷٫۹/۳٫۰٫۳ یا بعدا شامل اصلاح آسیب پذیری‌ها می‌شود، بنابراین RubyGems را به آخرین نسخه ارتقا دهید.

```
gem update --system
```

اگر شما نمی‌توانید RubyGems را ارتقا دهید، می‌توانید وصله‌های زیر را به عنوان یک راه حل اعمال کنید.

* [برای روبی ۲٫۴٫۵](https://bugs.ruby-lang.org/attachments/7669)
* [برای روبی ۲٫۵٫۳](https://bugs.ruby-lang.org/attachments/7670)
* [برای روبی ۲٫۶٫۱](https://bugs.ruby-lang.org/attachments/7671)

درباره trunk، به‌روزرسانی به آخرین نسخه.

## اعتبار

این گزارش بر اساس [وبلاگ رسمی RubyGems](http://blog.rubygems.org/2019/03/05/security-advisories-2019-03.html) است.

## تاریخچه

* در اصل در تاریخ ۱۳۹۷/۱۲/۱۴ ۰۴:۳۰:۰۰ IRDT منتشر شده است.
* لینک به وصله‌های به‌روز شده در تاریخ ۱۳۹۷/۱۲/۱۵ ۰۹:۵۶:۰۰ IRDT انجام شده.
