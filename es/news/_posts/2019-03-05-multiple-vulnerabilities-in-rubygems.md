---
layout: news_post
title: "Múltiples vulnerabilidades en RubyGems"
author: "hsbt"
translator: vtamara
date: 2019-03-05 00:00:00 +0000
tags: security
lang: es
---

Hay múltiples vulnerabilidades en el RubyGems distribuido con Ruby.
Se [reportan en el blog oficial de RubyGems](http://blog.rubygems.org/2019/03/05/security-advisories-2019-03.html).

## Detalles

Se han reportado las siguientes vulnerabilidaes

* CVE-2019-8320: Eliminar directorio usando enlace cuando se descomprime tar
* CVE-2019-8321: Vulnerabilidad por inyección de secuencia de escape en `verbose`
* CVE-2019-8322: Vulnerabilidad por inyección de secuencia de escape en `gem owner`
* CVE-2019-8322: Vulnerabilidad por inyección de secuencia de escape en manejo de respuesta API
* CVE-2019-8324: Instalar una gema maliciosa puede conducir a ejecutar código arbitrario
* CVE-2019-8325: Vulnerabilidad por inyección de secuencia de escape en errores

Se recomienda a los usuarios de Ruby aplicar alguna de las mitigaciones tan pronto como sea posible.

## Versiones afectadas

* Serie Ruby 2.4: 2.4.5 y anteriores
* Serie Ruby 2.5: 2.5.3 y anteriores
* Serie Ruby 2.6: 2.6.1 y anteriores
* Fuentes del control de versiones antes de la revisión 67168

## Mitigación

RubyGems 2.7.6.2/2.7.9/3.0.3 y posteriores incluyen soluciones a las
vulnerabilidades, así que actualice RubyGems a la versión más reciente.

```
gem update --system
```

Si no puede actualizar RubyGems, puede aplicar los siguientes parches como
mitigación.

* [para Ruby 2.4.5](https://bugs.ruby-lang.org/attachments/7669)
* [para Ruby 2.5.3](https://bugs.ruby-lang.org/attachments/7670)
* [para Ruby 2.6.1](https://bugs.ruby-lang.org/attachments/7671)

En caso de usar fuentes del control de versiones (trunk), actualice a la versión más reciente.

## Creditos

Este reporte se basa en [el blog oficial de RubyGems](http://blog.rubygems.org/2019/03/05/security-advisories-2019-03.html).

## Historia

* Publicado originalmente el 2019-03-05 00:00:00 UTC
* Enlace a los parches actualizados el 2019-03-06 05:26:27 UTC
