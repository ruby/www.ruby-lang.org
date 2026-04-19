---
layout: news_post
title: "全新的 Ruby 文档界面"
author: "Stan Lo"
translator: "GAO Jun"
date: 2025-12-23 00:00:00 +0000
lang: zh_cn
---

继 [重新设计 ruby-lang.org](https://www.ruby-lang.org/zh_cn/news/2025/12/22/redesign-site-identity/)之后，
我们还有更多消息来庆祝 Ruby 诞生 30 周年：[docs.ruby-lang.org][ruby-doc] 采用了全新的、[RDoc](https://github.com/ruby/rdoc) 的 Aliki 默认主题。

## 全新的 Ruby 文档界面

一直以来，编写 Ruby 程序让人愉悦，现在阅读 Ruby 文档也能带来相似的感受。Aliki 为 [docs.ruby-lang.org][ruby-doc] 及所有通过 RDoc v7.0+ 生成文档的 gem 带来了现代、简介的文档界面。

## 主要特点

- **改进搜索功能**: 根据大小写匹配设置权重，模糊匹配，支持常量搜索
- **深色模式**: 遵从操作系统的偏好设置，也可手动切换
- **三栏布局**: 左侧栏用于导航，中间栏显示内容，右侧栏显示目录
- **代码块改进**: 在代码块上增加复制按钮，支持 C 语言语法高亮
- **自定义脚注**: Gem 维护者可以增加指向代码库、问题跟踪和其他资源的链接

## 致 Gem 作者

如果您使用 RDoc 7.0+ 来生成文档，您的用户就会看到 Aliki 主题。您可以通过 `.rdoc_options` 文件来定制脚注链接或切换回 Darkfish 主题。

## 快试试

访问 [docs.ruby-lang.org][ruby-doc] 查看新界面的实际效果。

如果您发现问题或有任何建议，请在 Github 上 [提交问题报告](https://github.com/ruby/rdoc/issues)。

[ruby-doc]: https://docs.ruby-lang.org/en/master/
