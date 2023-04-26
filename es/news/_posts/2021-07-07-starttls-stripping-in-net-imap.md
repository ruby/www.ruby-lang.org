---
layout: news_post
title: "CVE-2021-32066: Vulnerabilidad de recortado de StartTLS en Net::IMAP"
author: "shugo"
translator: "vtamara"
date: 2021-07-07 09:00:00 +0000
tags: security
lang: es
---

Se descubrió una vulnerabilidad de recortado de StartTLS en Net::IMAP.
A esta vulnerabilidad se le ha asignado el identificador CVE
[CVE-2021-32066](https://www.cve.org/CVERecord?id=CVE-2021-32066).
Recomendamos enfáticamente actualizar Ruby.

net-imap es una gema predeterminada en Ruby 3.0.1 pero tiene un problema
de empaquetado, así que por favor actualice Ruby completo.

## Detalles

Net::IMAP no lanzan una excepción cuando falla StartTLS por una respuesta
desconocida, lo que puede permitir a un atacante intermediario sobrepasar
la proteccíon TLS aprovechando la posición de su red entre el cliente y
el registro para bloquear la orden StartTLS, es decir un
"ataque por recorte de StartTLS."

## Versiones afectadas

* Series de Ruby 2.6: 2.6.7 y anteriores
* Series de Ruby 2.7: 2.7.3 y anteriores
* Serires de Ruby 3.0: 3.0.1 y anteriores

## Creditos

Agradecimientos a [Alexandr Savca](https://hackerone.com/chinarulezzz)
por reportar este problema.

## Historia

* Publicado originalmente el 2021-07-07 09:00:00 UTC
