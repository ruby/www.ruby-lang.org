---
layout: news_post
title: "修复了与 GitLab 的 CVE-2026-89078、CVE-2026-93577、CVE-2026-97229 和 CVE-2026-110264 相关的正则表达式编译问题"
author: "k0kubun"
translator: "GAO Jun"
date: 2026-10-23 03:11:22 +0000
tags: security
lang: zh_cn
---

我们发布了 Ruby 4.0.9、3.4.12 和 3.3.13。这些版本修复了 Ruby 的正则表达式引擎 (Onigmo) 中的几个问题。
GitLab 发现这些缺陷可被用于在 GitLab 服务器上实现远程代码执行。GitLab 针对这些问题发布了四个 CVE，而 Ruby
的这些新版本包含了对这些问题的底层修复。

## 背景

GitLab 会使用 `Regexp.new` 编译用户提供的正则表达式（例如 CI 配置中的正则表达式）。
GitLab 发现，Ruby 在编译特殊构造的正则表达式时可能会破坏内存，这些缺陷还可能被进一步利用，从而在 GitLab 服务器上实现远程代码执行。
GitLab 在其自身版本中通过修补其随附的 Ruby 解决了这些问题，并分配了以下 CVE 编号：

* [CVE-2026-89078](https://www.cve.org/CVERecord?id=CVE-2026-89078): Double Free issue in Regular Expression Parser ([GitLab 19.4.1](https://docs.gitlab.com/releases/patches/patch-release-gitlab-19-4-1-released/))
* [CVE-2026-93577](https://www.cve.org/CVERecord?id=CVE-2026-93577): Integer Overflow issue in Regular Expression Compiler ([GitLab 19.4.1](https://docs.gitlab.com/releases/patches/patch-release-gitlab-19-4-1-released/))
* [CVE-2026-97229](https://www.cve.org/CVERecord?id=CVE-2026-97229): Integer Overflow issue in CI/CD Regular Expression Compiler ([GitLab 19.4.2](https://docs.gitlab.com/releases/patches/patch-release-gitlab-19-4-2-released/))
* [CVE-2026-110264](https://www.cve.org/CVERecord?id=CVE-2026-110264): Integer Overflow issue in Regular Expression Compiler ([GitLab 19.5.1](https://docs.gitlab.com/releases/patches/patch-release-gitlab-19-5-1-released/))

## Ruby 中的修复

下表列出了每个 CVE 对应的 Ruby 变更，以及 Ruby 各系列中首个包含该修复的版本。

| GitLab CVE | Ruby 中的缺陷| 变更 | Ruby 安全公告 | Ruby 4.0 | Ruby 3.4 | Ruby 3.3 |
|---|---|---|---|---|---|---|
| CVE-2026-89078 | 在 alternation（分支）之后，若模式解析失败会发生双重释放 | [#13332](https://github.com/ruby/ruby/pull/13332) | [GHSA-gfj3-8wj9-qx8p](https://github.com/ruby/ruby/security/advisories/GHSA-gfj3-8wj9-qx8p) | 4.0.0 | 3.4.12 | 3.3.13 |
| CVE-2026-93577, CVE-2026-97229 | 编译后的正则表达式中，模式大小发生整数溢出 | [#19020](https://github.com/ruby/ruby/pull/19020) | [GHSA-22mf-ggw7-pxfx](https://github.com/ruby/ruby/security/advisories/GHSA-22mf-ggw7-pxfx) | 4.0.8 | 3.4.12 | 3.3.13 |
| CVE-2026-110264 | 含大量重复的正则表达式中，内部 ID 发生整数溢出 | [#16801](https://github.com/ruby/ruby/pull/16801) | [GHSA-qm4g-8pfh-6996](https://github.com/ruby/ruby/security/advisories/GHSA-qm4g-8pfh-6996) | 4.0.9 | 3.4.12 | 3.3.13 |

Ruby 4.0.9、3.4.12 和 3.3.13 包含了所有修复。

## 受影响对象

只有当应用程序使用攻击者提供的字符串编译正则表达式时，才会触发这些缺陷，例如将其传给 `Regexp.new`、`Regexp.union`、
`Regexp.compile`，或将其插值到正则表达式字面量中，如 `/#{input}/`。仅使用开发者自己编写的正则表达式的应用程序不受影响。

`Regexp.timeout` 无法避免这些缺陷。限制正则表达式长度也不能可靠地防御它们，因为其中一些缺陷可由较短的正则表达式触发。

## 建议措施

我们建议升级到 Ruby 4.0.9、3.4.12、3.3.13 或更高版本。

如果无法升级，请避免从不受信任的输入编译正则表达式。

Ruby 3.3 处于安全维护阶段；此阶段中，我们只发布安全修复。Ruby 3.3.13 作为例外包含了这些修复，
因为 GitLab 为需要这些修复的问题分配了 CVE。

## 关于 CVE 编号

更新（2026-11-17）：我们现在将这些问题视为 Ruby 中的漏洞。我们已在 ruby/ruby 仓库中为每个问题发布了安全公告，
详见前表，并为其申请了 CVE 编号。待 CVE 编号分配后，我们会将其添加到本页。

最初发布本页时，我们没有为这些修复申请 Ruby 侧的 CVE 编号，原因如下。

Ruby 通常认为，编译并使用来自不可信来源的正则表达式是不安全的。
我们在 [CVE-2022-28738]({% link zh_cn/news/_posts/2022-04-12-double-free-in-regexp-compilation-cve-2022-28738.md %})
的公告中说明了这一点；不过在全面评估后，我们仍将 Regexp 编译中的双重释放视为漏洞。
我们对 [CVE-2024-27282]({% link zh_cn/news/_posts/2024-04-23-arbitrary-memory-address-read-regexp-cve-2024-27282.md %}) 也做了同样处理。

然而，[Regexp 文档](https://docs.ruby-lang.org/en/master/Regexp.html#class-Regexp-label-Timeouts) 仅从拒绝服务角度讨论不可信模式，并建议设置超时限制。它没有明确说明编译不可信正则表达式是否属于 Ruby 支持的用例。
我们随后进行了讨论，并决定：编译不可信正则表达式所导致的内存破坏属于 Ruby 的漏洞，因此我们发布了上述安全公告。

在 CVE 编号分配之前，如果你需要追踪这些问题（例如在安全扫描器中），请先参考上述 Ruby 安全公告或 GitLab 的 CVE 编号。

## 致谢

感谢 Johan Carlsson ([joaxcar](https://github.com/joaxcar)) 通过 GitLab 的漏洞赏金计划发现了由 [#19020](https://github.com/ruby/ruby/pull/19020) 修复的整数溢出问题，
同时感谢 GitLab 向我们报告这些问题并协调修复。

## 历史

* 最初发布于 2026-10-23 03:11:22 (UTC)
* 更新于 2026-11-17 04:28:40 (UTC)：添加 Ruby 安全公告，并将本页标记为安全公告
