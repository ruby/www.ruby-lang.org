---
layout: news_post
title: "CVE-2021-32066: Уязвимость StartTLS stripping в Net::IMAP"
author: "shugo"
translator: "nakilon"
date: 2021-07-07 09:00:00 +0000
tags: security
lang: ru
---

В Net::IMAP обнаружена уязвимость StartTLS stripping.
Этой уязвимости присвоен идентификатор [CVE-2021-32066](https://www.cve.org/CVERecord?id=CVE-2021-32066).
Мы настоятельно рекомендуем обновить Ruby.

net-imap является встроенным гемом Ruby 3.0.1, но т.к. есть трудности с его поставкой, следует обновить Ruby целиком.

## Подробности

Net::IMAP не генерирует исключение, когда StartTLS
прерывает работу с неизвестным ответом, что позволяет
обходить защиту TLS атакой man-in-the-middle,
блокируя команду StartTLS. Это называется "атака StartTLS".

## Уязвимые версии

* Ruby 2.6: 2.6.7 и ниже
* Ruby 2.7: 2.7.3 и ниже
* Ruby 3.0: 3.0.1 и ниже

## Авторство

Благодарим [Alexandr Savca](https://hackerone.com/chinarulezzz) за сообщение о проблеме.

## История

* Изначально опубликовано в 2021-07-07 09:00:00 UTC
