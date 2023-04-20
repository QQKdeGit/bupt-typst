#import "template.typ": *

#show: BUPTBachelorThesis.with(
  titleZH: "这是一个毕业设计的中文标题",
  abstractZH: [
    中文摘要。
    
    长中文摘要长中文摘要长中文摘要长中文摘要长中文摘要长中文摘要长中文摘要长中文摘要长中文摘要。
    
    中 English 混杂测试。
  ],
  keywordsZH: ("北京邮电大学", "本科生", "毕业设计", "模板", "示例"),

  titleEN: "This is English Title",
  abstractEN: [
    English Abstract.
    
    Long English Abstract Long English Abstract Long English Abstract Long English Abstract Long English Abstract.
  ],
  keywordsEN: ("BUPT", "undergraduate", "thesis", "template", "example"),
)

// 正文
= 基础模块

我认为 Typst 介于 LaTeX 和 Markdown 之间。在你开始使用这个模板之前，你可以对 LaTeX 不那么熟悉，但确保你对 Markdown 有一定了解，并且我建议学习一下如何使用 Typst 。

== 图示例

#Figure("images/bupt.png", "北京邮电大学校徽", 30%)

这是一幅图。

== 表格示例

#Table(
  "北京邮电大学历年录取分数线",
  (auto, auto, auto, auto, auto),
  horizon,
  (
    [*年份*], [*录取批次*], [*招生类型*], [*最低分/最低位次*], [*省控线*],
    [2018], [本科一批], [普通类], [649/2469], [532],
    [2017], [本科一批], [普通类], [635/2548], [537],
    [2016], [本科一批], [宏福校区], [621/--], [548],
    [2015], [本科一批], [普通类], [646/2499], [548],
    [2014], [本科一批], [普通类], [--/--], [548],
  )
)

这是一张表。注意到了吗？这里并没有自动段首空格，因为我们还在上一段里。要想在后面开启新的一段，需要自己手动输入换行符“\\”。后面没有空格的原理是一样的。

== 公式示例

下方是一个简单的求圆的面积的公式：

$ S = pi r^2 $

语法跟 Markdown 很像，比较容易上手。

== 引用示例

这是一个参考文献的引用#super([[1]])。

== 代码示例

这是一段用示例代码。

```c
void setFib(void)
{
  fib(1 | 2 | 3 | 5 | 8 | 13 | 21 | 34 | 55 | 89, 10);
}
```

Typst 还支持书写行内的代码，就像 Markdown 一样，比如 `return n * f(n - 1)` 。

// 附页
#show: Appendix.with()

#pagebreak()
= 参考文献

#text(font: (FONTSET.at("English"), FONTSET.at("Song")), size: 10.5pt)[
  #set par(first-line-indent: 0em)
  
  // 专著中的文献
  [1] 作者.专著名称[M].版本(第1版不加标注).出版者.出版年:参考页码.

  // 期刊中的文献
  [2] 作者.文献名称.期刊名称[J].卷号（期号）.年,月:页码范围.

  // 论文集
  [3] 作者.论文题目[C].见(英文用 In).主编.论文集名.出版地.出版年:页码范围.

  // 学位论文
  [4] 作者.题目[D].(英文用[Dissertation])保存地点.保存单位:年份.

  // 专利
  [5] 专利申请者.题目[P].国别.专利文献种类.专利号.批准日期.

  // 技术标准
  [6] 起草责任者.标准代号.标准顺序号-发布年.标准名称[S].出版地.出版者.出版年度.
]

#pagebreak()
= 致#h(2em)谢

谢谢你北邮，因为有你，温暖了四季。

#pagebreak()
= 附#h(2em)录
#set heading(outlined: false)

== 附录 1

这是一个附录内容，学校规定附录的二级标题得是“附录”二字后接阿拉伯数字。

但是 Typst 的中文与英文和数字之间的空格并没有像 LaTeX 那样自动空出，所以就需要自己手打了。

#pagebreak()
= 外#h(1em)文#h(1em)译#h(1em)文
