#import "@preview/ctheorems:1.1.3": *
#import "@preview/cuti:0.3.0": show-fakebold
#import "@preview/equate:0.3.2": equate
#import "./symbol.typ": *
#import "./box.typ": *
#import "./utils.typ":*




#let scr(it) = text(
  features: ("ss01",),
  box($cal(it)$),
)

#let textb(it) = [
  #set text(font: ("New Computer Modern","DFKai-SB"))
  #text(weight: "bold")[#it]
]

#let textr(it) = [
  #set text(font: ("New Computer Modern","DFKai-SB"))
  #it
]

#let heading-without-number(title) = [
  #set heading(numbering: none)
  = #title
  #set heading(numbering: "1.")
]
// test

#let al(itm) = {
  return n => grid(
    columns: (0em, auto),
    align: bottom,
    hide[一], numbering(itm, n)
  )
}

#let listal = {
  grid(
    columns: (0em, auto),
    align: bottom,
    hide[一], [•]
  )
}



#let makeTitle = [

  #let title = context {
    text(20pt)[#state("title").get()]
  }  
  #let author = context {
    text(size: 14pt)[#state("author").get()]
  }
  #let subtitle = context {
    text(16pt)[#state("subtitle").get()]
  }
  #set align(center)
  #set par(leading: 2em)
  
  #if title!= none [#title\ ]
  #if subtitle!= none [#subtitle\ ]
  #if author!= none [#author\ ]

]

#state("title","")
#state("author","")

#let conf(
  title:none,
  subtitle:none,
  author:none,
  doc
  ) = {
  

  set document(title: title, author: author)
  
  
  set page(
    paper: "a4",
    number-align: center,
    numbering: "1",
    // footer: rect(width: 100%, height: 100%,fill: silver),    
  )

  state("title").update(title)
  state("author").update(author)
  state("subtitle").update(subtitle)

  
  show: show-fakebold.with(reg-exp: "\p{script=Han}")
  show: thmrules
  show: math-ref
  
  set text(
    font: ("New Computer Modern","Source Han Sans"),
    top-edge: "ascender",
    bottom-edge: "descender",
    lang: "en"
  )

  set heading(numbering: "1.")
  // set heading(numbering: "あ.")

  show heading: it =>[
    #text(weight: "bold")[#it]
    // #v(0.65em)
  ]
  
  show heading.where(level: 1): it => {
    counter(math.equation).update(0)
    text(weight: "bold")[#it]
    v(0.65em)
  }

  set par(leading: 0.8em)
  show math.equation: set text(weight: "extralight")
  set table( stroke: (x, y) => if y == 0 { (top: 1pt, bottom: 0.5pt) }  else { none },)
  set text(size: 11pt)
  
  set list(marker: listal)
  
  set enum(numbering: al("1."))

  set math.cases(gap: 1em)


  doc
}




