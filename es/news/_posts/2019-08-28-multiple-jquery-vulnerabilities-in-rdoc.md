---
layout: news_post
title: "Multiples vulnerabilidades de jQuery en RDoc"
author: "aycabta"
translator: vtamara
date: 2019-08-28 09:00:00 +0000
tags: security
lang: es
---


Hay multiples vulnerabilidades tipo Cross-Site Scripting (XSS) en el jQuery
incluido con RDoc que es empaquetado en Ruby.
A todos los usuarios de Ruby se les recomienda actualizar Ruby a la versión
más reciente que incluye la versión reparada de RDoc.

## Detalles

Se han reportado las siguientes vulnerabilidades.

* [CVE-2012-6708](https://www.cve.org/CVERecord?id=CVE-2012-6708)
* [CVE-2015-9251](https://www.cve.org/CVERecord?id=CVE-2015-9251)

Se recomienda de manera especial a todos los usuarios de Ruby actualizar
la instalación de Ruby o emplear tan pronto sea posible una de las
soluciones alternas descritas más adelante.
También debe regenerar la documentación RDoc existente para mitigar
completamente las vulnerabilidades.

## Versiones afectadas

* Series de Ruby 2.3: todas
* Series de Ruby 2.4: 2.4.6 y anteriores
* Series de Ruby 2.5: 2.5.5 y anteriores
* Series de Ruby 2.6: 2.6.3 y anteriores
* lo anterior a la contribución en master f308ab2131ee675000926540cbb8c13c91dc3be5

## Acciones requeridas

RDoc es una herramienta para generación de documentación estática.
Reparar la herramienta misma no es suficiente para mitigar estas
vulnerabilidades.

Así que, documentación RDoc generada con versiones previas
deben ser regeneradas con un RDoc reciente.

## Soluciones alternas

En principio debe actualizar su instalación de Ruby a la versión más
reciente.
RDoc 6.1.2 o posteriores incluye solución a las vulnerabilidades, así que
actualice RDoc a la versión más reciente si no puede
actualizar Ruby mismo.

Note que como se mencionó antes, debe volver a generar la documentación
RDoc.

```
gem install rdoc -f
```

*Actualización:* La versión inicial de esta publicación, mencionaba
parcialmente rdoc-6.1.1.gem, que también era vulnerable.
Asegurese de instalara rdoc-6.1.2 o posterior.

Respecto a la versión de desarrollo, actualiza al HEAD más reciente de la
rama master.

## Creditos

Agradecimientos a [Chris Seaton](https://hackerone.com/chrisseaton) por reportar el problema.

## Historia

* Publicado originalmente el 2019-08-28 09:00:00 UTC
* Versión RDoc arreglada el 2019-08-28 11:50:00 UTC
* Mejoras menores al idioma el 2019-08-28 12:30:00 UTC
