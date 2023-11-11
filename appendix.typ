#import "template.typ": *

#let Appendix(
  bibliographyFile: none,
  
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

  // 参考文献
  if bibliographyFile != none {
    pagebreak()
    primary_heading([= 参考文献])
    
    set text(font: (FONTSET.at("English"), FONTSET.at("Song")), size: FONTSIZE.WuHao)
    set par(first-line-indent: 0em)
    bibliography(
      bibliographyFile, 
      title: none,
      style: "gb-7114-2015-numeric"
    )
    show bibliography: it => {

    }
  }

  body
}