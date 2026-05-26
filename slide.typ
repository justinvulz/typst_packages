#import "@preview/ctheorems:1.1.3": *
#import "@preview/touying:0.7.3": *
#import themes.university: *
#import "@preview/numbly:0.1.0": numbly
#import "./symbol.typ":*
#import "./utils.typ":*

#let exercise = thmbox(
  "exercise",
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
).with(
  inset: 1em
)

#let property= thmbox(
  "id1",
  "Property",
  // fill: rgb("e8f8e8"),
  base_level:2,
  padding: (y: 0em)
).with(
  inset: 1em
)

#let definition = thmbox(
  "id1",
  "Definition",
  fill: rgb("e8f8e8"),
  base_level:1,
  padding: (y: 0em)
).with(
  inset: 1em
)

#let conjecture = thmbox(
  "id1",
  "Conjecture",
  // fill: rgb("e8f8e8"),
  base_level:1,
  padding: (y: 0em)
).with(
  inset: 1em
)

#let lemma = thmbox(
  "id1",
  "Lemma",
  // fill: rgb("e8e8f8"),
  // stroke: black,
  base_level: 1,
  padding: (y: 0em)
).with(
  inset: 1em
)

#let remark = thmbox(
  "id1",
  "Remark",
  // stroke: black,
  base_level: 1,
  padding: (y: 0em)
).with(
  inset: 1em
)

#let corollary = thmbox(
  "id1",
  "Corollary",
  // fill: rgb("e8e8f8"),
  base_level: 1,
  padding: (y: 0em)
).with(
  inset: 1em
)

#let discussion = thmbox(
  "id1",
  "Discussion",
  base_level: 1,
  breakable: true,
  // stroke: black + 1pt,
  padding: (y: 0em)
).with(
  inset: 1em
)

#let proof = thmproof("pkoof","Proof").with(inset:0em)

#let example = thmplain("example","Example").with(
  inset: (top: 0.5em, bottom: 0.5em),//, left: 1em, right: 1em),
  numbering: none
)

#let conf(
  title:none,
  subtitle:none,
  author:none,
  doc
) = {
  show: university-theme.with(
    aspect-ratio: "16-9",
    header-right: none,
    header: self => pad(x: -2.5em,top:-0.5em, block(
      fill: self.colors.primary,
      inset: (x: 2.5em, y: 0.6em),
      width: 100% + 5em,
      text(fill: white, weight: "bold",
        utils.display-current-heading(depth: self.slide-level)),
    )),
    config-page(
      margin:(x:2em,y:2.9em)
      
    ),
    config-info(

      title: title,
      subtitle: subtitle,
      author: author,
      date: datetime.today(),
      // institution: [Institution],
    ),
    config-methods(init: (self: none, body) => {
      show: math-ref
      show: thmrules
      set heading(numbering: numbly("{1}.", default: "1.1"))
      set text(size: 21pt)
      body
    }),

  )

  title-slide()

  // outline()
  doc 
}


