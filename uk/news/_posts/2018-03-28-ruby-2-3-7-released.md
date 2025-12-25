---
layout: news_post
title: "Вийшов Ruby 2.3.7"
author: "usa"
translator: "Andrii Furmanets"
date: 2018-03-28 17:00:00 +0000
lang: uk
---

Ruby 2.3.7 випущено.

Цей випуск включає близько 70 виправлень помилок після попереднього випуску, а також включає кілька виправлень безпеки.
Будь ласка, перевірте теми нижче для деталей.

* [CVE-2017-17742: Розділення HTTP відповіді в WEBrick](/uk/news/2018/03/28/http-response-splitting-in-webrick-cve-2017-17742/)
* [CVE-2018-8777: DoS великим запитом в WEBrick](/uk/news/2018/03/28/large-request-dos-in-webrick-cve-2018-8777/)
* [CVE-2018-6914: Ненавмисне створення файлу та директорії з обходом директорії в tempfile та tmpdir](/uk/news/2018/03/28/unintentional-file-and-directory-creation-with-directory-traversal-cve-2018-6914/)
* [CVE-2018-8778: Недочитування буфера в String#unpack](/uk/news/2018/03/28/buffer-under-read-unpack-cve-2018-8778/)
* [CVE-2018-8779: Ненавмисне створення сокету через отруєний NUL байт в UNIXServer та UNIXSocket](/uk/news/2018/03/28/poisoned-nul-byte-unixsocket-cve-2018-8779/)
* [CVE-2018-8780: Ненавмисний обхід директорії через отруєний NUL байт в Dir](/uk/news/2018/03/28/poisoned-nul-byte-dir-cve-2018-8780/)
* [Множинні вразливості в RubyGems](/uk/news/2018/02/17/multiple-vulnerabilities-in-rubygems/)

Див. [ChangeLog](https://svn.ruby-lang.org/repos/ruby/tags/v2_3_7/ChangeLog) для деталей.

Після цього випуску ми закінчимо нормальну фазу обслуговування Ruby 2.3,
та почнемо фазу обслуговування безпеки.
Це означає, що після випуску 2.3.7 ми ніколи не будемо backport'ити жодних виправлень помилок
до 2.3, крім виправлень безпеки.
Термін фази обслуговування безпеки заплановано на 1 рік.
До кінця цього терміну офіційна підтримка Ruby 2.3 буде закінчена.
Тому ми рекомендуємо вам почати планувати оновлення до Ruby 2.5 або 2.4.

## Завантаження

* [https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.7.tar.bz2](https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.7.tar.bz2)

      РОЗМІР:   14421177 байтів
      SHA1:   3bb88965405da5e4de2432eeb445fffa8a66fb33
      SHA256: 18b12fafaf37d5f6c7139c1b445355aec76baa625a40300598a6c8597fc04d8e
      SHA512: e72754f7703f0706c4b0bccd053035536053451fe069a55427984cc0bc5692b86bd51c243c5f62f78527c66b08300d2e4aa19b73e6ded13d6020aa2450e66a7d

* [https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.7.tar.gz](https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.7.tar.gz)

      РОЗМІР:   17859100 байтів
      SHA1:   540996fec64984ab6099e34d2f5820b14904f15a
      SHA256: 35cd349cddf78e4a0640d28ec8c7e88a2ae0db51ebd8926cd232bb70db2c7d7f
      SHA512: 1ceccf00981d6d60e7587e89a04cc028f976950313ee445db5afd03e323472d3e69a35423733b24f9cbd9729f034cf80d2233b5c159764839f5bee4ca7052fe0

* [https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.7.tar.xz](https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.7.tar.xz)

      РОЗМІР:   11438124 байтів
      SHA1:   c489248730cbce7721edd3e97de81e68eec938b2
      SHA256: c61f8f2b9d3ffff5567e186421fa191f0d5e7c2b189b426bb84498825d548edb
      SHA512: fd91c8db3d3aa4cc962a62f27b4d1a71f6b5567ab836e6dbfbbb1553eb269d11e12faf9e36af6c489c33b54fd89dab99bfe81a563158b704877f0628d6f5bc5a

* [https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.7.zip](https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.7.zip)

      РОЗМІР:   19911423 байтів
      SHA1:   ec6870b39125238d8d57d642225592896ed3b6d9
      SHA256: ffa42eeff928624a05dc7ad39426c855c6e9a757417f17b6fe9e54664ec91012
      SHA512: c85255a7f43c7df2fb11be4f9aa96e2ae70a94d3e963ccff4d8c1349ad6d455d9a436812efb24c91e451e68b8f81e5d335c6d5811b2a0e945a7070c305054434

## Коментар до випуску

Дякую всім, хто допоміг з цим випуском.

Обслуговування Ruby 2.3, включаючи цей випуск, базується на "Угоді для стабільної версії Ruby" Ruby Association.