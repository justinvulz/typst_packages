#import "@preview/cetz:0.5.2"
#import "@preview/fletcher:0.5.8" as fletcher: diagram,node,edge
#import fletcher.shapes:circle

#let margin_size = 2cm
#let body_font_size = 30pt


#let conf(
  doc
) = {
  
  context {
    let size = measure(doc)
    set page(width: size.width+2em, height: size.height+2em)
    doc
  }
}
