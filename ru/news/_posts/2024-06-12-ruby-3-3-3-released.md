---
layout: news_post
title: "Выпуск Ruby 3.3.3"
author: "k0kubun"
translator: "suban05"
date: 2024-06-12 00:30:00 +0000
lang: ru
---

Вышел Ruby 3.3.3.

Этот релиз включает:

* RubyGems 3.5.11
* Bundler 2.5.11
* REXML 3.2.8
* strscan 3.0.9
* `--dump=prism_parsetree` заменен на `--parser=prism --dump=parsetree`
* Недопустимые символы кодировки вызывают `SyntaxError` вместо `EncodingError`
* Исправлена утечка памяти при разборе в Ripper
* Исправления ошибок для YJIT, `**{}`, `Ripper.tokenize`, `RubyVM::InstructionSequence#to_binary`, `--with-gmp` и некоторых сборочных окружений

Пожалуйста, ознакомьтесь с [релизами на GitHub](https://github.com/ruby/ruby/releases/tag/v3_3_3) для получения дополнительных деталей.

## Скачать

{% assign release = site.data.releases | where: "version", "3.3.3" | first %}

* <{{ release.url.gz }}>

      SIZE: {{ release.size.gz }}
      SHA1: {{ release.sha1.gz }}
      SHA256: {{ release.sha256.gz }}
      SHA512: {{ release.sha512.gz }}

* <{{ release.url.xz }}>

      SIZE: {{ release.size.xz }}
      SHA1: {{ release.sha1.xz }}
      SHA256: {{ release.sha256.xz }}
      SHA512: {{ release.sha512.xz }}

* <{{ release.url.zip }}>

      SIZE: {{ release.size.zip }}
      SHA1: {{ release.sha1.zip }}
      SHA256: {{ release.sha256.zip }}
      SHA512: {{ release.sha512.zip }}

## Комментарий к выпуску

Многие коммитеры, разработчики и пользователи, которые предоставляли отчеты об ошибках, помогли нам в создании этого выпуска.
Благодарим их за вклад.
