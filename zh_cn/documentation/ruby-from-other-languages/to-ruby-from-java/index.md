---
layout: page
title: "从 Java 到 Ruby"
lang: zh_cn
---

Java 非常成熟，久经检验，且非常快（与那些反对java的人可能还在声称的相反）。但它也非常啰嗦。从 Java 到 Ruby，可以预见的是代码规模将大大缩小。你也可以期望使用相对少的时间快速出产原型。

### 相似点

Ruby 与 Java 一样的地方……

* 垃圾回收器帮你管理内存。
* 强类型对象。
* 有 public、 private 和 protected 方法。
* 拥有嵌入式文档工具（Ruby 的工具叫 rdoc）。rdoc 生成的文档与 javadoc 非常相似。

### 相异点

Ruby 与 Java 不同的地方……

* 你不需要编译你的代码。你只需要直接运行它。
* 有几个不同的流行的第三方GUI工具包。Ruby 用户可以尝试 [WxRuby][1]、 [FXRuby][2]、 [Ruby-GNOME2][3]、
[Qt][4] 或 Ruby 内置的 Tk。
* 定义像类这样的东西时，可以使用 `end` 关键字，而不使用花括号包裹代码块。
* 使用 `require` 代替 `import`。
* 所有成员变量为私有。在外部，使用方法获取所有你需要的一切。
* 方法调用的括号通常是可选的，经常被省略。
* 一切皆对象，包括像 2 和 3.14159 这样的数字。
* 没有静态类型检查。
* 变量名只是标签。它们没有相应的类型。
* 没有类型声明。按需分配变量名，及时可用（如：`a = [1,2,3]` 而不是 `int[] a = {1,2,3};`）。
* 没有显式转换。只需要调用方法。代码运行之前，单元测试应该告诉你出现异常。
* 使用 `foo = Foo.new("hi")` 创建新对象，而非 `Foo foo = new Foo("hi")`。
* 构造器总是命名为“initialize” 而不是类名称。
* 作为接口的替代，你将获得“混入（mixins）”。
* 相比 XML，倾向于使用 YAML。
* `nil` 替代 `null`。
* Ruby 对 `==` 和 `equals()` 的处理方式与 Java 不一样。测试相等性使用 `==`（Java 中是 `equals()`）。测试是否为同一对象使用 `equals?()`（Java 中是 `==`）。

[1]: https://github.com/eumario/wxruby
[2]: https://github.com/larskanis/fxruby
[3]: https://ruby-gnome2.osdn.jp/
[4]: https://github.com/ryanmelt/qtbindings/
