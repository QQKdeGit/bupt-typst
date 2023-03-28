// 三号 16pt，小三号 15pt，四号 14pt，小四号 12pt，五号 10.5pt

#let HeiTi = "Noto Sans CJK SC"
#let SongTi = "Noto Serif CJK SC"

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

  // Display Chinese abstract
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
      box(width: 1em) + value
    }
  )
  pagebreak()

  // Display English abstract
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
      box(width: 1em) + value
    }
  )
  pagebreak()

  // Display contents
  set page(numbering: "1")
  counter(page).update(1)
  body
}