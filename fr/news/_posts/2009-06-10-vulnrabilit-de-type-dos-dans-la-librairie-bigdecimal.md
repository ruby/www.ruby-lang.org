---
layout: news_post
title: "Vulnérabilité de type DoS dans la librairie BigDecimal"
author: "Jean-Denis Vauguet"
lang: fr
---

Une faille du type déni de service (DoS) a été révélée dans la librairie
standard BigDecimal. La conversion des objets BigDecimal en Float
ouvrait la voie à des erreurs de segmentations volontaires.

ActiveRecord se base sur cette classe, aussi la plupart des applications
Rails sont elles touchées par ce bug, mais ce n\'est pas une faille
exclusive à Rails.

## Description

Un attaquant peut provoquer un DOS en forçant BigDecimal à scanner un
nombre immense, du type :


    BigDecimal("9E69999999").to_s("F")

## Versions touchées

### branche 1.8

* 1\.8.6-p368 et toutes les versions précédentes
* 1\.8.7-p160 et toutes les versions précédentes

### branche 1.9

* Aucune des versions 1.9.1 n\'est affectée

## Solution

### branche 1.8

Une mise à jour vers 1.8.6-p369 ou ruby-1.8.7-p173 règle le problème.

* [https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.6-p369.tar.gz][1]
* [https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p173.tar.gz][2]



[1]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.6-p369.tar.gz
[2]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p173.tar.gz
