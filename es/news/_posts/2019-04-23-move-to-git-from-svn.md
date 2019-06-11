---
layout: news_post
title: "Repositorio de Ruby movido de Subversion a Git"
author: "hsbt"
translator: vtamara
date: 2019-04-23 00:00:00 +0000
lang: es
---

Hoy, el repositorio canónico del lenguaje de programación Ruby se ha movido de Subversion a Git.

La interfaz web para el nuevo repositorio es [https://git.ruby-lang.org](https://git.ruby-lang.org), y es proveida por cgit. Podemos mantener el condensado (hash) del commit del contribuyente directamente en el repositorio de Ruby.

## Política de desarrollo

* No usamos ramas de corta duración (topic branches) en cgit.
* El repositorio en GitHub seguirá siendo un espejo.  No usamos la
  característica de "Mezclar solicitud de cambio (merge pull request)".
* Las ramas ruby_2_4, ruby_2_5, y ruby_2_6 seguirán usando SVN. No
  enviamos nada a esas ramas a cgit.
* Comenzando con ruby_2_7, usaremos cgit para desarrollar ramas estables.
* No usamos merge commits.

## Agradecimientos especiales

* k0kubun

  k0kubun desarrolló de manera agresiva herramientas para publicar y retro-portar flujos de trabajo y también actualizó el script hook para git.

* naruse

  naruse actualizó los cambios en características de Ruby CI y de Redmine (bugs.ruby-lang.org).

* mame

  mame creó el script para notificar contribuciones en slack.

## Trabajo futuro

Aún debemos completar algunas tareas.  Si encuentra alguna incidencia relacionada con la migración a Git, por favor reportela en [https://bugs.ruby-lang.org/issues/14632](https://bugs.ruby-lang.org/issues/14632).

Disfrutelo!
