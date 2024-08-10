#import "@preview/cetz:0.2.2"
#import "@preview/fletcher:0.4.5" as fletcher: diagram,node,edge
#import fletcher.shapes:circle

#let margin_size = 2cm
#let body_font_size = 30pt


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
  show stack: set block(spacing: 2em)
  show grid: set block(spacing: 2em)
  show par: set block(spacing: 1em)
  show block: set block(spacing: 1em)
  show figure: set block(spacing: 2em) 
  show list: set block(spacing: 1em)
  // title
  block(
    width: 100%,
    fill: main_color, 
    inset:margin_size,

  )[
    #align(center+horizon)[
      #set text(fill: white)
      #show par: set block(spacing: 0.5em)
      #text(size:85pt)[
        *#title*
      ]
      
      #text(size: 56pt)[
        *#author*
      ]
      #if (advisor != none){
        text(size: 56pt)[
          ,  *Advisor: #advisor*
        ]
      }
    ]
    #if (logo != none){
      place(top+right)[
        #image(logo, width:  6em)
      ]
    }
  ]
  // block for heading
  show heading.where(level: 1): h => {
    align(center)[
      #block(width: 100%,fill: main_color,inset: 0.45em)[
        #text(size: 36pt,fill:white)[
          *#h*
        ]
      ]

    ]
  }
  show heading.where(level:2): h => {
    align(center)[
      #block(width: 100%,fill: main_color,inset: 0.45em)[
        #text(size: 30pt,fill:white)[
          *#h*
        ]
      ]

    ]
  }
  show math.equation.where(block: true): e => [
		// #set block(fill: lime)
  	#block(width: 100%, inset: 0.3em)[
      #set align(center)
			#set par(leading: 0.65em)
      #e
	
		]
	]
  // content
  block(inset: margin_size)[
    #columns(2)[
      #doc
    ]
  ]
}