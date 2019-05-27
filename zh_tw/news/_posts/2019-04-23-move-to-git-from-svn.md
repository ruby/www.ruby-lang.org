---
layout: news_post
title: "Ruby 存放區已從 Subversion 移至 Git"
author: "hsbt"
translator: "Vincent Lin"
date: 2019-04-23 00:00:00 +0000
lang: zh_tw
---

今天，Ruby 程式語言的正式存放區（repository）已從 Subversion 移至 Git。

新存放區的網頁介面為 [https://git.ruby-lang.org](https://git.ruby-lang.org)，由 cgit 產生，我們可以在 Ruby 存放區中直接保存貢獻者的 commit hash 。

## 開發政策

* 在 cgit 上，我們不使用 Topic 分支。
* GitHub 存放區將持續保持鏡像，我們不使用「Merge pull request」功能。
* ruby_2_4、ruby_2_5 和 ruby_2_6 分支仍使用 SVN，在 cgit 上我們將不會推送任何東西給這些分支。
* 從 ruby_2_7 開始，我們將會使用 cgit 開發穩定分支。
* 我們不使用合併提交（merge commits）。

## 特別感謝

* k0kubun

  k0kubun 積極地開發有關發佈與 backport 流程的工具鏈，同時也幫 git 更新了 hook 腳本。

* naruse

  naruse 更新了 Ruby CI 和 Redmine 功能更改(bugs.ruby-lang.org)。

* mame

  mame 為了 slack 創建了提交通知腳本。

## 待辦事項

我們仍有一些任務需要完成，如果你在 Git 遷移中發現問題，請在此回報 [https://bugs.ruby-lang.org/issues/14632](https://bugs.ruby-lang.org/issues/14632)。

請盡情享受！
