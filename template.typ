// 三号 16pt，小三号 15pt，四号 14pt，小四号 12pt，五号 10.5pt

#let FONTSET = (
  Hei: "Noto Sans CJK SC",
  Song: "Noto Serif CJK SC",
  Kai: "FZKai-Z03",
  English: "Times New Roman",
)
// #set text(font: "STIX Two Text")

#let figureCounter = counter("Figure")
#let equationCounter = counter("Equation")

#let BUPTBachelorThesis(
  titleZH: "",
  abstractZH: "",
  keywordsZH: (),

  titleEN: "",
  abstractEN: "",
  keywordsEN: (),

  bibliographyFile: none,

  body
) = {
  // =========== Configure pages ===========
  set page(paper: "a4", margin: 2.5cm)
  set text(font: (FONTSET.at("English"), FONTSET.at("Song")), weight: "regular", size: 12pt)

  // =========== Configure equation ===========
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

  // =========== Chinese abstract ===========
  align(center)[
      #set text(font: FONTSET.at("Hei"), weight: "bold")
      #text(size: 16pt, titleZH) \ \
      #text(size: 15pt, tracking: 1em, "摘要") \ \
  ]

  set par(first-line-indent: 2em, leading: 1.2em)
  show par: set block(spacing: 1.2em)
  abstractZH

  [\ \ ]
  text(font: FONTSET.at("Hei"), weight: "bold", size: 12pt, "关键词")
  text(size: 12pt,
    for value in keywordsZH {
      h(1em) + value
    }
  )
  pagebreak()

  // =========== English abstract ===========
  align(center)[
      #text(weight: "bold", size: 16pt, titleEN) \ \
      #text(weight: "bold", size: 15pt, "ABSTRACT") \ \
  ]
  abstractEN

  [\ \ ]
  text(weight: "bold", size: 12pt, "KEY WORDS")
  text(size: 12pt,
    for value in keywordsEN {
      h(1em) + value
    }
  )
  pagebreak()

  // =========== Table of content ===========
  set page(numbering: "I")
  counter(page).update(1)
  align(center)[
    #outline(
      title: text(font: FONTSET.at("Hei"), weight: "bold", tracking: 2em, size: 16pt, [目录\ \ ]),
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
    set text(font: FONTSET.at("Hei"), weight: "bold")
    
    if it.level == 1 {
      // reset figure counter
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

  // =========== Citation ===========
  show cite: it => {
    text(font: FONTSET.at("English"), super(it))
  }

  // =========== Contents ===========
  set page(numbering: "1")
  counter(page).update(1)
  body

  // =========== Bibliography ===========
  show heading: it => {
    pagebreak()
    align(center)[
      #text(font: FONTSET.at("Hei"), size: 16pt, it.body) \ \
    ]
  }
  
  if bibliographyFile != none {
    bibliography(bibliographyFile, title: "参考文献")
    
    show bibliography: it => {
      set text(font: (FONTSET.at("English"), FONTSET.at("Song")), size: 10.5pt)
    }
  }
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