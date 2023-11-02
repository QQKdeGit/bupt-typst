// 三号     16pt
// 小三号   15pt
// 四号     14pt
// 小四号   12pt
// 五号     10.5pt
// 小五号    9pt

#let FONTSET = (
  English: "Times New Roman",
  Hei:     "Source Han Sans SC",
  Song:    "Source Han Serif SC",
  Kai:     "STKaiti",
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
  set text(font: (FONTSET.at("English"), FONTSET.at("Song")), weight: "regular", size: 12pt)

  // 数学公式
  show math.equation: it => locate(loc => {
    let chapterLevel = counter(heading).at(loc).at(0)

    grid(
      columns: (100pt, 1fr, 100pt),
      [],
      align(center, it),
      align(right)[
        #text(
          font: (FONTSET.at("English"), FONTSET.at("Song")),
          [式（#chapterLevel\-#equationCounter.display()）]
        )
      ]
    )

    equationCounter.step()
  })

  // 代码
  show raw.where(block: true): it => {
    set block(stroke: 0.5pt, width: 100%, inset: 1em)
    it
  }

  // 中文摘要
  align(center)[
      #set text(font: (FONTSET.at("English"), FONTSET.at("Hei")), weight: "semibold")
      #text(size: 16pt, titleZH) \ \
      #text(size: 15pt, tracking: 1em, "摘要") \ \
  ]

  set par(first-line-indent: 2em, leading: 1.2em)
  show par: set block(spacing: 1.2em)
  abstractZH

  [\ \ ]
  text(font: FONTSET.at("Hei"), weight: "semibold", size: 12pt, "关键词")
  text(size: 12pt,
    for value in keywordsZH {
      h(1em) + value
    }
  )
  pagebreak()

  // 英文摘要
  align(center)[
      #text(weight: "semibold", size: 16pt, titleEN) \ \
      #text(weight: "semibold", size: 15pt, "ABSTRACT") \ \
  ]
  abstractEN

  [\ \ ]
  text(weight: "semibold", size: 12pt, "KEY WORDS")
  text(size: 12pt,
    for value in keywordsEN {
      h(1em) + value
    }
  )
  pagebreak()

  // 目录
  let chineseNumMap(num) = {
    let chineseNum = (
      "一", "二", "三", "四", "五", "六", "七", "八", "九", "十",
      "十一", "十二", "十三", "十四", "十五", "十六", "十七", "十八", "十九", "二十",
      "二十一", "二十二", "二十三", "二十四", "二十五", "二十六", "二十七", "二十八", "二十九", "三十",
      "三十一", "三十二", "三十三", "三十四", "三十五", "三十六", "三十七", "三十八", "三十九", "四十",
    )
    chineseNum.at(num - 1)
  }

  let romanNumMap(num) = {
    let romanNum = (
      "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX", "X",
      "XI", "XII", "XIII", "XIV", "XV", "XVI", "XVII", "XVIII", "XIX", "XX",
      "XXI", "XXII", "XXIII", "XXIV", "XXV", "XXVI", "XXVII", "XXVIII", "XXIX", "XXX",
      "XXXI", "XXXII", "XXXIII", "XXXIV", "XXXV", "XXXVI", "XXXVII", "XXXVIII", "XXXIX", "XL",
    )
    romanNum.at(num - 1)
  }

  set page(
    footer: locate(loc => {
      [
        #align(center)[
          #text(font: FONTSET.at("English"), size: 9pt)[
            // 这里默认了摘要只有 2 页
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
      #text(font: (FONTSET.at("English"), FONTSET.at("Hei")), weight: "semibold", tracking: 2em, size: 16pt, [目录\ \ ])
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
        set text(font: (FONTSET.at("English"), FONTSET.at("Hei")), size: 12pt, weight: "semibold")

        if i.body != [参考文献] and i.body != [致#h(2em)谢] and i.body != [附#h(2em)录] {
          [第#chineseNumMap(chapterCounter)章#h(1em)]
        }
        [#i.body #box(width: 1fr, repeat[.]) #calc.abs(i.location().page() - loc.page())\ ]

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
    set text(font: (FONTSET.at("English"), FONTSET.at("Hei")), weight: "semibold")

    if it.level == 1 {
      // 重置计数器
      tableCounter.update(1)
      figureCounter.update(1)
      equationCounter.update(1)

      align(center)[
        #text(size: 16pt, [第#chineseNumMap(levels.at(0))章#h(1em)#it.body])
      ]
    } else if it.level == 2 {
      numbering("1.1", ..levels)
      text(size: 14pt, h(1em) + it.body)
    } else {
      set par(first-line-indent: 2em)
      numbering("1.1", ..levels)
      text(size: 12pt, h(1em) + it.body)
    }
  })

  // 引用
  show cite: it => {
    text(font: (FONTSET.at("English"), FONTSET.at("Song")), super(it))
  }

  // 页眉页脚
  set page(
    header: [
      #align(center)[
        #pad(bottom: -8pt)[
          #pad(bottom: -8pt,
            text(font: FONTSET.at("Song"), size: 9pt, "北京邮电大学本科毕业设计 (论文)")
          )
          #line(length: 100%, stroke: 0.5pt)
        ]
      ]
    ],
    footer: [
      #align(center)[
        #text(font: FONTSET.at("English"), size: 9pt)[
          #counter(page).display()
        ]
      ]
    ]
  )
  counter(page).update(1)

  // 正文
  body
}

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
        size: 10.5pt,
        [图 #chapterLevel\-#figureCounter.display() #caption]
      )
    ]

    figureCounter.step()
  })

  figure(
      image(file, width: width)
  )
}

#let Table(caption, columnsSet, alignSet, body) = {
  show table: it => locate(loc => {
    let chapterLevel = counter(heading).at(loc).at(0)

    align(center)[
      #text(
        font: (FONTSET.at("English"), FONTSET.at("Kai")),
        size: 10.5pt,
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