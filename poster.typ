#import "@preview/cetz:0.2.2"
#import "@preview/fletcher:0.4.5" as fletcher: diagram,node,edge
#import "symbol.typ":*
#import "./utils.typ":*
#import fletcher.shapes:circle

#let margin_size = 2cm
#let body_font_size = 32pt

#let mktitle(title,advisor,author,main_color,logo_right,logo_left) = {
  block(
    width: 100%,
    fill: main_color, 
  )[

    #align(center+horizon,block(
    inset: margin_size,
    [
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
      
    ))

    #if (logo_right != none){
      place(horizon+right,block(logo_right,inset: margin_size))
    }
    #if (logo_left!= none){
      place(horizon+left,block(logo_left,inset: margin_size))
    }
  ]
}

#let conf(
  title,
  author,
  advisor: none,
  logo_left: none,
  logo_right: none,
  main_color: rgb(35,80,120),
  doc
) = {

  set page(
    paper: "a0",
    margin: 0pt,
  )


  set text(size:body_font_size)
  set par(spacing: 1em)
  show stack: set block(spacing: 1em)
  show grid: set block(spacing: 1em)
  // show block: set block(spacing: 0.5em)
  show figure: set block(spacing: 1em) 
  show list: set block(spacing: 1em)
  // title
  mktitle(title,advisor,author,main_color,logo_right,logo_left)
   
  // block for heading
  set heading(numbering: "1.")
  show heading.where(level: 1): h => {
    // counter(math.equation).update(0)
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
  show: math-ref
   
  // content
  block(inset: margin_size)[
    #columns(2)[
      #doc
    ]
  ]
}
