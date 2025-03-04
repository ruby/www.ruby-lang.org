---
layout: news_post
title: "Avisos de seguridad: CVE-2025-27219, CVE-2025-27220 y CVE-2025-27221"
author: "hsbt"
translator: vtamara
date: 2025-02-26 07:00:00 +0000
tags: security
lang: es
---

Publicamos avisos de seguridad para CVE-2025-27219, CVE-2025-27220 y
CVE-2025-27221. Por favor vea detalles a continuación.

## CVE-2025-27219: Denegación de Servicio en `CGI::Cookie.parse`.

Hay posibilidad de una DoS por la gema cgi.  A esta vulnerabilidad se
le ha asignado el identificador
[CVE-2025-27219](https://www.cve.org/CVERecord?id=CVE-2025-27219).
Recomendamos actualizar la gema cgi.

### Detalles

`CGI::Cookie.parse` tomaba tiempo super-lineal para analizar una
cadena con una cookie en algunos casos.
Suministrar una cadena de cookie manipulada a ese método podría
conducir a una Denegación de Servicio.

Por favor actualice la gema CGI a la versión 0.3.5.1, 0.3.7, 0.4.2 o
posterior.

### Versiones afectadas

* Gema cgi versiones <= 0.3.5, 0.3.6, 0.4.0 y 0.4.1.

### Créditos

Agradecemos a [lio346](https://hackerone.com/lio346) por descubrir
este problema. También agradecemos a
[mame](https://github.com/mame) por corregirlo.

## CVE-2025-27220: ReDoS en `CGI::Util#escapeElement`.

Hay posibilidad de una Denegación de Servicio por Expresión Regular (ReDoS)
por parte de la gema cgi.
A esta vulnerabilidad se le ha asignado el identificador
[CVE-2025-27220](https://www.cve.org/CVERecord?id=CVE-2025-27220).
Recomendamos actualizar la gema cgi.

### Detalles

La expresión regular usada en `CGI::Util#escapeElement` es
vulnerable a ReDoS. Una entrada diseñada podría conducir a un alto
consumo de CPU.

Esta vulnerabilidad sólo afecta a Ruby 3.1 y 3.2. Si usa estas versiones,
por favor actualice la gema CGI a la versión 0.3.5.1, 0.3.7, 0.4.2 o posterior.

### Versiones afectadas

* Gema cgi versiones <= 0.3.5, 0.3.6, 0.4.0 y 0.4.1.

### Créditos

Gracias a [svalkanov](https://hackerone.com/svalkanov) por descubrir
el problma. También gracias a [nobu](https://github.com/nobu) por
corregir esta vulnerabilidad.

## CVE-2025-27221: fuga de información del usuario en `URI#join`,
`URI#merge` y `URI#+`.

Hay posibilidad de que se fugue información con la gema uri.  A esta
vulnerabilidad se le ha asignado el identificador
[CVE-2025-27221](https://www.cve.org/CVERecord?id=CVE-2025-27221).
Recomendamos actualizar la gema uri.

### Detalles

Los métodos `URI#join`, `URI#merge`, y `URI#+` retienen información
del usuario, tales como `user:password`, incluso aún después de que
la máquina es reemplazada.  Cuando genera un URL para una máquina
maliciosa a partir de una URL que contenga información de usuario
secreta usando este método, y teniendo que alguien accede a la URL,
podría ocurrir una fuga de datos no intencionada.

Por favor actualizar la gema URI a las versiones 0.11.3, 0.12.4, 0.13.2, 1.0.3
o posterior.

### Versiones Afectadas

* Gema uri versions < 0.11.3, 0.12.0 to 0.12.3, 0.13.0, 0.13.1 y
  1.0.0 a 1.0.2.

### Créditos

Agradecemos a [Tsubasa Irisawa (lambdasawa)](https://hackerone.com/lambdasawa)
por descubrir este problema. También agradecemos a
[nobu](https://github.com/nobu) por correcciones adicionales
para esta vulnerabilidad.

## Historia

* Publicado originalmente el 2025-02-26 7:00:00 (UTC)
