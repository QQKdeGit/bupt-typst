#let chineseNumMap(num) = {
  let chineseNum = (
    "一", "二", "三", "四", "五", "六", "七", "八", "九", "十",
    "十一", "十二", "十三", "十四", "十五", "十六", "十七", "十八", "十九", "二十",
    "二十一", "二十二", "二十三", "二十四", "二十五", "二十六", "二十七", "二十八", "二十九", "三十",
    "三十一", "三十二", "三十三", "三十四", "三十五", "三十六", "三十七", "三十八", "三十九", "四十",
  )
  chineseNum.at(num - 1)
}

#let romanNumMap(num) = {
  let romanNum = (
    "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX", "X",
    "XI", "XII", "XIII", "XIV", "XV", "XVI", "XVII", "XVIII", "XIX", "XX",
    "XXI", "XXII", "XXIII", "XXIV", "XXV", "XXVI", "XXVII", "XXVIII", "XXIX", "XXX",
    "XXXI", "XXXII", "XXXIII", "XXXIV", "XXXV", "XXXVI", "XXXVII", "XXXVIII", "XXXIX", "XL",
  )
  romanNum.at(num - 1)
}

#let FONTSIZE = (
  SanHao:   16pt,
  XiaoSan:  15pt,
  SiHao:    14pt,
  XiaoSi:   12pt,
  WuHao:    10.5pt,
  XiaoWu:   9pt,
)

#let FONTSET = (
  Hei:     "Noto Sans CJK SC",
  Song:    "Noto Serif CJK SC",
  Kai:     "FZKai-Z03",
  English: "Times New Roman",
)
// #set text(font: "STIX Two Text")

#let tableCounter    = counter("Table")
#let figureCounter   = counter("Figure")
#let equationCounter = counter("Equation")

