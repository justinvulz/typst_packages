

#let marign_size = 2cm

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
  set text(size:24pt)
  show par: set block(spacing: 1.5em)
  show block: set block(spacing: 0pt)
  // title
  block(
    width: 100%,
    fill: main_color, 
    inset:marign_size,

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
  show heading: h => {
    align(center)[
      #block(width: 100%,fill: main_color,inset: 0.45em)[
        #text(size: 36pt,fill:white)[
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
  block(inset: marign_size,fill: silver)[
    #columns(2)[
      #doc
    ]
  ]
}