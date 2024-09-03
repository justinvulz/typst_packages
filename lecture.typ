#import "@preview/ctheorems:1.1.2": *
#import "@preview/cuti:0.2.1": show-fakebold
#import "./symbol.typ": *


#let st = $space s.t. space $
#let exercise = thmbox(
  "id1",
  "Exercise",
  stroke: black + 1pt,
  base: none,           
).with(numbering: "I") 

#let theorem = thmbox(
	"id1",
	"Theorem",
	fill: rgb("e8e8f8"),
	base_level: 1,
	padding: (y: 0em)
)

#let definition = thmbox(
	"id1",
	"Definition",
	fill: rgb("e8f8e8"),
	base_level:1,
	padding: (y: 0em)
)

#let lemma = thmbox(
  "le",
  "Lemma",
  fill: rgb("e8e8f8"),
  // stroke: black,
  base_level: 1,
  padding: (y: 0em)
)

#let discussion = thmbox(
	"id1",
	"Discussion",
	base_level: 1,
	stroke: black + 1pt,
	padding: (y: 0em)
)

#let proof = thmproof("pkoof","Proof")

#let example = thmplain("example","Example").with(
	inset: (top: 0.5em, bottom: 0.5em, left: 1em, right: 1em),
	numbering: none
)

#let remark = thmplain("remark","Remark").with(
	inset: (top: 0.5em, bottom: 0.5em, left: 1em, right: 1em),
	numbering: none
)


#let textb(it) = [
	#set text(font: ("Times New Roman","DFKai-SB"))
	#text(weight: "bold")[#it]
]

#let textr(it) = [
	#set text(font: ("Times New Roman","DFKai-SB"))
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

#let cir = $circle.stroked.tiny$


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
	
	set text(
		font: ("Times New Roman","DFKai-SB"),
	)

	set heading(numbering: "1.")
	show heading: it =>[
	  #text(weight: "bold")[#it]
		#v(0.65em)
	]
	
	show math.equation: set text(weight: "extralight")

	show math.equation.where(block: true): e => [
		// #set block(fill: lime)
  	#block(width: 100%, inset: 0.3em)[
      #set align(center)
			#set par(leading: 0.65em)
      #e
	
		]
	]

	set text(size: 11pt)
	
	set list(marker: listal)
	
	set enum(numbering: al("1."))

	doc
}




