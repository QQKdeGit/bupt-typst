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

= 基础模块

== 图示例

#Figure("images/bupt.png", "label", 30%)

这是一个北邮校徽。

== 公式示例

下方是一个简单的求圆的面积的公式：

$ S = pi r^2 $

语法跟 Markdown 很像，比较容易上手。注意到了吗？这里并没有自动段首空格。要想在公式后开启新的一段，需要自己手动输入换行符“\\”。