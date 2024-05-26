#import "@preview/ctheorems:1.1.2": *

#let theorem = thmbox("thm","Theorem")
#let proof = thmproof("proof","Proof")
#let example = thmbox("example","Example").with(numbering: none)
#let definition = thmbox("definition","Definition")

#state("title","")
#state("author","")

#let conf(_title,_author,doc) = {
  
  set document(title: _title, author: _author)
  
  state("title").update(_title)
  state("author").update(_author)
  
  show: thmrules
  set page(
    paper: "a4",
    number-align: center,
    numbering: "1",
  )
  set text(
    font: ("Times New Roman","DFKai-SB"),
  )
  set heading(numbering: "1.")
  show heading: it =>[
    #set text(weight: "regular")
    #it
  ]

  doc
}


#let makeTitle = () => [


  #let title = context {
    text(20pt)[#state("title").get()]
  }  
  #let author = context {
    text(size: 14pt)[#state("author").get()]
  }
  #set align(center)
  #set par(leading: 2em)
  
  #title\
  #author

]