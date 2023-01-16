---
layout: page
title: "Guía del redactor de Parches"
lang: es
---
Sigue algunos consejos, directamente de Matz, sobre cómo hacer para que tus parches sean considerados.
{: .summary}

Estas pautas fueron adoptadas de una [publicación hecha por Matz][ruby-core-post]
en la lista de distribución de Ruby-Core:

* Implementa una modificación por parche

  Este es el mayor problema para la mayoría de los parches diferidos. Cuando tú
  envias un parche que corrija varios errores (y agregue funciones) a la vez,
  tenemos que separarlos antes de aplicarlos. Es una tarea bastante difícil para nosotros,
  desarrolladores ocupados, por lo que este tipo de parches tiende a aplazarse.
  Por favor, no envies parches grandes.

* Agrega descripciones

  A veces, un simple parche no describe suficientemente el problema que soluciona.
  Una mejor descripción (el problema que soluciona, las condiciones previas, la plataforma, etc.)
  ayudaría a un parche a aplicarse más rápido.

* Haz diff a la última revisión

  Es posible que tu problema se haya solucionado en la última revisión. O el código
  podría ser totalmente diferente a estas alturas. Antes de enviar un parche, intenta recuperar
  la última versión (la rama `trunk` para la última versión de desarrollo,
  `{{ site.svn.stable.branch }}` para {{ site.svn.stable.version }})
  desde el repositorio de Subversion, por favor.

* Usa `diff -u`

  Preferimos los parches de diferencias unificados de estilo `diff -u` a diferencia de `diff -c`
  o cualquier otro estilo de parches. Son mucho más fáciles de revisar.
  No envíes archivos modificados, no queremos hacer un diff por nosotros mismos.

* Proporciona casos de prueba (opcional)

  Un parche que proporciona casos de prueba (preferiblemente un parche para `test/*/test_*.rb`)
  nos ayudaría a comprender el parche y su intención.

Podríamos pasar a un flujo de trabajo push/pull estilo Git en el futuro.
Pero hasta entonces, seguir las pautas anteriores te ayudaría a evitar
una frustración.


[ruby-core-post]: https://blade.ruby-lang.org/ruby-core/25139
