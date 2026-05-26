#import "@preview/cetz:0.2.2"
#import "@preview/fletcher:0.4.5" as fletcher: diagram,node,edge
#import "symbol.typ":*
#import fletcher.shapes:circle

#let margin_size = 2cm
#let body_font_size = 32pt

#let mktitle(title,advisor,author,main_color,logo) = {
  block(
    width: 100%,
    fill: main_color, 
    inset:margin_size,

  )[
    #align(center+horizon)[
      #set text(fill: white)
      #set par(spacing: 0.5em)
      #text(size:85pt)[
        *#title*
      ]
      
      #text(size: 56pt)[
        *#author*
      ]
      #if (advisor != none){
        text(size: 56pt)[
          ,  *Advisor : #advisor*
        ]
      }
    ]
    #if (logo != none){
      place(top+right)[
        #image(logo, width:  6em)
      ]
    }
  ]
  
}

#let conf(
  title,
  author,
  advisor: none,
  logo: none,
  main_color: rgb(35,80,120),
  doc
) = {

  set page(
    paper: "a0",
    margin: 0pt,
  )


  set text(size:body_font_size)
  set par(spacing: 1em)
  show stack: set block(spacing: 2em)
  show grid: set block(spacing: 2em)
  // show block: set block(spacing: 0.5em)
  show figure: set block(spacing: 2em) 
  show list: set block(spacing: 1em)
  // title
  mktitle(title,advisor,author,main_color,logo)
   
  // block for heading
  set heading(numbering: "1.")
  show heading.where(level: 1): h => {
    align(left)[
      #block(width: 100%,inset: 0.1em,above: 1em,below:0em)[
        #text(size: 45pt,fill:main_color)[
          *#h*
        ]
      ]

    ]
    block(above:0.3em, below:1em,line(stroke:main_color,length: 100%))
  }

  show math.equation.where(block: true): e => [
		// #set block(fill: lime)
  	#block(width: 100%, inset: 0.3em)[
      #set align(center)
			#set par(leading: 0.65em)
      #e
	
		]
	]
  show math.equation:it => {
    if it.fields().keys().contains("label"){
        math.equation(
          block: true,
          numbering: num => numbering("(1.1)", counter(heading).get().first(), num),
          it
        )
    } else {
      it
    }
  }


  show ref: it => {
    let el = it.element
    if el != none and el.func() == math.equation {
      link(el.location(), numbering(
        "(1.1)",
        counter(heading).at(el.location()).first(),
        counter(math.equation).at(el.location()).first() + 1
      ))
    } else {
      it
    }
  } 
  // content
  block(inset: margin_size)[
    #columns(2)[
      #doc
    ]
  ]
}
