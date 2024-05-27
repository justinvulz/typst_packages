#import "@preview/ctheorems:1.1.2": *
#import "@preview/cuti:0.2.1": show-cn-fakebold
#show: show-cn-fakebold


#let theorem = thmbox("thm","Theorem")
#let proof = thmproof("proof","Proof")
#let example = thmbox("example","Example").with(numbering: none)
#let definition = thmbox("definition","Definition",
						fill: rgb("e8e8fe"))



#let textb(it) = [
	#set text(font: ("Times New Roman","DFKai-SB"))
	#text(weight: "bold")[#it]
]

#let ts(content) = {
  if content.has("text") {
	if type(content.text) == "string" {
		content.text
	} else {
		ts(content.text)
	}
	} else if content.has("children") {
		content.children.map(to-string).join("")
	} else if content.has("body") {
		ts(content.body)
	} else if content == [ ] {
		" "
  }
}


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
	  #text(weight: "bold")[#it]
	]
	
	show math.equation.where(block: true): e => [
		// #set block(fill: lime)
  	#block(width: 100%, inset: 2pt,spacing: 1pt)[
      #set align(center)
      #e
  	]
	]

	show enum.item: it=>[
		// #set block(fill: red)
		#block(width: 100%,spacing: 0.4em,inset: 2pt)[
			#set align(left)
			#show par: set block(spacing: 0.4em)
			#it
		]
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