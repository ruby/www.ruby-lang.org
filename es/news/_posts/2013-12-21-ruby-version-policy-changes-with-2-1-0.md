---
layout: news_post
title: "Esquema de Semantic Versioning comenzando con Ruby 2.1.0"
author: "zzak"
translator: "David Padilla"
date: 2013-12-21 2:00:00 +0000
lang: es
---

Hemos decidido migrar a una política de [Semantic Versioning](http://semver.org/)
comenzando con Ruby 2.1.0.

Para poder utilizar un esquema de versiones para Ruby hemos decidido migrar
gradualmente a la siguiente política:

## Cambios en la Política

Esta política está basada en una propuesta de el administrador de ruby-lang.org
Hiroshi Shibata ([@hsbt](https://twitter.com/hsbt)).

### Esquema de Versiones

* `MAJOR`: Incrementado cuando hay un cambio incompatible que no puede ser liberado en MINOR.
  * Reservado para eventos especiales.
* `MINOR`: Incrementado cada Navidad, la API puede ser incompatible.
* `TEENY`: Corrección de falla o de seguridad que mantiene compatibilidad de API.
  * Puede ser incrementada a más de 10 (como `2.1.11`), y será liberada cada 2-3 meses.
* `PATCH`: Número de commits desde la última versión `MINOR` (volverá a ser 0 después de liberar una versión `MINOR`).

### Esquema de Branching

Se mantendrán los siguientes branches:

* trunk
* `ruby_{MAJOR}_{MINOR}`

El branch de `ruby_{MAJOR}_{MINOR}` será mantenido a través de entregas `TEENY`.
Se utilizarán tags para cada entrega.

### Compatibilidad de API

Los siguientes cambios han sido marcados como incompatibles y requieren
un incremento en la version `MINOR`:

* Remover características de API a nivel de C.
* Cambios o adiciones incompatibles con versiones anteriores.

### Compatibilidad de ABI

La ABI cumplirá con el siguiente esquema: `{MAJOR}.{MINOR}.0`

Pondremos nuestro mayor esfuerzo en mantener la compatibilidad de la ABI con el
mismo nivel de entregas de `MINOR`. Por lo tanto `TEENY` será corregida en 0.

## Referencias

Para leer más acerca de esta propuesta por favor ve a las siguientes ligas:

* [Introducing a semantic versioning scheme and branching policy](https://bugs.ruby-lang.org/issues/8835)
* [Accepted proposal in English](https://gist.github.com/sorah/7803201)
* [Accepted proposal in Japanese](https://gist.github.com/hsbt/7719305)

## ¡Gracias!

Me gustaría agradecer personalmente a todas las personas que participaron en
esta discusión. Cada paso que tomamos nos acerca a un Ruby más estable y efectivo.
