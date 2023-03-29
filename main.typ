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

= 一级标题
#lorem(20)

== 二级标题
#lorem(20)

=== 三级标题
#lorem(20)

==== 四级标题
#lorem(10)

== 二级标题2
#lorem(20)

=== 三级标题2
#lorem(20)

#pagebreak()
= 一级标题2
#lorem(20)

== 二级标题
#lorem(20)

=== 三级标题
#lorem(20)

== 二级标题2
#lorem(20)

=== 三级标题2
#lorem(20)