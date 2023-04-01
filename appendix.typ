#import "template.typ": *

#let Appendix(
  body
) = {
  show heading: it => locate(loc => {
    set par(first-line-indent: 0em)
    
    let levels = counter(heading).at(loc)

    if it.level == 1 {
      align(center)[
        #text(font: FONTSET.at("Hei"), size: 16pt, it.body)
      ]
    } else if it.level == 2 {
      text(size: 14pt, it.body)
    }
  })

  body
}