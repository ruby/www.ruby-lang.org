---
layout: news_post
title: "CVE-2021-31810: Vulnerabilidad por confiar en respuestas FTP PASV en Net::FTP"
author: "shugo"
translator:
date: 2021-07-07 09:00:00 +0000
tags: security
lang: es
---

Se ha descubierto una vulnerabilidad en Net::FTP por confiar en respuestas
FTP PASV.
A eta vulnerabilidad se le ha asignado el identificador CVE
[CVE-2021-31810](https://www.cve.org/CVERecord?id=CVE-2021-31810).
Recomendamos enfáticamente actualizar Ruby.

net-ftp es una gema predeterminada en Ruby 3.0.1 pero tiene un
problema de empaquetamiento, así que por favor actualice Ruby completo.

## Detalles

Una servidor FTP malicioso puede usar la respuesta PASV para engañar
a Net::FTP para que se conecte de vuelta a una dirección IP y puerto dados.
Esto potencialmente hace que Net::FTP extraiga información sobre servicios
que de otra manera es privada y que no se publica (e.g. el atacante puede
conducir escaneo de puertos y extraer anuncios de los servicios).

## Versiones afectadas

* Series de Ruby 2.6: 2.6.7 y anteriores
* Series de Ruby 2.7: 2.7.3 y anteriores
* Series de Ruby 3.0: 3.0.1 y anteriores

## Creditos

Agradecemos a [Alexandr Savca](https://hackerone.com/sighook) por
reportar este problema.

## Historia

* Se publicó originalmente el 2021-07-07 09:00:00 UTC
