---
layout: news_post
title: "Multiples vulnerabilidades en RubyGems"
author: "usa"
translator: "Espartaco Palma"
date: 2017-08-29 12:00:00 +0000
tags: security
lang: es
---

Existen múltiples vulnerabilidades en la version de RubyGem que incluye Ruby.
Ha sido [reportado en el blog oficial de Rubygems](http://blog.rubygems.org/2017/08/27/2.6.13-released.html).

## Detalles

Fueron reportadas las siguientes vulnerabilidades:

* una vulnerabilidad de secuestro de peticiones DNS. (CVE-2017-0902)
* una vulnerabilidad en secuencia de escape ANSI. (CVE-2017-0899)
* una vulnerabilidad del tipo DoS en el comando *query*. (CVE-2017-0900)
* una vulnerabilidad en el instalador de gemas, la cual permite
 a una gema maliciosa el sobreescribir archivos arbitrariamente. (CVE-2017-0901)

Se recomienda a los usuarios de Ruby a actualizar o tomar alguna de las
siguientes opciones tan pronto como sea posible.

## Versiones afectadas

* Ruby 2.2: 2.2.7 y anteriores
* Ruby 2.3: 2.3.4 y anteriores
* Ruby 2.4: 2.4.1 y anteriores
* antes de *trunk* revision 59672

## Soluciones alternativas

Si no puede actualizar Ruby, actualice RubyGems a la última versión.
RubyGems 2.6.13 y posteriores incluye la corrección para éstas
vulnerabilidades.

```
gem update --system
```

Si no puede actualizar RubyGems, puede aplicar el parche correspondiente
como una solución alternativa.

* [para Ruby 2.2.7](https://bugs.ruby-lang.org/attachments/download/6690/rubygems-2613-ruby22.patch)
* [para Ruby 2.3.4](https://bugs.ruby-lang.org/attachments/download/6691/rubygems-2613-ruby23.patch)
* Para Ruby 2.4.1: se necesitan 2 parches. Aplíquelos secuencialmente:
  1. [Pasar RubyGems 2.6.11 a 2.6.12](https://bugs.ruby-lang.org/attachments/download/6692/rubygems-2612-ruby24.patch)
  2. [Pasar RubyGems 2.6.12 a 2.6.13](https://bugs.ruby-lang.org/attachments/download/6693/rubygems-2613-ruby24.patch)

En el caso de trunk, actualice a la última revisión.

## Créditos

Este reporte está basado en [el blog oficial de RubyGems](http://blog.rubygems.org/2017/08/27/2.6.13-released.html).

## Historial

* Publicado originalmente: 2017-08-29 12:00:00 UTC
* Agregado el número CVE: 2017-08-31 2:00:00 UTC
* Mención de la actualización de Rubies: 2017-09-15 12:00:00 UTC
