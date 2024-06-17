---
layout: news_post
title: "CVE-2021-31799: Vulnerabilidad de inyección de ordenes en RDoc"
author: "aycabta"
translator: "vtamara"
date: 2021-05-02 09:00:00 +0000
tags: security
lang: es
---

Hay una vulnerabilidad de Inyección de Ordenes en el RDoc que se
distribuye con Ruby.
Se recomienda a todos los usuarios de Ruby que actualicen RDoc a
la versión más reciente que resuelve el problema.

## Detalles

Se ha reportado la siguiente vulnerabilidad.

* [CVE-2021-31799](https://www.cve.org/CVERecord?id=CVE-2021-31799)

RDoc solía llamar `Kernel#open` para abrir un archivo local.
Si un proyecto Ruby tiene un archivo cuyo nombre comience con `|`
y termine con `tags`, la orden que siga al carácter de tubería
será ejecutada.
Un proyecto Ruby malicioso podría explotar esto para ejecutar
ordenes arbitrarías como el usuario que intente ejecutar la orden
`rdoc`.

Los usuarios de Ruby cuya versión de RDoc sea afectada por esta
situación deben actualizar a la versión más reciente de RDoc.

## Versiones afectadas

* Todas las versiones de RDoc desde la 3.11 hasta la 6.3.0

## Cómo actualizar

Para corregir la vulnerabilidad ejecute la siguiente orden que
actualizará RDoc a la última versión (6.3.1 o más reciente)

```
gem install rdoc
```

Si usa bundler, por favor añada `gem "rdoc", ">= 6.3.1"` a su Gemfile.

## Creditos

Agradecemos a [Alexandr Savca](https://hackerone.com/sighook)
por reportar el problema.

## Historia

* Publicado originalmente el 2021-05-02 09:00:00 UTC
