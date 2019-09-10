---
layout: news_post
title: "Ruby 仓库已从 Subversion 迁移至 Git"
author: "hsbt"
translator: "Delton Ding"
date: 2019-04-23 00:00:00 +0000
lang: zh_cn
---

即日起，Ruby 语言的正式代码仓库（repository）已从 Subversion 迁移至 Git。

新仓库的网页链接为 [https://git.ruby-lang.org](https://git.ruby-lang.org)，由 cgit 生成，我们可以在 Ruby 仓库中直接保存贡献者的 commit hash。

## 开发政策

* 我们不在 cgit 上使用 topic 分支。
* GitHub 仓库仍然会作为镜像，我们不会使用「Merge pull request」功能。
* ruby_2_4、ruby_2_5 和 ruby_2_6 分支仍会继续使用 SVN，在 cgit 上我们不会推送任何东西到这些分支。
* 从 ruby_2_7 开始，我们将会使用 cgit 开发稳定版本的分支。
* 我们不使用 Merge commits。

## 特别感谢

* k0kubun

  k0kubun 积极地开发了有关于发布和 backport 流程的工具链，同時也帮 git 更新了 hook 脚本。

* naruse

  naruse 更新了 Ruby CI 和 Redmine 功能更改(bugs.ruby-lang.org)。

* mame

  mame 为 slack 创建了 commit 通知脚本。

## 未来规划

我们仍有一些工作未完成，如果你在 Git 迁移中发现问题，请在此反馈 [https://bugs.ruby-lang.org/issues/14632](https://bugs.ruby-lang.org/issues/14632)。

请尽情享受。
