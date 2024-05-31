---
layout: news_post
title: "Datadog 为 ruby-lang.org 提供开源软件社区支持"
author: "hsbt"
translator: "GAO Jun"
date: 2024-05-30 00:00:00 +0000
lang: zh_cn
---

我们很激动地宣布 Ruby 官方站点，ruby-lang.org，采用了 Datadog 的 [Datadog 开源软件社区支持](https://opensource.datadoghq.com/projects/oss-program/) 来进行运维监控。

这使我们能够有效地实时监控 Ruby 用户站点的性能和可用性。使用 Datadog 的好处包括以下几点：

## CDN 可见性

由 Fastly 提供的 cache.ruby-lang.org 是 Ruby 生态系统中的重要一环。Datadog 能监控 CDN 的性能，跟踪缓存覆盖率和错误率，提升用户体验。

## 统一的数据可视化

ruby-lang.org 提供了多种 Web 服务。Datadog 能够在同一仪表板中可视化地呈现日志分析数据以及应用程序性能监控 (APM) 数据。

## JIT 跟踪可见性

通过 Datadog 的跟踪功能，我们可以在请求通过 Web 服务器和数据库时进行捕获并跟踪。这有助于识别瓶颈和有问题的请求。

我们发布了关键指标的 [公共仪表板](https://p.ap1.datadoghq.com/sb/1271b83e-af90-11ee-9072-da7ad0900009-01633a8fa8c0b0c0051f1889afdf55dc)。随着我们持续改进监控，尤其是 YJIT 性能，我们将相应地更新仪表板。

我们希望采用 Datadog 能有助于提高 Ruby 社区的站点性能。请继续使用 ruby-lang.org 来享受更好的用户体验。
