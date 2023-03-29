// 三号 16pt，小三号 15pt，四号 14pt，小四号 12pt，五号 10.5pt

#let HeiTi = "Noto Sans CJK SC"
#let SongTi = "Noto Serif CJK SC"
#let KaiTi = "FZKai-Z03"

#let BUPTBachelorThesis(
  title-zh: "",
  abstract-zh: "",
  keywords-zh: (),

  title-en: "",
  abstract-en: "",
  keywords-en: (),

  bibliography-file: none,

  body
) = {
  set page(paper: "a4", margin: 2.5cm)

  // =========== Chinese abstract ===========
  set text(font: HeiTi, weight: "bold")
  align(center)[
      #text(size: 16pt, title-zh) \ \
      #text(size: 15pt, tracking: 1em, "摘要") \ \
  ]

  set text(font: ("Times New Roman", SongTi), weight: "regular", size: 12pt)
  set par(first-line-indent: 2em, leading: 1.2em)
  show par: set block(spacing: 1.2em)
  abstract-zh

  [\ \ ]
  text(font: HeiTi, weight: "bold", size: 12pt, "关键词")
  text(size: 12pt,
    for value in keywords-zh {
      h(1em) + value
    }
  )
  pagebreak()

  // =========== English abstract ===========
  set text(font: "Times New Roman", weight: "bold")
  align(center)[
      #text(size: 16pt, title-en) \ \
      #text(size: 15pt, "ABSTRACT") \ \
  ]
  set text(font: "Times New Roman", weight: "regular", size: 12pt)
  abstract-en

  [\ \ ]
  text(font: "Times New Roman", weight: "bold", size: 12pt, "KEY WORDS")
  text(size: 12pt,
    for value in keywords-en {
      h(1em) + value
    }
  )
  pagebreak()

  // =========== Table of content ===========
  set page(numbering: "I")
  counter(page).update(1)
  align(center)[
    #outline(
      title: text(font: HeiTi, weight: "bold", tracking: 2em, size: 16pt, [目录\ \ ]),
      depth: 3,
    )
  ]
  pagebreak()

  // =========== Configure headings ===========
  let chineseNumMap(num) = {
    let chineseNum = (
      "一", "二", "三", "四", "五", "六", "七", "八", "九", "十",
      "十一", "十二", "十三", "十四", "十五", "十六", "十七", "十八", "十九", "二十")
    chineseNum.at(num - 1)
  }
  
  set heading(numbering: "1.1")
  show heading: it => locate(loc => {
    let levels = counter(heading).at(loc)

    // reset par first
    set par(first-line-indent: 0em)
    set text(font: HeiTi, weight: "bold")
    
    if it.level == 1 {
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

  // =========== Contents ===========
  set page(numbering: "1")
  counter(page).update(1)
  body
}