#let BUPTBachelorThesis(
  titleZH: "",
  abstractZH: "",
  keywordsZH: (),

  titleEN: "",
  abstractEN: "",
  keywordsEN: (),

  body
) = {
  // 页面配置
  set page(paper: "a4", margin: 2.5cm)
  set text(font: (FONTSET.at("English"), FONTSET.at("Song")), weight: "regular", size: FONTSIZE.XiaoSi)

  // 数学公式
  show math.equation: it => if it.block {
    locate(loc => {
    set par(leading: 1.5em)
    let chapterLevel = counter(heading).at(loc).at(0)

    grid(
      columns: (100pt, 1fr, 100pt),
      [],
      align(center, it),
        align(horizon + right)[
        #text(
          font: (FONTSET.at("English"), FONTSET.at("Song")),
          [式（#chapterLevel\-#equationCounter.display()）]
        )
      ]
    )

    equationCounter.step()
  })
  } else {
    it
  }

  // 代码
  show raw.where(block: true): it => {
    set block(stroke: 0.5pt, width: 100%, inset: 1em)
    it
  }

  // 中文摘要
  align(center)[
      #set text(font: FONTSET.at("Hei"), weight: "bold")
      #text(size: FONTSIZE.SanHao, titleZH) \ \
      #text(size: FONTSIZE.XiaoSan, tracking: 1em, "摘要") \ \
  ]

  set par(first-line-indent: 2em, leading: 1.2em)  // 段内行间距为1.2倍
  show par: set block(spacing: 1.2em)              // 段间距同样为1.2倍
  abstractZH

  [\ \ ]
  text(font: FONTSET.at("Hei"), weight: "bold", size: FONTSIZE.XiaoSi, h(2em) + "关键词")
  text(size: FONTSIZE.XiaoSi,
    for value in keywordsZH {
      h(1em) + value
    }
  )
  pagebreak()

  // 英文摘要
  align(center)[
      #text(weight: "bold", size: FONTSIZE.SanHao, titleEN) \ \
      #text(weight: "bold", size: FONTSIZE.XiaoSan, "ABSTRACT") \ \
  ]
  abstractEN

  [\ \ ]
  text(weight: "bold", size: FONTSIZE.XiaoSi, h(2em) + "KEY WORDS")
  text(size: FONTSIZE.XiaoSi,
    for value in keywordsEN {
      h(1em) + value
    }
  )
  pagebreak()

  // 目录
  set page(
    footer: locate(loc => {
      [
        #align(center)[
          #text(font: FONTSET.at("English"), size: FONTSIZE.XiaoWu)[
            // 这里默认了摘要只有 2 页
            // TODO: 更改成自动获取摘要页数
            #romanNumMap(calc.abs(loc.page() - 2))
          ]
        ]
      ]
    })
  )
  counter(page).update(1)

  show outline: it => locate(loc => {
    set par(first-line-indent: 0em)

    align(center)[
      #text(font: FONTSET.at("Hei"), weight: "bold", tracking: 2em, size: FONTSIZE.SanHao, [目录\ \ ])
    ]

    let chapterCounter    = 1
    let sectionCounter    = 1
    let subsectionCounter = 1

    let headingList = query(selector(heading).after(loc), loc)
    for i in headingList {
      if i.outlined == false {
        break
      }

      if i.level == 1 {
        set text(font: (FONTSET.at("English"), FONTSET.at("Hei")), size: FONTSIZE.XiaoSi, weight: "bold")

        if i.body != [参考文献] and i.body != [致#h(1em)谢] and i.body != [附#h(1em)录] {
          [第#chineseNumMap(chapterCounter)章#h(1em)]
        }

        if i.body == [致#h(1em)谢] {
          [致谢 #box(width: 1fr, repeat[.]) #calc.abs(i.location().page() - loc.page())\ ]
        } else if i.body == [附#h(1em)录] {
          [附录 #box(width: 1fr, repeat[.]) #calc.abs(i.location().page() - loc.page())\ ]
        } else {
          [#i.body #box(width: 1fr, repeat[.]) #calc.abs(i.location().page() - loc.page())\ ]
        }

        chapterCounter = chapterCounter + 1
        sectionCounter = 1
      } else if i.level == 2 {
        [#h(1em)#calc.abs(chapterCounter - 1)\.#sectionCounter#h(1em)#i.body #box(width: 1fr, repeat[.]) #calc.abs(i.location().page() - loc.page())\ ]

        sectionCounter += 1
        subsectionCounter = 1
      } else if i.level == 3 {
        [#h(2em)#calc.abs(chapterCounter - 1)\.#calc.abs(sectionCounter - 1)\.#subsectionCounter#h(1em)#i.body #box(width: 1fr, repeat[.]) #calc.abs(i.location().page() - loc.page())\ ]

        subsectionCounter += 1
      }
    }
  })

  outline(title: none, depth: 3, indent: true)  

  // 章节标题配置  
  set heading(numbering: "1.1")
  show heading: it => locate(loc => {
    let levels = counter(heading).at(loc)

    // 重置段首空格
    set par(first-line-indent: 0em)
    set text(font: FONTSET.at("Hei"), weight: "bold")

    if it.level == 1 {
      // 重置计数器
      tableCounter.update(1)
      figureCounter.update(1)
      equationCounter.update(1)

      align(center)[
        #text(size: FONTSIZE.SanHao, [第#chineseNumMap(levels.at(0))章#h(1em)#it.body])
      ]
    } else if it.level == 2 {
      numbering("1.1", ..levels)
      text(size: FONTSIZE.SiHao, h(1em) + it.body)
    } else {
      set par(first-line-indent: 2em)
      numbering("1.1", ..levels)
      text(size: FONTSIZE.XiaoSi, h(1em) + it.body)
    }
  })

  // 引用
  show cite: it => {
    text(font: FONTSET.at("English"), super(it))
  }

  // 页眉页脚
  set page(
    header: [
      #align(center)[
        #pad(bottom: -4pt)[
          #pad(bottom: -8pt,
            text(font: FONTSET.at("Song"), size: FONTSIZE.XiaoWu, "北京邮电大学本科毕业设计(论文)")
          )
          #line(length: 100%, stroke: 0.5pt)
        ]
      ]
    ],
    footer: [
      #align(center)[
        #text(font: FONTSET.at("English"), size: FONTSIZE.XiaoWu)[
          #counter(page).display()
        ]
      ]
    ]
  )
  counter(page).update(1)

  // 正文
  body
}

// 附录部分
#let Appendix(
  body
) = {
  show heading: it => locate(loc => {
    set par(first-line-indent: 0em)
    
    let levels = counter(heading).at(loc)

    if it.level == 1 {
      align(center)[
        #text(font: FONTSET.at("Hei"), size: FONTSIZE.SanHao, it.body)
      ]
    } else if it.level == 2 {
      text(size: FONTSIZE.SiHao, it.body)
    }
  })

  body
}

// 图
#let Figure(
  file,
  caption,
  width,
) = {
  show figure: it => locate(loc => {
    let chapterLevel = counter(heading).at(loc).at(0)

    align(center)[
      #it.body
      #text(
        font: (FONTSET.at("English"), FONTSET.at("Kai")),
        size: FONTSIZE.WuHao,
        [图 #chapterLevel\-#figureCounter.display() #caption]
      )
    ]

    figureCounter.step()
  })

  figure(
      image(file, width: width)
  )
}

// 表
#let Table(caption, columnsSet, alignSet, body) = {
  show table: it => locate(loc => {
    let chapterLevel = counter(heading).at(loc).at(0)

    align(center)[
      #text(
        font: (FONTSET.at("English"), FONTSET.at("Kai")),
        size: FONTSIZE.WuHao,
        [表 #chapterLevel\-#tableCounter.display() #caption]
      )
      #it
    ]

    tableCounter.step()
  })

  table(
    columns: columnsSet,
    align: alignSet,
    inset: 8pt,
    stroke: 0.5pt,
    ..body
  )
}