---
layout: news_post
title: "Vulnerabilidad en BigDecimal"
author: "Michel Martens"
lang: es
---

Una vulnerabilidad de DoS ha sido descubierta en la BigDecimal, parte de
la librería estándar de Ruby. La conversión de objetos del tipo
BigDecimal a Float puede producir una violación de acceso a memoria
(segmentation fault).

## Importancia

Un atacante puede provocar un ataque de denegación de servicio (DoS, por
\"denial of service\") al intentar que la librería BigDecimal lea un
número muy grande y lo transforme en Float. Por ejemplo:


    BigDecimal("9E69999999").to_s("F")

## Versiones de Ruby vulnerables

### 1.8

* 1\.8.6-p368 y todas las versiones anteriores
* 1\.8.7-p160 y todas las versiones anteriores

### 1.9

* Las versiones 1.9.1 no están afectadas

## Soluciones

### 1.8

Por favor, actualicen a 1.8.6-p369 o ruby-1.8.7-p173.

* [https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.6-p369.tar.gz][1]
* [https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p173.tar.gz][2]



[1]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.6-p369.tar.gz
[2]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p173.tar.gz
