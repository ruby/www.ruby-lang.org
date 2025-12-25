---
layout: news_post
title: "helium.ruby-lang.org було зламано"
author: "Shugo Maeda"
translator: "Andrii Furmanets"
lang: uk
---

У п'ятницю, 28 травня, ми виявили, що хтось зламав helium.ruby-lang.org
через CVS.

На щастя, процес cvs працював у середовищі chroot,
тому вплив на інші сервіси/контент був не такий ймовірний, але
ми зараз це підтверджуємо.
Наразі не знайдено втручань поза середовищем
chroot.

Найбільш тривожним контентом є репозиторії CVS, але ці
дистрибутиви не зачеплені принаймні.

    5d52c7d0e6a6eb6e3bc68d77e794898e  ruby-1.8.1.tar.gz
    bf48d49dbd94b5c0eda5f75b3bfbac16  ruby-1.6.8.tar.gz

Сервіси розсилки перезапущено, але CVS/WWW/FTP/RSYNC
ще зупинено, вибачте.

Додаткова інформація буде надана на https://www.ruby-lang.org/.
Для більшої інформації, будь ласка, надішліть листа на admin@ruby-lang.org.

