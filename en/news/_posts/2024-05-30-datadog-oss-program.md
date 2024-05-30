---
layout: news_post
title: "Datadog provides OSS community support for ruby-lang.org"
author: "hsbt"
translator:
date: 2024-05-30 00:00:00 +0000
lang: en
---

We are excited to announce that Ruby's official website, ruby-lang.org, has adopted Datadog for monitoring by [Datadog OSS community support](https://opensource.datadoghq.com/projects/oss-program/).

This allows us to effectively monitor the performance and availability of the site in real time for Ruby users. This key benefits of using Datadog include the following.

## CDN Visibility

cache.ruby-lang.org provided by Fastly is most important infrastructure of Ruby ecosystem. Datadog enables monitoring of Content Delivery Network (CDN) performance. It tracks cache coverage, error rate, enhancing user experiences.

## Unified Data Visualization

We have various web services for ruby-lang.org. Datadog allows to visualize log analytics data alongside metrics and application performance monitoring (APM) data in the same dashboards.

## JIT Trace Visibility

By utilizing Datadog’s tracing capabilities, we can capture traces as requests flow through web servers and databases. This helps identify bottlenecks and problematic requests.

We published the [public dashboard](https://p.ap1.datadoghq.com/sb/1271b83e-af90-11ee-9072-da7ad0900009-01633a8fa8c0b0c0051f1889afdf55dc) of our key metrics. We will update the dashboard as we continue to improve our monitoring especially YJIT performance.

We hope that this adoption of Datadog will contribute to improved site performance for the Ruby community. Please continue to use ruby-lang.org and enjoy an enhanced user experience.
