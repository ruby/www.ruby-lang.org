---
layout: news_post
title: "Datadog provee soporte comunitario (software de código abierto) para ruby-lang.org"
author: "hsbt"
translator: vtamara
date: 2024-05-30 00:00:00 +0000
lang: es
---

Nos emociona anunciar que el sitio oficial de Ruby, ruby-lang.org,
ha adoptado Datadog para el monitoreo proveido por el
[soporte comunitario de Datadog para software de código abierto](https://opensource.datadoghq.com/projects/oss-program/).

Esto nos permite monitorear efectivamente el desempeño y disponibilidad del
sitio en tiempo real para los usuarios de Ruby.
Los beneficios clave de usar Datadog incluyen los siguientes.

## Visibilidad del CDN

cache.ruby-lang.org proveido por Fastly es la infraestructura más importante
para el ecosistema Ruby. Datadog permite monitorear el desempeño de la
Red de Entrega de Contenido (CDN).  Registra la cobertura del cache y la
tasa de errores mejorando la experiencia de usuario.

## Visualizción unificada de los datos

Tenemos varios servicios web para ruby-lang.org.
Datadog permite visualizar datos de análisis de las bitácoras junto
con métricas y monitoreo de desempeño de la aplicación (APM) en un
mismo tablero.

## Visibilidad de la traza JIT

Al utilizar las capacidades de rastreo de Datadog, podemos capturar trazas como
flujos de peticiones entre servidores web y bases de datos.
Esto ayuda a identificar cuellos de botella y peticiones problemáticas.

Publicamos el [tablero público](https://p.ap1.datadoghq.com/sb/1271b83e-af90-11ee-9072-da7ad0900009-01633a8fa8c0b0c0051f1889afdf55dc)
de nuestras métricas clave.
Actualizaremos el tablero mientras seguimos mejorando nuestro monitoreo,
especialmente del desempeño YJIT.

Esperamos que esta adopción de Datadog contribuya a un desempeño mejorado
para la comunidad Ruby.

Por favor siga usando ruby-lang.org y disfrute de una experiencia
de usuario mejorada.
