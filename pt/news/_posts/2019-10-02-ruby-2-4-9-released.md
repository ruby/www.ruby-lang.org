---
layout: news_post
title: "Lançado Ruby 2.4.9"
author: "usa"
translator: "jcserracampos"
date: 2019-10-02 09:00:00 +0000
lang: pt
---

Ruby 2.4.9 foi lançado.

Esta versão é um reenpacotamento da 2.4.8 porque o tarball da versão
Ruby 2.4.8 anterior não instalava.
(Veja [[Bug #16197]](https://bugs.ruby-lang.org/issues/16197) em detalhes.)
Essencialmente, não existem mudanças exceto pelo número de versão entre 2.4.8 e 2.4.9.

Ruby 2.4 está sob o estado de fase de manutenção de segurança, até
o fim de março de 2020. Depois dessa data, manutenção de Ruby 2.4
será finalizada. Recomendamos que comece a planejar a migração para novas
versões de Ruby, como a 2.6 ou 2.5.

## Download

{% assign release = site.data.releases | where: "version", "2.4.9" | first %}

* <{{ release.url.bz2 }}>

      SIZE: {{ release.size.bz2 }}
      SHA1: {{ release.sha1.bz2 }}
      SHA256: {{ release.sha256.bz2 }}
      SHA512: {{ release.sha512.bz2 }}

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

## Comentário de Versão

Obrigado a todas as pessoas que ajudaram com esta versão.
